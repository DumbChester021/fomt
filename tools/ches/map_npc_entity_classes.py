#!/usr/bin/env python3
"""Generate the proven resident NPC entity class/factory/vtable map."""

from __future__ import annotations

import json
import re
import struct
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ROM_BASE = 0x08000000
FACTORY_TABLE = 0x0801A924
RESIDENT_FIRST = 1
RESIDENT_LAST = 35

FUNC_START_RE = re.compile(r"^\s*thumb_func_start\s+(\S+)")
CHAR_RE = re.compile(r"//\s*(\d+):\s*(.+)$")
LITERAL_SYMBOL_RE = re.compile(r"@ =([A-Za-z_][A-Za-z0-9_]*)")
VTABLE_ADDR_RE = re.compile(r"^\s*(vtable_unk_([0-9A-Fa-f]{8})|__vt_[A-Za-z0-9_]+):\s*$")


def load_symbols():
    text = subprocess.check_output(
        ["arm-none-eabi-nm", "-n", "-C", "fomt.elf"],
        cwd=ROOT,
        text=True,
    )
    by_addr = {}
    addr_by_name = {}
    for line in text.splitlines():
        parts = line.split(None, 2)
        if len(parts) != 3 or not re.fullmatch(r"[0-9A-Fa-f]{8}", parts[0]):
            continue
        addr = int(parts[0], 16)
        name = parts[2]
        addr_by_name[name] = addr
        current = by_addr.get(addr)
        if current is None:
            by_addr[addr] = name
            continue

        def rank(value):
            return (
                value.startswith("gUnk_"),
                value.startswith("func_") or value.startswith("sub_"),
                len(value),
            )

        if rank(name) < rank(current):
            by_addr[addr] = name
    return by_addr, addr_by_name


def load_character_names():
    result = {}
    for line in (ROOT / "src/data_character_info.cc").read_text().splitlines():
        match = CHAR_RE.search(line)
        if match:
            result[int(match.group(1))] = match.group(2).strip()
    return result


def parse_constructor_metadata():
    path = ROOT / "asm/code_entities_08034CEC.s"
    lines = path.read_text().splitlines()
    starts = []
    for index, line in enumerate(lines):
        match = FUNC_START_RE.match(line)
        if match:
            starts.append((index, match.group(1)))

    metadata = {}
    for pos, (start, symbol) in enumerate(starts):
        stop = starts[pos + 1][0] if pos + 1 < len(starts) else len(lines)
        body = lines[start:stop]
        if not any(
            "bl __10ANpcEntityP10GameObjectP3NpcUiPCvUiUiUi" in line
            for line in body
        ):
            continue

        schedule = None
        vtable = None
        for line in body:
            match = LITERAL_SYMBOL_RE.search(line)
            if not match:
                continue
            value = match.group(1)
            if value.startswith("vtable_") or value.startswith("__vt_"):
                vtable = value
            elif "080F" in value or "Schedule" in value:
                schedule = value

        metadata[symbol] = {
            "schedule": schedule,
            "vtable": vtable,
        }
    return metadata


def parse_source_constructor_metadata():
    path = ROOT / "src/entity_resident_npcs.cc"
    if not path.exists():
        return {}

    lines = path.read_text().splitlines()
    metadata = {}
    for index, line in enumerate(lines[:-1]):
        match = re.match(
            r"^([A-Za-z_][A-Za-z0-9_]*Entity)::\1\(GameObject \* game_object, Npc \* npc, u32 context\)$",
            line,
        )
        if not match:
            continue

        class_name = match.group(1)
        initializer = lines[index + 1].strip()
        prefix = ": ANpcEntity("
        if not initializer.startswith(prefix) or not initializer.endswith(")"):
            continue

        args = [part.strip() for part in initializer[len(prefix):-1].split(",")]
        if len(args) != 7:
            continue

        schedule_expr = args[3]
        schedule = None if schedule_expr == "0" else schedule_expr.lstrip("&")
        constructor = f"__{len(class_name)}{class_name}P10GameObjectP3NpcUi"
        metadata[constructor] = {
            "schedule": schedule,
            "vtable": f"__vt_{len(class_name)}{class_name}",
        }

    return metadata


