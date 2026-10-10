#!/usr/bin/env python3
"""Heuristic source-readability inventory, not a semantic understanding score.

The tool reports evidence debt requiring human review. All counts concern
src/*.cc only; they are not a percentage of properly decompiled ROM.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PATTERNS = {
    "address_named_function_definitions": re.compile(
        r"(?m)^\s*(?:void|bool|u8|u16|u32|s8|s16|s32|int|unsigned|"
        r"char\s*\*|[A-Za-z_]\w*\s*\*)\s+func_0[0-9A-Fa-f]{7,8}\s*\("
    ),
    "address_symbol_mentions": re.compile(
        r"\b(?:func_0[0-9A-Fa-f]{7,8}|sub_0[0-9A-Fa-f]{7,8}|gUnk_[0-9A-Fa-f]{8})\b"
    ),
    "layout_padding_fields": re.compile(r"\b(?:pad|unknown|unk)[A-Za-z0-9_]*\s*\["),
    "offset_named_callbacks": re.compile(
        r"\b(?:action|slot|method)(?:0x)?[A-Fa-f0-9]{2,3}\s*\("
    ),
    "compiler_sensitive_constructs": re.compile(
        r"\b(?:__asm__|asm\s*\(|register\s+\w+\s+asm\s*\(|volatile)\b"
    ),
}
def inventory():
    files = sorted((ROOT / "src").glob("*.cc"))
    rows = []
    totals = {name: 0 for name in PATTERNS}
    touched = {name: 0 for name in PATTERNS}
    for path in files:
        source = path.read_text(encoding="utf-8")
        counts = {name: len(regex.findall(source)) for name, regex in PATTERNS.items()}
        for name, amount in counts.items():
            totals[name] += amount
            touched[name] += amount > 0
        if any(counts.values()):
            rows.append({"path": path.relative_to(ROOT).as_posix(), **counts})
    return {
        "scope": "src/*.cc (heuristics, not a human-readability grade)",
        "files": len(files),
        "lines": sum(len(p.read_text(encoding="utf-8").splitlines()) for p in files),
        "counts": totals,
        "files_with_indicator": touched,
        "top_flagged_files": sorted(
            rows, key=lambda row: (
                row["address_named_function_definitions"] +
                row["offset_named_callbacks"] +
                row["compiler_sensitive_constructs"], row["path"]
            ), reverse=True
        )[:20],
    }

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="machine-readable output")
    options = parser.parse_args()
    report = inventory()
    if options.json:
        print(json.dumps(report, indent=2))
    else:
        print(f"Source audit: {report['files']} C++ units, {report['lines']} lines")
        for name, count in report["counts"].items():
            print(f"  {name}: {count} occurrences in "
                  f"{report['files_with_indicator'][name]} files")
        print("Most flagged units (not a quality ranking):")
        for row in report["top_flagged_files"][:10]:
            print(f"  {row['path']}: address definitions="
                  f"{row['address_named_function_definitions']}, "
                  f"callback offsets={row['offset_named_callbacks']}, "
                  f"compiler-sensitive={row['compiler_sensitive_constructs']}")
        print("Manual semantic review is essential; exact ROM builds do not grade readability.")

if __name__ == "__main__":
    main()
