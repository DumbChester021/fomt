# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Scenes: complex Run 92604

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Run `git log -1` and `git status` before new work. Preserve unrelated changes.

New exact source this checkpoint: `func_08092604`, 60 linked retail bytes.
Scratch `scene-complex-runs-2026-10-09/92604-v5` is 0x3C / 0 differences.
Production forced full-ROM comparison passes with `fomt.gba: OK`.

Current metrics:
- Code: 81,488 / 940,036 = 8.6686%.
- Assembly: 858,548 bytes; 2,132 linked functions.
- Inferred ranges: 855,852 / 858,548 = 99.6860%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 157,218 / 7,717,440 = 2.0372%.

The shared scene lifetime layer now owns 72 source functions / 3,748 bytes:
24 constructors, 25 destructors and 23 Run entries.

## New proven technique: old transfer proxy

Retail `92604` is not represented correctly by a plain local SmartPtr because the
project SmartPtr intentionally lacks the original rvalue transfer proxy.

Exact model:
1. controller helper writes a one-pointer owned result into caller-provided stack storage;
2. a two-word transfer proxy stores the source temporary address and moved request;
3. proxy construction clears the source;
4. the moved pointer is kept in a local and written to the outer result;
5. the now-cleared source temporary runs its normal virtual-delete destructor.

This naturally emits retail's 12-byte frame and `sp+4` / `sp+8` proxy stores.
Do not modify SmartPtr globally just to model this ABI.

## Exact next action: continue 83B2C from v2

Target `func_08083B2C` is 0xA8 bytes.
Behavior is established:
- controller status 0 moves the scene continuation directly to the result;
- status 1 allocates a 16-byte wrapper, moves the continuation, stores context +0x1C and flag 0;
- other status allocates the same wrapper with flag 1;
- both wrapper paths transfer ownership to the result and destroy the cleared owner temporary.

Scratch directory:
`tools/ches/checkpoints/scene-complex-runs-2026-10-09/`

Important candidates:
- `83b2c-v1b`: behavior-right but branches merged, 0x7C, 20-byte frame.
- `83b2c-v2`: best structural candidate, 0xAC. It restores the retail 24-byte frame and separate branch-local transfer proxies. Its wrong extra continuation object creates an additional destructor; keep the layout, replace that lifetime model.
- `83b2c-v3`: 0x90 scratch-only shortcut; rejected.
- `92604-v5`: exact transfer-proxy reference implementation.

Retail 83B2C stack shape to preserve:
- +0: shared owned wrapper temporary;
- +4: one-word compiler/transfer slot, but not a destructed continuation owner;
- status-1 proxy: +8 source, +0xC request;
- fallback proxy: +0x10 source, +0x14 request.

Do not force registers or change the compiler.

## Remaining scene frontier

- constructor `92570`: behavior-complete exact-size 0x54, parked at four r0/r1 bytes;
- Run `83B2C`: active next target;
- Run `881EC`: still assembly, audit after 83B2C if needed.

Stable evidence: docs/SCENES.md
ROM SHA1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963
No background executions remain.
