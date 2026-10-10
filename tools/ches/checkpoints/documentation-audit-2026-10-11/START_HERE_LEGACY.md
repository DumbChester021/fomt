# Archived START_HERE historical sections, October 11 2026

The following was previously part of the live START_HERE.md. Its “Active next direction” toward general decompilation is superseded by the user's save-first priority. Preserve the historical content verbatim; do not treat those older next steps as current.

---

Sections below are **historical**, not the current queue or percentage.

## Earlier exact batches (historical evidence, not the current queue)

include/menu_font.hh / src/menu_font.cc recover MenuGlyphTiles, the 128-byte
four-tile output record, GetMenuDoubleByteGlyphIndex and DecodeMenuGlyph.
The decoder resolves signed font-table indices, fifteen special glyphs and
one-/two-tile character widths. Normal invalid input clears the output.
It retains the fixed IWRAM expansion ABI already used elsewhere in the project.

src/menu_text_canvas.cc adds exact CopyMenuText and the two unaligned stubs.
The former anonymous E9D0 helper **copies** a whole canvas; it is not a clear
operation. Four named entries leave the inventory; the fifth source function
was previously included in E9CC's inferred range. Other surviving ranges and
the then-current 2,696 unattributed bytes were unchanged. See [MENU_TEXT.md](docs/MENU_TEXT.md).
The renderer pair and fill helpers are parked after bounded natural probes.

The preceding 14-function menu drawing batch remains exact:

include/menu_draw_nodes.hh / src/menu_draw_nodes.cc own twelve methods / 360
bytes: four initializers, four cleanup methods and four draw callbacks.
Allocation callers prove 0x20-byte rectangle and 0x1C-byte decimal records.
All four existing vtables and original callback slots remain unchanged.
Two formerly anonymous constructors at ED7C/EDF8 become source-owned.
See [MENU_TILEMAP.md](docs/MENU_TILEMAP.md).

include/menu_text.hh / src/menu_text.cc own two encoded text streams / 216
linked bytes at E8F0/E958, including four ordinary alignment bytes.
Both cache the current byte and dispatch glyphs; completed glyphs advance
eight or sixteen pixels. Styled text forwards both color values unchanged.
See [MENU_TEXT.md](docs/MENU_TEXT.md).

Twelve named assembly entries leave the inventory. The anonymous constructors
instead shrink the surviving ED28/EDB4 ranges to 84/68 bytes.
Other ranges and the then-current 2,696 unattributed bytes were unchanged.
EA94 gains parked metadata after two nonmatching natural source probes.

Earlier provider unit:

PackedSpriteAnimationProvider::GetSpriteCount and GetAnimationCount are exact
at 0805E81C..0805E824, four bytes each. They return counts[1] and counts[0].
The inferred frame-getter assembly range shrinks 148 to 140 bytes; no named
assembly function leaves the inventory and other ranges remain unchanged.
See [SPRITE_ANIMATOR.md](docs/SPRITE_ANIMATOR.md).

The earlier FillSequentialTileRect unit fills consecutive tile values across menu rows with
palette bits and a caller-supplied row stride. Its 98-byte body and two
alignment bytes match retail at 0804E9F4..0804EA58. That checkpoint removed
only 4E9F4 from the inventory and preserved the other address/size pairs.
See [MENU_TILEMAP.md](docs/MENU_TILEMAP.md).

Livestock controller construction and cleanup are exact source. The recovered
0x43E0-byte extent contains 17 menu records, title/message FixedStr fields and
16 animal records. Base internals and menu-record contents remain opaque.
Animal affection hearts, purchased species, sale pricing and pregnant-animal
count remain exact source. The typed catalog covers fodder,
cow/sheep purchases, Miracle Potions, medicine, bell, sales and animal info.
Original symbols and retail pointer values are preserved.
See [LIVESTOCK_SHOP.md](docs/LIVESTOCK_SHOP.md).

Scene lifetime remains **74 source functions / 4,108 bytes**:
24 constructors, 25 destructors and all 25 Runs. Constructor 92570 and most
controller logic remain assembly. See [SCENES.md](docs/SCENES.md).

## Active next direction

**Choose a coherent, high-value original TU or repeated source/type family.**
The leading candidate is the **18-member ownership-transfer/allocator wrapper
cluster (72 bytes per function, 1,296 potential bytes)**. Its `DB394` scratch
v1/v2 candidates are *nonmatching*; v1 is wrong on moved-pointer ownership.
Recover the 16-byte smart-owner transaction and the actual virtual cleanup
ABI before promoting this family. If this stalls on compiler source-shape,
pivot to another high-yield family rather than repeating spellings.

A promising alternative is the three **192-byte tree insertion** siblings
`E2294`, `E27FC` and `E54F0`. The tree node layout, both rotations and
the `E21E0` balancing helper are already exact. E2294 remains assembly after
two nonmatching probes. Rerank with the live function inventory.

F060 glyph-cache row rotation (best 12 differing linked bytes), E1C70,
E3610/E375C, 36-byte field-copy wrappers and D6EAC/D6EEC flag-store
initializers remain deferred compiler-sensitive work. The loader's previous
compiler variants are closed, but save-loader recovery is now active under
the October 11 priority. Avoid repeating failed candidate families.

Use [the live handoff](tools/ches/NEXT_AGENT_HANDOFF.md) for exact
candidate/proof locations and next steps; it now starts with live state,
with complete prior chronology retained in a dated archive. The existing
multi-section isolated comparator is unreliable for selecting separately
named C++ text sections; use one scratch function per proof.

Earlier menu/glyph proof assets:
- `tools/ches/checkpoints/menu-glyph-cache-2026-10-10/`
- `tools/ches/checkpoints/menu-glyphs-2026-10-09/`
- `tools/ches/checkpoints/menu-graphics-batch-2026-10-09/`
- `tools/ches/checkpoints/menu-numbers-2026-10-09/`

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. NEXT_AGENT_HANDOFF.md owns next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
