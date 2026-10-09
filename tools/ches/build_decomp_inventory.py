#!/usr/bin/env python3
"""Build a machine-readable inventory and ranked queue for remaining FoMT assembly.

This is project decompilation infrastructure for the active main branch.
It derives evidence from the current repository and fomt.elf. Inferred regions
and scores are heuristics, not claims about original source-file boundaries.
"""

from __future__ import annotations

import argparse
import bisect
import collections
import hashlib
import json
import re
import statistics
import subprocess
from dataclasses import dataclass
from pathlib import Path

FUNC_START_RE = re.compile(r"^\s*(?:thumb_func_start|arm_func_start)\s+(\S+)")
CALL_RE = re.compile(r"^\s*blx?\s+([^\s@]+)")
ADDR_COMMENT_RE = re.compile(r"@\s*0x([0-9A-Fa-f]{8})")
REGISTER_RE = re.compile(r"\b(?:r(?:1[0-5]|[0-9])|sp|lr|pc|ip|fp|sl|sb)\b", re.I)
IMM_RE = re.compile(r"#-?(?:0x[0-9A-Fa-f]+|\d+)")
HEX_RE = re.compile(r"\b0x[0-9A-Fa-f]+\b")
LOCAL_RE = re.compile(r"\.L[0-9A-Za-z_]+")
REF_RE = re.compile(
    r"\b(?:g(?:Unk_)?0[0-9A-Fa-f]{7}|g[A-Z][A-Za-z0-9_]*|"
    r"vtable_[A-Za-z0-9_]+|__vt_[A-Za-z0-9_]+)\b"
)

PARKED = {
    "func_08011650",
    "func_080455D8",
    "func_08092A70",
    "func_080CAC7C",
    "func_080CAD18",
    "func_08092940",
    "func_08038110",
    "func_08038820",
    "func_08038EE0",
    "func_08039204",
    "func_08039310",
    "func_0803955C",
    "func_08039708",
    "func_08039E98",
    "func_08039F90",
    "func_0803A180",
    "func_0803A394",
    "func_0804EDB4",
    "func_08085640",
    "func_08092570",
}


@dataclass
class AsmFunction:
    symbol: str
    path: str
    line: int
    body: list[str]
    address_hint: int | None = None


def run(repo: Path, *args: str) -> str:
    return subprocess.check_output(args, cwd=repo, text=True, errors="replace")


def parse_nm(repo: Path):
    text = run(repo, "arm-none-eabi-nm", "-S", "--defined-only", "fomt.elf")
    addresses: dict[str, int] = {}
    sizes: dict[str, int] = {}
    typed: dict[str, str] = {}
    sized_text_starts: set[int] = set()

    for line in text.splitlines():
        parts = line.split()
        size = None
        if len(parts) == 3 and re.fullmatch(r"[0-9A-Fa-f]{8}", parts[0]):
            addr_s, typ, name = parts
        elif (
            len(parts) >= 4
            and re.fullmatch(r"[0-9A-Fa-f]{8}", parts[0])
            and re.fullmatch(r"[0-9A-Fa-f]{8}", parts[1])
        ):
            addr_s, size_s, typ, name = parts[:4]
            size = int(size_s, 16)
        else:
            continue

        addr = int(addr_s, 16)
        addresses[name] = addr
        typed[name] = typ
        if size:
            sizes[name] = size
            if typ.lower() == "t" and 0x08000000 <= addr < 0x08100000:
                sized_text_starts.add(addr)

    return addresses, sizes, typed, sized_text_starts


