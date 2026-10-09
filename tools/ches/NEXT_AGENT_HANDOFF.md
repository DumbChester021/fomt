# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Scenes: constructors with additional inputs

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Run `git log -1` and `git status` before new work. Preserve unrelated changes.

New exact source: three 68-byte scene constructors in src/scene_owners.cc,
with typed u8 declarations in include/scene_owners.hh. func_08057DD8,
func_0805CEB8 and func_08069E14 add 204 linked retail bytes. All three natural
scratch candidates matched immediately at 0x44 / 0 differences. Production
integration preserves the old address aliases and existing scene vtables.
The forced full-ROM comparison passes and the regenerated inventory removes
exactly three linked assembly functions. The shared scene lifetime layer now
owns 68 source functions / 3,440 bytes: 21 constructors, 25 destructors and
22 Run entries.
ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
No background executions remain. The tracked compiler/wrapper is unchanged.

Current metrics:
- Code: 81,180 / 940,036 = 8.6358%.
- Assembly: 858,856 bytes; 2,136 linked functions.
- Inferred function ranges: 856,160 / 858,856 = 99.6861%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 156,910 / 7,717,440 = 2.0332%.

## Proven constructor contract

The first 18 recovered constructors take a mutable one-pointer continuation
reference and an opaque context pointer. The newest 57DD8, 5CEB8 and 69E14
constructors take the same pair plus an unsigned byte. Their factories load
that byte from request +0x0C, and the constructor zero-extends it before
forwarding it to the bound controller constructor. Do not rename the byte
until its gameplay meaning is proven. Every recovered constructor installs
its existing scene vtable, stores the returned controller at +4 and
moves/clears the continuation into +8. Complete controller types are not
invented.

The SceneController declaration is an 8-byte deletion prefix only: data +0,
vtable +4 under this compiler. Its concrete allocations range from 0x10C to
0x6430. Original controller constructor calls remain assembly-bound.
Do not replace those allocation sizes with sizeof(SceneController).

17 audited factories allocate a 12-byte scene. DC3A0 instead constructs
SceneOwner93A88 on the stack with a null continuation, calls its Run/accessor
and destroys it with mode 2. Both paths establish the same constructor ABI.
Do not assume every scene constructor is reached through a heap allocation.

The three 52-byte entries (5E624, 5FCD0, 854F4) use literal-pool allocation
constants. They match the same natural source as the fifteen immediate/shift
entries even though the normalized inventory groups differ.

The prior 25 natural destructors and 22 Run entries remain exact. Stable
ownership layout, all entry mappings and controller allocation table:
docs/SCENES.md. Concrete screen identities and controller behavior remain
unresolved; use subsystem titles rather than inventing screen names.

## Exact next action: audit scene constructor 9A4D4 separately

Do not assume func_0809A4D4 belongs to the recovered extra-u8 trio. Audit its
factory caller, controller constructor, allocation size and complete register
inputs first. Then write one natural typed constructor candidate using the
existing controller/continuation ownership layout and compare its true body.

The completed extra-u8 trio is:
- 57DD8: allocation 0x23A8, controller 522F8, factory DB96C.
- 5CEB8: allocation 0x14FC, controller 5806C, factory DBA4C.
- 69E14: allocation 0x164, controller 5FD78, factory DC50C.
All three are 68 bytes and matched naturally with a u8 third semantic input
after the continuation/context pair.

Four constructors remain assembly: 83A7C, 88168, 92570 and 9A4D4. The first
three have larger proven scene layouts and/or complex Run partners, so keep
them separate until their inputs are fully audited. The three complex Runs
83B2C, 881EC and 92604 also remain assembly, mapped in docs/SCENES.md. The
larger scene-change family stays bounded at its existing nonmatching frontier.

## Proofs and closed assumptions

Current ignored checkpoints:
tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/
- extra-input-v1.* plus 57dd8-v1/: first natural 57DD8 candidate, 0x44 / 0.
- 5ceb8.* plus 5ceb8-v1/: natural 5CEB8 candidate, 0x44 / 0.
- 69e14.* plus 69e14-v1/: natural 69E14 candidate, 0x44 / 0.
- The production integration needed old-address linker aliases for the emitted
  constructor manglings ending in PvUc. Read nm output instead of guessing.

tools/ches/checkpoints/scene-constructors-2026-10-09/
- manifest.json: prior 18 constructors, exact spans, allocation sizes and seams.
- constructor-results.json and constructors/: all 18 exact comparisons.
- caller-evidence.json: all 18 factories, including the stack temporary.
- integration-inputs/: reviewed prior production files.
- isolated-complete-build.log / production-complete-build.log: expanded ROM gates.

The first representative source compiled correctly. Its initial matcher call
guessed the wrong template mangling. The emitted constructor symbol is:
__15SceneOwner7DD68Rt8SmartPtr1Z13AUnk_0800080CPv
Read nm output rather than guessing old-GCC template symbols.
The initial caller audit assumed heap factories; DC3A0 disproves that
assumption. No source mismatch or compiler workaround was needed.

Previous Run proofs and closed ordinary-return/placement-new attempts:
tools/ches/checkpoints/scene-owners-2026-10-09/
The explicit result-storage helpers are already exact; do not redo those
failed spellings. The 596 bytes of unnamed Run neighbors remain unchanged
assembly and must not be claimed as source.

Use compare-function.py with the explicit tracked compiler, then isolated
full-ROM -> production forced compare/progress -> symbol/inventory audit ->
canonical docs -> narrow reviewed commit/push to ches/main.
Do not force registers, add empty asm barriers or modify the compiler.

Reusable isolated worktree:
 /mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/flag-setters-20261009
Detached b11a48e baseline plus verified flag setters, prior 39 single-owned
destructors, scene destructors/Runs and all 18 new constructors. The compiler
was freshly installed before those integrations. Compare reviewed build
inputs before reuse; do not reset or overwrite unrelated changes.

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
