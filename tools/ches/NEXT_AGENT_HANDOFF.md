# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Scenes: cleanup and continuation transfer

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Run `git log -1` and `git status` before new work. Preserve unrelated changes.

New exact source: include/scene_owners.hh and src/scene_owners.cc.
25 natural destructors / 1,600 bytes plus 22 Run entries / 760 bytes:
47 functions / 2,360 linked bytes. All individual comparisons, retail entry
addresses/sizes and all 25 destructor/Run vtable slot pairs pass. Reversing
only the bounded assembly seams reproduces the previous assembly exactly.
Isolated and production forced full-ROM comparisons pass.
ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
No background executions remain. The tracked compiler/wrapper is unchanged.

Current metrics:
- Code: 80,100 / 940,036 = 8.5210%.
- Assembly: 859,936 bytes; 2,157 linked functions.
- Inferred function ranges: 857,240 / 859,936 = 99.6865%.
- Unattributed assembly: 2,696 bytes; 17 parked functions.
- Data/assets: 75,334 / 6,777,404 = 1.1115%.
- Overall meaningful ROM: 155,830 / 7,717,440 = 2.0192%.

## Proven scene ownership and ABI

AScene owner: +0 vtable, +4 owned controller, +8 owned continuation request.
The shared SceneController deletion prefix has data at +0 and its vtable at
+4 under old GCC; its complete concrete size/state is not reconstructed.
The continuation uses AUnk_0800080C with a +0 vtable.
Natural empty derived destructors match all 25 entries: install derived
vtable, delete continuation, delete controller, forward original owner mode
to the AScene base destructor. Member deletion mode is 3; base mode is not
replaced with 3. Existing vtables and aliases remain authoritative.

Six 52-byte Runs discard/destroy a controller-produced temporary request:
521FC, 57E5C, 5CF3C, 5E698, 5FD44, 9A558.
Sixteen 28-byte Runs call the controller for side effects.
All move-clear the owned continuation into the caller's one-pointer result
slot and return the result address. Explicit ABI helpers preserve hidden
result r0 / self r1, typed owner fields and normal SmartPtr::Move().

SceneOwner83AEC additionally has four words +0C..+18 and context +1C;
SceneOwner881AC has word +0C and context +10. Other declarations claim only
the proven common prefix. Stable layout/contract/table: docs/SCENES.md.
Use subsystem titles in updates. Concrete screen names remain unresolved.

Six true Run boundaries expose 596 untouched unnamed bytes:
69EB4..69F14 (96), 75678..756B0 (56), 7F60C..7F63C (48),
804E8..804F8 (16), 821A0..821D0 (48), 93AF0..93C3C (332).
Only true bodies were promoted. 93AD4 is the vtable Run, separated from its
destructor by the 12-byte 93AC8 helper; do not assume adjacency.

## Exact next action: Scenes, constructors and controller creation

Representative func_0807DD38..0807DD68 is 48 bytes. Its SceneOwner7DD68
destructor and Run now have exact typed source.
Audit the original constructor, factory DC158 and callers before writing:
- r0 is the scene; r1 is the one-pointer continuation input; r2 is context.
- It installs vtable E7C30, allocates a 0x710-byte controller and calls 7D194.
- It stores controller at +4 and transfer-clears continuation into +8.
- It returns the scene.

Try one credible natural scene constructor using the shared owner type,
SmartPtr transfer and an audited opaque-controller construction boundary.
The 8-byte controller deletion prefix is not the allocation size. Do not
invent a complete controller layout to express allocation.
Similar 48-byte constructors include 7EE14, 7F580, 8045C, 80D94, 81A40,
82114, 8AB38, 8C56C, 8ECD8, 90E54, 931B0 and 93A58. Audit each allocation,
callee ABI and extra fields before batching. No constructor candidate has
been attempted in this checkpoint.

Three complex Runs remain mapped assembly, not newly matched:
- 83B2C: status from 82CEC chooses direct continuation or 16-byte wrapper
  E7CF4 with context +1C and a status-derived boolean.
- 881EC: 86A08/85EEC status -1 chooses direct continuation; other statuses
  construct nested requests E5D94/E5C64 with context +10 and mode/state.
- 92604: controller 9152C produces a request, transferred with additional
  temporary lifetime machinery. Constructor 92570 already moves the incoming
  continuation into the controller before storing the moved-from input +8.

## Proofs and closed source shapes

Local ignored checkpoint:
tools/ches/checkpoints/scene-owners-2026-10-09/
manifest.json owns all 25 mappings, true Run bodies/sizes and source seams.
destructor-results.json: all 25 exact.
run-results.json: all 22 exact.
integration-inputs/ owns the four reviewed production inputs.
isolated-final-build.log and production-final-build.log: both exact retail ROMs.
verification.json and inventory-before/after.json own the final audit.

Closed attempts:
- Ordinary member Run return did not compile: SmartPtr's private unfinished
  copy constructor and nonconst-reference/rvalue diagnostics.
- Placement-new ABI result view added a null check on result: 521FC was
  56/22 versus 52, 7DDA8 was 32/20 versus 28.
- Direct one-pointer result storage removes that extra language operation;
  both representatives and all 22 batch entries match. Do not redo variants
  of the failed ordinary-return or placement-new spellings.

Use compare-function.py with the explicit tracked compiler, then isolated
full-ROM -> production forced compare/progress -> symbol/inventory audit ->
canonical docs -> narrow reviewed commit/push to ches/main.
Do not force registers, add empty asm barriers or modify the compiler.

Reusable isolated worktree:
 /mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/flag-setters-20261009
Detached b11a48e baseline plus verified flag setters, prior 39 single-owned
destructors and this scene unit. Compiler was freshly installed before these
integrations. Compare reviewed baseline inputs before reuse; do not reset or
overwrite unrelated changes.

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
