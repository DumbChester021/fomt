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
- Starting checkpoint for the provider count unit: **688a625**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Handoff readiness

Latest verified unit: packed sprite-provider count accessors, eight additional
exact code bytes. The larger frame getter and integer formatter are parked
after bounded probes. Livestock controller code remains six source functions /
548 linked bytes, with 220 catalog bytes.
Isolated and forced production full-ROM comparisons pass on October 9, 2026.
Run git log -1 and git status before work; preserve intentional dirty files.
The full loader and complete GameState type remain unfinished.
No build or compiler command is pending.

Read the Fast-path operating method in docs/DECOMP_PLAYBOOK.md.
NEXT_AGENT_HANDOFF.md owns exact bounds, first commands and closed paths.

## Current exact reconstruction

- Code: **82,504 / 940,036 = 8.7767%**.
- Assembly: **857,532 bytes; 2,123 linked functions**.
- Inferred ranges: **854,836 / 857,532 = 99.6856%**.
- Unattributed assembly: **2,696 bytes; 22 parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,454 / 7,717,440 = 2.0532%**.
- Free tail: **671,168 bytes**.

## Latest completed unit

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

Next: recover the menu OAM descriptor factory at 0804EA94..0804EB64,
208 bytes, around its eight-byte packed return record and caller contract.
Preserve the separate 288-byte anonymous routine at 0804EB64..0804EC84.
The raw 496-byte inventory range includes that successor.

Frame getter 5E790 is parked at 140 bytes / 34 differences. The old October 5
probes were found and the current natural candidate reproduces that schedule.
Integer formatter 4EC84 is parked on the counter-copy/loop placement frontier;
v4/v5/v6 canonicalize at 160 bytes / 97 differences. No nonmatching source is promoted.
Number drawer 4EDB4 stays 68/eight and constructor 92570 stays 0x54/four.
Offer builder 85640 remains parked on shared frame-copy/list lifetimes.
The whole loader, resource-owner constructors and B128 remain parked.
Whole save recovery is unfinished despite exact persistent subobjects.

Current proofs: tools/ches/checkpoints/packed-sprite-frame-2026-10-09/.
Menu probes: tools/ches/checkpoints/menu-numbers-2026-10-09/.
Builder probes: tools/ches/checkpoints/livestock-offer-builder-2026-10-09/.
The canonical handoff supplies exact commands and fresh-clone limitations.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. NEXT_AGENT_HANDOFF.md owns next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
