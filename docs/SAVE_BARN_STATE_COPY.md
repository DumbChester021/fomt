# Retail-exact Barn saved-state assignment

## Verified October 11, 2026

`CopySavedBarnState` in `src/barn_state_copy.cc` is the exact C++ replacement for `func_080D657C`, ROM `0x080D657C..0x080D66A4` (**296 linked bytes**). The original function's entry address is preserved by its alias, and the next `Coop` routine still starts at `0x080D66A4`. This is one dependency of `CopySavedFarmState`, not a full save-loader implementation.

The copy uses the project's existing `Barn` type, with evidence-backed packed fields for upgrade, fodder inventory, stall flags, pregnancy stalls, animal age data, and stored names. The two pregnancy-stall indices are copied bytewise. The two `FixedStr<12>` names use their normal assignments (calling retail `strcpy`), followed by **16 record copies of 60 bytes each** using `memcpy` and advancing typed `Barn::Ent` pointers. Some field labels remain neutral because their gameplay meanings are not yet established.

## Matching evidence and rejected source shapes

- `barn-v1.cc`: natural array-indexed copying, **0x114 vs 0x128** expected, 285 differing bytes.
- `barn-v2.cc`: countdown and pointer-based copying, **0x128/0x128**, 13 differing linked bytes. The bytewise stall pointer increments had reverse order; the 60-byte `memcpy` loop advanced pointers before the call.
- `barn-v3.cc`: same correct behavior, with source-copy followed by destination/source increments as separate statements. **0x128/0x128; zero differing linked bytes**. No register constraints, compiler patches, inline assembly, volatile tricks or raw ROM patching.

Proofs and candidate source are preserved in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-copy-20261011/`, especially `proofs/barn-v3.mismatch.txt` and `proofs/barn-v3.diff`.

## Production integration

An isolated detached worktree at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-barn-integration-20261011` passed forced `make -B -j4 compare` (Ches execution `sh_mv2tshhj_2b10282d`, exit 0, `fomt.gba: OK`). The same three-file change was promoted into retail `main`: `src/barn_state_copy.cc`, the precisely split `asm/code_linkonce.s` span, and the `fomt.lds` placement for `.text.save_barn_copy` and `.text.after_save_barn_copy`. The **production** forced `make -B -j4 compare` also passed (Ches `sh_mv2ttfmz_7d3abce8`, exit 0; retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`). Symbol verification confirms the new C++ function and original `func_080D657C` alias both at `0x080D657C`, while `func_080D66A4` remains at `0x080D66A4`.

Updated inventory: **90,940 / 940,036 = 9.6741%** matching game C++; **849,096 bytes / 1,947 linked assembly functions** remain, including 846,060 inferred function bytes and 3,036 unattributed bytes. Meaningful ROM **166,890 / 7,717,440 = 2.1625%**. Inspector self-test passed; readability audit covers 148 C++ units / 20,543 lines. Neither is a substitute for a backed-up real player SRAM/emulator load test.

## Next: Coop and parent ownership

`func_080D66A4` Coop copy is still ASM. Naturally typed candidates `coop-v1..v6.cc` live in the same ext4 scratch directory; v1 = 0x118 vs 0x124 expected, v2 = 0x124 and 40 differences, v3/v4 = 0x124 and 35 differences. Bounded declaration-order probes v5/v6 were worse: 0x128 bytes and 104/109 differing linked bytes respectively. That declaration-order family is closed until new evidence exists. A separately tested actual C++ member `Coop::operator=` version (`coop-member-v1`, October 11, detached worktree) also compiled to 0x124 bytes / 35 differences, identical to the natural free-function version; changing the wrapper to a member does not solve the register allocation. The remaining v3/v4 mismatch is chiefly register allocation (`r4` vs `r5`) rather than demonstrated missing state-copy behavior; do not promote a nonmatching version or brute-force compiler tricks.

Farmer `func_080D68C0` has subsequently been replaced with matching 448-byte C++ ([proof](SAVE_FARMER_STATE_COPY.md)); its nested Rucksack `func_080D6A80` remains ASM. Continue with Coop, Rucksack, MoneyState `func_080D6B40`, and the larger `func_080D4178` GameState assignment, then `func_08011650` loader and save-menu/error paths. The custom-game worktree is excluded from this retail integration. At the time of the initial proof, this integration was uncommitted; check Git for any subsequent publication.
