# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Scenes: complex Run 83B2C

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Run `git log -1` and `git status` before new work. Preserve unrelated changes.

New exact source this checkpoint:
- `func_08083B2C`: 168 linked retail bytes (0xA8), 0 differing bytes.
- Scratch proof: `tools/ches/checkpoints/scene-complex-runs-2026-10-09/83b2c-v12/`.
- Production-shaped proof: `tools/ches/checkpoints/scene-complex-runs-2026-10-09/83b2c-production-shape-v1/`.
- Forced `make -B -j4 compare` passes with `fomt.gba: OK`.

Current metrics:
- Code: 81,656 / 940,036 = 8.6865%.
- Assembly: 858,380 bytes; 2,131 linked functions.
- Inferred ranges: 855,684 / 858,380 = 99.6859%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 157,386 / 7,717,440 = 2.0394%.
- Free tail: 671,168 bytes.

The shared scene lifetime layer now owns 73 source functions / 3,916 linked bytes:
24 constructors, 25 destructors and 24 Run entries.

## 83B2C exact source contract

Controller: `func_08082CEC`.
Owner: `SceneOwner83AEC`.
Behavior:
- status 0 moves the existing continuation directly to the result;
- status 1 allocates a 16-byte request with context +0x1C and flag 0;
- all other statuses allocate the same request with flag 1;
- wrapper paths transfer ownership to the result and destroy the cleared branch-local owner.

Exact stack/lifetime shape:
- frame: 24 bytes, saved r4-r7;
- +0: shared owned request temporary;
- +4: one-word move-copy continuation slot;
- status-1 proxy: +8 source, +0x0C request;
- fallback proxy: +0x10 source, +0x14 request.

Critical source-shape lesson:
Do not return directly from the status-1/fallback branches. Each branch must assign the caller result, leave the branch so the local owner destructor runs there, then join at one final return. Direct branch returns cause GCC to tail-merge the cleanup blocks and miss retail.

Production uses a local one-word `SceneMovePtr83` view over the existing continuation field. This reconstructs the missing old move-copy semantics without changing project-wide `SmartPtr`. Keep that scope local until SmartPtr itself is reconstructed.

The bundled `tools/libagbc++/memory` is the 1997 SGI STL auto_ptr implementation and remains useful ABI evidence. Do not modify it to force matches.

## Remaining scene frontier

- `func_08092570`: behavior-complete, exact-size 0x54, parked at four r0/r1 linked bytes.
- `func_080881EC`: only remaining complex scene Run in assembly and the active next target.
- Controller constructors/controller internals remain assembly-bound as documented.

## Exact next action: audit 881EC

Audit `func_080881EC` from retail before writing source:
1. confirm true body boundary and controller return/status behavior;
2. map all request allocations, context +0x10 use, and extra owner state;
3. identify ownership temporaries/proxy stack slots;
4. try one natural typed candidate using the proven branch-local ownership transfer pattern from 83B2C;
5. compare with `tools/ches/compare-function.py`;
6. if exact, integrate, full-ROM gate, inventory/docs, commit/push.

Known semantic clue from prior scene mapping: 881EC selects direct continuation transfer or nested 16-/20-byte requests using context at +0x10 and additional state.

Do not force registers, add volatile barriers, or change the compiler.

Stable evidence: `docs/SCENES.md`
ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
No background executions remain.