def parse_asm_code_intervals(repo: Path):
    """Return exact linked asm code intervals from fomt.map."""
    text = (repo / "fomt.map").read_text(errors="ignore")
    intervals: dict[str, list[tuple[int, int, str]]] = collections.defaultdict(list)
    total = 0
    in_memory_map = False
    pending_section: str | None = None

    def is_code(section: str) -> bool:
        return (
            section == ".text"
            or section.startswith(".text.")
            or section.startswith(".gnu.linkonce.t.")
        )

    def add(section: str, addr: int, size: int, obj: str):
        nonlocal total
        if not size or not is_code(section) or not obj.startswith("asm/"):
            return
        path = obj.split("(", 1)[0]
        if path.endswith(".o"):
            path = path[:-2] + ".s"
        intervals[path].append((addr, addr + size, section))
        total += size

    for line in text.splitlines():
        if not in_memory_map:
            if line.strip() == "Linker script and memory map":
                in_memory_map = True
            continue

        m = re.match(
            r"^\s*(\.\S+)\s+0x([0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+)",
            line,
        )
        if m:
            section, addr_s, size_s, obj = m.groups()
            pending_section = None
            add(section, int(addr_s, 16), int(size_s, 16), obj)
            continue

        m = re.match(r"^\s*(\.\S+)\s*$", line)
        if m:
            pending_section = m.group(1)
            continue

        if pending_section is not None:
            m = re.match(
                r"^\s*0x([0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+)",
                line,
            )
            if m:
                addr_s, size_s, obj = m.groups()
                add(pending_section, int(addr_s, 16), int(size_s, 16), obj)
            if line.strip():
                pending_section = None

    for value in intervals.values():
        value.sort()
    return intervals, total


def containing_interval(
    intervals: dict[str, list[tuple[int, int, str]]],
    path: str,
    addr: int,
):
    for start, end, section in intervals.get(path, []):
        if start <= addr < end:
            return start, end, section
    return None
def parse_asm(repo: Path) -> dict[str, AsmFunction]:
    out: dict[str, AsmFunction] = {}
    for path in sorted((repo / "asm").rglob("*.s")):
        rel = str(path.relative_to(repo))
        lines = path.read_text(errors="ignore").splitlines()
        starts: list[tuple[int, str]] = []
        for i, line in enumerate(lines):
            m = FUNC_START_RE.match(line)
            if m:
                starts.append((i, m.group(1)))

        for j, (start, symbol) in enumerate(starts):
            stop = starts[j + 1][0] if j + 1 < len(starts) else len(lines)
            body = lines[start:stop]
            addr_hint = None
            for raw in body[:5]:
                m = ADDR_COMMENT_RE.search(raw)
                if m:
                    addr_hint = int(m.group(1), 16)
                    break
            out[symbol] = AsmFunction(symbol, rel, start + 1, body, addr_hint)
    return out


def instruction_features(body: list[str]):
    opcodes: list[str] = []
    normalized: list[str] = []
    refs: set[str] = set()
    callees: list[str] = []

    for raw in body:
        refs.update(REF_RE.findall(raw))
        code = raw.split("@", 1)[0].strip()
        if not code or code.endswith(":") or code.startswith("."):
            continue
        if "func_start" in code or "func_end" in code:
            continue

        parts = code.split(None, 1)
        if not parts:
            continue
        opcode = parts[0].lower()
        if not re.fullmatch(r"[a-z][a-z0-9.]*", opcode):
            continue

        operand = parts[1] if len(parts) > 1 else ""
        cm = CALL_RE.match(code)
        if cm:
            target = cm.group(1).rstrip(",")
            if not target.startswith("."):
                callees.append(target)

        norm = REGISTER_RE.sub("R", operand)
        norm = IMM_RE.sub("#IMM", norm)
        norm = HEX_RE.sub("HEX", norm)
        norm = LOCAL_RE.sub("LBL", norm)
        norm = re.sub(
            r"\b(?:func_[0-9A-Fa-f]+|g[A-Za-z0-9_]+|vtable_[A-Za-z0-9_]+|"
            r"__vt_[A-Za-z0-9_]+|_[A-Za-z0-9_$.]+)\b",
            "SYM",
            norm,
        )
        opcodes.append(opcode)
        normalized.append(f"{opcode} {norm}".rstrip())

    opcode_sig = hashlib.sha1(" ".join(opcodes).encode()).hexdigest()
    norm_sig = hashlib.sha1("\n".join(normalized).encode()).hexdigest()
    return opcodes, normalized, sorted(refs), callees, opcode_sig, norm_sig