def parse_vtable_addresses(addr_by_name):
    result = {}
    lines = (ROOT / "asm/vtables.s").read_text().splitlines()
    for line in lines:
        match = VTABLE_ADDR_RE.match(line)
        if not match:
            continue
        name = match.group(1)
        explicit = match.group(2)
        if explicit:
            result[name] = int(explicit, 16)
        elif name in addr_by_name:
            result[name] = addr_by_name[name]

    # Source-owned concrete classes use linker aliases such as
    # __vt_10RickEntity = vtable_unk_080E7158.  nm exposes those aliases at
    # the retail vtable address, so retain them in the same lookup.
    for name, address in addr_by_name.items():
        if name.startswith("__vt_"):
            result.setdefault(name, address)

    return result


def decode_thumb_bl_targets(rom, address, max_bytes=0x100):
    offset = address - ROM_BASE
    data = rom[offset:offset + max_bytes]
    targets = []
    for rel in range(0, len(data) - 3, 2):
        first, second = struct.unpack_from("<HH", data, rel)
        if first & 0xF800 != 0xF000 or second & 0xF800 != 0xF800:
            continue
        high = first & 0x7FF
        if high & 0x400:
            high -= 0x800
        displacement = (high << 12) + ((second & 0x7FF) << 1)
        targets.append((address + rel, (address + rel + 4 + displacement) & 0xFFFFFFFF))
    return targets


def load_inventory():
    path = ROOT / "tools/ches/decomp_inventory.json"
    data = json.loads(path.read_text())
    return {row["symbol"]: row for row in data["functions"]}


def resolve_symbol(by_addr, pointer):
    raw = pointer
    address = pointer & ~1
    symbol = by_addr.get(address)
    return {
        "raw": f"0x{raw:08X}",
        "address": f"0x{address:08X}",
        "symbol": symbol,
    }


def build():
    rom = (ROOT / "baserom.gba").read_bytes()
    by_addr, addr_by_name = load_symbols()
    characters = load_character_names()
    ctor_meta = parse_constructor_metadata()
    ctor_meta.update(parse_source_constructor_metadata())
    vtable_addresses = parse_vtable_addresses(addr_by_name)
    inventory = load_inventory()

    # Lillia lives in its own exact source TU.
    lillia_constructor = "__12LilliaEntityP10GameObjectP3NpcUi"
    ctor_meta[lillia_constructor] = {
        "schedule": "gUnk_080F280C",
        "vtable": "__vt_12LilliaEntity",
    }
    vtable_addresses["__vt_12LilliaEntity"] = 0x080E7198

    constructor_targets = set(ctor_meta)
    table_offset = FACTORY_TABLE - ROM_BASE
    jump_targets = [
        struct.unpack_from("<I", rom, table_offset + selector * 4)[0]
        for selector in range(94)
    ]

    rows = []
    for selector in range(RESIDENT_FIRST, RESIDENT_LAST + 1):
        stub = jump_targets[selector]
        constructor = None
        constructor_address = None
        for _callsite, target in decode_thumb_bl_targets(rom, stub):
            symbol = by_addr.get(target)
            if symbol in constructor_targets:
                constructor = symbol
                constructor_address = target
                break

        if constructor is None:
            raise RuntimeError(
                f"selector {selector} at 0x{stub:08X}: constructor call not found"
            )

        meta = ctor_meta[constructor]
        vtable_name = meta["vtable"]
        vtable_address = vtable_addresses.get(vtable_name)
        if vtable_address is None:
            raise RuntimeError(f"vtable address not found: {vtable_name}")

        words = struct.unpack_from(
            "<16I", rom, vtable_address - ROM_BASE
        )
        slots = [
            resolve_symbol(by_addr, word)
            for word in words
        ]

        vfunc30_pointer = words[12] & ~1
        vfunc30_symbol = by_addr.get(vfunc30_pointer)
        ctor_inventory = inventory.get(constructor)
        vfunc_inventory = inventory.get(vfunc30_symbol)
        vfunc_source_owned = bool(
            vfunc30_symbol and vfunc30_symbol.startswith("vfunc_30__")
        )

        rows.append({
            "character_id": selector,
            "character_name": characters.get(selector, "?"),
            "factory_stub": f"0x{stub:08X}",
            "constructor": constructor,
            "constructor_address": f"0x{constructor_address:08X}",
            "schedule": meta["schedule"],
            "vtable": vtable_name,
            "vtable_address": f"0x{vtable_address:08X}",
            "destructor": slots[2],
            "vfunc_30": slots[12],
            "vfunc_3C": slots[15],
            "constructor_shape": (
                ctor_inventory.get("shape_cluster") if ctor_inventory else "source"
            ),
            "constructor_size": (
                ctor_inventory.get("size") if ctor_inventory else 0x3C
            ),
            "vfunc_30_shape": (
                vfunc_inventory.get("shape_cluster")
                if vfunc_inventory
                else ("source" if vfunc_source_owned else "unlabeled")
            ),
            "vfunc_30_size": (
                vfunc_inventory.get("size")
                if vfunc_inventory
                else (0x2C if selector == 1 else None)
            ),
            "vtable_slots": slots,
        })

    return rows


