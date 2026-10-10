#!/usr/bin/env python3
"""Print save-system exact-source progress for the *bounded evidence-matrix subset*.

This is intentionally NOT an estimate of whole save-system completeness.
The matrix includes only independently bounded research targets.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
MATRIX = ROOT / "docs/SAVE_EVIDENCE_MATRIX.md"
ROW = re.compile(
    r"^\| (0x[0-9A-Fa-f]{8}) \| ([^|]+) \| (\d+) \| "
    r"(EXACT|ASM) \|"
)

def main():
    rows = []
    for line in MATRIX.read_text().splitlines():
        match = ROW.match(line)
        if match:
            address, label, size, state = match.groups()
            rows.append((address, label.strip(), int(size), state))
    if not rows:
        raise SystemExit("save-progress: no function rows found in evidence matrix")
    code_bytes = sum(size for _, _, size, state in rows if state == "EXACT")
    asm_bytes = sum(size for _, _, size, state in rows if state == "ASM")
    matching = sum(1 for *_, state in rows if state == "EXACT")
    pending = [(address, label, size) for address, label, size, state in rows if state == "ASM"]
    total = code_bytes + asm_bytes
    print("\nSave decompilation (tracked function subset ONLY)")
    print(f"  Exact-source functions: {matching}/{len(rows)}; {code_bytes:,}/{total:,} bytes ({code_bytes/total*100:.1f}%)")
    print(f"  Still in retail ASM: {len(pending)} functions / {asm_bytes:,} bytes")
    for addr, label, size in pending:
        print(f"    {addr} {label}: {size} B")
    print("  Scope WARNING: NOT whole-save-system completion. Other save/UI/SRAM routines remain outside this 12-function matrix.")
    print("  Runtime status: no recorded real player-save emulator round-trip; synthetic SRAM tests are separate.")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
