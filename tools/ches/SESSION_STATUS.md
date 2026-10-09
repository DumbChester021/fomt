# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: complex Run 92604.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 81,488 / 940,036 = 8.6686%.
- Assembly: 858,548 bytes; 2,132 linked functions.
- Inferred function ranges: 855,852 / 858,548 = 99.6860%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 157,218 / 7,717,440 = 2.0372%.
- Free tail: 671,168 bytes.

## Verification

`func_08092604` is exact source at 60 bytes / 0 differences. It calls controller helper `func_0809152C` through old aggregate-return storage, then transfers that temporary into the caller result.

The exact source requires an explicit old `auto_ptr_ref`-style transfer proxy:
- controller temporary owns one request pointer and has the normal virtual-delete destructor;
- proxy stores the source temporary address plus the moved request pointer;
- proxy construction clears the source before its destructor;
- carrying the moved pointer in a local while retaining the proxy object produces the exact retail `sp+4` / `sp+8` stores and 12-byte frame.

Scratch proof: `tools/ches/checkpoints/scene-complex-runs-2026-10-09/92604-v5/`, 0x3C / 0 differences.
Production `make -B -j4 compare` passes with `fomt.gba: OK`.

The shared scene lifetime layer now owns 72 source functions / 3,748 bytes: 24 constructors, 25 destructors and 23 Run entries.

`func_08083B2C` remains assembly:
- v1b captured behavior but merged both wrapper branches and used a 20-byte frame.
- v2 restored the retail 24-byte frame and separate branch-local proxy positions, but is 0xAC vs retail 0xA8 and carries an extra continuation-lifetime destructor.
- v3's scratch-only shortcut regressed to 0x90 and is rejected.
Do not promote or force registers. Reuse v2 as the structural starting point.

Constructor `func_08092570` remains parked at its prior exact-size 0x54 / four-byte r0-r1 codegen frontier. `func_080881EC` remains unaudited this turn.

ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

## Next action

Continue `func_08083B2C` from v2. Preserve:
- separate status==1 and fallback wrapper-construction branches;
- 24-byte frame;
- shared owned request at stack +0;
- branch-local transfer proxies at +8/+0xC and +0x10/+0x14;
- one-word slot at +4, but do not model it with a destructed continuation temporary.

If that remains compiler-shaped, audit `func_080881EC` next using the proven transfer-proxy technique.
