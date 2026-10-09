# FoMT Session Status

Latest verified unit: October 9, 2026, 39 owned-polymorphic destructor entries.

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Run `git log -1` and `git status` before work.

## Exact progress

- Code: 77,740 / 940,036 = 8.2699%.
- Assembly: 862,296 bytes; 2,204 linked functions.
- Inferred function ranges: 860,196 / 862,296 = 99.7565%.
- Unattributed assembly: 2,100 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 153,470 / 7,717,440 = 1.9886%.
- Free tail: 671,168 bytes.

## Verification

`src/owned_polymorphic_dtors.cc` adds 1,560 exact linked bytes. Every entry's 38-byte body and two alignment bytes match. All 39 original symbols retain their addresses. Isolated and production forced full-ROM comparisons pass with the unchanged tracked compiler.

ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
No background executions remain.

The DB3DC seam exposes 556 bytes of unchanged unnamed code at DB404..DB630; they remain assembly. Inventory removes only the 39 promoted functions.

Proofs: tools/ches/checkpoints/scene-change-2026-10-09/owned-dtors/
Stable evidence: docs/POLYMORPHIC_OWNERS.md

## Next action

Audit the 25-member two-owned-member cleanup family beginning at func_080521BC. Its +4 member uses a +4-vtable interface, unlike the recovered +0-vtable deletion prefix. Verify factories/layouts and one credible candidate before batching. Similarity IDs renumber after regeneration; use symbols.

The larger scene-change constructors and all prior parked paths remain bounded/closed as recorded in NEXT_AGENT_HANDOFF.md. That file owns the full continuation; this file is the concise verification snapshot.