def assign_clusters(rows: list[dict], key: str, prefix: str):
    groups: dict[str, list[dict]] = collections.defaultdict(list)
    for row in rows:
        groups[row[key]].append(row)
    useful = [g for g in groups.values() if len(g) >= 2]
    useful.sort(key=lambda g: (-len(g), g[0]["address"]))
    for idx, group in enumerate(useful, 1):
        cid = f"{prefix}{idx:04d}"
        for row in group:
            row[f"{prefix}_cluster"] = cid
            row[f"{prefix}_cluster_size"] = len(group)
    return useful


def assign_regions(rows: list[dict], source_starts: set[int], max_span: int = 0x3000):
    by_file: dict[str, list[dict]] = collections.defaultdict(list)
    for row in rows:
        by_file[row["asm_file"]].append(row)

    regions: list[dict] = []
    for asm_file, funcs in sorted(by_file.items()):
        funcs.sort(key=lambda r: r["address"])
        current: list[dict] = []
        region_start = None
        prev_addr = None

        def flush():
            nonlocal current, region_start, prev_addr
            if not current:
                return
            start = current[0]["address"]
            end = max(f["address"] + f["size"] for f in current)
            rid = f"{asm_file}:{start:08X}-{end:08X}"
            for f in current:
                f["region_id"] = rid
            regions.append({
                "region_id": rid,
                "asm_file": asm_file,
                "start": start,
                "end": end,
                "functions": [f["symbol"] for f in current],
            })
            current = []
            region_start = None
            prev_addr = None

        for row in funcs:
            addr = row["address"]
            split = False
            if current:
                if addr - region_start >= max_span:
                    split = True
                elif any(prev_addr < s < addr for s in source_starts):
                    split = True
            if split:
                flush()
            if not current:
                region_start = addr
            current.append(row)
            prev_addr = addr
        flush()

    return regions


