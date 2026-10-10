# FoMT Next Agent Handoff

## Current production authority — 2026-10-10

**This is the live handoff.** The former chronological handoff is preserved
byte-for-byte in [handoff history](checkpoints/menu-throughput-docs-2026-10-10/HANDOFF_HISTORY.md).
Superseded next-target claims in that history are not instructions.

- Retail workspace: `/mnt/data/Github/gba/fomt`; branch `main` tracking `ches/main`; verified source-code checkpoint **`1e522c9`**. Check `git log -1` for the subsequent documentation checkpoint.
- **The previously dirty verified retail source is now committed as 1e522c9.** Keep the separate custom-game worktree isolated. Preserve any new local changes and never reset, clean, or stash them without review.
- Retail SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**, ROM size **8,388,608**.
- Latest full forced comparison: `make -B -j4 compare` -> **`fomt.gba: OK`**; execution `sh_mv1zgcf1_407a2abd`, exit 0. No background build pending.
- **Code 87,236 / 940,036 = 9.2801%**. Assembly: **852,800 bytes / 2,037 linked unresolved functions**; mapped inferred ranges **849,828** bytes, unattributed **2,972**, explicitly parked **27**.
- **Data/assets 75,554 / 6,777,404 = 1.1148%**; meaningful ROM **163,186 / 7,717,440 = 2.1145%**; free tail **671,168 bytes**.
- The thirteen-rule compiler compatibility layer is unchanged; see `docs/FOMT_COMPILER_FINGERPRINT.md`. The full save loader/GameState remains unfinished and parked.
- The live machine-generated truth is `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md`.

## Latest verified exact integration — 18 functions / 632 bytes

All four independent source families were isolated, proven byte-exact, integrated
with original linker/assembly seams, and followed by a successful forced retail
ROM gate. Scratch proofs are under
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/`,
including `matching/*.mismatch.txt`.

| Family | Exact function addresses | Production source | Recovered |
| --- | --- | --- | ---: |
| Polymorphic owner destructors | DCE60, DCEEC, E4510 | `src/menu_owner_dtors.cc` | 3 / 156 bytes |
| Global-owner destructors | D7AAC, D7B04, E581C, E5844 | `src/menu_global_owner_dtors.cc` | 4 / 160 bytes |
| Resource checks and two initializers | D7F60, D7F74, D7F88, D6F1C, D6F5C | `src/menu_resource_helpers.cc` | 5 / 124 bytes |
| Vtable-only destructors | D3ED4, DE220, E103C, E3D94, E4190, E4544 | `src/menu_simple_dtors.cc` | 6 / 192 bytes |

Forced ROM execution IDs, in sequence: `sh_mv1z65ct_8e774db6`,
`sh_mv1z8v52_19acc033`, `sh_mv1zdh6z_e0e0ec96`,
`sh_mv1zgcf1_407a2abd`. All exited 0 and ended with `fomt.gba: OK`.
The **64 bytes** of raw code/data following `DE220` remain in assembly; they
were reclassified as unattributed, increasing this subtotal from 2,908 to
2,972 bytes. They were neither reconstructed nor removed.

Earlier October 10 integrations included glyph-cache/provider/canvas methods,
range cleanups, tree rotations/balancing/release methods, ten menu emitters,
four subobject initializers and entity destructors. Their original experiments
are preserved in the archived history, corresponding subsystem pages, and
local matching workspace. Do not repeat already exact work.

## Highest-leverage next work

Re-rank coherent TUs/families by source-byte payoff, downstream type leverage,
existing structural evidence and compiler difficulty. The inventory queue is
a heuristic, **not** automatically an execution order.

1. **Ownership-transfer wrapper cluster:** 18 similar methods of **72 linked
   bytes each** (potential 1,296 bytes), including `func_080DB394`. Retail
   moves a temporary owned pointer into output and only conditionally releases.
   Scratch `db394-owned-v1.cc` is **0x40 versus 0x48 / 50 differing bytes**
   and semantically releases the result incorrectly. `db394-owned-v2.cc`
   zeroes a temp, but compiles to **0x2C versus 0x48 / 49 differences**.
   Recover the 16-byte stack smart-owner/move layout and destructor/allocator
   ABI *before* using one exemplar across siblings. Park if codegen archaeology
   dominates; never integrate nonmatching candidates.
2. **Typed tree-insertion family:** three ~192-byte siblings at `E2294`,
   `E27FC`, `E54F0`; layout and left/right rotations are source-exact,
   plus the `E21E0` balancer. E2294 scratch v1/v2 is behavior-recovered but
   nonmatching. Require new allocator/pointer-lifetime/type evidence.
3. **Other compiler-sensitive parked work:** two D6EAC/D6EEC pair initializers
   have correct 32-byte size but 7 mismatching linked bytes due to flag-store
   register order; E3610/E375C bit predicates, ten 36-byte DD410 field-copy
   helpers, F060 glyph-row rotation, E1C70, and the save loader remain parked
   until new structure provides leverage.

## Verification and continuation rules

- Read `AGENTS.md`, `START_HERE.md`, the fast path in
  `docs/DECOMP_PLAYBOOK.md` and the current ranked inventory. Reuse source
  types and saved scratch proofs; do not re-run completed experiments.
- Compare **single-function scratch sources** using
  `python3 tools/ches/compare-function.py scratch.cc name --start 0x08... --end 0x08... --out-dir <dir>`.
  The existing `--symbol` comparator is unreliable when one scratch object
  contains multiple independently named `.text.*` sections. An experimental
  fix failed and was reverted byte-for-byte to tracked HEAD; do not rely on
  multi-section proofs without a proper regression-tested fix.
- Check exact body, trailing alignment, literals, relocations and ABI before
  production. Split only the proven ranges in `asm/code_linkonce.s` and
  `fomt.lds`. Preserve all neighboring ASM and raw literal/data islands.
- Force `make -B -j4 compare`, verify ROM SHA1, regenerate inventory with
  `python3 tools/ches/build_decomp_inventory.py`, run `git diff --check`,
  update the live dashboard/status/handoff and relevant stable subsystem page
  **once per coherent batch**.
- Keep custom-game edits isolated. The exact retail source was committed as
  **1e522c9** and the documentation was prepared as a separate checkpoint;
  verify the current upstream state with `git status -sb` and `git log -1`.