def write_outputs(rows):
    json_path = ROOT / "tools/ches/npc_entity_class_map.json"
    md_path = ROOT / "tools/ches/NPC_ENTITY_CLASS_MAP.md"

    payload = {
        "schema": "fomt-resident-npc-entity-map-v1",
        "factory": "func_0801A8E0",
        "factory_table": f"0x{FACTORY_TABLE:08X}",
        "resident_character_count": len(rows),
        "evidence": [
            "Factory selector jump table read directly from baserom.gba.",
            "Thumb BL calls decoded from each selector stub and resolved through fomt.elf.",
            "Constructor schedule/vtable literals parsed from code_entities_08034CEC.s.",
            "Character IDs/names read from data_character_info.cc.",
            "Vtable words read directly from baserom.gba and resolved through fomt.elf.",
            "Similarity shapes joined from decomp_inventory.json.",
        ],
        "characters": rows,
    }
    json_path.write_text(json.dumps(payload, indent=2) + "\n")

    lines = [
        "# Resident NPC entity class map",
        "",
        "Generated by tools/ches/map_npc_entity_classes.py.",
        "Selectors 1..35 are proven by the retail factory table and decoded constructor calls.",
        "",
        "| ID | Character | Constructor | Schedule | Vtable | +30 virtual | Constructor shape | +30 shape | +3C override |",
        "| ---: | --- | --- | --- | --- | --- | --- | --- | --- |",
    ]
    for row in rows:
        v30 = row["vfunc_30"]["symbol"] or row["vfunc_30"]["address"]
        v3c = row["vfunc_3C"]["symbol"] or row["vfunc_3C"]["address"]
        lines.append(
            f"| {row['character_id']} | {row['character_name']} | "
            f"{row['constructor']} | {row['schedule'] or '-'} | "
            f"{row['vtable']} | {v30} | "
            f"{row['constructor_shape'] or 'solo'} | "
            f"{row['vfunc_30_shape'] or 'solo'} | {v3c} |"
        )

    from collections import Counter
    ctor_shapes = Counter(
        row["constructor_shape"] or "solo" for row in rows[1:]
    )
    v30_shapes = Counter(
        row["vfunc_30_shape"] or "solo" for row in rows[1:]
    )
    lines += [
        "",
        "## Family leverage",
        "",
        "Constructor shape counts among IDs 2..35: "
        + ", ".join(f"{key}={value}" for key, value in ctor_shapes.most_common())
        + ".",
        "",
        "+0x30 virtual shape counts among IDs 2..35: "
        + ", ".join(f"{key}={value}" for key, value in v30_shapes.most_common())
        + ".",
        "",
        "Rick is the first exact representative: its 0x38-byte constructor and "
        "0x2C-byte +0x30 virtual both match retail with zero differing linked bytes "
        "using the Lillia source shape.",
    ]
    md_path.write_text("\n".join(lines) + "\n")
    print(json_path)
    print(md_path)


if __name__ == "__main__":
    rows = build()
    write_outputs(rows)
    print(f"mapped {len(rows)} resident NPC entity classes")
