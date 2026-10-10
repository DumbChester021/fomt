# FoMT TODO

Current authoritative dashboard: `START_HERE.md`. Exact continuation: `tools/ches/NEXT_AGENT_HANDOFF.md`.

## Save-only priority — October 10, 2026

- **User-directed:** Complete the retail save system in natural, human-readable and byte-identical C++ before resuming custom-game modifications or unrelated decompilation clusters. Seven exact SRAM header methods / 472 bytes are integrated at `080002E0..080004C4`; see `src/save_slot_header.cc` and `docs/SAVE_LIFECYCLE.md`.
- Main blocked loader: `func_08011650` (740 bytes), where default GameState construction and matching compiler zero identities remain a source-shape frontier. Reuse `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md` and scratch v103; don't repeat 100+ compiler versions. Recover natural types for the other saved subobjects, then exact C++.
- Next save-lifecycle targets: SRAM read/write proxies `func_080006A4` and `func_080006E4`, scene save/load UI functions `func_08003F9C`, `func_080040A0`, `func_080041DC`, all slot selection/erase/copy/retry paths; emulator save/load tests of copied saves after matching source.
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
