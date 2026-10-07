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

The legacy fixed-register and inline-assembly code still present in
`src/mine_floor.cc` is not a model for future reconstruction. Preserve its
exact output until each remaining helper is replaced by independently proven
natural source.
