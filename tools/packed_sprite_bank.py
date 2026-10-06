#!/usr/bin/env python3
"""FoMT packed sprite-bank inspector/exporter.

Current proven target is the packed item/UI/effect bank at ROM 0x086678A0.
The tool preserves unresolved data verbatim and round-trips editable 4bpp OBJ
graphics/palettes for both simple icons and proven multi-frame animations.
"""

from __future__ import annotations

import argparse
import json
import struct
from dataclasses import dataclass
from pathlib import Path

from PIL import Image

BANK_OFFSET = 0x6678A0
BANK_SIZE = 0x30080
POOL_STRIDES = (4, 16, 8, 32, 32, 8)


@dataclass
class PackedBank:
    blob: bytearray
    counts: list[int]
    starts: list[int]
    tail_start: int

    @classmethod
    def from_rom(cls, rom_path: Path) -> "PackedBank":
        rom = rom_path.read_bytes()
        blob = bytearray(rom[BANK_OFFSET:BANK_OFFSET + BANK_SIZE])
        if len(blob) != BANK_SIZE:
            raise ValueError("ROM is too small for item-icon bank")

        counts: list[int] = []
        starts: list[int] = []
        pos = 0
        for stride in POOL_STRIDES:
            count = struct.unpack_from("<H", blob, pos)[0]
            counts.append(count)
            pos += 4
            starts.append(pos)
            pos += count * stride

        counts.append(struct.unpack_from("<H", blob, pos)[0])
        pos += 4
        starts.append(pos)
        tail_start = pos + counts[6] * 4
        return cls(blob, counts, starts, tail_start)

    def animation(self, animation_id: int) -> tuple[int, int]:
        return struct.unpack_from("<HH", self.blob, self.starts[0] + animation_id * 4)

    def frame(self, frame_id: int) -> tuple[int, int]:
        return struct.unpack_from("<HH", self.blob, self.starts[6] + frame_id * 4)

    def descriptor(self, sprite_id: int) -> tuple[int, ...]:
        return struct.unpack_from("<8H", self.blob, self.starts[1] + sprite_id * 16)

    def layout(self, index: int) -> tuple[int, int, int, int]:
        return struct.unpack_from("<4H", self.blob, self.starts[2] + index * 8)

    def graphics(self, desc: tuple[int, ...]) -> bytes:
        size = desc[2] * 32
        start = self.starts[3] + desc[3] * 32
        return bytes(self.blob[start:start + size])

    def palette(self, desc: tuple[int, ...]) -> bytes:
        size = desc[4] * 32
        start = self.starts[4] + desc[5] * 32
        return bytes(self.blob[start:start + size])


def signed_coord(value: int, bits: int) -> int:
    limit = 1 << bits
    sign = 1 << (bits - 1)
    value &= limit - 1
    return value - limit if value & sign else value


def obj_dimensions(attr0: int, attr1: int) -> tuple[int, int]:
    shape = (attr0 >> 14) & 3
    size = (attr1 >> 14) & 3
    table = {
        0: ((8, 8), (16, 16), (32, 32), (64, 64)),
        1: ((16, 8), (32, 8), (32, 16), (64, 32)),
        2: ((8, 16), (8, 32), (16, 32), (32, 64)),
    }
    if shape not in table:
        raise ValueError("prohibited OBJ shape")
    return table[shape][size]


def bgr555_to_rgb(value: int) -> tuple[int, int, int]:
    r5 = value & 31
    g5 = (value >> 5) & 31
    b5 = (value >> 10) & 31
    return (
        (r5 << 3) | (r5 >> 2),
        (g5 << 3) | (g5 >> 2),
        (b5 << 3) | (b5 >> 2),
    )


def rgb_to_bgr555(rgb: tuple[int, int, int]) -> int:
    r, g, b = rgb
    return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)


def decode_4bpp_tile(tile: bytes) -> list[int]:
    if len(tile) != 32:
        raise ValueError("4bpp tile must be 32 bytes")
    out: list[int] = []
    for byte in tile:
        out.append(byte & 0xF)
        out.append(byte >> 4)
    return out


