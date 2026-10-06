# FoMT Zero-Context Start Here

This file is the live dashboard for the US **Harvest Moon: Friends of Mineral Town** matching decompilation.

## Read this in order

For decompilation work:

1. `AGENTS.md`
2. `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`
3. this file
4. `docs/DECOMP_PLAYBOOK.md`
5. `docs/DECOMP_PRIORITY_MAP.md`
6. `tools/ches/NEXT_AGENT_HANDOFF.md`
7. the current snapshot at the top of `tools/ches/SESSION_STATUS.md`
8. subsystem docs and experiment/failure ledgers referenced by the handoff

For compiler-sensitive work, search both:

- `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`
- `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`

before starting a new experiment family.

## Active branch and project tracks

The active public retail reconstruction branch is **`main`**.

The former `Live-temp` checkpoint line has been folded into `main` and retired. The older `ches-dev` branch remains historical evidence from the earlier exact-contribution workflow; it is no longer the active continuation branch.

Intentional gameplay/QoL/content changes remain isolated in the separate `custom-game` worktree/branch. Never mix custom behavior into the retail-matching `main` branch.

## Current verified retail state

Latest exact code checkpoint before this documentation/publication refresh: `bf45d1405c67000a7aa023726a885c6c87216dfd` (`decompile mode4 setup and effect helpers`).

Retail ROM:

- size: **8,388,608 bytes**
- SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**
- authoritative build gate: `make -B -j4 compare`
- latest full gate: **`fomt.gba: OK`**

Current exact reconstruction:

- code: **70,360 / 940,036 = 7.4848%**
- assembly remaining: **869,676 bytes**
- remaining linked assembly functions: **2,342**
- inferred function ranges: **868,512 / 869,676 = 99.8662%**
- unattributed assembly: **1,164 bytes**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **146,090 / 7,717,440 = 1.8930%**
- contiguous tail free space: **671,168 bytes = 655.44 KiB**

Use `make progress` after meaningful exact integrations.

## Latest completed exact family

The current Entity38740 neighborhood now includes exact source for the mapped five-mode strategy interface and its small helpers.

The most recent exact batch added **332 retail bytes**:

- `func_08039DA8`: 0x70 / 0
- `func_08039E18`: 0x70 / 0
- `func_08039A30`: 0x2C / 0
- `func_08039F50`: 0x40 / 0

The paired 0x70 setup methods prove the packed mode-4 state layout:

- low 16 bits: timer
- next 7 bits: sub-counter
- next bit: target kind
- top byte: facing timer

`func_08039A30` is the natural typed `UnknownEntityThing` factory. `func_08039F50` is the exact matching destructor for the adjacent effect-owner object.

Earlier exact helpers in this same strategy/controller run include `39134`, `391C0`, `391FC`, `39200`, `3930C`, `396F4`, `398A0`, `39A5C`, `39D4C`, `39D5C`, `39D98`, `39E88`, and `39E8C`.

## Exact next action

`func_080399C0` is now **scratch-exact and isolated-full-ROM proven**.

Saved exact candidate:

`tools/ches/checkpoints/entity-08038740-2026-10-06/candidate-dtor-399c0-v2.cc`

The key type correction is that owner +0x38..+0x48 is a five-element owning `SmartPtr` array, not a raw pointer array. Natural C++ member destruction generates the retail reverse-delete loop and its begin-null check exactly. The destructor body itself only saves `actor_34`, obtains the current `ActorLocation`, and writes it back to that actor.

Exact target proof: **0x70 / 0 differing linked bytes**.

Detached integration proof at `/tmp/fomt-399c0-integration` also passes `make -B -j4 compare` with **`fomt.gba: OK`** and SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. The linked seam is exact:

- `func_080398A4` at `0x080398A4`;
- `Entity398A4::~Entity398A4` at `0x080399C0`, size 0x70;
- `func_08039A30` at `0x08039A30`;
- generated `__vt_11Entity398A4` aliased to retail `0x080E74DC`.

**Next:** promote the already-proven three-file splice from the detached worktree into `main` (`src/entity_unk_08038740.cc`, `asm/code_entities_08034CEC.s`, `fomt.lds`), then run the production compare/SHA1/progress/inventory/diff/documentation gates and publish the exact checkpoint.

## Parked nearby frontiers

Do not reopen these without genuinely new type/compiler evidence:

- `func_08039E98`: exact-size 0xB8 / 109, behavior complete; real 8-byte `SpriteAnimation` temporary proven.
- `func_08039708`: exact-size 0x198 / 290, behavior complete.
- `func_0803955C`: best natural source 0x194 / 383; behavior complete.
- `func_08039310`: 0x248 / 505; behavior complete.
- `func_08039204`: 0x110 / 210; behavior complete.
- controller constructor `0x08038820`: exact-size 0x108 / 183.
- controller collection builder `0x08038EE0`: 0x1EC / 127.
- Ball mover `func_08038110`: behavior complete and parked.
- save loader `func_08011650`, `func_080455D8`, `func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and `func_08092940`: documented compiler-sensitive frontiers.

The failure ledger owns the reopen criteria.

## Throughput strategy

The project works coherent translation units, type/vtable families, and repeated machine-code clusters rather than fixed-size batches.

Rules:

- prefer natural source and existing project types;
- solve one repeated-family representative, then reuse it as an oracle;
- park codegen-only islands once game behavior is understood;
- production `src/` remains exact-only;
- regenerate `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md` after meaningful exact integrations;
- use runtime tracing for targeted evidence and bulk classification, not manual resource hunting;
- resolve assets through their consuming code instead of chasing anonymous IDs.

The packed item/UI bank currently has **416 / 493 semantically owned animations**, leaving 77 as a parked by-product lane.

## Authoritative compiler path

Use:

`tools/install_agbcp.sh`

Pinned compiler source:

`1caa6becde5e4676b59c31c74d68f45ced79557c`

Tracked compatibility patch:

`tools/agbcp_fomt_compat.patch`

Patch SHA-256:

`aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`

Do not copy arbitrary generated `tools/agbcc` directories between worktrees as build authority.

## Validation ladder

For an exact retail integration:

1. exact target comparison;
2. coupled function/TU checks;
3. integrate only the proven source/asm/linker seam;
4. `make -B -j4 compare`;
5. verify SHA1;
6. `make progress`;
7. regenerate inventory/queue if code ownership changed;
8. `git diff --check`;
9. update every canonical doc whose current truth changed;
10. commit and push the durable checkpoint to `ches/main`.

## Documentation ownership

- `README.md`: public project front door
- `START_HERE.md`: current live dashboard
- `docs/PROGRESS.md`: public current reconstruction metrics
- `docs/REPO_MAP.md`: repository/subsystem orientation
- `docs/DECOMP_PLAYBOOK.md`: durable matching workflow
- `docs/DECOMP_PRIORITY_MAP.md`: target-selection strategy
- `tools/ches/NEXT_AGENT_HANDOFF.md`: exact continuation/candidate state
- `tools/ches/SESSION_STATUS.md`: current snapshot plus chronology
- `EXPERIMENT_INDEX.md`: experiment lookup
- `FAILURES_AND_CLOSED_PATHS.md`: anti-rediscovery ledger
- stable subsystem `docs/*.md`: proven human-facing architecture

Historical sections remain useful evidence, but any old paragraph labeled current/active is superseded by this dashboard and the top of the canonical handoff/status files.
