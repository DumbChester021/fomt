# FoMT Session Status

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
The flag-setter checkpoint is published as 4881ff9. Follow the active scene-request continuation below; do not redo the completed proof or select shape0005 blindly.


## Active continuation - 2026-10-09 - scene request ownership

Exact flag-setter source is published as 4881ff9; both forced ROM builds pass.
The next shape0005 family contains 20 functions / 2,960 bytes. Its representative
12BBC proves owner+0x8C context, +0x9C state and +0xA4 pending request. Complete
owner identity and the other members still need verification.

Best bounded scene candidate: scene-change-v3.cc, 0xA4 vs 0x94 / 157 differences.
A related natural derived destructor emits 0x30 vs retail 0x28 because it rewrites
the vtable. Neither candidate is promoted. Local candidates and comparisons are
under tools/ches/checkpoints/scene-change-2026-10-09/.

Next: test the structured two-argument ABI helper for DB2EC, then use exact
siblings as a type/ownership oracle before returning to the larger constructors.
NEXT_AGENT_HANDOFF.md owns the complete findings, closed shapes and exact test.
No background executions remain.

## Authoritative current snapshot - October 9, 2026

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty state.

## Exact production progress

- Code: 76,180 / 940,036 = 8.1039%
- Assembly remaining: 863,856 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 151,910 / 7,717,440 = 1.9684%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,243
- Inferred function bytes: 862,312 / 863,856 = 99.8213%
- Unattributed assembly: 1,544 bytes
- Parked functions: 17
- Runtime/library functions: 33

The rise in unattributed assembly from 1,164 to 1,544 is intentional structural
progress, not regression: exact source boundaries exposed 380 bytes that were
previously hidden inside inferred neighboring function ranges.

## Latest verified integration

The mine-floor cluster now owns 872 exact linked source bytes:

- CE8C initializer: 0xA8 / 0
- D8A0..D8E8 accessor block: 0x48 / 0
- D9B4 content consumer: 0x4C / 0
- DF2C..E0AC helper block: 0x180 / 0
- E0AC tile-resource lookup: true body 0x6A / 0, linked span 0x6C with alignment
- E174..E1B4 progress-flag getter block: 0x40 / 0

Newest sources:
- src/mine_floor_tile_resource.cc
- src/mine_floor_progress_flags.cc

Shared layout remains include/mine_floor.hh.
Stable architecture is docs/MINE_FLOOR.md.

Both detached and production `make -B -j4 compare` pass. Retail ROM remains
8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## E0AC matching lesson

Inventory originally inferred E0AC through E174, but the real function returns
at E116 and has two alignment bytes through E118.

Natural typed switch:
- v1: 0x6A vs apparent 0x6C, 32 differences
- retail-style y*56+4 then x*2 + halfword load: 6 differences
- fixed y-offset r3: 4 differences
- existing-project-style empty register barrier after the subtraction:
  true body 0x6A / 0

The caller at 0x080A6AC8 passes the returned pointer to func_080AA540 while
rendering each mine tile. E0AC maps tile types 0..4 to resource records
086DC3C4, 086DC3D0, 086DC3DC, 086DC3E8 and 086DC3F4.

## Progress flag getters

E174/E184/E194/E1A4 matched on the first typed candidate. They expose persistent
MineFloor progress bits 0, 10, 11 and 12 respectively.

## Exposed unlabeled mine-floor code: bounded and parked

The two exact-seam islands remain separate structural ranges:

- E118..E174 = 0x5C bytes
- E1B4..E2D4 = 0x120 bytes

E118 is behavior-recovered as a two-field MineTile histogram helper. It counts
bits 4..9 and bits 10..15 into a caller-provided byte table. No direct BL or
literal Thumb-pointer reference exists. Candidates:
- v1 0x66 / 88 differing bytes
- v2 0x54 / 84 differing bytes

E1B4 is behavior-recovered as a location-dependent mine table-copy helper using
Farmer at context+0x1BD8, ActorLocation, D79C/D7D8 or D418/D470, and table
copies into destination byte offsets. No direct BL or literal Thumb-pointer
reference exists. Candidates:
- v1 0x118 / 211 differing bytes
- v2 0x114 / 214 differing bytes

