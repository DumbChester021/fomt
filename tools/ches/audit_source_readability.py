#!/usr/bin/env python3
"""Repeatable source-readability *triage*, not a semantic-quality percentage.

Scan all compiled production C/C++ (src/*.cc and src/*.c). Avoid counting
comments and strings as executable source; keep location evidence for manual
review. A small, reviewed exception ceiling forbids *new* low-level register/
inline-ASM forcing without deliberate audit baseline changes.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASELINE = ROOT / "tools/ches/readability_exceptions.json"
SOURCE_GLOBS = ("src/*.cc", "src/*.c", "src/rt/*.cc", "src/rt/*.c")
HARD_REGISTER = re.compile(r"\bregister\s+[^;\n{}]*?\basm\s*\(\s*", re.M)
ASM_TOKEN = re.compile(r"\b(?:__asm__|asm)\s*(?:__volatile__|volatile\s*)?\s*\(")
PATTERNS = {
    "address_named_function_definitions": re.compile(
        r"(?m)^\s*(?:EC\s+)?(?:void|bool|u8|u16|u32|s8|s16|s32|int|unsigned|"
        r"char\s*\*|[A-Za-z_]\w*\s*\*)\s+func_0[0-9A-Fa-f]{7,8}\s*"
        r"\([^;{}]*\)\s*\{"
    ),
    "address_symbol_mentions": re.compile(
        r"\b(?:func_0[0-9A-Fa-f]{7,8}|sub_0[0-9A-Fa-f]{7,8}|gUnk_[0-9A-Fa-f]{8})\b"
    ),
    "layout_padding_fields": re.compile(r"\b(?:pad|unknown|unk)[A-Za-z0-9_]*\s*\["),
    "offset_named_callbacks": re.compile(r"\b(?:action|slot|method)(?:0x)?[A-Fa-f0-9]{2,3}\s*\("),
    "explicit_volatile": re.compile(r"\bvolatile\b"),
    "reinterpret_casts": re.compile(r"\breinterpret_cast\s*<"),
    "legacy_address_aliases": re.compile(r"\bALIAS\s*\("),
}
CHECK_CATEGORIES = ("hard_register_bindings", "inline_assembly")
DISPLAY_CATEGORIES = (*PATTERNS.keys(), "abi_symbol_bindings", "hard_register_bindings", "inline_assembly")


def mask_comments_and_strings(source: str) -> str:
    """Replace non-code with spaces, keeping character indices and newlines.

    Deliberately lightweight lexer: not a C++ grammar, but handles block/line
    comments, escapes, ordinary strings and character literals. Conservative
    on raw strings (which are not used by the old agbcc project's sources).
    """
    result = list(source)
    i = 0
    n = len(source)
    while i < n:
        start = i
        if source.startswith("//", i):
            i = source.find("\n", i)
            if i == -1:
                i = n
        elif source.startswith("/*", i):
            end = source.find("*/", i + 2)
            i = end + 2 if end >= 0 else n
        elif source[i] in ('"', "'"):
            quote = source[i]
            i += 1
            while i < n:
                if source[i] == "\\":
                    i += 2
                elif source[i] == quote:
                    i += 1
                    break
                else:
                    i += 1
        else:
            i += 1
            continue
        for pos in range(start, min(i, n)):
            if source[pos] != "\n":
                result[pos] = " "
    return "".join(result)


def occurrences(path: Path, source: str, code: str):
    matches = {category: list(pattern.finditer(code))
               for category, pattern in PATTERNS.items()}
    hard = list(HARD_REGISTER.finditer(code))
    def is_symbol_binding(m):
        # C/C++ assembler *label* on an extern declaration is not inline code.
        # Match the original string, as string contents are masked in code.
        tail = source[m.start():].split("\n", 1)[0]
        return (bool(re.match(r'(?:__asm__|asm)\s*\(\s*"[A-Za-z_]\w*"\s*\)', tail))
                and "extern " in source[source.rfind("\n", 0, m.start()) + 1:m.start()])

    symbol_bindings = [m for m in ASM_TOKEN.finditer(code) if is_symbol_binding(m)]
    asm = [m for m in ASM_TOKEN.finditer(code)
           if not any(h.start() <= m.start() < h.end() for h in hard)
           and not any(s.start() == m.start() for s in symbol_bindings)]
    matches["abi_symbol_bindings"] = symbol_bindings
    matches["hard_register_bindings"] = hard
    matches["inline_assembly"] = asm
    # 'compiler_sensitive_constructs' remains for older output consumers;
    # volatile MMIO alone does not constitute forcing. See separate buckets.
    matches["compiler_sensitive_constructs"] = [
        *hard, *asm, *matches["explicit_volatile"]
    ]
    return matches


def inventory(include_locations: bool = False):
    files = sorted({p for glob in SOURCE_GLOBS for p in ROOT.glob(glob)})
    totals = {name: 0 for name in (*DISPLAY_CATEGORIES, "compiler_sensitive_constructs")}
    touched = dict.fromkeys(totals, 0)
    rows = []
    evidence = []
    total_lines = 0

    for path in files:
        source = path.read_text(encoding="utf-8")
        code = mask_comments_and_strings(source)
        total_lines += len(source.splitlines())
        found = occurrences(path, source, code)
        counts = {k: len(v) for k, v in found.items()}
        for category in totals:
            totals[category] += counts[category]
            touched[category] += int(counts[category] > 0)
        rel = path.relative_to(ROOT).as_posix()
        if any(counts.values()):
            rows.append({"path": rel, **counts})
        if include_locations:
            lines = source.splitlines()
            for category in DISPLAY_CATEGORIES:
                for match in found[category]:
                    line = source.count("\n", 0, match.start()) + 1
                    evidence.append({
                        "path": rel,
                        "line": line,
                        "category": category,
                        "excerpt": lines[line - 1].strip()[:160],
                    })

    def rank(row):
        return (
            row["hard_register_bindings"] * 4 +
            row["inline_assembly"] * 4 +
            row["address_named_function_definitions"] +
            row["offset_named_callbacks"]
        )

    return {
        "scope": "src/*.cc + src/*.c (including src/rt if present); lexical triage only",
        "files": len(files),
        "lines": total_lines,
        "counts": totals,
        "files_with_indicator": touched,
        "top_flagged_files": sorted(rows, key=lambda r: (-rank(r), r["path"]))[:20],
        "high_risk_by_file": {
            row["path"]: {cat: row[cat] for cat in CHECK_CATEGORIES}
            for row in rows if any(row[cat] for cat in CHECK_CATEGORIES)
        },
        **({"locations": sorted(evidence, key=lambda e: (
            e["category"], e["path"], e["line"]))} if include_locations else {}),
    }


def enforce_baseline(report):
    baseline = json.loads(BASELINE.read_text(encoding="utf-8"))
    expected = baseline["high_risk_by_file"]
    actual = report["high_risk_by_file"]
    issues = []
    for path in sorted(set(expected) | set(actual)):
        for category in CHECK_CATEGORIES:
            before = expected.get(path, {}).get(category, 0)
            now = actual.get(path, {}).get(category, 0)
            if now > before:
                issues.append(f"{path}: {category} increased {before} -> {now}")
    return issues


def self_test():
    sample = ('// register int x asm("r0");\n'
              'char const *str = "asm volatile(x)";\n'
              '/* func_08010000() */ register int x asm("r0");\n'
              'asm volatile("" : : : "memory");\n'
              'extern int external_call() asm("func_08001234");\n')
    code = mask_comments_and_strings(sample)
    m = occurrences(Path("src/test.cc"), sample, code)
    assert len(code) == len(sample)
    assert [len(m[k]) for k in CHECK_CATEGORIES] == [1, 1]
    assert len(m["abi_symbol_bindings"]) == 1
    assert not re.search(r"func_08010000", code)
    assert len(code.splitlines()) == len(sample.splitlines())
    # A previously unseen forced register must trip CI; the regression guard
    # tests the baseline without mutating any real source file.
    simulated = {"high_risk_by_file": {
        "src/simulated_new.cc": {"hard_register_bindings": 1}}}
    assert any("src/simulated_new.cc" in x for x in enforce_baseline(simulated))
    print("Readability lexer, ABI binding and new-coercion guard: OK")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="JSON summary")
    parser.add_argument("--details", action="store_true",
                        help="include path, line and excerpt for every indicator")
    parser.add_argument("--check", action="store_true",
                        help="fail on newly introduced forced registers or inline ASM")
    parser.add_argument("--self-test", action="store_true")
    opts = parser.parse_args()

    if opts.self_test:
        self_test()
        return
    report = inventory(include_locations=opts.details)
    if opts.json:
        print(json.dumps(report, indent=2))
    else:
        print(f"Source audit: {report['files']} C/C++ units, {report['lines']} lines")
        for name, count in report["counts"].items():
            print(f"  {name}: {count} occurrences in "
                  f"{report['files_with_indicator'][name]} files")
        print("Highest-triage units (not a readability ranking):")
        for row in report["top_flagged_files"][:12]:
            print(f"  {row['path']}: address definitions="
                  f"{row['address_named_function_definitions']}, "
                  f"callback offsets={row['offset_named_callbacks']}, "
                  f"hard registers={row['hard_register_bindings']}, "
                  f"inline ASM={row['inline_assembly']}")
        if opts.details:
            for row in report["locations"]:
                if row["category"] in CHECK_CATEGORIES:
                    print(f"  {row['path']}:{row['line']} "
                          f"{row['category']}: {row['excerpt']}")
        print("Heuristic counts are not a semantic quality grade.")
    if opts.check:
        problems = enforce_baseline(report)
        if problems:
            for item in problems:
                print(f"READABILITY REGRESSION: {item}")
            raise SystemExit(1)
        print("Readability high-risk source ceiling: OK")


if __name__ == "__main__":
    main()
