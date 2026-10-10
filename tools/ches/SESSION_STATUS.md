# FoMT Session Status

## Current verified snapshot — October 10, 2026

This is a **concise live checkpoint**. The former chronological session
notes are preserved byte-for-byte in
[session history](checkpoints/menu-throughput-docs-2026-10-10/SESSION_HISTORY.md).
Live next actions belong to `tools/ches/NEXT_AGENT_HANDOFF.md`.

| Item | Verified value |
| --- | --- |
| Workspace / branch | `/mnt/data/Github/gba/fomt`; `main` tracking `ches/main` |
| Published checkpoints | Source **`1e522c9`**; inventory/handoff documentation **`38718be`** |
| Code in C++ source | **87,236 / 940,036 (9.2801%)** |
| Remaining linked ASM | **852,800 bytes; 2,037 functions** |
| Inferred assembly ranges | **849,828 bytes** (99.6515%) |
| Unattributed ASM / parked | **2,972 bytes / 27 functions** |
| Recovered data/assets | **75,554 / 6,777,404 (1.1148%)** |
| Meaningful ROM | **163,186 / 7,717,440 (2.1145%)** |
| Free ROM tail | **671,168 bytes** |
| Retail ROM | **8,388,608 bytes**; SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963` |
| Latest forced build | `make -B -j4 compare` **passed** (`sh_mv1zgcf1_407a2abd`; `fomt.gba: OK`) |
| Pending builds | None at this checkpoint |

## Latest integrated work

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
unchanged. The verified retail source is committed in **`1e522c9`**, followed by published inventory/handoff documentation **`38718be`**. The later documentation-sync edits do not change executable source.

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
