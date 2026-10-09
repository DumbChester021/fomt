# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: owned-polymorphic destructor family

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Run `git log -1` and `git status` before new work. Preserve unrelated changes.

New exact source: src/owned_polymorphic_dtors.cc, 39 original entries / 1,560 linked bytes.
Every 38-byte body plus two alignment bytes matches retail; isolated and production
forced ROM comparisons pass, original symbols remain at their retail addresses.
ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
No background executions remain. The tracked compiler/wrapper is unchanged.

Current metrics:
- Code: 77,740 / 940,036 = 8.2699%.
- Assembly: 862,296 bytes; 2,204 linked functions.
- Inferred function ranges: 860,196 / 862,296 = 99.7565%.
- Unattributed assembly: 2,100 bytes; 17 parked functions.
- Overall meaningful ROM: 153,470 / 7,717,440 = 1.9886%.

## Proven cleanup ABI

33 entries delete a pointer at +4 then forward mode to base func_0800080C.
DB2EC/DC21C/DC474 use +8 with the same base.
DC404/E41E8/E4210 use +4 and scene base func_080007EC.
The member virtual destructor receives mode 3; the base receives the original
incoming owner mode. Prefix views deliberately leave complete class identities
and concrete owned types unresolved. No extra derived-vtable store is present.

DB3DC's true range is DB3DC..DB404, 40 aligned bytes. Preserve the unnamed
DB404..DB630 neighbor (556 bytes) in assembly. Inventory originally swallowed
it into DB3DC; exposing it explains the larger unattributed total.

Local durable ignored proofs:
tools/ches/checkpoints/scene-change-2026-10-09/owned-dtors/
Contains candidate, audited manifest, per-symbol comparisons, complete aligned
span checks, integration inputs, both build logs and verification summaries.
The matcher `--symbol` excludes trailing alignment by ELF symbol size; use
the full correctly linked 40-byte span when checking a complete retail range.
Stable evidence: docs/POLYMORPHIC_OWNERS.md.

## Exact next action

Audit the repeated two-owned-member cleanup family beginning at func_080521BC
in asm/code_0803EE94.s. Current regenerated family: 25 functions / 1,600 bytes,
27 instructions each. Cluster IDs renumber after regeneration, so locate it
by representative symbol rather than assuming the previous shape number.

Representative 521BC..521FC is 64 bytes:
1. Save the original owner and incoming destructor mode.
2. Write vtable_unk_080E7934 into the owner.
3. Delete the nullable member at owner+8 using its vtable at object+0.
4. Delete the nullable member at owner+4 using its vtable at object+4.
5. Forward owner and original mode to func_080007EC.

The second owned object has a different polymorphic prefix. Do not call it
GameObject or AUnk_0800080C solely from similar delete code. Audit neighboring
constructors/factories, existing class interfaces and each member's vtable/
offset/base before writing one credible source candidate. Keep candidates in
an ignored checkpoint until exact; classify the first divergence instead of
looping spellings. A true old-ABI data-bearing virtual interface may explain
the +4 vtable, but verify it rather than assuming modern object layout.

Use existing compare-function.py and then the normal ladder:
isolated full-ROM -> production forced compare/progress -> symbol/inventory
audit -> canonical docs -> narrow reviewed commit/push to ches/main.

Reusable isolated worktree:
 /mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/flag-setters-20261009
Detached b11a48e baseline plus verified flag-setter and owned-destructor source,
assembly and linker inputs; compiler was freshly installed in the previous
checkpoint. Compare reviewed baseline inputs before reusing it. Do not reset
or overwrite unrelated changes. Old /tmp proof paths are absent.

## Larger scene-change family: preserved frontier

The 20-member family represented by func_08012BBC (12BBC..12C50 = 0x94)
allocates a 20-byte request, wraps/transfers it, replaces a pending request
and sets state. Proven owner prefix: +0x8C context, +0x9C state, +0xA4 pending;
owner itself is reached through caller+4. Do not substitute +0xA0 or assume
the whole serialized GameState type.

Request vtable E5E74: DC288 base destructor, DC244 factory through 11DC4.
Wrapper vtable E5E34: DC1A0 (now exact source) and DC158 transfer through 7DD38.
Candidate artifacts remain at tools/ches/checkpoints/scene-change-2026-10-09/:
- v1: 0xB4 vs 0x94 / 172 differences, extra moved-SmartPtr cleanup.
- v2: 0xA4 / 157 differences, wrong pending +0xA0.
- v3: corrected +0xA4, still 0xA4 / 157; aggregate/address lifetimes induce r8.
- natural request-dtor-v1: adds a derived-vtable rewrite absent from retail.
- explicit request-dtor-v2: exact 0x28, successfully generalized to all 39.

Do not redo these closed shapes, force registers, add empty asm barriers or
edit the compiler. Existing loader/C6BC/A1EA8/resource-owner/mine-floor/entity
parked work stays parked without materially new structural evidence.

## Historical orientation and prior bounded work

The following retained orientation belongs to older completed/parked units.
The current frontier and commands above take precedence over old next actions.

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

- Code: 77,740 / 940,036 = 8.2699%
- Assembly remaining: 862,296 bytes
- Linked assembly functions: 2,204
- Inferred ranges: 860,196 / 862,296 = 99.7565%
- Unattributed assembly: 2,100 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 153,470 / 7,717,440 = 1.9886%
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
