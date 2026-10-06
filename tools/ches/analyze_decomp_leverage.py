#!/usr/bin/env python3
"""Rank unresolved FoMT assembly functions by decompilation leverage.

This is a project analysis helper. It is intentionally heuristic: call
fan-out is evidence for architectural value, not a substitute for human review.

Metrics:
- direct_calls: number of direct BL/BLX references from remaining assembly
- unique_callers: number of distinct unresolved caller functions
- caller_files: number of assembly files containing direct callers
- size: approximate linked size from the next text symbol in fomt.elf
- leverage_score: rewards fan-out and cross-module use, penalizes large size

Use the ranking to find foundational functions/types that unlock many later
decompilations. Then classify them manually before changing the roadmap.
"""

from __future__ import annotations

import argparse
import bisect
import collections
import math
import re
import subprocess
from dataclasses import dataclass
from pathlib import Path


FUNC_RE = re.compile(r"func_0[0-9A-Fa-f]{7}")
DEF_RE = re.compile(r"\b(?:thumb_func_start|arm_func_start)\s+(func_0[0-9A-Fa-f]{7})")
CALL_RE = re.compile(r"\bblx?\s+(func_0[0-9A-Fa-f]{7})")


@dataclass
class Row:
    symbol: str
    direct_calls: int
    unique_callers: int
    caller_files: int
    size: int | None
    definition: str
    score: float


def collect(repo: Path) -> list[Row]:
    definitions: dict[str, tuple[str, int]] = {}
    calls: dict[str, list[tuple[str | None, str, int]]] = collections.defaultdict(list)

    for path in (repo / "asm").rglob("*.s"):
        rel = str(path.relative_to(repo))
        current: str | None = None
        for line_no, line in enumerate(path.read_text(errors="ignore").splitlines(), 1):
            m = DEF_RE.search(line)
            if m:
                current = m.group(1)
                definitions[current] = (rel, line_no)

            m = CALL_RE.search(line)
            if m:
                calls[m.group(1)].append((current, rel, line_no))

    nm = subprocess.check_output(
        ["arm-none-eabi-nm", "-n", "fomt.elf"],
        cwd=repo,
        text=True,
        errors="ignore",
    )

    text_symbols: list[tuple[int, str]] = []
    for line in nm.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        if not re.fullmatch(r"[0-9A-Fa-f]{8}", parts[0]):
            continue
        if parts[1].lower() != "t":
            continue
        text_symbols.append((int(parts[0], 16), parts[2]))

    address = {name: addr for addr, name in text_symbols}
    sorted_addresses = sorted(addr for addr, _ in text_symbols)

    rows: list[Row] = []
    for symbol, (rel, line_no) in definitions.items():
        call_sites = calls.get(symbol, [])
        direct_calls = len(call_sites)
        unique_callers = len({caller for caller, _, _ in call_sites if caller})
        caller_files = len({relpath for _, relpath, _ in call_sites})

        addr = address.get(symbol)
        size: int | None = None
        if addr is not None:
            index = bisect.bisect_right(sorted_addresses, addr)
            if index < len(sorted_addresses):
                candidate = sorted_addresses[index] - addr
                if 0 < candidate <= 0x2000:
                    size = candidate

        raw = unique_callers * 10 + direct_calls + caller_files * 5
        score = raw / math.sqrt(max(size or 4, 4))

        rows.append(
            Row(
                symbol=symbol,
                direct_calls=direct_calls,
                unique_callers=unique_callers,
                caller_files=caller_files,
                size=size,
                definition=f"{rel}:{line_no}",
                score=score,
            )
        )

    rows.sort(
        key=lambda row: (
            row.score,
            row.unique_callers,
            row.direct_calls,
            row.caller_files,
        ),
        reverse=True,
    )
    return rows


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--top", type=int, default=100)
    parser.add_argument("--min-callers", type=int, default=1)
    parser.add_argument("--markdown", action="store_true")
    args = parser.parse_args()

    rows = [r for r in collect(args.repo) if r.unique_callers >= args.min_callers][: args.top]

    if args.markdown:
        print("| Rank | Function | Score | Unique callers | Calls | Files | Approx size | Definition |")
        print("| ---: | --- | ---: | ---: | ---: | ---: | ---: | --- |")
        for rank, row in enumerate(rows, 1):
            size = f"0x{row.size:X}" if row.size is not None else "?"
            print(
                f"| {rank} | `{row.symbol}` | {row.score:.1f} | "
                f"{row.unique_callers} | {row.direct_calls} | {row.caller_files} | "
                f"{size} | `{row.definition}` |"
            )
    else:
        for rank, row in enumerate(rows, 1):
            size = f"0x{row.size:X}" if row.size is not None else "?"
            print(
                f"{rank:3d} {row.symbol} score={row.score:6.1f} "
                f"callers={row.unique_callers:3d} calls={row.direct_calls:3d} "
                f"files={row.caller_files:2d} size={size:>6} def={row.definition}"
            )


if __name__ == "__main__":
    main()
