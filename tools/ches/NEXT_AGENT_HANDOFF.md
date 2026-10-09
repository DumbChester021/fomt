# Current FoMT continuation - October 9, 2026

## Latest checkpoint - 2026-10-09 - four GameState flag setters

Current branch: main, tracking ches/main. Run `git log -1` and `git status` to obtain the exact published commit and confirm local/remote parity before new work.

Exact source: `src/game_state_flag_setters.cc`. Retail range `0x08010F24..0x08010F54` contains four 12-byte slots:
- `func_08010F24`: OR byte-0 mask 1;
- `func_08010F30`: OR byte-0 mask 2;
- `func_08010F3C`: OR byte-0 mask 4;
- `func_08010F48`: OR byte-0 mask 8.

Natural source `*state |= mask` compiles instruction-for-instruction to retail (10-byte body + 2-byte alignment per function). The four functions are live; callers pass the same state pointer. Keep the semantic name conservative until the owning byte/bitfield is structurally identified.

Verification:
- complete 48-byte block: expected 0x30, actual 0x30, zero differing linked bytes;
- fresh production `make -B -j4 compare progress`: PASS (October 9);
- fresh detached `make -B -j4 compare`: PASS with a fresh tracked compiler installation;
- detached proof worktree `/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/flag-setters-20261009`;
- durable local proofs/logs: `tools/ches/checkpoints/flag-setters-2026-10-09/`;
- retail SHA1 exact; inventory removes only the four promoted functions.

The former `/tmp` logs/worktree were absent after restart. Their old claims were reverified before publication; do not depend on those temporary paths.

Current exact metrics:
- code: 76,180 / 940,036 = 8.1039%;
- assembly remaining: 863,856 bytes;
- linked assembly functions: 2,243;
- inferred function bytes: 862,312 / 863,856 = 99.8213%;
- unattributed assembly: 1,544 bytes;
- overall meaningful ROM: 151,910 / 7,717,440 = 1.9684%.

EXACT NEXT ACTION:
1. Confirm published tree clean and `HEAD == ches/main`; do not redo this flag-setter proof.
2. Re-rank the regenerated repeated clusters. The large repeated allocator/constructor families (for example shape0005) are now candidates, but first verify shared semantics/type ownership before batching.
3. Prefer bounded coherent exact families over parked C6BC/compiler archaeology.
4. Use the same ladder: one natural candidate -> family proof -> production/detached ROM -> inventory/docs -> publish.

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

- Code: 76,180 / 940,036 = 8.1039%
- Assembly remaining: 863,856 bytes
- Linked assembly functions: 2,243
- Inferred ranges: 862,312 / 863,856 = 99.8213%
- Unattributed assembly: 1,544 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 151,910 / 7,717,440 = 1.9684%
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
- the GameState copy routine in asm/code_linkonce.s copies exactly 0x30 bytes
  from source+0x3494 to destination+0x3494 using four 12-byte LDM/STM chunks;
- therefore this persistent object is exactly +0x3494..+0x34C3, with no gap;
- the next independently accessed state begins at +0x34C4.

Result for +0x3494..+0x34C3:
- exact size is 0x30 = three 0x10-byte records;
- both GameState init paths clear only the low nibble of record byte 0;
- GameState copy preserves the full 0x30 bytes;
- no active runtime read/write xref to this GameState block was found, including
  no consumer reached via the preceding +0x3480 CursedToolState base;
- a dormant/unreferenced entity subsystem (func_0803A798 -> virtual
  func_080DCFE0) uses an analogous array of three 0x10-byte records whose byte-0
  low nibble is a 1..12 discriminator and whose writers fill +4, +8 and +0xA,
  but func_0803A798 itself has no retail branch/function-pointer xref, so this
  is structural analogy only, not identity proof.

Do not invent semantics or merge that dormant family into the save type without
a real pointer link.

Live +0x34C4 block result:

### GameState+0x34C4

This is an active one-byte boolean gate. func_080142F0 sets it to 1 and
func_08014304 clears it to 0. Existing clock/day-transition evidence shows the
normal clock increment path requires GameState+0x34C4 == 0, alongside other
map/gameplay predicates. Conservatively treat it as a time/clock-advancement
inhibit flag; do not assign a stronger retail name yet.

### GameState+0x34C5

This is an active one-shot shipping-value modifier flag. func_0801140C:
- obtains ShippingBin value shipped;
- applies that value through func_0809ABD8 once;
- if +0x34C5 != 0, applies the same shipped value through func_0809ABD8 a
  second time, then clears +0x34C5 to 0;
- resets ShippingBin value shipped.

A writer in asm/code_0803EE94.s sets +0x34C5 = 1 inside a shipping/statistics
UI/event path. The exact player-facing meaning of the bonus/modifier is not yet
proven, so keep the semantic name conservative.

### Recovered GroundPickupState

GameState+0x34C8..+0x34D7 is typed in include/ground_pickup_state.hh
and src/ground_pickup_state.cc. Seven availability bytes encode 56 ground
item presence bits; fifteen packed three-bit fields encode durability
(counters 0..12 default 6; 13..14 default 1). gUnk_081043BC holds
116 actual twelve-byte ground pickup records, followed by unrelated
bad_alloc string bytes.

Exactly integrated: A1A48 (4 linked), A1A4C (236), A1EF4 (208),
A1FC4 (584): **1,032 linked bytes**. Production make compare passes retail
SHA1. See docs/GROUND_PICKUP_STATE.md for semantics and exact proof.

A1EA8 is a behavior-understood effective-season index mapper but remains
assembly because bounded source candidates did not match. Do not resume
compiler syntax roulette. Other spawn helpers remain assembly.

### Completed adjacent state

GameState+0x34D8..+0x34DB is structurally closed: C4E4/C5EC and the full 14-bit map-stamp mask API are exact source. The actor state at +0x34DC is also source-owned. Continue from the current repeated-family task at the top; do not remap these completed blocks.
