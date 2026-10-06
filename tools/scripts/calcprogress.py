#!/usr/bin/env python3
"""Report FoMT reconstruction progress across code, data/assets, and ROM space.

The existing executable-code percentage remains unchanged and authoritative.
This script adds conservative non-code/source-asset and whole-ROM metrics.

Only bytes that are actually regenerated from editable source/assets count as
reconstructed. Merely understanding, naming, or documenting an opaque incbin
does not count.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TOOLS_DIR = ROOT / "tools"
if str(TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR))

import packed_sprite_bank as packed_sprite_bank  # noqa: E402


def is_code_section(section: str) -> bool:
    return (
        section == ".text"
        or section.startswith(".text.")
        or section.startswith(".gnu.linkonce.t.")
    )


def account_entry(
    section: str,
    addr: int,
    size: int,
    obj: str,
    counters: dict[str, int],
) -> None:
    if size == 0:
        return

    path_match = re.search(r"(?:^|/)(src|asm)/[^\s]+\.o(?:\([^)]*\))?", obj)
    if path_match and is_code_section(section):
        if path_match.group(1) == "src":
            counters["code_src"] += size
        else:
            counters["code_asm"] += size

    # ROM-resident source-owned non-code bytes. This intentionally mirrors the
    # old code tracker philosophy: source ownership counts only when the linked
    # bytes come from src/, then explicit baserom-backed exceptions are removed
    # through tools/progress_manifest.json.
    if 0x08000000 <= addr < 0x08800000 and obj.startswith("src/"):
        if section == ".rom_header":
            # The ROM header section mixes startup code, Nintendo logo/header
            # bytes, and metadata. It is definitely reconstructed source, but it
            # is neither part of the historical .text code metric nor a clean
            # data/asset family. Count it only in the overall reconstruction.
            counters["source_other"] += size
        elif not is_code_section(section):
            counters["source_noncode_raw"] += size


def parse_map(map_path: Path) -> dict[str, int]:
    text = map_path.read_text(errors="ignore")
    counters = {
        "code_src": 0,
        "code_asm": 0,
        "source_noncode_raw": 0,
        "source_other": 0,
    }

    in_memory_map = False
    pending_section: str | None = None

    for line in text.splitlines():
        if not in_memory_map:
            if line.strip() == "Linker script and memory map":
                in_memory_map = True
            continue

        match = re.match(
            r"^\s*(\.\S+)\s+0x([0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+)",
            line,
        )
        if match:
            section, addr_hex, size_hex, obj = match.groups()
            pending_section = None
            account_entry(
                section,
                int(addr_hex, 16),
                int(size_hex, 16),
                obj,
                counters,
            )
            continue

        match = re.match(r"^\s*(\.\S+)\s*$", line)
        if match:
            pending_section = match.group(1)
            continue

        if pending_section is not None:
            match = re.match(
                r"^\s*0x([0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+)",
                line,
            )
            if match:
                addr_hex, size_hex, obj = match.groups()
                account_entry(
                    pending_section,
                    int(addr_hex, 16),
                    int(size_hex, 16),
                    obj,
                    counters,
                )

            if line.strip():
                pending_section = None

    pad_match = re.search(r"^\.pad\s+0x([0-9a-fA-F]+)\s+", text, re.MULTILINE)
    if not pad_match:
        raise ValueError("could not find final .pad section in linker map")

    pad_addr = int(pad_match.group(1), 16)
    counters["meaningful_rom_bytes"] = pad_addr - 0x08000000
    if counters["meaningful_rom_bytes"] <= 0:
        raise ValueError("invalid meaningful ROM byte span")

    return counters


def count_packed_item_icon_bytes(entry: dict) -> dict[str, int | str]:
    bank = packed_sprite_bank.PackedBank.from_rom(ROOT / entry["rom"])
    manifest = json.loads((ROOT / entry["manifest"]).read_text())
    items = manifest.get("icons", [])

    graphics_spans: set[tuple[int, int]] = set()
    palette_spans: set[tuple[int, int]] = set()

    for item in items:
        animation_id = int(item["icon_id"])
        frame_count, first_frame = bank.animation(animation_id)

        for frame_no in range(frame_count):
            sprite_id, _duration = bank.frame(first_frame + frame_no)
            desc = bank.descriptor(sprite_id)
            graphics_size = desc[2] * 32
            palette_size = desc[4] * 32
            if graphics_size:
                graphics_spans.add((bank.starts[3] + desc[3] * 32, graphics_size))
            if palette_size:
                palette_spans.add((bank.starts[4] + desc[5] * 32, palette_size))

    graphics_bytes = sum(size for _start, size in graphics_spans)
    palette_bytes = sum(size for _start, size in palette_spans)

    return {
        "name": entry["name"],
        "bytes": graphics_bytes + palette_bytes,
        "graphics_bytes": graphics_bytes,
        "palette_bytes": palette_bytes,
        "graphics_spans": len(graphics_spans),
        "palette_spans": len(palette_spans),
        "items": len(items),
    }


def pct(num: int, den: int) -> str:
    return f"{100 * num / den:.4f}" if den else "0.0000"


def kib(num: int) -> str:
    return f"{num / 1024:.2f}"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("map", type=Path, nargs="?", default=ROOT / "fomt.map")
    parser.add_argument(
        "--manifest",
        type=Path,
        default=ROOT / "tools/progress_manifest.json",
    )
    parser.add_argument(
        "--rom",
        type=Path,
        default=ROOT / "baserom.gba",
        help="ROM file whose size defines available cartridge space",
    )
    args = parser.parse_args()

    stats = parse_map(args.map)
    manifest = json.loads(args.manifest.read_text())

    opaque_source_data = sum(
        int(entry["bytes"]) for entry in manifest.get("opaque_source_data", [])
    )
    source_data_bytes = stats["source_noncode_raw"] - opaque_source_data
    if source_data_bytes < 0:
        raise ValueError("opaque source exclusions exceed linked source data")

    generated_assets: list[dict[str, int | str]] = []
    for entry in manifest.get("generated_assets", []):
        asset_type = entry.get("type")
        if asset_type == "packed_sprite_item_icons":
            generated_assets.append(count_packed_item_icon_bytes(entry))
        else:
            raise ValueError(f"unknown generated asset progress type: {asset_type!r}")

    editable_asset_bytes = sum(int(entry["bytes"]) for entry in generated_assets)

    code_total = stats["code_src"] + stats["code_asm"]
    code_src = stats["code_src"]
    meaningful_rom = stats["meaningful_rom_bytes"]

    # This denominator means "ROM bytes not represented by the legacy code
    # tracker". It includes ordinary data/assets plus small special regions such
    # as ROM header / IWRAM load bytes, so the label stays deliberately broad.
    noncode_total = meaningful_rom - code_total
    noncode_reconstructed = source_data_bytes + editable_asset_bytes

    overall_reconstructed = (
        code_src + noncode_reconstructed + stats["source_other"]
    )

    rom_capacity = args.rom.stat().st_size
    if meaningful_rom > rom_capacity:
        raise ValueError("linked meaningful ROM exceeds base ROM capacity")
    tail_free = rom_capacity - meaningful_rom

    print("Code reconstruction")
    print(f"  {code_src} / {code_total} bytes ({pct(code_src, code_total)}%)")
    print(f"  {stats['code_asm']} bytes remain in asm")
    print()
    print("Data/assets reconstruction")
    print(
        f"  {noncode_reconstructed} / {noncode_total} bytes "
        f"({pct(noncode_reconstructed, noncode_total)}%)"
    )
    print(f"  {source_data_bytes} bytes from typed/source non-code data")
    print(f"  {editable_asset_bytes} bytes from editable generated assets")
    for entry in generated_assets:
        print(
            f"    {entry['name']}: {entry['bytes']} bytes "
            f"({entry['graphics_bytes']} graphics + "
            f"{entry['palette_bytes']} palette)"
        )
    if stats["source_other"]:
        print(
            f"  {stats['source_other']} additional source-owned ROM bytes "
            f"count only toward overall reconstruction (.rom_header)"
        )
    print()
    print("Overall meaningful-ROM reconstruction")
    print(
        f"  {overall_reconstructed} / {meaningful_rom} bytes "
        f"({pct(overall_reconstructed, meaningful_rom)}%)"
    )
    print("  final ROM padding is excluded from this reconstruction denominator")
    print()
    print("ROM space")
    print(
        f"  {meaningful_rom} / {rom_capacity} bytes used "
        f"({pct(meaningful_rom, rom_capacity)}%)"
    )
    print(
        f"  {tail_free} bytes free ({kib(tail_free)} KiB, "
        f"{pct(tail_free, rom_capacity)}%) contiguous tail space"
    )


if __name__ == "__main__":
    main()
