# Current FoMT continuation - October 8, 2026

## Zero-context orientation

Workspace: /mnt/data/Github/gba/fomt
Retail branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty
state. No prior chat context is required.

Read in order:
1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. START_HERE.md
4. docs/DECOMP_PLAYBOOK.md, especially "Fast-path operating method"
5. docs/MINE_FLOOR.md
6. this handoff
7. named failure/experiment records only when reopening an old family

## Required execution style

Use the proven Opus/Astra fast path:
- trust the saved handoff;
- select one bounded coherent cluster;
- reuse recovered types/layouts/candidates;
- try one natural typed candidate quickly;
- classify first divergence before source variants;
- check true body/alignment/section boundaries before assuming code mismatch;
- exploit linker seams for exact islands;
- detached ROM -> production ROM -> inventory/docs -> publish;
- park compiler archaeology once behavior is understood.

Do not regress to broad rescans or syntax roulette.

## Current exact state

- Code: 74,428 / 940,036 = 7.9176%
- Assembly remaining: 865,608 bytes
- Linked assembly functions: 2,307
- Inferred ranges: 864,064 / 865,608 = 99.8216%
- Unattributed assembly: 1,544 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 150,158 / 7,717,440 = 1.9457%
- Free tail: 671,168 bytes
- Retail ROM: 8,388,608 bytes
- SHA1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963

The unattributed count rose by 380 bytes because exact boundaries exposed two
real unlabeled code islands; this is improved structural knowledge, not lost
progress.

## Completed MineFloor work

Persistent object: GameState+0x2E58, size 0x628.
Shared type: include/mine_floor.hh
Stable architecture: docs/MINE_FLOOR.md

Exact source owns 872 linked bytes:
- CE8C: 0xA8 / 0
- D8A0..D8E8 accessors: 0x48 / 0
- D9B4: 0x4C / 0
- DF2C..E0AC helpers: 0x180 / 0
- E0AC tile-resource lookup: true body 0x6A / 0; linked 0x6C with alignment
- E174..E1B4 progress getters: 0x40 / 0

Newest source files:
- src/mine_floor_tile_resource.cc
- src/mine_floor_progress_flags.cc

Both detached and production forced full-ROM compares pass.

## E0AC exact result

Retail E0AC returns at E116. E116..E118 is alignment. The inventory previously
extended its inferred range through E174 because the following code had no symbol.

E0AC semantics:
- locate MineTile at y*56 + 4 + x*2;
- read full u16 and extract low type nibble;
- types 0..4 return resource records:
  - 086DC3C4
  - 086DC3D0
  - 086DC3DC
  - 086DC3E8
  - 086DC3F4
- other types return null.

Matching path:
- v1 array/bitfield candidate: 32 diffs
- retail address/load shape: 6
- y-offset register r3: 4
- empty register barrier after y_offset -= y: 0 at true 0x6A body bound

Proofs:
tools/ches/checkpoints/mine-floor-2026-10-08/

## Progress getter result

E174, E184, E194, E1A4 each match 0x10 / 0, full E174..E1B4 block 0x40 / 0.
They return persistent bits 0, 10, 11 and 12.

## Newly exposed unlabeled code: NEXT TARGET

Exact seams reveal:

### Island A
0x0809E118..0x0809E174
Size: 0x5C = 92 bytes
Currently raw .byte code, no thumb_func_start/symbol.

### Island B
0x0809E1B4..0x0809E2D4
Size: 0x120 = 288 bytes
Currently raw .byte code, no function symbol.

Together: 380 bytes. These were previously counted inside inferred E0AC/E1A4
ranges, which is why unattributed assembly increased from 1,164 to 1,544.

Do not "fix" the inventory by merging them back into neighboring functions.
Recover their actual identities/bounds/semantics.

## Exact next action

Start with Island A E118..E174.

Fast path:
1. Disassemble only those 92 bytes as Thumb.
2. Search direct calls/branches/references to address E118, not broad repo scans.
3. Infer signature and behavior from register use plus nearby MineFloor helpers.
4. Give the candidate a local research identity if no retail symbol exists.
5. Try one natural typed implementation.
6. If exact, design a minimal seam/source identity without shifting retail
   addresses; then detached ROM -> production ROM -> inventory/docs.
7. If no caller/symbol can be proven, preserve the range as an explicitly
   bounded unlabeled code island and move to E1B4..E2D4.

Parked: D8E8, DA00, whole save loader, CF34 refactor, AB30/B128, 39E98,
39F90, 3A180, 3A394, Ball mover.

Do not reopen them without genuinely new evidence.
