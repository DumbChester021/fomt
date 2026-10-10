# FoMT Session Status

## Current verified snapshot — October 11, 2026

This is a **concise live checkpoint**. The former chronological session
notes are preserved byte-for-byte in
[session history](checkpoints/menu-throughput-docs-2026-10-10/SESSION_HISTORY.md).
Live next actions belong to `tools/ches/NEXT_AGENT_HANDOFF.md`.

| Item | Verified value |
| --- | --- |
| Workspace / branch | `/mnt/data/Github/gba/fomt`; `main` tracking `ches/main` |
| Earlier pre-batch published source | **`497395f`** (save helpers); check `git log -1` and `git status -sb` for later checkpoints |
| Code in C++ source | **91,388 / 940,036 (9.7218%)** |
| Remaining linked ASM | **848,648 bytes; 1,946 functions** |
| Inferred assembly ranges | **845,612 bytes** (99.6423%) |
| Unattributed ASM / parked | **3,036 bytes / 27 functions** |
| Recovered data/assets | **75,554 / 6,777,404 (1.1148%)** |
| Meaningful ROM | **167,338 / 7,717,440 (2.1683%)** |
| Free ROM tail | **671,168 bytes** |
| Retail ROM | **8,388,608 bytes**; SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963` |
| Latest forced build | `make -B -j4 compare` **passed** with typed Rucksack cleanup (`sh_mv2utzp3_be621085`; `fomt.gba: OK`) |
| Pending builds | None at this checkpoint |

## Current save-system checkpoint (October 11, 2026)

**Exact source integration:** CopySavedFarmerState 448B at 080D68C0, CopySavedBarnState 296B at 080D657C, CopySavedFarmState 180B at 080D64C8, CopySavedDogState 132B at 080D67C8, three parent/nested GameState cleanup routines 228B; plus save header/SRAM proxy, byte-buffer, transition and packed flag helpers. Cumulative **91,388 byte-exact game-code bytes / 1,946 remaining ASM functions**. Full forced retail gate sh_mv2ubxc2_e766423e passed with original SHA1.

**Coop and Rucksack next:** Nested Rucksack `080D6A80..080D6B00` is **128 bytes** of ASM although the enclosing Farmer assignment is exact. Adjacent `080D6B00..080D6B40` was already an exact source-owned 64-byte cleanup, now made fully typed as Rucksack in `src/game_state_cleanup.cc` without coverage gain (isolated and production full ROM pass). Four nonmatching copy variants are preserved in `docs/SAVE_RUCKSACK_COPY_RESEARCH.md`. Exact-sized Coop C++ v3/v4 of 080D66A4 still have 35 differing linked bytes, largely register allocation; declaration-order v5/v6 increased size to 0x128 and differences to 104/109. See `docs/SAVE_BARN_STATE_COPY.md`; avoid replaying closed variations. Barn/Farmer code and typed cleanup are retail exact; check Git for their current publication status.

**Structures/tests:** 41 original-compiler layout assertions verify seven embedded GameState types; read-only SRAM inspector synthetic tests pass including u32 fish-count overflow, no real SRAM tested. Full GameState assignment 080D4178, loader 08011650 and multiple save/copy/erase paths remain ASM. Next steps in tools/ches/NEXT_AGENT_HANDOFF.md.

Earlier milestone material was moved to tools/ches/checkpoints/save-2026-10-11/HANDOFF_HISTORY.md. Historical records below are not live progress or current priority.

## Earlier integrations (verified historical milestones)

**Earlier exact audio/readability checkpoint:** 2 GameState audio/child callbacks / **48 linked bytes** in `src/game_state_audio_callbacks.cc`; original audio fade-out at 16784 remains assembly. Forced `make -B -j4 compare` gate `sh_mv2471un_7d10991c` passed; current exact code **88,972 / 940,036 (9.4647%)**, linked ASM **851,064 bytes / 1,981 functions**. The separate human-readability audit covers **136 C++ files / 19,919 lines**: these counts are heuristic debt indicators, not semantic completion percentages. Source: `docs/SOURCE_READABILITY_AUDIT.md`, `tools/ches/audit_source_readability.py`, `docs/GAME_STATE_AUDIO_CALLBACKS.md`.

**Prior October 10 integration:** 13 GameState/menu callback and incubation methods / **444 byte-exact linked bytes** in `src/game_state_menu_callbacks.cc`, across five original-address islands. The forced ROM comparison `sh_mv22yrzy_255645e2` passed, exit 0, retail SHA1 unchanged. Inventory is **88,972 / 940,036 (9.4647%)**, with **851,064 bytes / 1,981** linked assembly functions. Proofs, scratch variants and backups are at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch3/`. See `docs/GAME_STATE_MENU_CALLBACKS.md`.

