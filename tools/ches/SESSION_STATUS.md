# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: cleanup and continuation transfer.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 80,100 / 940,036 = 8.5210%.
- Assembly: 859,936 bytes; 2,157 linked functions.
- Inferred function ranges: 857,240 / 859,936 = 99.6865%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 155,830 / 7,717,440 = 2.0192%.
- Free tail: 671,168 bytes.

## Verification

`src/scene_owners.cc` adds 47 exact functions / 2,360 linked bytes: 25 natural destructors and 22 controller/continuation Run entries. Individual comparisons, original symbol sizes/addresses, all 25 vtable slot pairs and bounded assembly inverse checks pass. Isolated and production forced full-ROM comparisons pass with the unchanged tracked compiler.

ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

The six Run seams expose 596 bytes of unchanged unnamed neighboring code. Those bytes remain assembly; inventory removes exactly the 47 promoted entries.

Proofs: tools/ches/checkpoints/scene-owners-2026-10-09/
Stable evidence: docs/SCENES.md

## Next action

Scenes: constructors and controller creation. Audit func_0807DD38 (48 bytes), its continuation input, controller allocation/constructor and factory callers before one natural candidate. SceneOwner7DD68's destructor and Run are now exact. Complete controller size is not the shared deletion-prefix size.

Three complex Runs and the larger scene-change constructor family remain assembly. Prior parked paths stay closed without new structural evidence. NEXT_AGENT_HANDOFF.md owns the full continuation.
