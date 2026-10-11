#!/usr/bin/env python3
"""Reproduce the FoMT native action selector -> saved bitfield index from retail ASM.

No ROM changes, no external dependencies. Selector IDs are NOT direct VM CALL
opcodes or proven event names. This checks only simple, directly addressed writes.
"""
import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ASM = ROOT / "asm/code_0803EE94.s"
HEADER = ROOT / "include/saved_native_call_state.hh"
JUMP_TABLE = ".L08049034"
SHARED_BIT6 = ".L0804DA1A"


def build_map():
    asm = ASM.read_text().splitlines()
    header = HEADER.read_text().splitlines()
    fields = {}
    for line in header:
        m = re.match(
            r"\s*u(?:8|16|32)\s+(\w+):(\d+);\s*//\s*\+0x([0-9a-fA-F]+)\.bit([0-7])",
            line,
        )
        if m:
            name, width, offset, bit = m.groups()
            fields[(int(offset, 16), int(bit))] = (name, int(width))
    assert len(fields) >= 450, "Incomplete offset-annotated packed-state fields"

    labels = {}
    for i, line in enumerate(asm):
        m = re.match(r"(\.L[0-9a-fA-F]+):", line)
        if m:
            labels[m.group(1)] = i
    assert JUMP_TABLE in labels and SHARED_BIT6 in labels
    tail = asm[labels[SHARED_BIT6]:labels[SHARED_BIT6]+9]
    assert any("ands r6, r0" in x for x in tail)
    assert any("lsls r3, r6, #6" in x for x in tail)

    cases = []
    for line in asm[labels[JUMP_TABLE]+1:]:
        m = re.match(r"\s*\.4byte\s+(\.L[0-9a-fA-F]+)\s+@\s+case\s+(\d+)", line)
        if not m:
            break
        handler, index = m.group(1), int(m.group(2))
        assert index == len(cases)
        cases.append((index + 0x1c, handler))
    assert len(cases) == 562, f"Unexpected dispatch table length {len(cases)}"

    matched = []
    direct = 0
    for selector, handler in cases:
        start = labels[handler]
        block = []
        for i in range(start + 1, min(len(asm), start + 42)):
            line = asm[i].strip()
            if re.match(r"^\.L[0-9a-fA-F]+:", line) or line.startswith(".align"):
                break
            block.append((i, line))
        targets = []
        for i, line in block:
            m = re.search(r"@\s*=\s*0x0*([0-9a-fA-F]+)\b", line)
            if m:
                addr = int(m.group(1), 16)
                if 0x214c <= addr < 0x21cc:
                    targets.append(addr - 0x214c)
        if targets:
            direct += 1
        if len(targets) != 1:
            continue

        branch = next((line for _, line in reversed(block)
                       if re.match(r"(?:b|bl|bx)\s+", line)), None)
        input_mask = None
        for i, line in block:
            if re.search(r"\bands r6,\s*r0\b", line):
                for prev_i, prev in reversed(block):
                    if prev_i >= i:
                        continue
                    m = re.search(r"\bmovs r0,\s*#(0x[0-9a-fA-F]+|\d+)", prev)
                    if m:
                        input_mask = int(m.group(1), 0)
                        break
                break

        shifts = [int(m.group(1), 0) for _, line in block
                  if (m := re.search(
                      r"\blsls r3,\s*r6,\s*#(0x[0-9a-fA-F]+|\d+)", line))]
        if len(shifts) > 1:
            continue
        shift = shifts[0] if shifts else None
        if shift is None and branch in ("b .L0804DA2C", "bl .L0804DA2C"):
            shift = 0
        if shift is None and (branch in (f"b {SHARED_BIT6}", f"bl {SHARED_BIT6}")
                              or handler == ".L0804DA10"):
            shift, input_mask = 6, 1
        if shift is None or shift >= 8:
            continue
        member = fields.get((targets[0], shift))
        if not member:
            continue
        name, width = member
        if input_mask is not None and input_mask != (1 << width) - 1:
            continue
        matched.append({
            "selector": selector,
            "offset": targets[0],
            "bit": shift,
            "width": width,
            "member": name,
            "handler": handler,
        })
    return len(cases), direct, matched


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true", help="Enforce known retail mapping and source names")
    ap.add_argument("--json", action="store_true", help="Print full mapping as JSON")
    args = ap.parse_args()
    count, direct, matches = build_map()
    selector_ids = [x["selector"] for x in matches]
    names = [x["member"] for x in matches]
    if args.check:
        assert (count, direct, len(matches)) == (562, 450, 413), (count, direct, len(matches))
        assert len(set(selector_ids)) == len(matches)
        assert len(set(names)) == len(matches)
        for m in matches:
            assert m["member"] == f"native_selector_{m['selector']:03x}", m
        assert {x["selector"] for x in matches} >= {0xf8, 0x1c3, 0x1c7, 0x24b, 0x24c}
    if args.json:
        print(json.dumps(matches, indent=2))
    else:
        print(f"Retail action selector index: {count} cases, {direct} direct packed-address cases, "
              f"{len(matches)} unique selector-to-field matches")
        print("Only verified direct writes; unindexed cases and gameplay meanings remain unclaimed.")
        if args.check:
            print("Selector-to-source verification: PASS")


if __name__ == "__main__":
    main()
