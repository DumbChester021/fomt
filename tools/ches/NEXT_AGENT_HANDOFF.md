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

## Exposed unlabeled mine-floor islands: PARKED

Exact seams still preserve these as separate raw Thumb ranges:

### Island A: E118..E174, 0x5C

Behavior is recovered as a MineFloor two-field histogram helper. It loops the
active width/height and increments a caller-provided byte count table once for
tile bits 4..9 and once for tile bits 10..15. This independently confirms both
six-bit tile fields are 0..63 content/state ids.

No direct BL or literal Thumb-pointer reference to E118/E119 exists in retail.
Bounded candidates:
- island-e118-v1.cc: 0x66 vs 0x5C, 88 differing bytes
- island-e118-v2.cc: 0x54, 84 differing bytes after the obvious
  register/address-shape rewrite

Parked because the mismatch remains broad register/control-flow source shape.

### Island B: E1B4..E2D4, 0x120

Behavior is recovered as a location-dependent mine table-copy helper. It takes
MineFloor, a destination byte buffer and context/state; obtains Farmer at
context+0x1BD8; reads ActorLocation; selects one of two mine namespaces; calls
D79C/D7D8 or D418/D470; then copies table-driven byte patterns into destination
offsets.

No direct BL or literal Thumb-pointer reference to E1B4/E1B5 exists in retail.
Bounded candidates:
- island-e1b4-v1.cc: 0x118 vs 0x120, 211 differing bytes
- island-e1b4-v2.cc: 0x114, 214 differing bytes after preserving the strongest
  retail register/lifetime clues

The second refinement did not improve matching, so park it. Do not merge either
island into E0AC/E1A4 merely to reduce unattributed assembly.

Proofs/candidates:
tools/ches/checkpoints/mine-floor-2026-10-08/

## Newly proven CursedToolState subobject

GameState+0x3480..+0x3493 is now a proven typed 0x14-byte persistent subobject:
- +0x00..+0x05 active/progression-enabled[6]
- +0x06..+0x0B completed/blessed[6]
- +0x0C..+0x11 count[6]
- +0x12..+0x13 alignment/padding

Both GameState initialization paths call func_0809C144 at +0x3480. The next
independently initialized block starts at +0x3494.

Shared type: include/cursed_tool_state.hh
Typed initializer: src/code_actor_0809BFE8.cc
func_0809C144 true body C144..C15E: 0x1A / 0
C15E..C160: function alignment
Detached and production full-ROM compares both PASS.

Code coverage metrics do not change because this helper was already source-owned.

## Exact next action

Assess the adjacent persistent block at GameState+0x3494..+0x34C4.

Known starting evidence:
- both GameState initialization paths begin at +0x3494;
- initializer touches three records at +0x3494, +0x34A4 and +0x34B4;
- stride is 0x10 bytes;
- each touched first byte is ANDed with 0xF0, clearing its low nibble;
- the next independently accessed state begins at +0x34C4.

Fast path:
1. map readers/writers of +0x3494/+0x34A4/+0x34B4 and their 0x10-byte records;
2. identify any existing helper/type family before inventing names;
3. build a checked field-access map and one natural typed candidate if coherent;
4. if exact, detached ROM -> production ROM -> docs/publish;
5. if compiler-sensitive after bounded work, save the frontier and move on.

Parked: E118 island, E1B4 island, D8E8, DA00, whole save loader, CF34 refactor,
AB30/B128, 39E98, 39F90, 3A180, 3A394, Ball mover.

Do not reopen parked families without genuinely new structural evidence.
