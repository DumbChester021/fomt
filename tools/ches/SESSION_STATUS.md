# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: complex Run 83B2C.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 81,656 / 940,036 = 8.6865%.
- Assembly: 858,380 bytes; 2,131 linked functions.
- Inferred function ranges: 855,684 / 858,380 = 99.6859%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 157,386 / 7,717,440 = 2.0394%.
- Free tail: 671,168 bytes.

## Verification

`func_08083B2C` is exact source at 168 bytes / 0 differences.

Proofs:
- `tools/ches/checkpoints/scene-complex-runs-2026-10-09/83b2c-v12/`
- `tools/ches/checkpoints/scene-complex-runs-2026-10-09/83b2c-production-shape-v1/`

Production `make -B -j4 compare` passes with `fomt.gba: OK`.

The exact source preserves:
- 24-byte frame and saved r4-r7;
- status-0 direct continuation move;
- 16-byte wrapper allocation;
- +4 move-copy slot;
- shared owned request at +0;
- branch-local transfer proxies at +8/+0x0C and +0x10/+0x14.

The decisive source-shape fix was branch lifetime, not compiler forcing: status-1 and fallback assign the outer result inside separate scopes, each local owner destructs before the common join, and the function returns only once after the branch chain. Direct branch returns let GCC tail-merge the cleanup and fail retail.

A local `SceneMovePtr83` view reconstructs the missing old auto_ptr-style moving copy for this Run without changing global `SmartPtr`.

The shared scene lifetime layer now owns 73 source functions / 3,916 bytes: 24 constructors, 25 destructors and 24 Run entries.

## Remaining frontier

- `func_08092570`: parked exact-size constructor frontier, 0x54 with four r0/r1 linked-byte differences.
- `func_080881EC`: only remaining complex scene Run in assembly; active next target.
- Controller internals remain assembly.

## Next action

Audit `func_080881EC` from retail. Recover its status branches, 16-/20-byte request layouts, owner context +0x10, extra state, and transfer-proxy stack layout. Start from one natural typed candidate using the proven branch-scope ownership pattern from 83B2C.

Do not change the compiler or force registers.

ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.
