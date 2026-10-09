# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: constructors with additional inputs.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 81,180 / 940,036 = 8.6358%.
- Assembly: 858,856 bytes; 2,136 linked functions.
- Inferred function ranges: 856,160 / 858,856 = 99.6861%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 156,910 / 7,717,440 = 2.0332%.
- Free tail: 671,168 bytes.

## Verification

Three natural 68-byte scene constructors add 204 linked bytes: `func_08057DD8`, `func_0805CEB8` and `func_08069E14`. Each takes the existing mutable continuation reference and opaque context plus a proven `u8`, allocates its audited controller, forwards context and that byte to the original controller constructor, and moves the continuation into the scene.

All three scratch comparisons are exact at 0x44 / 0 differences. The production integration preserves the original constructor entry aliases and scene vtables. A forced full-ROM build ends in `fomt.gba: OK`; the regenerated inventory removes exactly these three linked assembly functions and leaves the 2,696 unattributed bytes unchanged. The tracked compiler is unchanged.

ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

Proofs: tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/
Stable evidence: docs/SCENES.md

## Next action

Audit `func_0809A4D4` separately before assigning it to a constructor family. Trace its caller and controller constructor, establish its complete input list and allocation size, then try one natural typed constructor candidate. Do not assume it shares the recovered extra-`u8` shape merely because its body is near the scene family.

Four scene constructors remain assembly: 83A7C, 88168, 92570 and 9A4D4. The three complex Runs 83B2C, 881EC and 92604 also remain assembly. Prior parked paths stay closed without new structural evidence. NEXT_AGENT_HANDOFF.md owns the full continuation.
