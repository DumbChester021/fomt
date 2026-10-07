# Mine-floor persistent state

This document records the stable retail structure recovered for the persistent
mine-floor object inside GameState. Transient candidate history and compiler
experiments belong in `tools/ches/checkpoints/`.

## Persistent boundary

The object begins at **GameState+0x2E58** and is exactly **0x628 bytes** long,
ending at the next object at **+0x3480**.

Two independent boundaries prove the size:

- the next initialized persistent object begins at GameState+0x3480; and
- `func_080D4178` copies exactly 0x628 bytes from GameState+0x2E58.

`func_0809CE8C` initializes this object. Its retail body is
0x0809CE8C..0x0809CF34, 0xA8 bytes, and is now exact C++ source in
`src/mine_floor.cc`.

## Layout

| Offset | Size | Structure |
| --- | ---: | --- |
| +0x000 | 4 | layout/mode word |
| +0x004 | 0x620 | 28 x 28 array of 2-byte `MineTile` records |
| +0x624 | 4 | packed mine-progress word |
| total | 0x628 | persistent mine-floor state |

The layout word is read by `func_0809D8A0`. `func_0809D8A4` and
`func_0809D8B8` derive the active width and height from it.

## MineTile

Each tile is exactly two bytes. The initializer's exact natural source proves
three packed fields:

| Bits | Width | Current meaning |
| --- | ---: | --- |
| 0..3 | 4 | tile type |
| 4..9 | 6 | mine-content/state field, semantics not fully resolved |
| 10..15 | 6 | mine-content/state field, semantics not fully resolved |

`func_0809D8D4` reads the low four-bit tile type. `func_0809D9B4` passes
bits 4..9 to the mine-content handler for one tile class, while
`func_0809D8E8` passes bits 10..15 for another. Keep the two six-bit fields
neutral until all consumers justify stronger names.

## Packed progress word

The four bytes at +0x624 form one 32-bit packed allocation unit. The exact
initializer clears bits 0..21 and preserves bits 22..31.

The two nine-bit Jewel sets are proven by converging floor-selection,
counting, held-item and article-ID evidence:

| Bit | Meaning |
| ---: | --- |
| 1 | Kappa Jewel floor 0 |
| 2 | Kappa Jewel floor 40 |
| 3 | Kappa Jewel floor 60 |
| 4 | Kappa Jewel floor 80 |
| 5 | Kappa Jewel floor 120 |
| 6 | Kappa Jewel floor 140 |
| 7 | Kappa Jewel floor 160 |
| 8 | Kappa Jewel floor 180 |
| 9 | Kappa Jewel floor 255 |
| 13 | Goddess Jewel floor 60 |
| 14 | Goddess Jewel floor 102 |
| 15 | Goddess Jewel floor 123 |
| 16 | Goddess Jewel floor 152 |
| 17 | Goddess Jewel floor 155 |
| 18 | Goddess Jewel floor 171 |
| 19 | Goddess Jewel floor 190 |
| 20 | Goddess Jewel floor 202 |
| 21 | Goddess Jewel floor 222 |

Bits 0, 10, 11 and 12 are separate persistent mine-progress flags with
dedicated getters. Their exact gameplay names remain unresolved. Bit 12 is
strongly consistent with the Year-3 Teleport Stone acquisition condition,
but production source keeps the name neutral until the content-code-to-tool
identity is directly proven.

Bits 22..31 are preserved by the initializer and remain unresolved.

## Exactness and integration

The accepted source keeps the existing raw 16-bit tile view while adding a
packed 4/6/6 bitfield view. The packed nested tile type must remain two bytes;
an unpacked nested struct changes the tile stride to four and does not match.

Validation for the integrated initializer/accessor cluster:

- `func_0809CE8C`: 0xA8 expected, 0xA8 actual, 0 differing linked bytes.
- Existing source `func_0809CF34`: 0x234 expected, 0x234 actual, 0 differing
  bytes after moving the shared MineFloor/MineTile definitions to
  `include/mine_floor.hh`.
- Accessor block `0809D8A0..0809D8E8`: 0x48 expected, 0x48 actual, 0
  differing linked bytes. D8A4 and D8B8 have 0x12/0x1A true bodies plus normal
  two-byte alignment; the earlier 0x14/0x1C reports were boundary-only.
- Fresh detached worktree with the tracked compiler: `make -B -j4 compare`
  passes.
