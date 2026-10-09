# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: extended constructors.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 81,428 / 940,036 = 8.6622%.
- Assembly: 858,608 bytes; 2,133 linked functions.
- Inferred function ranges: 855,912 / 858,608 = 99.6860%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 157,158 / 7,717,440 = 2.0364%.
- Free tail: 671,168 bytes.

## Verification

This checkpoint promotes three additional exact scene constructors:
- `func_0809A4D4`: 68 bytes, natural continuation/context/u8 shape, controller `func_08094AC0`, allocation 0x33E0.
- `func_08083A7C`: 112 bytes, natural continuation/context/u8 plus four u32 inputs, controller `func_080821D0`, allocation 0x48E8. The extra inputs map to owner +0x0C/+0x10/+0x14/+0x18 and context +0x1C.
- `func_08088168`: 68 bytes, natural continuation/context/u32 shape, controller `func_08085584`, allocation 0x43E0. The extra word maps to +0x0C and context to +0x10.

All three scratch candidates matched on the first natural source attempt. Production integration passes `make -B -j4 compare` with `fomt.gba: OK`. The regenerated inventory removes exactly three linked assembly functions.

`func_08092570` remains assembly. Its behavior-complete transfer-slot candidate is exact-size 0x54 and differs by only four linked bytes, all from r0/r1 choice in the final null continuation transfer. Variants v3-v7 preserve the same four-byte frontier. Do not force registers or change the compiler for it.

ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

Proofs:
- tools/ches/checkpoints/scene-large-constructors-2026-10-09/
- tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/
Stable evidence: docs/SCENES.md

## Next action

Continue with the smallest remaining complex scene Run, `func_08092604` (60 bytes). It calls controller helper `func_0809152C` into temporary result storage and transfers that request to the caller result. Reuse the already proven explicit aggregate-return/result-storage technique before trying broader source shapes.

Remaining scene assembly at this boundary: constructor `92570` plus complex Runs `83B2C`, `881EC`, and `92604`. Prior parked paths stay closed without new structural evidence. NEXT_AGENT_HANDOFF.md owns the full continuation.
