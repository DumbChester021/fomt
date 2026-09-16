#!/usr/bin/env bash
set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
calcrom=$(cd "$here/.." && pwd)/calcrom.pl
fixture=$(mktemp)
trap 'rm -f "$fixture"' EXIT

cat > "$fixture" <<'MAP'
Discarded input sections

 .gnu.linkonce.t.discarded_template
                0x00000000      0x100 src/discarded.o
 .text          0x00000000       0x80 asm/discarded.o

Memory Configuration

Linker script and memory map

.rom            0x08000000      0x78
 .text          0x08000000       0x20 src/foo.o
 .text          0x08000020       0x40 asm/bar.o
 .gnu.linkonce.t.some_template
                0x08000060       0x10 src/template.o
 .text.helper
                0x08000070        0x8 asm/helper.o
 .rodata        0x08000078       0x80 src/not_code.o
MAP

expected='120 total bytes of code
48 bytes of code in src (40.0000%)
72 bytes of code in asm (60.0000%)'
actual=$(perl "$calcrom" "$fixture")

if [ "$actual" != "$expected" ]; then
    printf '%s\n' 'calcrom regression test FAILED' >&2
    printf '%s\n%s\n' 'Expected:' "$expected" >&2
    printf '%s\n%s\n' 'Actual:' "$actual" >&2
    exit 1
fi

printf '%s\n' 'calcrom regression test: PASS'
