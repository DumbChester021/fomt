#!/usr/bin/env python3
import argparse
import difflib
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_COMPILER = ROOT / "tools/agbcc/bin/agbcp"
DEFAULT_OUT = ROOT / "tools/ches/function-match-artifacts"

CXXFLAGS = [
    "-quiet",
    "-fno-exceptions",
    "-fno-rtti",
    "-fvtable-thunks",
    "-g",
    "-mthumb-interwork",
    "-Wimplicit",
    "-Wparentheses",
    "-Werror",
    "-O2",
    "-fhex-asm",
]


def run(args, *, env=None, stderr=None):
    return subprocess.check_output(
        args,
        cwd=ROOT,
        env=env,
        stderr=stderr if stderr is not None else subprocess.STDOUT,
    )


def parse_addr(value):
    return int(value, 0)


def disasm(path, start, end):
    text = run([
        "arm-none-eabi-objdump",
        "-D",
        "-M",
        "force-thumb",
        "--no-show-raw-insn",
        f"--start-address={start:#x}",
        f"--stop-address={end:#x}",
        str(path),
    ]).decode()
    lines = []
    for line in text.splitlines():
        if not re.match(r"^\s+[0-9a-f]+:", line):
            continue
        line = re.sub(r"\s*<[^>]*>", "", line).split("@")[0].rstrip()
        lines.append(line + "\n")
    return lines


def symbol_info(obj, name):
    text = run(["arm-none-eabi-nm", "-S", "-n", str(obj)]).decode()
    for line in text.splitlines():
        fields = line.split()
        if not fields or fields[-1] != name:
            continue
        if len(fields) >= 4:
            return int(fields[0], 16), int(fields[1], 16)
        if len(fields) >= 3:
            return int(fields[0], 16), None
    raise RuntimeError(f"symbol not found in candidate object: {name}")


def main():
    ap = argparse.ArgumentParser(
        description="Compile and linked-byte compare FoMT C++ candidate code against retail."
    )
    ap.add_argument("source", help="candidate .cc source")
    ap.add_argument("name", help="artifact prefix")
    ap.add_argument("--start", required=True, type=parse_addr, help="retail start address")
    ap.add_argument("--end", required=True, type=parse_addr, help="retail end address (exclusive)")
    ap.add_argument("--compiler", default=str(DEFAULT_COMPILER))
    ap.add_argument("--out-dir", default=str(DEFAULT_OUT))
    ap.add_argument(
        "--symbol",
        help="compare only this text symbol; useful when the scratch source emits multiple methods",
    )
    ap.add_argument(
        "--defsym",
        action="append",
        default=[],
        help="extra linker symbol assignment NAME=EXPR; may be repeated",
    )
    ap.add_argument("--trace", action="store_true", help="enable AGBCC_TRACE_ALLOC")
    ap.add_argument("--extra-flag", action="append", default=[])
    args = ap.parse_args()

    if args.end <= args.start:
        ap.error("--end must be greater than --start")

    source = Path(args.source)
    if not source.is_absolute():
        source = ROOT / source
    if not source.exists():
        ap.error(f"source does not exist: {source}")

    compiler = Path(args.compiler)
    if not compiler.is_absolute():
        compiler = ROOT / compiler
    if not compiler.exists():
        ap.error(f"compiler does not exist: {compiler}")

    out = Path(args.out_dir)
    if not out.is_absolute():
        out = ROOT / out
    out.mkdir(parents=True, exist_ok=True)
    prefix = out / args.name

    cpp = run([
        "arm-none-eabi-cpp",
        "-I", "tools/agbcc/include",
        "-I", "tools/libagbc++",
        "-I", "tools/libsix/include",
        "-iquote", ".",
        "-iquote", "include",
        "-Wno-trigraphs",
        "-fno-exceptions",
        str(source),
    ])
    preprocessed = prefix.with_suffix(".i")
    preprocessed.write_bytes(cpp)

    env = os.environ.copy()
    if args.trace:
        env["AGBCC_TRACE_ALLOC"] = "1"

    asm = prefix.with_suffix(".s")
    trace = prefix.with_suffix(".alloc.log")
    compiler_args = [str(compiler)] + CXXFLAGS + args.extra_flag + [
        str(preprocessed), "-o", str(asm)
    ]
    with trace.open("wb") as trace_file:
        subprocess.check_call(
            compiler_args,
            cwd=ROOT,
            env=env,
            stderr=trace_file,
        )

    run(["tools/scripts/align_sections.sh", str(asm)])

    obj = prefix.with_suffix(".o")
    run([
        "arm-none-eabi-as",
        "-I", "tools/agbcc/include",
        "-I", "tools/libagbc++",
        "-I", "tools/libsix/include",
        "-I", ".",
        "-I", "include",
        "-mcpu=arm7tdmi",
        str(asm),
        "-o", str(obj),
    ])

    selected_offset = 0
    selected_size = None
    if args.symbol:
        selected_offset, selected_size = symbol_info(obj, args.symbol)

    text_base = args.start - selected_offset
    elf = prefix.with_suffix(".elf")
    link_args = [
        "arm-none-eabi-ld",
        "--just-symbols=fomt.elf",
        f"-Ttext={text_base:#x}",
    ]
    for assignment in args.defsym:
        link_args.append(f"--defsym={assignment}")
    link_args += [str(obj), "-o", str(elf)]
    run(link_args)

    binary = prefix.with_suffix(".bin")
    run([
        "arm-none-eabi-objcopy",
        "-O", "binary",
        "-j", ".text",
        str(elf),
        str(binary),
    ])

    retail = (ROOT / "baserom.gba").read_bytes()[
        args.start - 0x08000000:args.end - 0x08000000
    ]
    all_text = binary.read_bytes()
    if args.symbol:
        if selected_size is None:
            selected_size = len(retail)
        actual = all_text[selected_offset:selected_offset + selected_size]
    else:
        actual = all_text

    common = min(len(retail), len(actual))
    positions = [i for i in range(common) if retail[i] != actual[i]]
    mismatch = len(positions) + abs(len(retail) - len(actual))

    candidate_end = args.start + len(actual)
    diff = "".join(difflib.unified_diff(
        disasm(ROOT / "fomt.elf", args.start, args.end),
        disasm(elf, args.start, max(args.end, candidate_end)),
        fromfile="retail",
        tofile=args.name,
    ))
    prefix.with_suffix(".diff").write_text(diff)

    mismatch_path = prefix.with_suffix(".mismatch.txt")
    mismatch_path.write_text(
        f"start={args.start:#x}\n"
        f"end={args.end:#x}\n"
        f"symbol={args.symbol or ''}\n"
        f"symbol_offset={selected_offset:#x}\n"
        f"expected_size={len(retail):#x}\n"
        f"actual_size={len(actual):#x}\n"
        f"differing_linked_bytes={mismatch}\n"
        "positions=" + ",".join(hex(p) for p in positions) + "\n"
    )

    print(
        f"{args.name}: expected={len(retail):#x}, actual={len(actual):#x}, "
        f"differing linked bytes={mismatch}"
    )
    if args.symbol:
        print(f"symbol={args.symbol}, object offset={selected_offset:#x}")
    print(f"diff={prefix.with_suffix('.diff')}")
    print(f"mismatch={mismatch_path}")
    print(f"trace={trace}")

    raise SystemExit(0 if mismatch == 0 else 1)


if __name__ == "__main__":
    main()
