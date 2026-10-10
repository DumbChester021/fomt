#!/usr/bin/env python3
"""Lightweight non-destructive documentation integrity checks.

Use on the normal retail branch. Scans LIVE docs and project guidance, not
archived experiments. Error output explains broken paths and status drift.
"""
from __future__ import annotations
import argparse
import hashlib
import json
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
    # Onboarding is a single live page; all pre-merge originals are SHA-verified.
    if (ROOT / "TODO.md").exists():
        errors.append("root TODO.md duplicates the sole current task in START_HERE.md")
    start = ROOT / "START_HERE.md"
    for title in ("## What is this?", "## Where are we now?",
                  "## What do we do next?", "## Where are things?"):
        if title not in start.read_text():
            errors.append(f"START_HERE.md missing required onboarding answer: {title}")
    for rel, limit in (
        ("AGENTS.md", 6500),
        ("README.md", 4500),
        ("START_HERE.md", 7500),
        ("tools/ches/NEXT_AGENT_HANDOFF.md", 1000),
        ("tools/ches/SESSION_STATUS.md", 1000),
        ("docs/PROGRESS.md", 1000),
        ("docs/REPO_MAP.md", 1500),
        ("docs/DECOMP_PRIORITY_MAP.md", 1500),
    ):
        if (ROOT / rel).stat().st_size > limit:
            errors.append(f"{rel} has become a duplicate/oversized live document")
    archive = ROOT / "tools/ches/checkpoints/onboarding-consolidation-2026-10-11"
    manifest = archive / "MANIFEST.json"
    if manifest.is_file():
        entries = json.loads(manifest.read_text())["files"]
        for entry in entries:
            p = archive / entry["path"]
            if not p.is_file():
                errors.append(f"missing archived original: {entry['path']}")
                continue
            contents = p.read_bytes()
            if len(contents) != entry["bytes"] or hashlib.sha256(contents).hexdigest() != entry["sha256"]:
                errors.append(f"archived original modified: {entry['path']}")
    else:
        errors.append("missing pre-consolidation original-file manifest")
    if errors:
        for x in errors: print("ERROR:",x,file=sys.stderr)
    if warnings:
        for x in warnings: print("WARN:",x,file=sys.stderr)
    print(f"Documentation preflight: {active_count} nonarchive docs, "
          f"{total_links} local links; {len(errors)} errors, {len(warnings)} warnings")
    return 1 if errors else 0

if __name__=="__main__":
    raise SystemExit(check())