The second E1B4 refinement regressed matching, so both islands are parked. Do
not merge them back into neighboring functions to manipulate inventory coverage.

Proofs: tools/ches/checkpoints/mine-floor-2026-10-08/

## Newly proven CursedToolState subobject

GameState+0x3480..+0x3493 is a typed 0x14-byte persistent object:
- active[6] at +0x00
- completed[6] at +0x06
- count[6] at +0x0C
- padding[2] at +0x12

Both GameState initialization paths call func_0809C144 at +0x3480. The next
independently initialized persistent block begins at +0x3494.

Shared type: include/cursed_tool_state.hh
Typed initializer: src/code_actor_0809BFE8.cc
C144 true body: 0x1A / 0 at C144..C15E
C15E..C160: alignment bytes
Detached and production forced full-ROM comparisons PASS.

Coverage metrics remain unchanged because C144 was already source-owned.

## Parked frontiers

D8E8 remains behavior-complete but source-shape parked:
- v1 0xC0 / 158 differences
- v2 0xB8 / 193
- v3 0xC2 / 182

DA00 remains behavior-mapped but source-shape parked:
- v1 0x534 vs retail 0x52C / 905 differences
- v2 0x534 / 883 differences

E118 and E1B4 are now also parked at the candidate frontiers above.

Do not resume these families without new structural/compiler evidence.

## Operating strategy

Keep using the Opus/Astra fast path in AGENTS.md and DECOMP_PLAYBOOK.md:
bounded cluster, reuse structure, natural candidate first, classify boundaries
before syntax changes, exploit linker seams, run detached+production ROM gates,
refresh docs once, publish, then move on.

## Exact next action

Assess GameState+0x3494..+0x34C4 as the next persistent subobject.

Known facts:
- both GameState initialization paths start at +0x3494;
- touched record starts are +0x3494, +0x34A4 and +0x34B4;
- record stride is 0x10;
- initializer clears the low nibble of the first byte with AND 0xF0;
- asm/code_linkonce.s copies exactly 0x30 bytes at +0x3494 via four 12-byte
  LDM/STM chunks, proving the object span is exactly +0x3494..+0x34C3;
- next independently accessed state starts at +0x34C4.

Result:
- +0x3494..+0x34C3 is exactly three 0x10-byte records;
- only init and whole-GameState copy are proven active accesses;
- no consumer reaches it through +0x3480 either;
- dormant func_0803A798/func_080DCFE0 code uses an analogous three-record
  0x10-stride format with a byte-0 low-nibble discriminator and fields at
  +4/+8/+0xA, but the factory has no retail xref, so identity is unproven.

Keep the save block opaque for now. Do not promote the dormant record format
without a real pointer link.

Live persistent state findings:

- +0x34C4 is an active boolean time/clock-advancement inhibit gate.
  func_080142F0 sets it; func_08014304 clears it; normal clock advancement
  requires it to be zero.
- +0x34C5 is a one-shot shipping-value modifier flag. func_0801140C applies
  ShippingBin shipped value once normally, applies it a second time when this
  flag is set, clears the flag, then resets ShippingBin value shipped. A
  shipping/statistics UI/event path sets the flag to 1. Stronger player-facing
  naming remains unresolved.
- +0x34C8..+0x34D7 is recovered as GroundPickupState:
  56 availability bits, fifteen three-bit durability fields, 116 real table
  records. A1A48/A1A4C/A1EF4/A1FC4 add 1,032 exact source bytes.
  Production retail-ROM comparison passes.
- A1EA8 effective-season mapper is source-shape parked; see
  docs/GROUND_PICKUP_STATE.md.

Exact next action: publish the NPC destructor-thunk checkpoint, then continue the repeated-small-function fast path; +0x34D8/+0x34DC are already source-owned and C6BC remains parked.
and the actor-state boundary at +0x34DC. Do not restart parked families.

No build or compiler process is currently running.
