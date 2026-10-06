# Thrown Ball Entity

This document records the proven `AEntity`-derived thrown Ball object selected by GameObject selector `0x4B`. Its retail vtable is `vtable_unk_080E73B4`; source is now split between `include/entity_ball.hh` / `src/entity_ball.cc` and the remaining assembly in `asm/code_entities_08034CEC.s`. Existing dog-play, item-use, terrain, and packed-animation traces prove the gameplay identity. `ARTICLE_BALL` is article ID `0x35`; Ball field `+0x28` is a packed animation/resource ID, initially `0x31` (49), not an Article ID.

## Proven layout

`BallEntity` derives directly from `AEntity`. The exact constructor at `0x08038028` proves that its `Location&` argument is writable and borrowed: the base constructor receives the same reference and the object stores its address at +0x18. Retail destructor `0x08038098` later copies the Ball's final six-byte `Location` back through that pointer.

| Offset | Source field | Proven role |
| ---: | --- | --- |
| +0x18 | `Location * location_ref` | borrowed persistent location back-reference |
| +0x1C | `i32 flight_pos_q16` | Q16 flight/height accumulator |
| +0x20 | `i32 flight_speed_q16` | Q16 flight velocity/state |
| +0x24 | `u8 launch_state` | launch direction/state used by the movement routine |
| +0x25 | `u8 active` | active-flight flag |
| +0x26 | `u8 dog_play` | secondary dog-play state set by `func_08038374` |
| +0x28 | `u16 resource_id` | packed Ball animation/resource ID |

## Exact source-owned methods

The current exact C++ pass owns **396 retail bytes** across the Ball entity plus its first controller method:

- `BallEntity::BallEntity(GameObject*, Location&)` at `0x08038028`, **0x70 / 0 diff**. It initializes the base entity, stores the location back-reference, clears flight/activity state, seeds resource ID `0x31`, then queries selector `0x2B`. If that actor is on the same map and `func_08020460` reports its required state, the constructor seeds the Ball from that actor's Q16 position, animation ID, and facing through `func_08038374`.
- `BallEntity::~BallEntity()` at `0x08038098`, **0x54 / 0 diff**. It copies the final six-byte `Location` through `location_ref`, then performs normal `AEntity` / smart-pointer teardown.
- `BallEntity::Launch(u32)` at `0x080380EC`, exact **0x1A-byte body** plus retail alignment. It stores the launch state, initializes `flight_pos_q16 = 0x150000`, `flight_speed_q16 = 0x30000`, and sets `active`.
- `BallEntity::IsActive() const` at `0x08038108`, exact **0x06-byte body** plus alignment.
- `BallEntity::vfunc_18()` at `0x08038300`, **0x20 / 0 diff**. It updates the visual/controller when present, then calls `func_08038110`.
- `BallEntity::vfunc_2C(u32)` at `0x08038320`, **0x14 / 0 diff**. It runs `AEntity::vfunc_2C` and then `func_08038110`.
- `BallEntity::vfunc_30()` at `0x08038334`, exact **0x16-byte body** plus retail alignment. It allocates the separate **0x48-byte** `BallVisualController` and calls retail constructor `func_0803853C`.
- `BallEntity::GetBox() const` at `0x0803834C`, **0x20 / 0 diff**. It returns the 8x8 box centered on the Ball's integer x/y position.
- `BallEntity::GetFlightHeight() const` at `0x0803836C`, exact **0x06-byte body** plus alignment; it returns `flight_pos_q16 >> 16`.
- `BallVisualController::vfunc_0C()` at `0x08038580`, exact **0x2E-byte body** plus retail alignment. Natural source is simply `effect.Update()`.

`#pragma interface` keeps the retail vtables in `asm/vtables.s`; `fomt.lds` interleaves the exact source sections with the remaining assembly at retail addresses.

## Existing semantic evidence

Selector `0x4B` is the thrown Ball world object. Player item-use code launches that selector for `ARTICLE_BALL`; adult-dog play/fetch code drives `func_08038374` / `func_08038398`; `func_08038398` maps dog animation plus facing into packed Ball animation IDs 21..48; and `func_0803853C` uses `resource_id` with the GameObject packed-animation provider. The large mover `func_08038110` uses the alternate terrain collision predicate that ignores descriptor bit 1 and has the already-documented three landing outcomes. See `docs/DECOMP_NOTES.md` and `docs/ASSET_DECOMPILATION.md` for the terrain and visual-family evidence.

## Proven visual/controller layout and remaining frontier

The +0x30 factory allocates exactly **0x48 bytes**. Retail constructor `func_0803853C` writes the Ball owner at +0x00, the controller vtable at +0x04, and constructs one `EntityEffect` at +0x08. Because `EntityEffect` is 0x40 bytes, this exactly fills the object. Its controller fields therefore map naturally: `effect.active` at +0x44, refresh at +0x45, upload state at +0x46, and reset-update at +0x47. `vtable_unk_080E73E8` contains destructor `0x080DCE94`, update `0x08038580`, and render `0x080385B0`.

The constructor's first natural scratch model is **0x44 exact size / 8 differing linked bytes**. The only mismatch is four argument-setup instructions at `0x08038556..0x0803855C`: retail loads the GameObject argument before forming the destination/resource arguments, while the current natural source orders those loads differently. Treat this as one bounded source/codegen seam, not a reason for syntax roulette.

There is also a known shared-type debt: runtime layout shows the Ball controller uses the common 8-byte helper base, but current source types narrow `AEntity::unk_10` / `vfunc_30` to `UnknownEntityThing*` and the helper base owner to `AActorEntity*`. A trial global widening broke actor code that legitimately accesses `UnknownEntityThing`-specific fields, so it was reverted. The Ball factory currently uses a local cast while the ABI stays unchanged.

Continue this coherent family in this order:

1. inspect controller render `0x080385B0` and keep using the proven embedded-`EntityEffect` layout;
2. give constructor `0x0803853C` only bounded effort around the known four-instruction load-order delta;
3. inspect adjacent Ball helpers `0x08038374`, `0x08038398`, and `0x080384FC` for natural exact wins;
4. only then return to the 0x1F0-byte flight/landing routine `func_08038110`, whose terrain/dog-play semantics are already documented.

Do not reopen Ball identity, article/resource-ID provenance, or packed-animation mapping without genuinely new structural evidence.
