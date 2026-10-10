#!/usr/bin/env python3
"""Read-only source-document census. Never follows symlinks or deletes evidence.

Usage: python3 tools/ches/audit_docs.py [--out DIRECTORY]
Writes TSV/JSON if --out is given; otherwise prints a short summary.
"""
from __future__ import annotations
import argparse
import csv
import hashlib
import json
import os
import re
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXCLUDE_DIR = {
    ".git", "node_modules", "build", "dist", "__pycache__", ".venv", ".cache", "audits",
    "obj", "agbcc", "libagbc++", "libsix", "function-match-artifacts",
    "function-match-temp", "scratch",
}
DOC_SUFFIXES = {".md", ".markdown", ".rst", ".adoc"}
ARCHIVE_ROOTS = {"checkpoints", "snapshots", "backups", "archive", "archives"}

# Categories are deliberately content-purpose based, not a suggestion that all
# files are useful at every startup.
SPEC = {
"AGENTS.md": ("Contract", "Critical", "Keep", "Project-wide safety, matching and agent obligations"),
"START_HERE.md": ("Live status", "Critical", "Shorten", "Current focus, validated metrics and first next step"),
"README.md": ("Public overview", "High", "Shorten", "Project introduction, supported features and build orientation"),
"INSTALL.md": ("Setup guide", "High", "Keep", "Compiler and ROM setup for an unfamiliar machine"),
"TODO.md": ("Planning", "Medium", "Merge", "Tasks overlapping current dashboard and handoff"),
"docs/DECOMP_PLAYBOOK.md": ("Operating instructions", "High", "Condense", "Exactness gates, workflow, compiler research discipline"),
"docs/DECOMP_PRIORITY_MAP.md": ("Planning/history mix", "Medium", "Split/archive", "Historical throughput queues and current save priority"),
"docs/DECOMP_NOTES.md": ("Research history", "High", "Archive", "Large long-running reverse-engineering notes; lookup only"),
"docs/PROGRESS.md": ("Status/history mix", "High", "Split/archive", "Old metrics and integration milestones, overlapping dashboard"),
"docs/REPO_MAP.md": ("Navigation", "Medium", "Generate/condense", "File locations, source islands and project structure"),
"docs/FOMT_COMPILER_FINGERPRINT.md": ("Compiler reference", "High", "Keep targeted", "Compact original compiler ABI/codegen fingerprint"),
"docs/FOMT_COMPILER_RESEARCH.md": ("Compiler history", "High", "Archive", "Compiler reconstruction hypotheses and evidence"),
"docs/SOURCE_READABILITY_AUDIT.md": ("Quality report", "Medium", "Generate", "Counts of opaque symbols and source-quality debt"),
"docs/SAVE_EVIDENCE_MATRIX.md": ("Save reference", "Critical", "Merge into save index", "Live ASM/source ownership by save function and proof links"),
"docs/SAVE_DECOMP_BEGINNERS_GUIDE.md": ("Learning guide", "Low", "Archive/optional", "Programming concepts for first-time contributors"),
"docs/SAVE_LIFECYCLE.md": ("Save reference/history mix", "Critical", "Condense", "SRAM geometry and end-to-end load/save behavior"),
"docs/SAVE_FORMAT.md": ("Save reference", "High", "Merge", "Save slot header, storage and checksum format"),
"docs/SAVE_SERIALIZED_LAYOUT.md": ("Save reference", "High", "Merge", "Typed persisted GameState offsets and assertions"),
"docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md": ("Save reference", "High", "Merge", "Parent GameState copy dependency offsets and states"),
"docs/SAVE_MENU_RETRY_TRACE.md": ("Save reference", "High", "Merge", "Save/load menu and failed-read ownership transitions"),
"docs/GAME_STATE_SAVE_CLEANUP.md": ("Save evidence", "High", "Archive detail", "Exact GameState and nested cleanup function proofs"),
"docs/SAVE_RUCKSACK_COPY_RESEARCH.md": ("Save evidence", "High", "Archive detail", "128-byte Rucksack copy failures and 64-byte cleanup correction"),
"docs/SAVE_BARN_STATE_COPY.md": ("Save evidence", "High", "Archive detail", "Exact Barn assignment and rejected candidates"),
"docs/SAVE_FARMER_STATE_COPY.md": ("Save evidence", "High", "Archive detail", "Exact Farmer assignment and memcpy ABI rationale"),
"docs/SAVE_FARM_STATE_COPY.md": ("Save evidence", "High", "Archive detail", "Exact Farm copy and compiler loop structure"),
"docs/SAVE_DOG_STATE_COPY.md": ("Save evidence", "High", "Archive detail", "Exact Dog assignment and implicit Animal assignment ABI"),
"docs/SAVED_BYTE_BUFFER.md": ("Save evidence", "High", "Archive detail", "SavedByteBuffer type and exact methods"),
"docs/SAVE_TRANSITION_STATE.md": ("Save evidence", "High", "Archive detail", "SavedTransitionState type and exact methods"),
"docs/SAVE_PACKED_PROGRESS.md": ("Save evidence", "High", "Archive detail", "Packed persistent flags and proof"),
"tools/ches/NEXT_AGENT_HANDOFF.md": ("Live task", "Critical", "Shorten", "One-page current work, exact next task and blocked experiments"),
"tools/ches/HISTORY.md": ("Historical evidence", "High when relevant", "Append only", "Dated discoveries and supersessions; never a live instruction"),
"tools/ches/SESSION_STATUS.md": ("Status/history mix", "Medium", "Merge/archive", "Duplicated status and chronological evidence"),
"tools/ches/DECOMP_QUEUE.md": ("Planning/history mix", "Medium", "Generate/park", "Backlog/heuristic ranking, historical queue and unresolved tasks"),
"tools/ches/NPC_ENTITY_CLASS_MAP.md": ("Subsystem reference", "Medium", "Keep targeted", "NPC ownership/vtables and class relationships"),
"assets/item_icons/README.md": ("Asset guide", "Low", "Keep targeted", "Item icon extraction and image assets"),
}
RESEARCH = {
"CHARACTERS": "NPC and character identity mapping",
"CUSTOM_CHARACTERS": "Custom-game character feature notes",
"CUSTOM_GAME_EXPANSION": "Custom-game expansion architecture",
"ASSET_DECOMPILATION": "Asset extraction and reconstruction",
"ENTITY_08037008": "Unidentified entity address research",
"ENTITY_BALL": "Ball controller and entity recovery",
"ENTITY_EFFECTS": "Effects entity constructors and lifecycle",
"FISHING_RECORDS": "Fishing persistence and methods",
"GAME_STATE_AUDIO_CALLBACKS": "Audio callback code evidence",
"GAME_STATE_MENU_ACTIONS": "Menu action code evidence",
"GAME_STATE_MENU_CALLBACKS": "Menu callback code evidence",
"GAME_STATE_MENU_DISPATCH": "Menu dispatch and implementation notes",
"GROUND_PICKUP_STATE": "Discarded and pickup object state",
"HARDWARE": "Hardware access and GBA I/O",
"HARDWARE_TRANSFER": "DMA and transfer code",
"INTRUSIVE_CALLBACK_LIST": "Callback-list ownership",
"KEY_INPUT": "Button handling",
"LIVESTOCK_SHOP": "Livestock vendors and state",
"MAP_DATA": "Game map data and resource IDs",
"MENU_GLYPH_CACHE": "Menu glyph cache behavior",
"MENU_TEXT": "Text rendering and layout",
"MENU_TILEMAP": "Menu tilemap behavior",
"MINE_FLOOR": "Mine floor state and tile layout",
"POLYMORPHIC_OWNERS": "Virtual owner and destructor relations",
"RESOURCE_HANDLES": "Resource handle lifecycle",
"RESOURCE_OWNERS": "Resource owner lifecycle",
"SCENES": "Scene creation, ownership and flow",
"SPRITE_ANIMATOR": "Sprite animation structures",
}
def categorize(path):
    name = path.as_posix()
    if name in SPEC:
        return SPEC[name]
    if name.startswith("docs/"):
        desc = RESEARCH.get(path.stem, path.stem.replace("_", " ").title() + " code research")
        return ("Subsystem reference", "Medium", "Keep targeted", desc)
    if any(p in ARCHIVE_ROOTS for p in path.parts) or "checkpoints" in path.parts:
        return ("Historical evidence", "High when relevant", "Preserve/lookup", "Immutable prior experiments or documented checkpoint")
    return ("Auxiliary documentation", "Low/targeted", "Preserve/lookup", "Specialized developer, data or asset reference")