def build(repo: Path):
    addresses, nm_sizes, nm_types, source_starts = parse_nm(repo)
    asm_intervals, canonical_asm_bytes = parse_asm_code_intervals(repo)
    asm = parse_asm(repo)
    asm_symbols = set(asm)

    all_function_starts = set(source_starts)
    for symbol, fn in asm.items():
        addr = addresses.get(symbol, fn.address_hint)
        if addr is not None:
            all_function_starts.add(addr)
    sorted_starts = sorted(all_function_starts)

    rows: list[dict] = []
    all_calls: dict[str, list[tuple[str, str]]] = collections.defaultdict(list)
    unlinked_definitions: list[str] = []

    for symbol, fn in asm.items():
        addr = addresses.get(symbol, fn.address_hint)
        if addr is None:
            continue

        linked_interval = containing_interval(asm_intervals, fn.path, addr)
        if linked_interval is None:
            unlinked_definitions.append(symbol)
            continue

        interval_end = linked_interval[1]
        idx = bisect.bisect_right(sorted_starts, addr)
        next_start = sorted_starts[idx] if idx < len(sorted_starts) else None

        candidates = []
        if next_start is not None and next_start > addr:
            candidates.append(next_start - addr)
        if interval_end > addr:
            candidates.append(interval_end - addr)
        size = min(candidates) if candidates else nm_sizes.get(symbol, 0)
        if size > 0x10000:
            size = nm_sizes.get(symbol, 0)

        opcodes, normalized, refs, callees, opcode_sig, norm_sig = instruction_features(fn.body)
        for callee in callees:
            all_calls[callee].append((symbol, fn.path))

        runtime_library = (
            fn.path in {
                "asm/code_libc_string.s",
                "asm/code_lib_syscall.s",
                "asm/code_lib_sram.s",
                "asm/sram_proxy_1.s",
                "asm/sram_proxy_2.s",
            }
            or symbol in {
                "malloc", "free", "rand", "srand", "memcpy", "memmove",
                "memset", "memcmp", "strlen", "strcpy", "strcat",
            }
        )

        rows.append({
            "symbol": symbol,
            "address": addr,
            "address_hex": f"0x{addr:08X}",
            "size": size,
            "size_hex": f"0x{size:X}" if size else "?",
            "asm_file": fn.path,
            "line": fn.line,
            "linked_section": linked_interval[2],
            "status": "parked" if symbol in PARKED else "assembly",
            "runtime_library": runtime_library,
            "instruction_count": len(opcodes),
            "opcode_signature": opcode_sig,
            "normalized_signature": norm_sig,
            "direct_callees": sorted(set(callees)),
            "data_refs": refs,
        })

    rows.sort(key=lambda r: r["address"])
    row_by_symbol = {r["symbol"]: r for r in rows}

    source_symbols = {
        name for name, size in nm_sizes.items()
        if size > 0 and nm_types.get(name, "").lower() == "t" and name not in asm_symbols
    }

    for row in rows:
        incoming = all_calls.get(row["symbol"], [])
        row["direct_calls_in"] = len(incoming)
        row["unique_callers"] = sorted({caller for caller, _ in incoming})
        row["unique_caller_count"] = len(row["unique_callers"])
        row["caller_files"] = sorted({path for _, path in incoming})
        row["caller_file_count"] = len(row["caller_files"])
        row["source_anchor_callees"] = sorted(
            c for c in row["direct_callees"] if c in source_symbols
        )

    opcode_groups = assign_clusters(rows, "opcode_signature", "shape")
    norm_groups = assign_clusters(rows, "normalized_signature", "norm")

    regions = assign_regions(rows, source_starts)
    symbol_region = {f["symbol"]: f["region_id"] for f in rows}

    incoming_regions: dict[str, set[str]] = collections.defaultdict(set)
    for target, sites in all_calls.items():
        target_region = symbol_region.get(target)
        if not target_region:
            continue
        for caller, _ in sites:
            caller_region = symbol_region.get(caller)
            if caller_region and caller_region != target_region:
                incoming_regions[target_region].add(caller_region)

    for row in rows:
        shape_size = row.get("shape_cluster_size", 1)
        size = row["size"]
        if size <= 0x600:
            base = size / 16.0
        else:
            base = 0x600 / 16.0 + (size - 0x600) / 256.0
        leverage = row["unique_caller_count"] * 8 + row["caller_file_count"] * 5
        family = max(0, shape_size - 1) * 4
        anchors = len(row["source_anchor_callees"]) * 2
        penalty = 60 if row["status"] == "parked" else 0
        if row["runtime_library"]:
            penalty += 250
        if size > 0x1000:
            penalty += 80
        row["priority_score"] = round(base + leverage + family + anchors - penalty, 2)

    for region in regions:
        funcs = [row_by_symbol[s] for s in region["functions"]]
        sizes = [f["size"] for f in funcs if f["size"]]
        total = sum(sizes)
        tractable = sum(f["size"] for f in funcs if 0 < f["size"] <= 0x600)
        large = sum(f["size"] for f in funcs if f["size"] > 0x600)
        repeated = sum(1 for f in funcs if f.get("shape_cluster_size", 1) > 1)
        parked = sum(f["size"] for f in funcs if f["status"] == "parked")
        runtime = sum(f["size"] for f in funcs if f["runtime_library"])
        anchors = sorted({c for f in funcs for c in f["source_anchor_callees"]})
        cross_in = len(incoming_regions.get(region["region_id"], set()))
        score = (
            tractable
            + 0.25 * large
            + repeated * 64
            + len(anchors) * 24
            + cross_in * 32
            - parked * 0.5
            - runtime * 0.75
        )
        region.update({
            "function_count": len(funcs),
            "total_function_bytes": total,
            "tractable_bytes": tractable,
            "large_function_bytes": large,
            "large_function_count": sum(1 for f in funcs if f["size"] > 0x600),
            "parked_bytes": parked,
            "runtime_library_bytes": runtime,
            "repeated_family_functions": repeated,
            "source_anchor_callees": anchors,
            "incoming_cross_region_count": cross_in,
            "median_function_size": int(statistics.median(sizes)) if sizes else 0,
            "priority_score": round(score, 2),
        })

    regions.sort(
        key=lambda r: (r["priority_score"], r["total_function_bytes"]),
        reverse=True,
    )

    shape_clusters = []
    for idx, group in enumerate(opcode_groups, 1):
        shape_clusters.append({
            "cluster_id": f"shape{idx:04d}",
            "member_count": len(group),
            "total_bytes": sum(r["size"] for r in group),
            "instruction_count": group[0]["instruction_count"],
            "members": [r["symbol"] for r in group],
            "files": sorted({r["asm_file"] for r in group}),
        })
    shape_clusters.sort(
        key=lambda c: (c["total_bytes"], c["member_count"]),
        reverse=True,
    )

    norm_clusters = []
    for idx, group in enumerate(norm_groups, 1):
        norm_clusters.append({
            "cluster_id": f"norm{idx:04d}",
            "member_count": len(group),
            "total_bytes": sum(r["size"] for r in group),
            "members": [r["symbol"] for r in group],
        })
    norm_clusters.sort(
        key=lambda c: (c["total_bytes"], c["member_count"]),
        reverse=True,
    )

    function_bytes = sum(r["size"] for r in rows)
    summary = {
        "asm_files": len({r["asm_file"] for r in rows}),
        "unresolved_functions": len(rows),
        "canonical_asm_code_bytes": canonical_asm_bytes,
        "function_range_bytes": function_bytes,
        "unattributed_asm_code_bytes": canonical_asm_bytes - function_bytes,
        "function_range_coverage_pct": round(
            100.0 * function_bytes / canonical_asm_bytes, 4
        ) if canonical_asm_bytes else 0.0,
        "unlinked_asm_definitions_skipped": len(unlinked_definitions),
        "unlinked_asm_definition_names": sorted(unlinked_definitions),
        "parked_functions": sum(r["status"] == "parked" for r in rows),
        "runtime_library_functions": sum(r["runtime_library"] for r in rows),
        "regions": len(regions),
        "repeated_shape_clusters": len(shape_clusters),
        "functions_in_repeated_shape_clusters": sum(
            1 for r in rows if r.get("shape_cluster_size", 1) > 1
        ),
        "exact_normalized_clusters": len(norm_clusters),
    }

    return {
        "schema": "fomt-decomp-inventory-v1",
        "note": "TU/region and priority fields are heuristic; addresses/calls are repository-derived evidence.",
        "summary": summary,
        "functions": rows,
        "regions": regions,
        "shape_clusters": shape_clusters,
        "normalized_clusters": norm_clusters,
    }


