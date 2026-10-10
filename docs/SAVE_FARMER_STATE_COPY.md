# Retail-exact Farmer saved-state assignment

## October 11, 2026: source integration verified

The original `func_080D68C0` at `0x080D68C0..0x080D6A80` is now the readable `CopySavedFarmerState` in `src/farmer_state_copy.cc`, **448 original bytes**. The original symbol is retained as an ABI alias, and its adjacent `func_080D6A80` Rucksack copy remains at its original address and still uses assembly.

The function copies both fixed-string name fields, the date and actor location, all six `Farmer::ToolLevel` entries with a countdown typed loop, the separate packed stamina/berry/fatigue/step/unknown state fields in layout order, held item, the two-byte `ToolStack` and the nested `Rucksack` through its existing specialized routine. Existing `Farmer`, `ToolLevel` and `Rucksack` project types are reused. Unknown packed fields retain neutral names; this is not a claim that every saved byte is semantically understood.

## Matching experiment and compiler caveat

- `farmer-v1.cc`: typed fields and countdown loop already produced the exact `0x1C0` length, with **33 linked differences**, entirely near the two-byte ToolStack copy. Calling standard `memcpy(&dest->unk_5C, &src->unk_5C, sizeof(ToolStack))` optimized to an inline halfword load/store, while retail explicitly calls the existing `memcpy` library function.
- `farmer-v2.cc`: declares a descriptive `CopyToolStackBytes` external C function bound by `__asm__("memcpy")` to the already-proven retail `memcpy` symbol. This is a **symbol binding**, not inline assembly instructions, forced registers, altered optimization settings or a patched compiler. It prevents intrinsic substitution and generates the original library call: **expected 0x1C0 / actual 0x1C0; zero linked differences**.
- `farmer-v3.cc`: directly declaring the function named `memcpy` without a header still triggered the optimizer and reproduced the previous 33 differences. Do not repeat this approach.

The `__asm__("memcpy")` declaration is a documented compiler-sensitive ABI binding: the source logic is otherwise ordinary typed C++. Its unusual syntax should remain auditable and should not be generalized without a separate need. Source and proof files: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-copy-20261011/farmer-v1.cc`, `farmer-v2.cc`, `farmer-v3.cc`, `proofs/farmer-v2.diff` and `proofs/farmer-v2.mismatch.txt`.

## Validation and linker ownership

A detached isolated integration worktree at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-barn-integration-20261011`, already containing exact Barn source, passed `make -B -j4 compare` after integrating Farmer: Ches `sh_mv2ub3me_43db97be`, exit 0, `fomt.gba: OK`. Its `src/farmer_state_copy.cc`, `asm/code_linkonce.s` and `fomt.lds` changes were promoted into the existing dirty retail `main` without touching custom-game. **Production** `make -B -j4 compare` passed, Ches `sh_mv2ubxc2_e766423e`, exit 0, retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. The `arm-none-eabi-nm` check confirmed `CopySavedFarmerState` and `func_080D68C0` at `0x080D68C0`, with nested `func_080D6A80` still at `0x080D6A80`.

The first Barn pass added 296 exact bytes; the second Farmer pass adds 448, **744 new exact bytes across two functions this session**. Regenerated inventory (October 11): **91,388 / 940,036 = 9.7218%** matching game C++, **848,648 bytes / 1,946 remaining linked assembly functions**, 845,612 inferred linked function bytes, 3,036 unattributed ASM bytes. Meaningful ROM **167,338 / 7,717,440 = 2.1683%**, data/assets unchanged 75,554, tail unchanged 671,168. SRAM inspector synthetic self-test passed. Readability audit reports 149 C++ units / 20,588 lines and 21 compiler-sensitive indicators in 8 files; byte-exact coverage does not imply full mod-readiness.

## Next work

Recover the **128-byte** nested `Rucksack` copy at `func_080D6A80` (`0x080D6A80..0x080D6B00`; see [research](SAVE_RUCKSACK_COPY_RESEARCH.md)) using `FixedVec<RucksackItem, 8>` and `FixedVec<ToolStack, 8>` semantics: the original resets each destination count, copies only the active entries, then sets the saved count. **Do not substitute whole-object assignment or memcpy** because that would change the behavior for inactive elements. The old `Coop` copy at `func_080D66A4` remains 292 bytes of ASM: v3/v4 natural typed candidates are exact-sized with 35 register differences; simple declaration permutations v5/v6 were worse and are closed. MoneyState `func_080D6B40`, parent GameState assignment `func_080D4178`, the 740-byte main loader `func_08011650`, and save-menu/erase/retry paths also remain in ASM.

At the time of the isolated/full production proofs, this work was still uncommitted above `497395f`; check Git for any subsequent publication. No genuine SRAM/emulator save-load test has passed.
