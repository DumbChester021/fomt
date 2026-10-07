# Current FoMT continuation - October 7, 2026

## Completed fishing-record unit

Retail main tracks ches/main. This unit began at
d9e95f5f4ebacc07d3b9f3aabae26f0809d63dd0; git log -1 identifies its checkpoint.

Source: include/fishing_records.hh and src/fishing_records.cc.
Seams: asm/code_actor_0809BFE8.s and fomt.lds.
Stable architecture: docs/FISHING_RECORDS.md and docs/SAVE_FORMAT.md.

| Function | True body bounds | Exact bytes |
| --- | --- | ---: |
| InitFishingRecords | 0809CD78..0809CD96 | 30 |
| RecordFishingCatch | 0809CD98..0809CDCC | 52 |
| HasCaughtAllFish | 0809CDCC..0809CDEC | 32 |
| GetTotalFishCaught | 0809CDEC..0809CE1C | 48 |
| GetFishingCatchCount | 0809CE1C..0809CE24 | 8 |
| GetFishingMaxSize | 0809CE24..0809CE2E | 10 |
| GetFishKingSpriteId | 0809CE30..0809CE7A | 74 |
| GetFishingRecordName | 0809CE7C..0809CE8C | 16 |

All eight methods plus six bytes of normal alignment form the exact 276-byte
block. Initial v1 results counted three alignment gaps as size differences;
final-results.json proves their true bounds and the full block.

The old statistics label is now identified: 59 fishing records, each count u32
plus maximum size u32, at GameState+2C80 (size 0x1D8), ending at +2E58.
Indices 0..7 are non-fish catches; 8..52 ordinary fish; 53..58 Fish Kings.
Both the fishing-result caller and name table prove the role. No size unit is
claimed. The name table remains binary data.

Old DECOMP_NOTES claims that C6BC must be solved first are superseded.
A normal section seam permits this independent exact unit. The current tracked
compiler matches the natural CE30 switch without variants or compiler changes.

## Verification

- All target bodies and complete linked block PASS.
- Isolated and production forced full-ROM builds PASS.
- ROM 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
- Eight body sizes and twelve function/neighbor addresses PASS.
- Four integration input hashes saved in isolated/production-proof.json.
- Only eight intended inventory functions removed; other addresses/sizes unchanged.
- No commands remain pending. Production execution sh_muy2r4k7_d5f6424d exited0.

Code 73,556 /940,036 =7.8248%; assembly 866,480. Data 75,334 /6,777,404 =1.1115%.
Overall 149,286 /7,717,440 =1.9344%. Linked asm functions 2,321; inferred 865,316;
unattributed 1,164; parked 17; free tail 671,168.

Existing local ignored checkpoint:
tools/ches/checkpoints/fishing-records-2026-10-07/
contains source, comparison script/results, integration plan, complete build
logs, proofs, inventory audit and publication record.
Isolated worktree: /tmp/fomt-fishing-records-integration at the base commit with
the four contribution files applied. It uses the unchanged verified compiler
from /tmp/fomt-resource-owner-integration/tools/agbcc.

## Exact next action: adjacent mine-floor persistent layout

1. Read AGENTS, the decompilation skill, current dashboard/playbook/priority map.
2. Search saved failures/experiments for 0809CE8C, MineFloor, mine-floor and
   func_0809CF34 before creating a candidate.
3. Read src/mine_floor.cc, including its private MineFloor/MineTile types and
   unusual At() byte base. There is no include/mine_floor.hh.
4. Inspect asm/code_actor_0809BFE8.s at CE8C and downstream field accessors,
   plus the loader/new-game calls at GameState+2E58. The old map's 0x628 span
   reaches the cursed-tool state at +3480.
5. Initial read shows a word at +0, 28x28 two-byte tiles at +4, two bytes at
   +624/+625, and six individually cleared low bits at +626; do not assign
   meanings to these tail fields until consumers prove them.
6. Existing mine_floor.cc contains legacy fixed-register/inline-assembly code
   and a private incomplete type. Preserve its verified output; do not copy
   those techniques or force a shared-type refactor without exact evidence.
   Prefer a coherent typed initializer/consumer unit if naturally matchable.
7. If bounded effort finds only codegen obstacles, save/close it and assess a
   different persistent subobject. Do not reopen the whole loader by inertia.

No mine-floor candidate was created in this checkpoint.

## Preserved parked work

- Save loader 08011650: stock v96 740/495. Private distinct-zero proof is an
  oracle only. Nested ActorLocation six-byte-copy mechanism is CLOSED.
- Loader errors: failed/invalid length or checksum mismatch 0x10000, payload
  read 0x20000, stored checksum read 0x30000, OR low-level error. Failed payload I/O
  can overwrite initialized defaults; returned pointer is not a success flag.
- Resource-owner AB30 ctor 328 expected/316 actual/217 differences.
- Sibling B128 update 382/2; reversed addition operands, commutation identical.
- Both owner constructors remain assembly. Four owner methods were already
  integrated in d9e95f5; do not redo them.
- Other generator-marked parked functions need new structural evidence.
