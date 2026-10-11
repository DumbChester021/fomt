# Save-system evidence matrix: current function boundaries and known results

This is the **live, human-readable entry point for save-system matching research**, not a replacement for the machine-generated whole-ROM inventory (`tools/ches/decomp_inventory.json`), the full original assembly, the per-function proof documents, or chronological experiment archives. **Verify current Git HEAD** with `git log -1`; entries describe the evidence as of October 11, 2026. Byte-exact C++ coverage counts **only newly source-owned executable bytes**, never independent reproofs or readability rewrites.

## Bounded save-system functions

The source-derived `make save-progress` summary reports **only the bounded functions in this matrix**; it is not a percentage of total save-system completion. The `Owner` column is checkable: `EXACT` means source-owned and whole-ROM-verified, `ASM` means the original assembly is still linked. Addresses and lengths below are original retail code regions. A match in isolation alone is insufficient for `EXACT`.

| Start | Retail function | Bytes | Owner | Implementation | Evidence / next useful clue |
| --- | --- | ---: | --- | --- | --- |
| 0x08011650 | Save loader / default initializer | 740 | ASM | asm/game_state.s | `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md`; many compiler variants failed; reactivated by save-first priority |
| 0x080D4178 | Full GameState assignment | 776 | ASM | asm/code_linkonce.s | `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`; copying destination in place is required |
| 0x080D4480 | GameState cleanup | 84 | EXACT | src/game_state_cleanup.cc | `docs/GAME_STATE_SAVE_CLEANUP.md`; mode 2 retains allocation, mode 3 releases it |
| 0x080D64C8 | Farm state copy | 180 | EXACT | src/farm_state_copy.cc | `docs/SAVE_FARM_STATE_COPY.md`; specialized Coop/Barn copies |
| 0x080D657C | Barn state copy | 296 | EXACT | src/barn_state_copy.cc | `docs/SAVE_BARN_STATE_COPY.md`; zero differences and forced full-ROM proof |
| 0x080D66A4 | Coop state copy | 292 | EXACT | src/coop_state_copy.cc | `docs/SAVE_BARN_STATE_COPY.md`; natural fieldwise C++ exact under two historical compilers and structurally refined compatibility compiler; adjacent `Coop::DayUpdate` remains exact, full default production `make test` and retail ROM SHA1 verified |
| 0x080D67C8 | Dog state copy | 132 | EXACT | src/dog_state_copy.cc | `docs/SAVE_DOG_STATE_COPY.md`; implicit Animal assignment ABI matters |
| 0x080D68C0 | Farmer state copy | 448 | EXACT | src/farmer_state_copy.cc | `docs/SAVE_FARMER_STATE_COPY.md`; explicit symbol binding preserves retail `memcpy` call |
| 0x080D6A80 | Rucksack active-entry copy | 128 | ASM | asm/code_linkonce.s | `docs/SAVE_RUCKSACK_COPY_RESEARCH.md`; copy only active entries, not unused capacity; v1-v4 not matching |
| 0x080D6B00 | Rucksack cleanup | 64 | EXACT | src/game_state_cleanup.cc | `docs/GAME_STATE_SAVE_CLEANUP.md`; **was already exact**, October 11 typed rewrite was readability-only |
| 0x080D6B40 | MoneyState copy | 200 | ASM | asm/code_linkonce.s | `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`; best prior typed 196 bytes / 157 differing, placement experiments closed |
| 0x080D6C08 | MoneyState nested cleanup | 80 | EXACT | src/game_state_cleanup.cc | `docs/GAME_STATE_SAVE_CLEANUP.md`; preserve original counted loops and allocation-mode behavior |

**Boundary warning:** `0x080D6A80..0x080D6B40` is **two functions (128+64 bytes)**. Earlier combined descriptions of a "192-byte Rucksack copy" were wrong. The cleanup is source-owned and the 128-byte copy is **not**. This was confirmed by source symbols and isolated linked-byte comparisons. Regenerate the linked ASM inventory after every source promotion. The 12-function save-copy subset includes the now source-owned Coop copy; **8 exact, 4 ASM**, and still does not imply full save-system completion.

## Verified save-adjacent helper outside this 12-function subset

- **0x080D60B0..0x080D64C8, 1,048 linked bytes: EXACT C++** in `src/social_state_copy.cc` (`CopySavedSocialState`), copying the 0x478-byte social-state record at GameState+0x1CD4. A separate isolated forced ROM compare and production `make test` both pass original SHA1; see [social proof](SAVE_SOCIAL_STATE_COPY.md). This source promotion adds **1,048 whole-game code bytes** but does **not** change **8/12** in the bounded tracker. Parent GameState assignment and second large nested assignment still ASM.

## Decompilation evidence classes

- **Proven exact source:** Original function bounds, readable implementation and ABI, zero linked-byte differences, exact isolated/production ROM, original SHA1, and source ownership in the linker/assembly inventory.
- **Behavior described, ASM still live:** Assembly and types support a plausible semantic reconstruction, but no matched C++ is in production. This is research progress, **not** an exact-byte contribution.
- **Failed candidate, closed family:** Preserve best source, generated size, mismatches, toolchain, trace, and explicit reason not to replay it. A later source match must provide **new evidence**, not just a different spelling.
- **Unknown:** Do not guess field meanings, assign ownership, or claim real save-load safety without confirming evidence.

## Discovery impact map: what to update when knowledge changes

| New discovery | Mandatory cross-checks and updates |
| --- | --- |
| Function boundary changes | Assembly symbols and linker spans; `tools/ches/decomp_inventory.json` if ownership changes; this matrix; per-function research; current handoff/queue; saved copy dependencies |
| Field/type identity changes | `include/save_persisted_layout.hh` layout assertions, `docs/SAVE_SERIALIZED_LAYOUT.md`, `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`, `docs/SAVE_LIFECYCLE.md`, consumers, cleanup and copy code |
| Function becomes exact C++ | Per-function zero-byte proof, separate isolated and production forced-ROM compare, source/linker ownership, inventory regen, readability audit, current status, handoff, progress/README |
| New failure or closed method | Scratch evidence, per-function proof/closed-path record, this matrix, handoff anti-repeat instructions; **do not** change the exact reconstruction metric |
| Compiler/ABI finding | `docs/FOMT_COMPILER_FINGERPRINT.md`, `docs/FOMT_COMPILER_RESEARCH.md`, relevant Call238 experiment index and closed-paths; verify other functions using the same ABI |
| Ownership or load-flow change | `docs/GAME_STATE_SAVE_CLEANUP.md`, `docs/SAVE_MENU_RETRY_TRACE.md`, save lifecycle, assignment map and the end-to-end player-save test plan |
| Publication/version changes | Verify `git log -1` and `git status -sb`, update only `START_HERE.md` for current state; append dated corrections to `tools/ches/HISTORY.md`. Status/progress redirects are not live metric stores. |

Never infer success from a historical screenshot or prose status alone. Compare current assembly inventory, source, symbols, original SHA1, and provenance. A machine check is provided by `python3 tools/ches/check_save_evidence.py`, which tests the table against the current linked-assembly inventory and source paths (it is not a replacement for `make -B -j4 compare`).

## How to help without writing C++

Read `docs/SAVE_DECOMP_BEGINNERS_GUIDE.md`. The most useful contributions are spotting contradictions between documents, asking which original source behavior is known versus merely inferred, researching input/field meanings, and producing reproducible observations from **backed-up** real save files. Never test save writing on the only copy of a player save. Keep intentional custom-game work in its separate worktree.
