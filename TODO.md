# FoMT TODO

Current authoritative dashboard: `START_HERE.md`. Exact continuation: `tools/ches/NEXT_AGENT_HANDOFF.md`.

## Active retail work (October 10, 2026)

- Current clean retail checkpoint is `38718be` (`main`, tracking `ches/main`); verified source checkpoint `1e522c9`. The latest matching ROM SHA1 is `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- The latest 18-function / 632-byte menu and ownership-helper batch is **already integrated**. Do not redo the prior resource-owner AC78/ACD8/AE58/B0A8 batch; those four methods are also exact source.
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
