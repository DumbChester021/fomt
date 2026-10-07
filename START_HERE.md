# FoMT Zero-Context Start Here

This file is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Read this in order

1. `AGENTS.md`
2. `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`
3. this file
4. `docs/DECOMP_PLAYBOOK.md`
5. `docs/DECOMP_PRIORITY_MAP.md`
6. `tools/ches/NEXT_AGENT_HANDOFF.md`
7. only the subsystem docs and checkpoint/failure ledgers named by the handoff

Search the relevant experiment registry and failure ledger before a new compiler
or source-shape family. Older chronological next-action text is historical.

## Active branch and build authority

- Retail branch: **`main`**, tracking **`ches/main`**.
- Latest exact code checkpoint: **45dfb3f06eb800a152e967daa3f1a2a0efd2a561** (`decompile logical map resource resolver`).
- Custom behavior remains in the separate `custom-game` worktree/branch.
- Retail ROM SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**.
- Full gate: `make -B -j4 compare` -> **`fomt.gba: OK`**.
- Compiler authority: `tools/install_agbcp.sh` plus `tools/agbcp_fomt_compat.patch`.
- Function matching defaults to the installed tracked `tools/agbcc/bin/agbcp` wrapper.

## Current exact reconstruction

- code: **72,600 / 940,036 = 7.7231%**
- assembly remaining: **867,436 bytes**
- linked assembly functions: **2,333**
- inferred ranges: **866,272 / 867,436 = 99.8658%**
- unattributed assembly: **1,164 bytes**
- parked functions: **17**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **148,330 / 7,717,440 = 1.9220%**
- contiguous free tail: **671,168 bytes = 655.44 KiB**

Run `make progress` after exact integrations. Regenerate inventory/queue/class
maps when code ownership changes.

## Latest exact source

`GetMapResourceId` / `func_0803A8A4` is the complete **652-byte logical map
resolver** at `0x0803A8A4..0x0803AB30`. It maps logical locations onto 66 physical
MapData resources, selecting Winter variants, building upgrades and mine-floor
families. The original symbol and renderer caller remain byte-exact.

- source: `src/map_resource.cc`
- shared interface: `include/map_data.hh`
- architecture: [docs/MAP_DATA.md](docs/MAP_DATA.md)
- isolated fresh compiler + forced full ROM: PASS
- production forced full ROM, SHA1, symbol/input-hash checks: PASS
- inventory delta: only the resolver leaves assembly; other addresses/sizes unchanged

Earlier exact Entity38740-family helpers through `3A8A0`, including `3A798`,
`3A350` and `3A320/334`, remain complete. Do not replay their matching/integration.

## Exact next action

Recover the coherent **`0x0803AB30..0x0803AEA0` resource-owner family** in
`asm/code_0803A8A4.s`. Its constructor, destructor, update and entity forwarding
helper total 880 bounded assembly bytes. The current handoff and saved
`next-family-selection.json` own exact targets and source/type anchors.

Recover provider/descriptor contracts first, then scratch-prove the bounded
`0803AC78` destructor as an ownership/ABI oracle. Reuse the proven model across
siblings; integrate only exact source and publish each verified checkpoint.

## Parked work

Do not reopen `3A180`, `3A394`, `39F90`, `39E98`, the Ball mover, legacy save/UI
islands or other generated `PARKED` entries without new structural evidence.
A high raw queue score does not override a parked status.

## Documentation ownership

- `START_HERE.md`: live dashboard and broad direction.
- `tools/ches/NEXT_AGENT_HANDOFF.md`: exact continuation.
- `tools/ches/SESSION_STATUS.md`: concise current verification state.
- `docs/DECOMP_PLAYBOOK.md`: durable workflow.
- `docs/DECOMP_PRIORITY_MAP.md`: target strategy.
- subsystem docs: stable architecture.
- dated checkpoints, experiment/failure ledgers and Git: detailed history.

Keep current-state files concise; preserve chronology in the dated checkpoints.