def write_markdown(data: dict, path: Path):
    s = data["summary"]
    lines = [
        "# FoMT decompilation ranked queue",
        "",
        "Generated by tools/ches/build_decomp_inventory.py from the current assembly and fomt.elf.",
        "Region/TU hints and scores are heuristics, not claims about original source-file boundaries.",
        "",
        "## Inventory summary",
        "",
        f"- remaining linked assembly functions: **{s['unresolved_functions']:,}**",
        f"- canonical linked assembly code: **{s['canonical_asm_code_bytes']:,} bytes**",
        f"- bytes covered by inferred function ranges: **{s['function_range_bytes']:,}** "
        f"(**{s['function_range_coverage_pct']:.4f}%** of linked asm code)",
        f"- assembly code not assigned to a function range: **{s['unattributed_asm_code_bytes']:,} bytes**",
        f"- asm definitions present in source but not linked as asm code: **{s['unlinked_asm_definitions_skipped']:,}**",
        f"- coarse TU/region hints: **{s['regions']:,}**",
        f"- repeated opcode-shape clusters: **{s['repeated_shape_clusters']:,}**",
        f"- functions in repeated opcode-shape clusters: **{s['functions_in_repeated_shape_clusters']:,}**",
        f"- exact normalized-body clusters: **{s['exact_normalized_clusters']:,}**",
        f"- explicitly parked functions: **{s['parked_functions']:,}**",
        f"- runtime/library functions retained in inventory: **{s['runtime_library_functions']:,}**",
        "",
        "## Highest-ranked coherent regions",
        "",
        "| Rank | Region | Score | Funcs | Bytes | Tractable | Large | Repeated | Source anchors | Cross-region callers |",
        "| ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |",
    ]
    for i, r in enumerate(data["regions"][:50], 1):
        lines.append(
            f"| {i} | {r['region_id']} | {r['priority_score']:.1f} | "
            f"{r['function_count']} | {r['total_function_bytes']} | {r['tractable_bytes']} | "
            f"{r['large_function_count']} | {r['repeated_family_functions']} | "
            f"{len(r['source_anchor_callees'])} | {r['incoming_cross_region_count']} |"
        )

    lines += [
        "",
        "## Largest repeated opcode-shape families",
        "",
        "| Rank | Cluster | Members | Total bytes | Instructions/member | Files | Sample members |",
        "| ---: | --- | ---: | ---: | ---: | ---: | --- |",
    ]
    for i, c in enumerate(data["shape_clusters"][:50], 1):
        sample = ", ".join(c["members"][:6])
        lines.append(
            f"| {i} | {c['cluster_id']} | {c['member_count']} | {c['total_bytes']} | "
            f"{c['instruction_count']} | {len(c['files'])} | {sample} |"
        )

    lines += [
        "",
        "## Highest-ranked tractable representatives",
        "",
        "| Rank | Function | Score | Size | Callers | Files | Shape family | Source anchors | Definition |",
        "| ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |",
    ]
    ranked = sorted(
        (
            f for f in data["functions"]
            if 0 < f["size"] <= 0x600
            and not f["runtime_library"]
            and f["status"] != "parked"
        ),
        key=lambda r: (r["priority_score"], r["size"]),
        reverse=True,
    )
    representatives = []
    seen_shapes = set()
    for f in ranked:
        shape = f.get("shape_cluster")
        if shape and shape in seen_shapes:
            continue
        if shape:
            seen_shapes.add(shape)
        representatives.append(f)
        if len(representatives) >= 80:
            break

    for i, f in enumerate(representatives, 1):
        lines.append(
            f"| {i} | {f['symbol']} | {f['priority_score']:.1f} | {f['size']} | "
            f"{f['unique_caller_count']} | {f['caller_file_count']} | "
            f"{f.get('shape_cluster_size', 1)} | {len(f['source_anchor_callees'])} | "
            f"{f['asm_file']}:{f['line']} |"
        )

    path.write_text("\n".join(lines) + "\n")
def main():
    p = argparse.ArgumentParser()
    p.add_argument("--repo", type=Path, default=Path.cwd())
    p.add_argument("--json", type=Path, default=Path("tools/ches/decomp_inventory.json"))
    p.add_argument("--markdown", type=Path, default=Path("tools/ches/DECOMP_QUEUE.md"))
    args = p.parse_args()

    repo = args.repo.resolve()
    data = build(repo)

    json_path = args.json if args.json.is_absolute() else repo / args.json
    md_path = args.markdown if args.markdown.is_absolute() else repo / args.markdown
    json_path.parent.mkdir(parents=True, exist_ok=True)
    md_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.write_text(json.dumps(data, indent=2) + "\n")
    write_markdown(data, md_path)

    print(json.dumps(data["summary"], indent=2))
    print(json_path)
    print(md_path)


if __name__ == "__main__":
    main()