def encode_4bpp_tile(pixels: list[int]) -> bytes:
    if len(pixels) != 64:
        raise ValueError("tile must have 64 pixels")
    out = bytearray()
    for i in range(0, 64, 2):
        a, b = pixels[i], pixels[i + 1]
        if not 0 <= a < 16 or not 0 <= b < 16:
            raise ValueError("pixel index exceeds 4bpp range")
        out.append(a | (b << 4))
    return bytes(out)


def export_simple_icon(bank: PackedBank, icon_id: int, png_path: Path, meta_path: Path) -> dict:
    frame_count, first_frame = bank.animation(icon_id)
    if frame_count != 1:
        raise ValueError(f"icon {icon_id} has {frame_count} animation frames; simple exporter requires 1")

    sprite_id, duration = bank.frame(first_frame)
    desc = bank.descriptor(sprite_id)
    layout_count, layout_index = desc[0], desc[1]
    if layout_count != 1:
        raise ValueError(f"sprite {sprite_id} has {layout_count} OBJ parts; simple exporter requires 1")
    if desc[4] != 1:
        raise ValueError(f"sprite {sprite_id} uses {desc[4]} palettes; simple exporter requires 1")

    attr0, attr1, attr2, extra = bank.layout(layout_index)
    if attr0 & (1 << 13):
        raise ValueError("8bpp OBJ is not supported by simple exporter")

    width, height = obj_dimensions(attr0, attr1)
    tile_count = (width // 8) * (height // 8)
    gfx = bank.graphics(desc)
    if len(gfx) != tile_count * 32:
        raise ValueError(
            f"graphics size {len(gfx)} does not match {width}x{height} 4bpp OBJ ({tile_count * 32})"
        )

    base_tile = attr2 & 0x3FF
    if base_tile != 0:
        raise ValueError(f"relative OBJ tile index {base_tile} is not supported yet")

    pixels = [0] * (width * height)
    tiles_wide = width // 8
    for tile_no in range(tile_count):
        tile_pixels = decode_4bpp_tile(gfx[tile_no * 32:(tile_no + 1) * 32])
        tx = tile_no % tiles_wide
        ty = tile_no // tiles_wide
        for py in range(8):
            for px in range(8):
                pixels[(ty * 8 + py) * width + tx * 8 + px] = tile_pixels[py * 8 + px]

    pal_raw = bank.palette(desc)
    colors = [struct.unpack_from("<H", pal_raw, i * 2)[0] for i in range(16)]
    palette_rgb: list[int] = []
    for color in colors:
        palette_rgb.extend(bgr555_to_rgb(color))
    palette_rgb.extend([0] * (768 - len(palette_rgb)))

    image = Image.new("P", (width, height))
    image.putdata(pixels)
    image.putpalette(palette_rgb)
    image.info["transparency"] = 0
    png_path.parent.mkdir(parents=True, exist_ok=True)
    image.save(png_path, transparency=0, optimize=False)

    meta = {
        "bank_rom_offset": hex(BANK_OFFSET),
        "icon_id": icon_id,
        "animation": {"frame_count": frame_count, "first_frame": first_frame},
        "frame": {"id": first_frame, "sprite_id": sprite_id, "duration": duration},
        "descriptor": list(desc),
        "layout": {
            "index": layout_index,
            "attr0": hex(attr0),
            "attr1": hex(attr1),
            "attr2": hex(attr2),
            "extra": hex(extra),
            "x": signed_coord(attr1, 9),
            "y": signed_coord(attr0, 8),
            "width": width,
            "height": height,
        },
    }
    meta_path.parent.mkdir(parents=True, exist_ok=True)
    meta_path.write_text(json.dumps(meta, indent=2) + "\n")
    return meta


def export_animation(bank: PackedBank, animation_id: int, out_dir: Path, meta_path: Path) -> dict:
    frame_count, first_frame = bank.animation(animation_id)
    frames: list[dict] = []

    for frame_no in range(frame_count):
        frame_id = first_frame + frame_no
        sprite_id, duration = bank.frame(frame_id)
        desc = bank.descriptor(sprite_id)
        layout_count, layout_index = desc[0], desc[1]
        frame_meta: dict = {
            "frame_no": frame_no,
            "frame_id": frame_id,
            "sprite_id": sprite_id,
            "duration": duration,
            "descriptor": list(desc),
            "parts": [],
        }

        if layout_count == 0:
            if desc[2] != 0 or desc[4] != 0:
                raise ValueError(f"sprite {sprite_id} has resources but no OBJ parts")
            frame_meta["png"] = None
            frames.append(frame_meta)
            continue

        if desc[4] != 1:
            raise ValueError(f"sprite {sprite_id} uses {desc[4]} palettes; animation exporter requires 1")

        parts: list[dict] = []
        covered_tiles: set[int] = set()
        rectangles: list[tuple[int, int, int, int]] = []
        for part_no in range(layout_count):
            current_layout = layout_index + part_no
            attr0, attr1, attr2, extra = bank.layout(current_layout)
            if attr0 & (1 << 13):
                raise ValueError(f"sprite {sprite_id} part {part_no} is 8bpp")
            width, height = obj_dimensions(attr0, attr1)
            x = signed_coord(attr1, 9)
            y = signed_coord(attr0, 8)
            tile_offset = attr2 & 0x3FF
            tile_count = (width // 8) * (height // 8)
            if tile_offset + tile_count > desc[2]:
                raise ValueError(f"sprite {sprite_id} part {part_no} exceeds graphics span")
            rect = (x, y, x + width, y + height)
            for previous in rectangles:
                if max(rect[0], previous[0]) < min(rect[2], previous[2]) and max(rect[1], previous[1]) < min(rect[3], previous[3]):
                    raise ValueError(f"sprite {sprite_id} has overlapping OBJ rectangles; composite export would be lossy")
            rectangles.append(rect)
            covered_tiles.update(range(tile_offset, tile_offset + tile_count))
            parts.append({
                "part_no": part_no,
                "layout_index": current_layout,
                "attr0": hex(attr0),
                "attr1": hex(attr1),
                "attr2": hex(attr2),
                "extra": hex(extra),
                "x": x,
                "y": y,
                "width": width,
                "height": height,
                "tile_offset": tile_offset,
                "tile_count": tile_count,
            })

        if covered_tiles != set(range(desc[2])):
            raise ValueError(f"sprite {sprite_id} does not expose every graphics tile through its OBJ parts")

        min_x = min(part["x"] for part in parts)
        min_y = min(part["y"] for part in parts)
        max_x = max(part["x"] + part["width"] for part in parts)
        max_y = max(part["y"] + part["height"] for part in parts)
        canvas_width = max_x - min_x
        canvas_height = max_y - min_y
        pixels = [0] * (canvas_width * canvas_height)
        gfx = bank.graphics(desc)

        for part in parts:
            width = part["width"]
            height = part["height"]
            tiles_wide = width // 8
            tile_count = part["tile_count"]
            first_tile = part["tile_offset"]
            part_pixels = [0] * (width * height)
            for tile_no in range(tile_count):
                absolute_tile = first_tile + tile_no
                tile = gfx[absolute_tile * 32:(absolute_tile + 1) * 32]
                tile_pixels = decode_4bpp_tile(tile)
                tx = tile_no % tiles_wide
                ty = tile_no // tiles_wide
                for py in range(8):
                    for px in range(8):
                        part_pixels[(ty * 8 + py) * width + tx * 8 + px] = tile_pixels[py * 8 + px]
            dst_x = part["x"] - min_x
            dst_y = part["y"] - min_y
            for py in range(height):
                src = py * width
                dst = (dst_y + py) * canvas_width + dst_x
                pixels[dst:dst + width] = part_pixels[src:src + width]

        pal_raw = bank.palette(desc)
        colors = [struct.unpack_from("<H", pal_raw, i * 2)[0] for i in range(16)]
        palette_rgb: list[int] = []
        for color in colors:
            palette_rgb.extend(bgr555_to_rgb(color))
        palette_rgb.extend([0] * (768 - len(palette_rgb)))

        png_path = out_dir / f"{meta_path.stem}_frame_{frame_no:02d}.png"
        image = Image.new("P", (canvas_width, canvas_height))
        image.putdata(pixels)
        image.putpalette(palette_rgb)
        image.info["transparency"] = 0
        png_path.parent.mkdir(parents=True, exist_ok=True)
        image.save(png_path, transparency=0, optimize=False)

        frame_meta.update({
            "png": str(png_path),
            "origin_x": min_x,
            "origin_y": min_y,
            "width": canvas_width,
            "height": canvas_height,
            "parts": parts,
        })
        frames.append(frame_meta)

    meta = {
        "format": "packed-animation-v1",
        "bank_rom_offset": hex(BANK_OFFSET),
        "animation_id": animation_id,
        "animation": {"frame_count": frame_count, "first_frame": first_frame},
        "frames": frames,
    }
    meta_path.parent.mkdir(parents=True, exist_ok=True)
    meta_path.write_text(json.dumps(meta, indent=2) + "\n")
    return meta


def import_animation(
    bank: PackedBank,
    meta_path: Path,
    base_blob: bytearray | bytes | None = None,
) -> bytearray:
    meta = json.loads(meta_path.read_text())
    if meta.get("format") != "packed-animation-v1":
        raise ValueError(f"unsupported animation metadata format in {meta_path}")
    animation_id = int(meta["animation_id"])
    frame_count, first_frame = bank.animation(animation_id)
    if (frame_count, first_frame) != (meta["animation"]["frame_count"], meta["animation"]["first_frame"]):
        raise ValueError("animation metadata no longer matches bank")
    if len(meta["frames"]) != frame_count:
        raise ValueError("animation metadata frame list length mismatch")

    out = bytearray(bank.blob if base_blob is None else base_blob)
    for frame_no, frame_meta in enumerate(meta["frames"]):
        frame_id = first_frame + frame_no
        sprite_id, duration = bank.frame(frame_id)
        desc = bank.descriptor(sprite_id)
        if frame_meta["frame_no"] != frame_no or frame_meta["frame_id"] != frame_id:
            raise ValueError("animation frame metadata no longer matches bank")
        if frame_meta["sprite_id"] != sprite_id or frame_meta["duration"] != duration:
            raise ValueError("animation frame sprite/duration metadata no longer matches bank")
        if tuple(frame_meta["descriptor"]) != desc:
            raise ValueError("animation sprite descriptor metadata no longer matches bank")

        if desc[0] == 0:
            if frame_meta.get("png") is not None or desc[2] != 0 or desc[4] != 0:
                raise ValueError("empty animation frame metadata is inconsistent")
            continue
        if desc[4] != 1:
            raise ValueError(f"sprite {sprite_id} uses {desc[4]} palettes; animation importer requires 1")

        image = Image.open(Path(frame_meta["png"]))
        if image.mode != "P":
            raise ValueError("animation PNG must remain indexed/paletted (mode P)")
        expected_size = (int(frame_meta["width"]), int(frame_meta["height"]))
        if image.size != expected_size:
            raise ValueError(f"animation PNG size {image.size} != expected {expected_size}")
        values = list(image.getdata())
        if any(value >= 16 for value in values):
            raise ValueError("animation PNG uses palette index >=16; sprite is 4bpp")

        palette = image.getpalette()
        if palette is None:
            raise ValueError("animation PNG has no palette")
        pal_raw = bytearray()
        for i in range(16):
            rgb = tuple(palette[i * 3:i * 3 + 3])
            pal_raw.extend(struct.pack("<H", rgb_to_bgr555(rgb)))
        pal_start = bank.starts[4] + desc[5] * 32
        pal_size = desc[4] * 32
        if len(pal_raw) != pal_size:
            raise ValueError("animation palette size mismatch")
        out[pal_start:pal_start + pal_size] = pal_raw

        canvas_width, _canvas_height = expected_size
        origin_x = int(frame_meta["origin_x"])
        origin_y = int(frame_meta["origin_y"])
        gfx = bytearray(desc[2] * 32)
        covered_tiles: set[int] = set()
        if len(frame_meta["parts"]) != desc[0]:
            raise ValueError("animation part count metadata no longer matches bank")

        for part_no, part_meta in enumerate(frame_meta["parts"]):
            layout_index = desc[1] + part_no
            attr0, attr1, attr2, extra = bank.layout(layout_index)
            expected_attrs = (hex(attr0), hex(attr1), hex(attr2), hex(extra))
            actual_attrs = (part_meta["attr0"], part_meta["attr1"], part_meta["attr2"], part_meta["extra"])
            if part_meta["part_no"] != part_no or part_meta["layout_index"] != layout_index or actual_attrs != expected_attrs:
                raise ValueError("animation OBJ-part metadata no longer matches bank")
            width, height = obj_dimensions(attr0, attr1)
            x = signed_coord(attr1, 9)
            y = signed_coord(attr0, 8)
            tile_offset = attr2 & 0x3FF
            tile_count = (width // 8) * (height // 8)
            if (part_meta["x"], part_meta["y"], part_meta["width"], part_meta["height"], part_meta["tile_offset"], part_meta["tile_count"]) != (x, y, width, height, tile_offset, tile_count):
                raise ValueError("animation OBJ geometry metadata no longer matches bank")
            if any(tile in covered_tiles for tile in range(tile_offset, tile_offset + tile_count)):
                raise ValueError("animation OBJ parts share graphics tiles; importer requires disjoint tile coverage")
            covered_tiles.update(range(tile_offset, tile_offset + tile_count))

            src_x = x - origin_x
            src_y = y - origin_y
            tiles_wide = width // 8
            encoded = bytearray()
            for ty in range(height // 8):
                for tx in range(tiles_wide):
                    tile_pixels: list[int] = []
                    for py in range(8):
                        row = (src_y + ty * 8 + py) * canvas_width + src_x + tx * 8
                        tile_pixels.extend(values[row:row + 8])
                    encoded.extend(encode_4bpp_tile(tile_pixels))
            start = tile_offset * 32
            gfx[start:start + len(encoded)] = encoded

        if covered_tiles != set(range(desc[2])):
            raise ValueError(f"sprite {sprite_id} does not reconstruct every graphics tile")
        gfx_start = bank.starts[3] + desc[3] * 32
        out[gfx_start:gfx_start + len(gfx)] = gfx

    return out

def import_simple_icon(
    bank: PackedBank,
    png_path: Path,
    meta_path: Path,
    base_blob: bytearray | bytes | None = None,
) -> bytearray:
    meta = json.loads(meta_path.read_text())
    icon_id = int(meta["icon_id"])
    frame_count, first_frame = bank.animation(icon_id)
    if (frame_count, first_frame) != (
        meta["animation"]["frame_count"],
        meta["animation"]["first_frame"],
    ):
        raise ValueError("animation metadata no longer matches bank")

    sprite_id, _duration = bank.frame(first_frame)
    desc = bank.descriptor(sprite_id)
    attr0, attr1, attr2, _extra = bank.layout(desc[1])
    width, height = obj_dimensions(attr0, attr1)

    image = Image.open(png_path)
    if image.mode != "P":
        raise ValueError("PNG must remain indexed/paletted (mode P) for exact 4bpp round-trip")
    if image.size != (width, height):
        raise ValueError(f"PNG size {image.size} != expected {(width, height)}")

    values = list(image.getdata())
    if any(v >= 16 for v in values):
        raise ValueError("PNG uses palette index >=16; icon is 4bpp")

    tiles_wide = width // 8
    tiles_high = height // 8
    gfx = bytearray()
    for ty in range(tiles_high):
        for tx in range(tiles_wide):
            tile: list[int] = []
            for py in range(8):
                row = (ty * 8 + py) * width + tx * 8
                tile.extend(values[row:row + 8])
            gfx.extend(encode_4bpp_tile(tile))

    palette = image.getpalette()
    if palette is None:
        raise ValueError("PNG has no palette")
    pal_raw = bytearray()
    for i in range(16):
        rgb = tuple(palette[i * 3:i * 3 + 3])
        pal_raw.extend(struct.pack("<H", rgb_to_bgr555(rgb)))

    out = bytearray(bank.blob if base_blob is None else base_blob)
    gfx_start = bank.starts[3] + desc[3] * 32
    gfx_size = desc[2] * 32
    if len(gfx) != gfx_size:
        raise ValueError(f"encoded graphics size {len(gfx)} != original {gfx_size}")
    out[gfx_start:gfx_start + gfx_size] = gfx

    pal_start = bank.starts[4] + desc[5] * 32
    pal_size = desc[4] * 32
    if len(pal_raw) != pal_size:
        raise ValueError(f"encoded palette size {len(pal_raw)} != original {pal_size}")
    out[pal_start:pal_start + pal_size] = pal_raw
    return out


def cmd_info(args: argparse.Namespace) -> None:
    bank = PackedBank.from_rom(args.rom)
    print("counts:", bank.counts)
    print("pool starts:", [hex(BANK_OFFSET + x) for x in bank.starts])
    print("known frame-table end:", hex(BANK_OFFSET + bank.tail_start))
    print("opaque trailing bytes:", hex(BANK_SIZE - bank.tail_start))


def cmd_export(args: argparse.Namespace) -> None:
    bank = PackedBank.from_rom(args.rom)
    meta = export_simple_icon(bank, args.icon, args.png, args.meta)
    print(json.dumps(meta, indent=2))


def cmd_verify(args: argparse.Namespace) -> None:
    bank = PackedBank.from_rom(args.rom)
    rebuilt = import_simple_icon(bank, args.png, args.meta)
    if rebuilt != bank.blob:
        for i, (a, b) in enumerate(zip(bank.blob, rebuilt)):
            if a != b:
                raise SystemExit(
                    f"round-trip mismatch at bank +0x{i:X}: retail=0x{a:02X}, rebuilt=0x{b:02X}"
                )
        raise SystemExit("round-trip mismatch: different lengths")
    print(f"EXACT: {args.png} rebuilds the full 0x{BANK_SIZE:X}-byte bank byte-for-byte")




def parse_item_definitions() -> list[dict]:
    result: list[dict] = []
    specs = (
        ("tool", Path("data/item/tool.def")),
        ("article", Path("data/item/article.def")),
        ("food", Path("data/item/food.def")),
    )

    for kind, path in specs:
        text = path.read_text(errors="ignore")
        for line in text.splitlines():
            if not line.strip().startswith("/*") or "o(" not in line:
                continue
            inner = line[line.index("o(") + 2:line.rfind(")")]
            parts = [part.strip() for part in inner.split(",")]
            try:
                if kind == "food":
                    tag = parts[0]
                    icon_id = int(parts[4], 0)
                else:
                    tag = parts[0]
                    icon_id = int(parts[1], 0)
            except (IndexError, ValueError):
                continue
            result.append({"kind": kind, "tag": tag, "icon_id": icon_id})

    return result


def cmd_export_items(args: argparse.Namespace) -> None:
    bank = PackedBank.from_rom(args.rom)
    entries = parse_item_definitions()
    seen_icons: set[int] = set()
    manifest_entries: list[dict] = []

    for entry in entries:
        icon_id = entry["icon_id"]
        if icon_id in seen_icons:
            raise ValueError(f"duplicate item icon id {icon_id}")
        seen_icons.add(icon_id)

        kind = entry["kind"]
        tag = entry["tag"]
        stem = tag.lower()
        png = args.out_dir / kind / f"{stem}.png"
        meta = args.out_dir / kind / f"{stem}.json"
        export_simple_icon(bank, icon_id, png, meta)
        manifest_entries.append({
            "kind": kind,
            "tag": tag,
            "icon_id": icon_id,
            "png": str(png),
            "meta": str(meta),
        })

    manifest = {"icons": manifest_entries}
    manifest_path = args.out_dir / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"exported {len(manifest_entries)} item icons to {args.out_dir}")
    print(f"manifest: {manifest_path}")


def animation_resource_ranges(bank: PackedBank, animation_id: int) -> list[tuple[str, int, int]]:
    frame_count, first_frame = bank.animation(animation_id)
    ranges: list[tuple[str, int, int]] = []
    seen: set[tuple[str, int, int]] = set()
    for frame_no in range(frame_count):
        sprite_id, _duration = bank.frame(first_frame + frame_no)
        desc = bank.descriptor(sprite_id)
        candidates = (
            ("graphics", bank.starts[3] + desc[3] * 32, desc[2] * 32),
            ("palette", bank.starts[4] + desc[5] * 32, desc[4] * 32),
        )
        for candidate in candidates:
            if candidate[2] and candidate not in seen:
                seen.add(candidate)
                ranges.append(candidate)
    return ranges


def cmd_build(args: argparse.Namespace) -> None:
    bank = PackedBank.from_rom(args.rom)
    manifest = json.loads(args.manifest.read_text())
    out = bytearray(bank.blob)

    # Assets deliberately share tile and palette spans. Every source that
    # references a shared span must encode the same bytes.
    planned: dict[int, tuple[int, str]] = {}

    for entry in manifest.get("icons", []):
        source_format = entry.get("format", "simple")
        source_name = entry.get("tag", str(entry.get("icon_id", "asset")))

        if source_format == "animation":
            meta_path = Path(entry["meta"])
            meta = json.loads(meta_path.read_text())
            animation_id = int(meta["animation_id"])
            if "icon_id" in entry and int(entry["icon_id"]) != animation_id:
                raise ValueError(f"manifest/meta animation mismatch for {meta_path}")
            candidate = import_animation(bank, meta_path)
            ranges = animation_resource_ranges(bank, animation_id)
        elif source_format == "simple":
            png = Path(entry["png"])
            meta_path = Path(entry["meta"])
            meta = json.loads(meta_path.read_text())
            animation_id = int(meta["icon_id"])
            if "icon_id" in entry and int(entry["icon_id"]) != animation_id:
                raise ValueError(f"manifest/meta icon mismatch for {png}")
            candidate = import_simple_icon(bank, png, meta_path)
            frame_count, first_frame = bank.animation(animation_id)
            if frame_count != 1:
                raise ValueError(f"simple source requires single-frame icon {animation_id}")
            sprite_id, _duration = bank.frame(first_frame)
            desc = bank.descriptor(sprite_id)
            ranges = [
                ("graphics", bank.starts[3] + desc[3] * 32, desc[2] * 32),
                ("palette", bank.starts[4] + desc[5] * 32, desc[4] * 32),
            ]
        else:
            raise ValueError(f"unsupported manifest source format {source_format!r}")

        for resource_kind, start, size in ranges:
            if size == 0:
                continue
            data = candidate[start:start + size]
            for rel, value in enumerate(data):
                offset = start + rel
                previous = planned.get(offset)
                if previous is not None and previous[0] != value:
                    raise ValueError(
                        f"shared {resource_kind} conflict at bank +0x{offset:X}: "
                        f"{previous[1]} wants 0x{previous[0]:02X}, "
                        f"{source_name} wants 0x{value:02X}"
                    )
                planned[offset] = (value, source_name)

    for offset, (value, _source_name) in planned.items():
        out[offset] = value

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(out)

    if out == bank.blob:
        print(f"EXACT: rebuilt bank matches retail ({len(out)} bytes)")
    else:
        diffs = sum(a != b for a, b in zip(out, bank.blob))
        print(f"rebuilt custom bank: {len(out)} bytes, {diffs} byte positions differ from retail")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--rom", type=Path, default=Path("baserom.gba"))
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("info")
    p.set_defaults(func=cmd_info)

    p = sub.add_parser("export-icon")
    p.add_argument("--icon", type=lambda x: int(x, 0), required=True)
    p.add_argument("--png", type=Path, required=True)
    p.add_argument("--meta", type=Path, required=True)
    p.set_defaults(func=cmd_export)

    p = sub.add_parser("verify-icon")
    p.add_argument("--png", type=Path, required=True)
    p.add_argument("--meta", type=Path, required=True)
    p.set_defaults(func=cmd_verify)

    p = sub.add_parser("export-animation")
    p.add_argument("--animation", type=lambda x: int(x, 0), required=True)
    p.add_argument("--out-dir", type=Path, required=True)
    p.add_argument("--meta", type=Path, required=True)
    p.set_defaults(func=lambda args: print(json.dumps(export_animation(PackedBank.from_rom(args.rom), args.animation, args.out_dir, args.meta), indent=2)))

    p = sub.add_parser("verify-animation")
    p.add_argument("--meta", type=Path, required=True)
    def verify_animation(args: argparse.Namespace) -> None:
        bank = PackedBank.from_rom(args.rom)
        rebuilt = import_animation(bank, args.meta)
        if rebuilt != bank.blob:
            for i, (a, b) in enumerate(zip(bank.blob, rebuilt)):
                if a != b:
                    raise SystemExit(f"round-trip mismatch at bank +0x{i:X}: retail=0x{a:02X}, rebuilt=0x{b:02X}")
            raise SystemExit("round-trip mismatch: different lengths")
        print(f"EXACT: {args.meta} rebuilds the full 0x{BANK_SIZE:X}-byte bank byte-for-byte")
    p.set_defaults(func=verify_animation)

    p = sub.add_parser("export-items")
    p.add_argument("--out-dir", type=Path, default=Path("assets/item_icons"))
    p.set_defaults(func=cmd_export_items)

    p = sub.add_parser("build-bank")
    p.add_argument("--manifest", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.set_defaults(func=cmd_build)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
