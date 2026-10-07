# FoMT Zero-Context Start Here

This file is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Read this in order

For normal retail decompilation work:

1. `AGENTS.md`
2. `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`
3. this file
4. `docs/DECOMP_PLAYBOOK.md`
5. `docs/DECOMP_PRIORITY_MAP.md`
6. `tools/ches/NEXT_AGENT_HANDOFF.md`
7. only the subsystem docs and checkpoint/failure ledgers named by the handoff

For compiler-sensitive work, search the relevant checkpoint registry and failure ledger before starting a new experiment family. Do not broadly reread historical checkpoints when the handoff already contains the needed current state.

## Active branch and build authority

- Retail-matching branch: **`main`**, tracking **`ches/main`**.
- Latest published exact code checkpoint: **`7900f82e7ba18688dd7705efc2b143d4bc89f42c`** (`decompile entity animation helpers`).
- Intentional QoL/content work stays isolated in the separate `custom-game` worktree/branch.
- Retail ROM SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**.
- Full validation gate: `make -B -j4 compare` -> **`fomt.gba: OK`**.
- Authoritative compiler path: `tools/install_agbcp.sh` plus `tools/agbcp_fomt_compat.patch`.

## Current exact reconstruction

Measured after the latest exact source batch:

- code: **71,948 / 940,036 = 7.6537%**
- assembly remaining: **868,088 bytes**
- remaining linked assembly functions: **2,334**
- inferred function ranges: **866,924 / 868,088 = 99.8659%**
- unattributed assembly: **1,164 bytes**
- explicitly parked functions in the generated inventory: **17**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **147,678 / 7,717,440 = 1.9136%**
- contiguous retail tail free space: **671,168 bytes = 655.44 KiB**

Run `make progress` after meaningful exact integrations and regenerate the inventory/queue when code ownership changes.

## Latest exact Entity38740-family work

The latest published batch moved the complete raw retail tail `0x0803A804..0x0803A8A4` into exact source as seven coherent helpers over the common owner with embedded `EntityEffect` / `SpriteAnimator`:

- `func_0803A804`: get animator step
- `func_0803A80C`: set animator step
- `func_0803A814`: `WillFinish()`
- `func_0803A820`: moving/timer predicate
- `func_0803A840`: effect update wrapper
- `func_0803A870`: animation-change/reset wrapper
- `func_0803A8A0`: return owning `GameObject *`

This batch added **160 exact source bytes** and preserved the retail ROM exactly.

Immediately preceding exact promotions include `func_0803A798`, `func_0803A350`, `func_0803A320`, and `func_0803A334`.

## Parked nearby compiler/codegen islands

Do not reopen these without genuinely new type, source-shape, or compiler evidence:

- `func_0803A394`: weighted entity-factory behavior/layout complete; bounded natural candidates do not reproduce retail codegen.
- `func_0803A180`: shared movement/state helper behavior complete; best natural candidate is 0x19C vs retail 0x1A0 and the remaining gap is allocator ownership.
- `func_08039F90`, `func_08039E98`, `func_08039708`, `func_0803955C`, `func_08039310`, `func_08039204`, controller `08038820` / `08038EE0`, and Ball mover `08038110` are also documented parked islands.
- The generated inventory is authoritative for the complete current parked set.

## Exact next action

Continue at the next coherent retail frontier beginning at **`0x0803A8A4`** in `asm/code_0803A8A4.s`.

Before writing candidates:

1. map exact named function boundaries and linked sizes from the current ELF/assembly;
2. map callers, callees, vtables, globals/tables, and likely class/TU ownership;
3. search existing project types and exact neighboring source for structural oracles;
4. group repeated methods/functions into a coherent family;
5. scratch-compare one natural representative first;
6. propagate a proven source shape to siblings and integrate only 0-diff source.

Do not go back to `3A180`, `3A394`, or other parked islands just because a raw queue score is high.

## Documentation ownership

- `START_HERE.md`: live dashboard and broad next direction.
- `tools/ches/NEXT_AGENT_HANDOFF.md`: exact continuation state and ordered next steps.
- `tools/ches/SESSION_STATUS.md`: concise current snapshot and verification state.
- `docs/DECOMP_PLAYBOOK.md`: durable matching process.
- `docs/DECOMP_PRIORITY_MAP.md`: target-selection strategy.
- dedicated subsystem docs: stable recovered architecture.
- checkpoint directories, experiment registries, failure ledgers, and Git history: detailed chronology and rejected experiments.

Current-state files should stay concise. Do not append session-by-session history to them.
