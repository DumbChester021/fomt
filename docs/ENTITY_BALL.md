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

The current exact C++ pass owns **496 retail bytes** across the Ball entity and its controller-facing helpers:

- `BallEntity::BallEntity(GameObject*, Location&)` at `0x08038028`, **0x70 / 0 diff**.
- `BallEntity::~BallEntity()` at `0x08038098`, **0x54 / 0 diff**; it copies the final six-byte `Location` through `location_ref`.
- `BallEntity::Launch(u32)` at `0x080380EC`, exact **0x1A-byte body** plus retail alignment.
- `BallEntity::IsActive() const` at `0x08038108`, exact **0x06-byte body** plus alignment.
- `BallEntity::vfunc_18()` at `0x08038300`, **0x20 / 0 diff**; controller update then `func_08038110`.
- `BallEntity::vfunc_2C(u32)` at `0x08038320`, **0x14 / 0 diff**; base vfunc then `func_08038110`.
- `BallEntity::vfunc_30()` at `0x08038334`, exact **0x16-byte body** plus alignment; allocates the 0x48-byte `BallVisualController`.
- `BallEntity::GetBox() const` at `0x0803834C`, **0x20 / 0 diff**.
- `BallEntity::GetFlightHeight() const` at `0x0803836C`, exact **0x06-byte body** plus alignment.
- `func_08038374(BallEntity*, i32, i32, u32, u32)` at `0x08038374`, exact **0x22-byte body + 2-byte alignment**. It enters dog-play mode, stores Q16 x/y, and forwards dog animation/facing to `func_08038398`.
- `func_080384FC(BallEntity*)` at `0x080384FC`, exact **0x3E-byte body + 2-byte alignment**. It restores packed Ball resource `0x31`, resets the live controller effect animation/upload state when present, and clears dog-play mode.
- `BallVisualController::vfunc_0C()` at `0x08038580`, exact **0x2E-byte body** plus alignment; natural source is `effect.Update()`.

`#pragma interface` keeps the retail vtables in `asm/vtables.s`; `fomt.lds` interleaves the exact source sections with remaining assembly at retail addresses.

## Existing semantic evidence

Selector `0x4B` is the thrown Ball world object. Player item-use code launches that selector for `ARTICLE_BALL`; adult-dog play/fetch code drives `func_08038374` / `func_08038398`; `func_08038398` maps dog animation plus facing into packed Ball animation IDs 21..48; and `func_0803853C` uses `resource_id` with the GameObject packed-animation provider. The large mover `func_08038110` uses the alternate terrain collision predicate that ignores descriptor bit 1 and has the already-documented landing outcomes. See `docs/DECOMP_NOTES.md` and `docs/ASSET_DECOMPILATION.md` for the terrain and visual-family evidence.

## Proven visual/controller layout and bounded seams

The +0x30 factory allocates exactly **0x48 bytes**. Retail constructor `func_0803853C` writes the Ball owner at +0x00, controller vtable at +0x04, and constructs one 0x40-byte `EntityEffect` at +0x08. `vtable_unk_080E73E8` contains destructor `0x080DCE94`, update `0x08038580`, and render `0x080385B0`.

Three remaining small/controller routines are structurally recovered but compiler-sensitive:

- `func_0803853C`: **0x44 exact size / 8 differing linked bytes**, all from four argument-setup instructions.
- `func_08038398`: explicit no-op `case 0x338` reproduces the retail 62-entry `0x338..0x375` sparse jump table; best natural source is **0x164 exact size / 21 differing linked bytes**, entirely the r5/r6 allocation swap for `self` and the new packed resource ID. A real-member probe gives the same result.
- `func_080385B0`: behavior-reconstructed renderer. Natural source reproduces camera-relative position, flight-height offset, dog-play depth bias, render-attribute gate, effect draw/upload, and ground shadow. Using the same explicit render/resource temporaries as the exact generic renderer improves it to **0x18C vs retail 0x190**; a real-member probe does not improve the remaining register/source-lifetime seam.

Do not syntax-roulette these three routines. The **0x1F0-byte `func_08038110` mover** has now also been behavior-reconstructed in scratch. The strongest natural source has the exact 68-byte retail frame, the historically proven `UnkMapBox(GetBox())` intermediate, correct airborne/landing control flow and full landing semantics, but compiles to 0x1C2 and never acquires retail's saved r8 lifetime. A terrain-pointer lifetime probe worsened to 0x1BE/483 differences and still did not use r8; matcher allocator output provided no further evidence. Park the mover with `tools/ches/checkpoints/ball-mover-2026-10-06/` and move on unless new structural/compiler evidence appears.
