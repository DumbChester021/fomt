# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes, complex Run 881EC.
Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Starting checkpoint: 8174a61;
run `git log -1` and `git status` for the completed checkpoint's identity.

## Exact progress

- Code: **81,848 / 940,036 = 8.7069%**.
- Assembly: **858,188 bytes; 2,130 linked functions**.
- Inferred ranges: **855,492 / 858,188 = 99.6858%**.
- Unattributed assembly: **2,696 bytes; 17 parked functions**.
- Data/assets: **75,334 / 6,777,404 = 1.1115%**.
- Overall meaningful ROM: **157,578 / 7,717,440 = 2.0418%**.
- Free tail: **671,168 bytes**.

## Verification

func_080881EC is exact source, 192 bytes / 0 differences.
Scratch v17, renamed production shape and full scene TU symbol slice match.
Fresh tracked compiler install plus isolated and production forced full-ROM
comparisons pass with `fomt.gba: OK`.
ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The 0x14 frame, both allocations, status/mode branches, original vtables,
nested transfer slots and cleared-inner-owner destructor match exactly.
All 25 scene destructor/Run vtable pairs remain correct. Inventory removes
only func_080881EC; all other assembly addresses/sizes are unchanged.

Scene lifetime source: 74 functions / 4,108 bytes:
24 constructors, 25 destructors, all 25 Runs.
Complete controller implementations and screen identities remain unresolved.

Proof root: tools/ches/checkpoints/scene-complex-runs-2026-10-09/.
See 881ec-isolated-proof.json, 881ec-production-proof.json and 881ec-checkpoint.md.
No build or compiler execution is pending.

## Remaining frontier and next action

Next: the bounded controller helpers 85EC4 (40 bytes) and 85EEC (28 bytes).
85EC4 returns min(10, unsigned argument / 25); 85EEC returns controller
+0x43D8 when <=1, otherwise 999. Audit that field's writers and controller
constructor 85584 before gameplay naming. Keep the large 86A08 separate.
NEXT_AGENT_HANDOFF.md owns exact bounds, commands and source hypotheses.

Constructor 92570 remains parked at 0x54 / four r0/r1 differences.
Whole-loader matching and other recorded compiler islands remain parked.
No compiler or global SmartPtr change was made.
Canonical detailed continuation: NEXT_AGENT_HANDOFF.md.
