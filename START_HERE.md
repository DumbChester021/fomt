# FoMT Zero-Context Start Here

This is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Read this in order

1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. This file
4. docs/DECOMP_PLAYBOOK.md and docs/DECOMP_PRIORITY_MAP.md
5. tools/ches/NEXT_AGENT_HANDOFF.md
6. Only subsystem docs and experiment/failure ledgers named by that handoff

## Active branch and build authority

- Retail branch: **main**, tracking **ches/main**. Run git log -1 for this checkpoint's commit.
- Starting checkpoint for the menu drawing batch: **a714171**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Handoff readiness

Latest verified batch: **14 menu drawing functions / 576 exact linked bytes**.
Twelve callback methods recover rectangle and three decimal layouts; two
encoded text streams share MenuTextSize and the glyph-return interface.
Both forced isolated and production full-ROM comparisons pass on October 9, 2026.
Run git log -1 and git status before work; preserve intentional dirty files.
The full loader and complete GameState type remain unfinished.
No build or compiler command is pending.

Read the Fast-path operating method in docs/DECOMP_PLAYBOOK.md.
NEXT_AGENT_HANDOFF.md owns exact bounds, first commands and closed paths.

## Current exact reconstruction

- Code: **83,080 / 940,036 = 8.8380%**.
- Assembly: **856,956 bytes; 2,111 linked functions**.
- Inferred ranges: **854,260 / 856,956 = 99.6854%**.
- Unattributed assembly: **2,696 bytes; 23 parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **159,030 / 7,717,440 = 2.0607%**.
- Free tail: **671,168 bytes**.

## Latest completed batch

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
Other ranges and all 2,696 unattributed bytes remain unchanged.
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

## Next direction

Next: recover the **shared menu glyph renderer family / 756 bytes**:
DrawMenuGlyph E4AC..E5AC (256) and DrawStyledMenuGlyph E5AC..E7A0 (500),
around MenuTextSize, their four-tile buffer and shared decoder.
Preserve unaligned-copy stubs E9C8/E9CC and anonymous clear helper E9D0..E9F4.
Use whole related families with one integration, inventory/docs and publication
pass; a fixed small function count is not the batch unit.

OAM factory EA94 is parked: true body 208 bytes followed by a separate
288-byte anonymous routine at EB64..EC84. Preserve that successor.
Native bitfield/helper spellings failed; reopen only with real source/lifetime evidence.

Frame getter 5E790 is parked at 140 bytes / 34 differences. The old October 5
probes were found and the current natural candidate reproduces that schedule.
Integer formatter 4EC84 is parked on the counter-copy/loop placement frontier;
v4/v5/v6 canonicalize at 160 bytes / 97 differences. No nonmatching source is promoted.
Number drawer 4EDB4 stays 68/eight and constructor 92570 stays 0x54/four.
Offer builder 85640 remains parked on shared frame-copy/list lifetimes.
The whole loader, resource-owner constructors and B128 remain parked.
Whole save recovery is unfinished despite exact persistent subobjects.

Current proofs: tools/ches/checkpoints/menu-graphics-batch-2026-10-09/.
Earlier frame/count proofs: tools/ches/checkpoints/packed-sprite-frame-2026-10-09/.
Menu probes: tools/ches/checkpoints/menu-numbers-2026-10-09/.
Builder probes: tools/ches/checkpoints/livestock-offer-builder-2026-10-09/.
The canonical handoff supplies exact commands and fresh-clone limitations.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. NEXT_AGENT_HANDOFF.md owns next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
