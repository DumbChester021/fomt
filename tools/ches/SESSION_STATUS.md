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


## Research continuation after 5ff335f: 83B2C auto_ptr ABI

Scratch-only work advanced the 83B2C model without modifying production source.

Best structural candidate remains `83b2c-v7`:
- exact 24-byte frame and saved `r4-r7` set;
- exact status-0 direct continuation move;
- exact 16-byte request allocation shape;
- exact `sp+4 = 0` move-argument slot;
- exact owned request at `sp+0`;
- exact status-1 proxy positions `sp+8/+0xC`;
- exact fallback proxy positions `sp+0x10/+0x14`.
Its remaining large difference is that GCC tail-merges the two identical ownership-result cleanup blocks, while retail keeps one cleanup copy inside each branch.

New authoritative evidence: `tools/libagbc++/memory` is the bundled 1997 SGI STL implementation and explicitly defines `auto_ptr`. `tools/libagbc++/stl_config.h` enables `__SGI_STL_USE_AUTO_PTR_CONVERSIONS`. Therefore this ABI should be reconstructed from the real library rather than by inventing a project-wide SmartPtr change.

A minimal retail oracle was identified: `func_080DB320` (0x080DB320..0x080DB36C) in `asm/code_linkonce.s`. It is effectively one 83B2C wrapper branch:
- 16-byte stack frame;
- incoming continuation moved through `sp+4`;
- 12-byte concrete allocation;
- owned return temporary at `sp+0`;
- two-word return proxy at `sp+8/+0xC`;
- source cleared before virtual-delete destructor;
- caller result written from the moved pointer.

Scratch DB320 results:
- `db320-v1`: direct base-typed auto_ptr-style return collapses by RVO to 0x34 vs retail 0x4C.
- `db320-v2`: concrete local -> base return reached the expected cross-type conversion point but old GCC rejected the final rvalue copy.
- `db320-v3`: custom conversion model became ambiguous.
- `db320-v4`: using the actual bundled `<memory>` confirms the same ambiguity: both the templated cross-type constructor and conversion operator are viable for `auto_ptr<ConcreteSceneDB320> -> auto_ptr<AScene>`.

Exact next action: solve the DB320 oracle first using the real SGI `auto_ptr` API and an original-source expression that disambiguates the concrete-to-base transfer naturally. Do not alter `tools/libagbc++/memory` or production `SmartPtr`. Candidate directions should be source-level only, such as an explicit intermediate conversion form that selects one SGI auto_ptr path. Once DB320 reaches 0x4C / 0, port that exact expression/type relationship back to 83B2C. Avoid artificial volatile/register barriers.
