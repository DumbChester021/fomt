# FoMT TODO

Current authoritative dashboard: `START_HERE.md`. Exact continuation: `tools/ches/NEXT_AGENT_HANDOFF.md`.

## Current save-system backlog — October 11, 2026

- Source-exact Farm 180B and Dog 132B copies are **done**; do not repeat. Read their proof docs.
- Decompile Farmer, MoneyState, Coop/Barn copy dependencies and the 776-byte GameState assignment, then the 740-byte save loader.
- Finish SRAM write/erase and GUI save/load/repair/error/retry paths; validate backed-up actual player save and error cases in emulator.
- Retain original retail SHA1. Live exact C++ **90,644/940,036 (9.6426%)**, 1,948 ASM functions; keep custom-game isolated.

## Historical save-only priority — October 10, 2026

- **User-directed:** Complete the retail save system in natural, human-readable and byte-identical C++ before resuming custom-game modifications or unrelated decompilation clusters. Seven exact SRAM header methods / 472 bytes are integrated at `080002E0..080004C4`; see `src/save_slot_header.cc` and `docs/SAVE_LIFECYCLE.md`.
- **New exact typed saved buffer:** `GameState+0x1CA0` now has six exact C++ methods / 84 bytes in `src/save_byte_buffer.cc` and `include/save_byte_buffer.hh`. Investigate its constructor `0800FF8C` and remaining handler `08010024` (append `0800FFF4` is now exact C++) using `docs/SAVED_BYTE_BUFFER.md`; initial typed constructor/append candidates are nonmatching, so do not force compiler codegen.
- **Latest save packed flag:** `func_08011458` is now natural byte-exact C++ (12 bytes) at its original entrypoint in `src/save_packed_flag.cc`; see `docs/SAVE_PACKED_PROGRESS.md`. Adjacent progress setters are **not** matched (best 5 and 3 byte differences); retain retail ASM and prioritize the large loader, not syntax roulette.
- **New matching saved transition state:** Eight typed methods / 120 bytes at `08011510..08011588` are now exact C++; see `src/save_transition_state.cc`, `include/save_transition_state.hh` and `docs/SAVE_TRANSITION_STATE.md`. A double-index sentinel 16 and daily countdown are proven for `GameState+0x2C74`; exact game-world meaning is not yet proven. Neighboring packed progress/flag helpers `080114C8/114F8` remain ASM after compiler-only deltas; do not force registers.
- **Typed full SRAM image and offline integrity checker now available:** `include/save_persisted_layout.hh` models 0x8000-byte binary geometry with forty-one old-compiler-compatible assertions, now embedding true MoneyState and Dog types, including the typed SRAM header; `tools/ches/inspect_sram.py` verifies length/checksum on read-only copies and passes synthetic tests. See `docs/SAVE_SERIALIZED_LAYOUT.md`. This is structural/tooling progress, not new source-exact ROM bytes or validated real game loading.
- **Save/header offline checks expanded:** `SaveSramHeaderLayout` now types the 32-byte signature, valid-mask and selected-slot fields with forty-one compile-time checks; the read-only inspector validates them along with slot length/checksums. Header and slot inconsistency fixtures passed. Save-menu write/load three-attempt retries and ownership branches are documented in `docs/SAVE_MENU_RETRY_TRACE.md` but remain ASM.
- **Save ownership traced:** `func_080D4480` is a conditional GameState cleanup, while `func_080D4178` copies persistent fields and nested objects. The successful load path cleans the old state in place, copies the new one into it, then frees the temporary. The destructor and both nested cleanup helpers now match in natural C++ (228 bytes total); the GameState copy/assignment still remains ASM. See `docs/GAME_STATE_SAVE_CLEANUP.md` and `docs/SAVE_MENU_RETRY_TRACE.md`.
- **Newest exact Dog assignment dependency:** `func_080D67C8` / `CopySavedDogState` now matches all 132 bytes using the real `Dog` and `Animal` members. The old compiler's implicit `Animal::operator=` symbol must remain generated; an explicit class declaration broke the full link and was reverted. See `src/dog_state_copy.cc`, `docs/SAVE_DOG_STATE_COPY.md`. The main 776-byte GameState copy remains ASM; typed nested `080D6B40` candidate is nonmatching research.
- **Latest typed save assignment graph:** Real `Farm`, `Farmer` and `FishingRecords` types now join MoneyState, Dog, SavedByteBuffer and SavedTransitionState in the binary layout. 41 compiler checks pass and the original 776-byte `func_080D4178` fieldwise copy is mapped in `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`; still ASM. Read-only fishing summary synthetic tests passed. The nested MoneyState copy placement-construction variants failed to match and are documented/closed in the current handoff.
- **Farm copy exact:** `src/farm_state_copy.cc` now owns `CopySavedFarmState` / `func_080D64C8` (180 byte-exact C++ bytes) with real Farm members and normal counted Horse placeholder copy. Standalone 0-byte-difference proof and full forced `make -B -j4 compare` passed (`sh_mv2sly7y_cf9bd46e`). See `docs/SAVE_FARM_STATE_COPY.md`. Next copy dependencies include Farmer, MoneyState, Coop/Barn; parent `080D4178` and loader remain ASM.
- Main blocked loader: `func_08011650` (740 bytes), where default GameState construction and matching compiler zero identities remain a source-shape frontier. Reuse `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md` and scratch v103; don't repeat 100+ compiler versions. Recover natural types for the other saved subobjects, then exact C++.
- Next save-lifecycle targets: the still-assembly anonymous 64-byte SRAM erase routine at `08000664` and **remaining** write proxy `func_080006A4` (read `func_080006E4` and error dispatcher `func_08000728` are exact source), scene save/load UI functions `func_08003F9C`, `func_080040A0`, `func_080041DC`, all slot selection/erase/copy/retry paths; emulator save/load tests of copied saves after matching source. Writer `write-v9.cc` is exact-sized natural source with only 4 differing linked bytes (swapped input registers); low-level `func_080D3800` is exact-sized with 2 register-order differences (`physical-write-v2.cc`). Preserve both rather than patch registers. Proofs: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/`.
- Previous general throughput menu/tree/ownership targets below are **deferred** until the save system reaches the completion gates in `docs/SAVE_LIFECYCLE.md`.

## Earlier retail work (superseded queue)

- Previously published exact source checkpoint: **`399882d`**. Current `main` HEAD and its tracked remote determine whether the latest callback batch is published. ROM SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- **Newest 2-function / 48-byte GameState audio/child callback batch is retail-exact**, with the natural sound-player query and one child callback, while the neighboring 16784 fade-out remains assembly. The preceding 13-function / 444-byte menu callback batch is also integrated. Prior dispatch and action batches are also exact (23 / 684 bytes and 18 / 560 bytes). Do not reopen the still-assembly `func_08014BD8` loop without new source-lifetime evidence; its best natural candidate is exact-size with five differing bytes.
- Only `func_0801412C` remains assembly in the recovered GameState/menu dispatch region. The neighboring `14164`, `14264`, and `14290` are already exact source. For `1412C`, natural v1 matches size 56 but has 14 differing linked bytes; v2 has 29. Seek new control-flow/ABI evidence or pivot rather than repeating syntax variants.
- Check `docs/GAME_STATE_MENU_CALLBACKS.md` for the recovered incubation and child callback ABI, saved scratch and deferred neighboring routines. Resume by re-ranking adjacent GameState/menu action wrappers using the new target, child callback and record layouts. Preserve the still-assembly `16CEC`, `16D48`, `16DB0`, `16EC4`, `16F60` routines. See `docs/GAME_STATE_MENU_ACTIONS.md`.
- Rank coherent high-payoff clusters using `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md`, tempered by the experiment/closed-path evidence. The leading 18-member ownership-transfer family (72 bytes each; exemplar `func_080DB394`) requires proof of the 16-byte smart-owner/move layout, allocator, and destructor ABI. Existing DB394 v1/v2 candidates are nonmatching; v1 mishandles ownership.
- The three 192-byte tree-insertion siblings `func_080E2294`, `func_080E27FC`, and `func_080E54F0` are the alternative. Rotations and the balancer are already exact. Preserve nonmatching E2294 scratch variants unless new allocator/lifetime evidence changes the hypothesis.
- Park compiler-sensitive work, including F060, E1C70, D6EAC/D6EEC, E3610/E375C, and the complete save loader, until new type/ABI evidence makes it productive.
- Integrate **only byte-exact** code, prove the full-ROM hash with `make -B -j4 compare`, regenerate inventory only after source ownership changes, and update the relevant canonical docs once per batch. See `tools/ches/NEXT_AGENT_HANDOFF.md` for exact bounds and proof paths.

## Do not reopen without new evidence

- `func_0803A394`
- `func_0803A180`
- `func_08039F90`
- `func_08039E98`
- `func_08039708`
- `func_0803955C`
- `func_08039310`
- `func_08039204`
- `func_08038820`
- `func_08038EE0`
- `func_08038110`
- resource-owner update `0803B128` (best historical linked comparison 382 bytes / 2 differences) and constructor `0803AB30` (316 bytes / 217 differences versus 328 expected); their exact neighbors have already been integrated
- other functions marked parked by `tools/ches/build_decomp_inventory.py`

## Ongoing project lanes

- Keep the machine-readable function/TU inventory and class maps current after meaningful integrations.
- Recover assets/data through their consuming code and count only editable byte-exact project-side representations.
- Keep runtime tracing as scripted bulk evidence infrastructure, not manual one-off exploration.
- Keep intentional gameplay/QoL changes isolated on the custom-game track.
- Resume persistence/save expansion only when a concrete custom runtime feature requires stored state.
