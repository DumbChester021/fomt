#!/usr/bin/env python3
"""Read-only preflight for the current FoMT retail save-system evidence table.

This checks documentation versus the current source-owned aliases and the
generated linked-assembly inventory. It does NOT prove semantics or rerun the
full-ROM hash gate.
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MATRIX = ROOT / "docs/SAVE_EVIDENCE_MATRIX.md"
INVENTORY = ROOT / "tools/ches/decomp_inventory.json"
TOTAL_CODE = 940_036

ROW = re.compile(
    r"^\| (0x[0-9A-Fa-f]{8}) \| ([^|]+) \| (\d+) \| "
    r"(EXACT|ASM) \| ([^|]+) \|"
)


def main() -> int:
    errors = []
    text = MATRIX.read_text()
    inventory = json.loads(INVENTORY.read_text())
    functions = inventory["functions"]
    unresolved = {f["symbol"]: f for f in functions}
    rows = []
    starts = set()
    for line in text.splitlines():
        match = ROW.match(line)
        if match:
            address, name, size_text, owner, path_text = match.groups()
            addr = int(address, 16)
            size = int(size_text)
            symbol = f"func_{addr:08X}"
            if addr in starts:
                errors.append(f"duplicate matrix address: {address}")
            starts.add(addr)
            path = ROOT / path_text.strip()
            if not path.is_file():
                errors.append(f"{address} missing implementation path: {path_text}")
                continue
            code = path.read_text()
            if owner == "EXACT":
                if symbol in unresolved:
                    errors.append(f"{address} labeled EXACT but still in linked ASM inventory")
                if symbol not in code:
                    errors.append(f"{address} source has no original ABI alias {symbol}")
            else:
                record = unresolved.get(symbol)
                if record is None:
                    errors.append(f"{address} labeled ASM but absent from unresolved inventory")
                else:
                    if int(record["address"]) != addr:
                        errors.append(f"{address} symbol address mismatch")
                    if int(record["size"]) != size:
                        errors.append(f"{address} size: matrix {size}, inventory {record['size']}")
                if f"{symbol}:" not in code:
                    errors.append(f"{address} ASM source lacks original function definition")
            rows.append((addr, size, owner))
    if len(rows) < 10:
        errors.append(f"only {len(rows)} function rows parsed; matrix may be malformed")
    rows.sort()
    for (a, n, _), (b, _, _) in zip(rows, rows[1:]):
        if a + n > b:
            errors.append(f"overlapping retail spans: {a:#x}..{a+n:#x} and {b:#x}")

    remaining = int(inventory["summary"]["canonical_asm_code_bytes"])
    recovered = TOTAL_CODE - remaining
    marker = f"{recovered:,} / {TOTAL_CODE:,}"
    pct = f"{100 * recovered / TOTAL_CODE:.4f}%"
    # Only the live dashboard owns current numbers; no competing status copies.
    for rel in ("START_HERE.md",):
        page = (ROOT / rel).read_text()
        if marker not in page:
            errors.append(f"{rel} lacks current metric {marker}")
        if pct not in page:
            errors.append(f"{rel} lacks current percentage {pct}")

    # The two-way Rucksack boundary is a known earlier interpretation error.
    expected = {0x080D6A80: (128, "EXACT"), 0x080D6B00: (64, "EXACT")}
    by_addr = {a: (n, owner) for a, n, owner in rows}
    for addr, state in expected.items():
        if by_addr.get(addr) != state:
            errors.append(f"Rucksack 128-byte copy / 64-byte cleanup split drift at {addr:#x}")

    try:
        head = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"], cwd=ROOT, text=True
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        head = "unavailable"
    print(f"Git HEAD: {head}")
    print(f"Evidence rows: {len(rows)} | linked ASM functions: "
          f"{len(functions)} | reconstructed code: {marker} ({pct})")
    if errors:
        for error in errors:
            print("ERROR:", error, file=sys.stderr)
        return 1
    print("Save evidence cross-check: PASS (not a full ROM or runtime test)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
