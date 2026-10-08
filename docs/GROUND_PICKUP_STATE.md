# Ground pickup state

## Proven persistent layout

`GameState+0x34C8..+0x34D7` is a **0x10-byte GroundPickupState**. Its source type is `include/ground_pickup_state.hh`; exact functions are in `src/ground_pickup_state.cc`. The next separately initialized GameState object begins at +0x34D8.

- +0x00..+0x06: seven availability bytes, **56 bits** total.
- +0x07..+0x0C: fifteen consecutive packed three-bit durability counters, `durability_0` through `durability_14`.
- Remaining bytes are layout/alignment space, not independently named fields.

The exact old compiler naturally produces the retail initialization masks for `struct PACKED ALIGN(4)` with `u8 available[7]` and fifteen `u32 : 3` fields.

## Semantics and table

`func_080A1EA8` maps a table index and effective season to one of 56 availability bits. Seasonal pickup groups reuse the lower 36 positions; fixed high-index records 96..115 occupy bits 36..55. `func_080A1ED4` tests availability and `func_080A1C94` clears a consumed bit.

The table beginning at `gUnk_081043BC` contains **116 actual 12-byte records**, shaped as `u32 kind; u32 item_or_article_id; i16 x; i16 y`. The following bytes begin an unrelated `bad_alloc` string, not a 117th table record.

Records 96..110 additionally have packed durability counters (indices 0..14). Counters 0..12 reset to **6**, counters 13..14 reset to **1**. `func_080A1EF4` retrieves a counter and `func_080A1FC4` subtracts damage/consumption with clamping at zero. Records 111..115 use availability without a durability counter.

These represent persistent ground pickups and resource nodes, not general inventory quantities.

## Exact source proof

- `func_080A1A48`: no-op constructor, 4 linked bytes.
- `func_080A1A4C`: reset initializer, **236 bytes exact**.
- `func_080A1EF4`: packed-counter getter, **208 bytes exact**.
- `func_080A1FC4`: decrement-and-clamp, **584 bytes exact**.

**Total newly source-owned: 1,032 bytes**, via two linker/assembly source islands. The old compiler's natural packed-bitfield output reproduces the retail instruction bytes; linked jump-table addresses match at retail placement. Production `make compare` passed byte-for-byte at retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## Parked frontier and follow-on

`func_080A1EA8` is understood as the effective-season index mapper but remains assembly: bounded natural candidates retained source-shape differences. Do not repeat syntax roulette. Other related availability/spawn helpers remain in assembly, including A1ED4, A1C94, A1B38, A1CBC and A1D20.

The adjacent **GameState+0x34D8..+0x34DB** four-byte map-stamp mask is now structurally closed in exact source, and the +0x34DC 24-byte actor state is already source-owned as well.