def document_paths():
    # Traverse likely doc roots only: avoids scanning the full build graph,
    # but still includes historical README/Markdown under checkpoints.
    for path in [Path(s) for s in ["AGENTS.md","README.md","START_HERE.md","INSTALL.md","TODO.md"]]:
        if (ROOT / path).is_file():
            yield path
    for top in ["docs","tools","assets"]:
        base = ROOT / top
        if not base.is_dir():
            continue
        for dirpath, dirs, files in os.walk(base, followlinks=False):
            dirs[:] = sorted(d for d in dirs if d not in EXCLUDE_DIR and not d.startswith("."))
            for name in sorted(files):
                p = Path(dirpath) / name
                if p.suffix.lower() in DOC_SUFFIXES and p.is_file() and not p.is_symlink():
                    yield p.relative_to(ROOT)
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", help="write full census to this output directory")
    args = parser.parse_args()
    records = []
    hashes = defaultdict(list)
    for path in sorted(set(document_paths())):
        file = ROOT / path
        try:
            data = file.read_bytes()
            lines = data.decode("utf-8", errors="replace").splitlines()
        except OSError:
            continue
        category, importance, action, purpose = categorize(path)
        title = next((re.sub(r"^#+\s*", "", line).strip() for line in lines[:25] if line.startswith("# ")), path.stem)
        sha = hashlib.sha256(data).hexdigest()
        hashes[sha].append(path.as_posix())
        records.append({
            "path": path.as_posix(), "bytes": len(data), "lines": len(lines),
            "category": category, "importance": importance,
            "proposed_action": action, "purpose": purpose,
            "title": title, "sha256": sha
        })
    groups = defaultdict(lambda:{"files":0,"bytes":0})
    for row in records:
        groups[row["category"]]["files"] += 1
        groups[row["category"]]["bytes"] += row["bytes"]
    duplicates = [paths for paths in hashes.values() if len(paths)>1]
    summary = {"total_files": len(records), "total_bytes": sum(x["bytes"] for x in records),
               "categories":dict(groups),"exact_duplicate_groups": duplicates,
               "active_doc_paths": [r["path"] for r in records if r["category"] != "Historical evidence"]}
    if args.out:
        out = ROOT / args.out
        out.mkdir(parents=True, exist_ok=True)
        with (out/"document_inventory.tsv").open("w",encoding="utf-8",newline="") as stream:
            writer=csv.DictWriter(stream,fieldnames=list(records[0].keys()),delimiter="\t",lineterminator="\n")
            writer.writeheader();writer.writerows(records)
        (out/"document_census.json").write_text(json.dumps(summary,indent=2)+"\n")
        print("Wrote:",out/"document_inventory.tsv",out/"document_census.json")
    print("Files:",len(records),"Bytes:",summary["total_bytes"])
    for category, item in sorted(groups.items()):
        print(f"  {category}: {item['files']} files / {item['bytes']} bytes")
    print("Exact duplicate groups:",len(duplicates))
    return 0
if __name__=="__main__":
    raise SystemExit(main())
