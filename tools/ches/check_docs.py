#!/usr/bin/env python3
"""Lightweight non-destructive documentation integrity checks.

Use on the normal retail branch. Scans LIVE docs and project guidance, not
archived experiments. Error output explains broken paths and status drift.
"""
from __future__ import annotations
import argparse
import re
import subprocess
import sys
from pathlib import Path
from audit_docs import ROOT, document_paths, categorize

MD_LINK = re.compile(r'(?<!!)\[[^\]\n]*\]\(([^)\n]+)\)')
REFERENCE_LINK = re.compile(r'(?m)^\s*\[[^\]\n]+\]:\s*(\S+)')
EXTERNAL = ("https://", "http://", "mailto:", "tel:", "data:", "file:")
KEY_DOCS = [
    "AGENTS.md", "START_HERE.md", "tools/ches/NEXT_AGENT_HANDOFF.md",
    "docs/SAVE_EVIDENCE_MATRIX.md", "docs/DECOMP_PLAYBOOK.md",
]

def check():
    errors, warnings = [], []
    total_links = 0
    active_count = 0
    for path in sorted(set(document_paths())):
        category = categorize(path)[0]
        if category == "Historical evidence":
            continue
        active_count += 1
        abs_path = ROOT / path
        content = abs_path.read_text(errors="replace")
        for raw in MD_LINK.findall(content) + REFERENCE_LINK.findall(content):
            url = raw.strip().split(" ",1)[0].strip('"\'')
            if url.startswith((*EXTERNAL, "#", "/", "git:", "ssh:")):
                continue
            target = url.split("#",1)[0].split("?",1)[0].strip()
            if not target:
                continue
            total_links += 1
            dest = (abs_path.parent / target).resolve()
            if not dest.exists():
                errors.append(f"{path}: missing relative link {raw}")
        # Historical labels are fine in research files, but not as active claims.
        if path.as_posix() in {"START_HERE.md","docs/PROGRESS.md","docs/SAVE_LIFECYCLE.md"}:
            for m in re.finditer(
                r'(?im)^\s*(?:[-*]\s*)?\*\*'
                r'(?:Last published production-code checkpoint|Published source checkpoint)'
                r'.{0,200}497395f',
                content
            ):
                warnings.append(f"{path}: possibly stale current publication claim: {m.group(0)[:110]}")
    for p in KEY_DOCS:
        if not (ROOT / p).is_file():
            errors.append(f"missing canonical entrypoint: {p}")
    # Dated corrections must be appended, never replace or truncate prior facts.
    history = ROOT / "tools/ches/HISTORY.md"
    if history.is_file():
        old = subprocess.run(
            ["git", "show", "HEAD:tools/ches/HISTORY.md"],
            cwd=ROOT, capture_output=True, text=True, check=False,
        )
        if old.returncode == 0 and not history.read_text().startswith(old.stdout):
            errors.append("tools/ches/HISTORY.md was rewritten or truncated; append a dated correction instead")
    if errors:
        for x in errors: print("ERROR:",x,file=sys.stderr)
    if warnings:
        for x in warnings: print("WARN:",x,file=sys.stderr)
    print(f"Documentation preflight: {active_count} nonarchive docs, "
          f"{total_links} local links; {len(errors)} errors, {len(warnings)} warnings")
    return 1 if errors else 0

if __name__=="__main__":
    raise SystemExit(check())
