# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Current state only. Chronology belongs in Git and dated checkpoints.

### Repository and authority

- Retail branch: **`main`**, tracking **`ches/main`**.
- Latest exact code checkpoint: **45dfb3f06eb800a152e967daa3f1a2a0efd2a561** (`decompile logical map resource resolver`).
- ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**.
- Compiler: unchanged tracked installer and thirteen-rule patch.
- Function matcher now defaults to the tracked compiler.
- Custom-game source/worktree and pre-existing documentation changes are preserved.

### Exact progress

- code: **72,600 / 940,036 = 7.7231%**
- assembly: **867,436 bytes**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **148,330 / 7,717,440 = 1.9220%**
- free tail: **671,168 bytes**

### Inventory

- linked asm functions: **2,333**
- inferred ranges: **866,272 / 867,436 = 99.8658%**
- unattributed bytes: **1,164**
- parked: **17**; runtime/library retained: **33**
- repeated shape clusters: **184**, members **864**
- exact normalized clusters: **176**
- sole removed asm function: `func_0803A8A4`
- all other addresses/sizes and regenerated NPC class-map outputs unchanged

### Latest exact source and proof

`GetMapResourceId` owns the 652-byte logical map resolver. Shared map interface,
renderer caller and source/assembly/linker seam are exact. Stable architecture:
`docs/MAP_DATA.md`.

Both isolated fresh-install and production forced full-ROM comparisons pass;
whole-ROM equality, six symbol addresses and contribution-file hashes pass.
`make progress` passes. Evidence: the map-resolver checkpoint's isolated and
production proof JSON, build/install logs and inventory audit.

### Current frontier

Resource-owner family **`0x0803AB30..0x0803AEA0`**, four functions / 880 bounded
bytes, all still assembly. Recover provider/descriptor types and destructor ABI
before a natural candidate. Current handoff and `next-family-selection.json`
own exact continuation. Other parked compiler/codegen islands stay parked.
