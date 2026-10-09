# FoMT Session Status

Latest verified unit: October 9, 2026, Scenes: constructors and controller creation.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 80,976 / 940,036 = 8.6141%.
- Assembly: 859,060 bytes; 2,139 linked functions.
- Inferred function ranges: 856,364 / 859,060 = 99.6862%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 156,706 / 7,717,440 = 2.0305%.
- Free tail: 671,168 bytes.

## Verification

18 natural scene constructors add 876 linked bytes: fifteen 48-byte entries and three 52-byte entries. Each allocates its audited controller, calls the original controller constructor and moves the incoming continuation into the owned scene field. Controller implementations remain assembly.

All 18 individual matches, both expanded forced full-ROM builds, symbol/vtable audits, all 65 source-owned scene spans and bounded assembly inverse checks pass. The inventory removes exactly these 18 entries; other addresses/statuses and the unattributed total are unchanged. The tracked compiler is unchanged.

ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

Proofs: tools/ches/checkpoints/scene-constructors-2026-10-09/
Stable evidence: docs/SCENES.md

## Next action

Scenes: constructors with additional inputs. Audit func_08057DD8 (68 bytes), its DB96C caller and controller 522F8. r3 is reduced to an unsigned byte before forwarding. Reuse the exact natural constructor and existing ownership types; compare 5CEB8 and 69E14 after the representative is proven.

Seven scene constructors and three complex Runs remain assembly. Prior parked paths stay closed without new structural evidence. NEXT_AGENT_HANDOFF.md owns the full continuation.