- Production `main`: `make -B -j4 compare` passes.
- ROM remains 8,388,608 bytes, SHA1
  `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Addresses remain D8A0, D8A4, D8B8, D8D4 and D8E8 exactly.
- `func_0809D9B4` is now exact source at 0x4C / 0 differences. It consumes
  MineTile bits 4..9, calls DA00, then clears tile type and the consumed field.
  Its exact source uses separate x*2 / y*56 temporaries and the retail nibble
  shift pair before the type comparison.
- Both detached and production full-ROM comparisons still pass after the D9B4
  linker seam; DA00 remains at 0x0809DA00.

`func_0809D8E8` is behavior-complete but parked after bounded natural-source
work. Saved candidates are under
`tools/ches/checkpoints/mine-floor-2026-10-07/`: v1 is 0xC0 / 158 differing
bytes, v2 0xB8 / 193, and v3 0xC2 / 182 against retail 0xCC. It consumes bits
10..15, changes tile type, and conditionally clears that field across active
tiles. The remaining problem is source shape/register allocation, not behavior;
do not resume syntax roulette without new structural evidence.

The adjacent helper block `0x0809DF2C..0x0809E0AC` is now exact source as one
contiguous **0x180-byte / 0-difference** unit in `src/mine_floor_helpers.cc`:

- `func_0809DF2C` maps content ids 4..9 to the six cursed tools and returns
  whether that tool already exists in either the Rucksack or ToolChest.
  Natural typed source was one byte from exact until the mapped tool id local
  was made signed, reproducing retail's signed compare against `TOOL_NONE`.
- `func_0809DFAC` counts the nine Goddess Jewel flags for floors
  60, 102, 123, 152, 155, 171, 190, 202 and 222. The first typed candidate
  matched 0x80 / 0.
- `func_0809E02C` counts the nine Kappa Jewel flags for floors
  0, 40, 60, 80, 120, 140, 160, 180 and 255. The first typed candidate
  matched 0x80 / 0.

Both detached and production full-ROM comparisons pass after the helper linker
seam.

`func_0809E0AC` is now exact source as the tile-type resource lookup used by
the mine renderer. Its true body is **0x6A / 0** at E0AC..E116, followed by two
alignment bytes before separate code begins at E118. It maps tile types 0..4 to
the five retail resource records at 086DC3C4/3D0/3DC/3E8/3F4. The natural array
form was 32 bytes different; reproducing retail's y*56+4, then x*2, halfword
load reduced that to 6, fixing the y-offset register to r3 reduced it to 4, and
an empty register barrier after the subtraction produced the exact body.

The four adjacent persistent progress getters are also exact source as one
**0x40 / 0** block at E174..E1B4:
- E174 reads progress bit 0 (`unk_624_0`);
- E184 reads progress bit 10 (`unk_625_2`);
- E194 reads progress bit 11 (`unk_625_3`);
- E1A4 reads progress bit 12 (`unk_625_4`).

Recovering those true boundaries exposes two previously hidden unlabeled code
islands that the inventory had incorrectly absorbed into neighboring inferred
function ranges: **E118..E174 = 0x5C bytes** and **E1B4..E2D4 = 0x120 bytes**.
They account for the 380-byte increase in unattributed assembly and are the next
bounded mine-floor research target. Both detached and production full-ROM
comparisons pass with the two new linker seams.

`func_0809DA00` is behavior-mapped but parked after the bounded natural-source
pass. Its true size is 0x52C. Saved candidates are `da00-v1.cc` at 0x534 /
905 differing linked bytes and `da00-v2.cc` at 0x534 / 883 differences.
The v2 experiment applied the one high-leverage register clue, keeping the
persistent result/content value toward r8 and matching the first branch order;
the mismatch still begins immediately in entry/jump-table register allocation.
Its meaningful cases are now mapped: 3 one-time mine/location progress,
4..9 cursed-tool rewards, 10 year/progress-gated reward, 23 all-six cursed-tool
completion, 32 Goddess Jewel floors, 33 Kappa Jewel floors and 34 a standalone
progress flag. Treat DA00 as a compiler/source-shape frontier until genuinely
new evidence appears.

The mine-floor cluster now owns **872 exact linked source bytes** across CE8C,
the D8A0..D8E8 accessor block, D9B4, DF2C..E0AC, the E0AC tile-resource
lookup and the E174..E1B4 progress-flag getter block.

The legacy fixed-register and inline-assembly code still present in
`src/mine_floor.cc` is not a model for future reconstruction. Preserve its
exact output until each remaining helper is replaced by independently proven
natural source.
