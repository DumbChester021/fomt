# FoMT Session Status

## Current verified snapshot — October 10, 2026

This is a **concise live checkpoint**. The former chronological session
notes are preserved byte-for-byte in
[session history](checkpoints/menu-throughput-docs-2026-10-10/SESSION_HISTORY.md).
Live next actions belong to `tools/ches/NEXT_AGENT_HANDOFF.md`.

| Item | Verified value |
| --- | --- |
| Workspace / branch | `/mnt/data/Github/gba/fomt`; `main` tracking `ches/main` |
| Latest published source | **`65d61b8`** (13-function GameState callbacks), pushed to `ches/main` |
| Code in C++ source | **88,972 / 940,036 (9.4647%)** |
| Remaining linked ASM | **851,064 bytes; 1,981 functions** |
| Inferred assembly ranges | **848,092 bytes** (99.6508%) |
| Unattributed ASM / parked | **2,972 bytes / 27 functions** |
| Recovered data/assets | **75,554 / 6,777,404 (1.1148%)** |
| Meaningful ROM | **164,922 / 7,717,440 (2.1370%)** |
| Free ROM tail | **671,168 bytes** |
| Retail ROM | **8,388,608 bytes**; SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963` |
| Latest forced build | `make -B -j4 compare` **passed** (`sh_mv2471un_7d10991c`; `fomt.gba: OK`) |
| Pending builds | None at this checkpoint |

## Latest integrated work

**Newest exact audio/readability checkpoint:** 2 GameState audio/child callbacks / **48 linked bytes** in `src/game_state_audio_callbacks.cc`; original audio fade-out at 16784 remains assembly. Forced `make -B -j4 compare` gate `sh_mv2471un_7d10991c` passed; current exact code **88,972 / 940,036 (9.4647%)**, linked ASM **851,064 bytes / 1,981 functions**. The separate human-readability audit covers **136 C++ files / 19,919 lines**: these counts are heuristic debt indicators, not semantic completion percentages. Source: `docs/SOURCE_READABILITY_AUDIT.md`, `tools/ches/audit_source_readability.py`, `docs/GAME_STATE_AUDIO_CALLBACKS.md`.

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

Exact-ROM code coverage is **not** a measure of full human readability. The current heuristic audit covers 135 C++ units/19,851 lines and flags 133 address-named function definitions in 15 files, 44 offset-named callback uses in three GameState/menu source files, and compiler-sensitive constructs in seven files. These are review indicators, not a semantic completeness percentage. See `docs/SOURCE_READABILITY_AUDIT.md` and `tools/ches/audit_source_readability.py`; the newest three GameState/menu units now have documented ABI uncertainty and cleaned formatting, without adding code coverage.

## Highest-leverage next action

Choose a coherent high-payoff function/type family. The 18-member 72-byte
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
