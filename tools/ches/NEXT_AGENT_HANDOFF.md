# Current FoMT continuation - October 7, 2026

## Read-first orientation and verified publication

Workspace: /mnt/data/Github/gba/fomt. Retail branch: main, tracking ches/main.
Latest verified code commit: 98c6cd1e203ccc781e4f1a2669cb56a2477c5df5
(decompile fishing records and recover persistent layout), pushed and verified.
A later docs-only commit may be HEAD. Read git status and git log before work;
never reset another session's changes to match an expected hash.

Read AGENTS.md, the decompilation skill, START_HERE.md, then the playbook section
"Recover persistent subobjects without blocking on the whole loader" and the
current priority map. Continue here with docs/SAVE_FORMAT.md,
docs/FISHING_RECORDS.md and the named failure records. No chat history is needed.

The goal is whole-game exact decompilation with renewed save-structure recovery.
Three distinct states matter:

- Slot geometry/checksum/writer and the fishing subobject are recovered.
- A complete typed GameState and exact legacy loader remain unfinished.
- The custom extension format is deferred design, not implemented behavior.

This handoff refresh changes documentation only. It does not claim another
code gain or new mine-floor experiment. There is no outstanding build, provider
request or unknown mutation to resume.

## Completed fishing-record unit

Retail main tracks ches/main. This unit began at
d9e95f5f4ebacc07d3b9f3aabae26f0809d63dd0; the verified code checkpoint is 98c6cd1e203ccc781e4f1a2669cb56a2477c5df5.

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
- No commands remain pending. Production execution sh_muy2r4k7_d5f6424d exited 0.

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

## First inspection and reproducible proof paths

Run from /mnt/data/Github/gba/fomt. Start with these read-only checks:

    git status --short --branch
    git log -3 --oneline
    git diff --check
    rg -n '0809CE8C|0809CF34|MineFloor|mine.floor' docs/DECOMP_NOTES.md docs/DECOMP_PLAYBOOK.md tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md

Before reading large checkpoint trees, use rg --files with relevant filenames,
then search only those paths. The older save-system offset map is evidence to
verify, not an authoritative completed type. Inspect the actual constructor
and consumers at the selected boundary.

The immediate next deliverable is a field-access map for the CE8C object:
offset, access width/mask, initializer value, readers/writers, evidence level.
Then decide whether a natural typed initializer/consumer cluster is ready.
If the old mine-floor source cannot share a type without broad changes, retain
its exact boundary and preserve the assessment rather than forcing a refactor.

For changed source, use tools/ches/compare-function.py with true symbol bounds,
then a complete block proof where applicable. Follow with isolated and production
make -B -j4 compare, ROM hash/size and neighboring-symbol checks.
Regenerate tools/ches/build_decomp_inventory.py and
tools/ches/map_npc_entity_classes.py after successful integration. Compare
inventories to ensure only intended functions changed ownership.
Do not rerun unchanged builds merely for this documentation refresh.

Local ignored checkpoints hold richer history:

- fishing-records-2026-10-07: typed candidate, whole-block proof, integration/
  publication records, inventory audit and all 59 record names/offsets.
- resource-owner-0803AB30-2026-10-07: prior exact owner boundaries and parked work.
- save-loader-08011650-2026-10-04: authoritative closed loader probes/oracles.
- save-system-research-2026-10-05: broader offset map with mixed evidence levels.
- call238/EXPERIMENT_INDEX.md and FAILURES_AND_CLOSED_PATHS.md: lookup/closed paths.

These are under tools/ches/checkpoints/ and are ignored, not published artifacts.
On a fresh clone, their absence is not a clean slate or permission to repeat
closed work. Use the tracked source, this handoff and playbook; reacquire missing
research before any experiment that depends on it. Recreate temporary checkouts
with the tracked installer if needed. Never replay old integration/promote
scripts or prior execution IDs.

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