**Previous October 10 integration:** 18 GameState/menu action and record functions / **560 linked bytes**, in `src/game_state_menu_actions.cc` across four original-address islands. The forced ROM comparison `sh_mv22h75z_27840b97` passed, exit 0, and the retail SHA1 is unchanged. Those counts were superseded by the newest 2-function audio checkpoint at the top of this file. Standalone proofs, matching differences, integration script and backups: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch2/`. See `docs/GAME_STATE_MENU_ACTIONS.md`.

**Earlier (October 10):** 23 GameState/menu dispatch and flag-setting methods / 684 exact bytes in `src/game_state_menu_dispatch.cc`, five original-address source islands across 08014034..08014318. Only `func_0801412C` remains assembly. The latest forced full-ROM build passed (`sh_mv21rcv0_8fb063b4`, exit 0); the rebuilt ROM still has the original SHA1. For current totals, use the header above; this paragraph describes an earlier exact source batch. Proof and backups: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-virtual-dispatch-20261010/`. See `docs/GAME_STATE_MENU_DISPATCH.md`.

**Preceding (October 10):**

The October 10 continuation recovered **18 byte-exact functions / 632
linked bytes**: three owner destructors (156), four global-owner destructors
(160), five resource helpers (124), and six vtable-only destructors (192).
Their files are `src/menu_owner_dtors.cc`,
`src/menu_global_owner_dtors.cc`, `src/menu_resource_helpers.cc` and
`src/menu_simple_dtors.cc`. All four production full-ROM gates passed.
A formerly adjacent **64-byte raw region** after DE220 is unchanged and
now counted as unattributed ASM instead of as part of its preceding function.

The complete save loader and GameState are not finished; the separate
custom-game worktree remains independent. The current tracked compiler is
unchanged. The previously verified 20-function source is committed in **`9bac767`**, following documentation commits **`38718be`** and **`98e093a`**. The subsequent 23-function source integration is retail-exact; verify its published commit with `git log -1`.

## Readability review

Exact-ROM code coverage is **not** a measure of full human readability. The current October 11 heuristic audit covers **149 C++ files / 20,588 lines**, with 143 address-named function definitions in 20 files, 44 offset-named callback uses in three GameState/menu source files, and 21 compiler-sensitive syntax indicators across eight files. The newly added Farmer source uses one explicit `memcpy` ABI symbol binding, documented in `docs/SAVE_FARMER_STATE_COPY.md`. These are review indicators, not a semantic completeness percentage. See `docs/SOURCE_READABILITY_AUDIT.md` and `tools/ches/audit_source_readability.py`; the newest three GameState/menu units now have documented ABI uncertainty and cleaned formatting, without adding code coverage.

## Save and custom-game readiness (October 10)

**Not finished:** retail save writer/checksum and 32-KiB SRAM/two-slot geometry are proven; loader `func_08011650` remains 740 bytes of assembly and the complete `GameState` field layout and save-menu lifecycle are unfinished. Retail's per-slot 2,800-byte unused tail is a candidate extension area, not a deployed format.

The separate `custom-game` worktree now has a **host-only** proposed dual-bank extension codec (`tools/save_extension_reference.py`) and **16 passing synthetic-image regression tests** (`tools/test_save_extension_reference.py`). No actual GBA hook, live save modification, emulator round-trip, schema migrator or comprehensive slot-copy/erase/overwrite integration has been implemented. Slot overwrite with byte-identical retail data and non-atomic retail/extension write ordering are release blockers. For the tested architecture and exact implementation gates see retail `docs/SAVE_FORMAT.md` and custom-game `docs/SAVE_EXTENSION_READINESS.md`. Preserve that custom worktree's existing dirty documentation; these research/tools changes must not be mistaken for retail coverage gain.

**Current save priority:** recover the low-level SRAM I/O, complete 740-byte loader and persistent type graph, and all retail save/load/copy/erase/overwrite/retry and slot-selection handlers in human-readable, byte-exact source. All custom-game extension work remains deferred. REA is optional for genuinely unresolved control-flow questions; static assembly already settles the retail record and loader error stages. No retail executable files were changed during this investigation.

## Historical general-throughput next action (deferred)

The former queue recommended choosing a coherent high-payoff function/type family. The 18-member 72-byte
ownership-transfer cluster is promising, but DB394 v1/v2 candidates are
nonmatching and v1 is semantically wrong on temporary ownership. Alternatively
work the three typed tree-node insertion siblings (E2294/E27FC/E54F0);
the tree rotations and balancer are already exact. Park codegen-only
compiler-sensitive targets until new evidence exists.

The isolated function comparison tool can mis-target multi-section scratch
objects; the attempted fix was reverted to the tracked version. Use one
candidate function per scratch source for matching. Regenerate
`tools/ches/decomp_inventory.json` after actual production changes, not
merely for documentation. At the October 10 audit start, retail `main` was clean and even with its tracked remote; the separate `custom-game` worktree had four uncommitted documentation changes. Preserve any subsequent modifications in either worktree.
