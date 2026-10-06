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

The current exact C++ pass owns **188 retail bytes** across five methods:

- `BallEntity::BallEntity(GameObject*, Location&)` at `0x08038028`, **0x70 / 0 diff**. It initializes the base entity, stores the location back-reference, clears flight/activity state, seeds resource ID `0x31`, then queries selector `0x2B`. If that actor is on the same map and `func_08020460` reports its required state, the constructor seeds the Ball from that actor's Q16 position, animation ID, and facing through `func_08038374`.
- `BallEntity::Launch(u32)` at `0x080380EC`, exact **0x1A-byte body** plus the retail 2-byte alignment. It stores the launch state, initializes `flight_pos_q16 = 0x150000`, `flight_speed_q16 = 0x30000`, and sets `active`.
- `BallEntity::IsActive() const` at `0x08038108`, exact **0x06-byte body** plus 2-byte alignment.
- `BallEntity::GetBox() const` at `0x0803834C`, **0x20 / 0 diff**. It returns the 8x8 box centered on the Ball's integer x/y position.
- `BallEntity::GetFlightHeight() const` at `0x0803836C`, exact **0x06-byte body** plus 2-byte alignment; it returns `flight_pos_q16 >> 16`.

`#pragma interface` keeps the retail vtable in `asm/vtables.s`; `fomt.lds` exposes it as `__vt_10BallEntity` and preserves the legacy `func_08...` aliases for sourced methods.

## Existing semantic evidence

Selector `0x4B` is the thrown Ball world object. Player item-use code launches that selector for `ARTICLE_BALL`; adult-dog play/fetch code drives `func_08038374` / `func_08038398`; `func_08038398` maps dog animation plus facing into packed Ball animation IDs 21..48; and `func_0803853C` uses `resource_id` with the GameObject packed-animation provider. The large mover `func_08038110` uses the alternate terrain collision predicate that ignores descriptor bit 1 and has the already-documented three landing outcomes. See `docs/DECOMP_NOTES.md` and `docs/ASSET_DECOMPILATION.md` for the terrain and visual-family evidence.

## Remaining Ball frontier

The exact class anchors make the next coherent targets clear without reopening solved provenance:

1. retail destructor `0x08038098`, which writes the final `Location` through `location_ref` before normal `AEntity` teardown;
2. virtual wrappers `0x08038300` / `0x08038320` around the large mover and `vfunc_2C`;
3. +0x30 factory `0x08038334`, which allocates the separate 0x48-byte Ball visual/controller object constructed by `func_0803853C`;
4. `func_08038374`, `func_08038398`, `func_080384FC`, and the controller family beginning at `0x0803853C`;
5. the 0x1F0-byte flight/landing routine `func_08038110`, whose high-level terrain/dog-play semantics are already documented but whose exact C++ source has not yet been reconstructed.

Promote another coherent exact family before attempting the large movement routine if the smaller destructor/wrapper/controller methods match naturally.
