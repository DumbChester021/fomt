# Sprite animation

## Overview

`SpriteAnimator` is a 0x14-byte animation cursor used by actor/entity rendering code. It owns a provider pointer, the current eight-byte animation descriptor, the current frame index, a Q8 frame timer, a signed playback step, and a one-shot changed flag.

The five recovered methods are the retail routines at `0x0805E824..0x0805E999`.

## Types

`SpriteAnimationFrame` is four bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `u16` | sprite ID |
| +0x02 | `u16` | frame duration |

`SpriteAnimation` is eight bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `SpriteAnimationFrame const *` | frame array |
| +0x04 | `u16` | frame count |
| +0x06 | `u16` | unresolved |

`SpriteAnimationProvider::GetAnimation(u32)` returns a `SpriteAnimation` by value.

`SpriteAnimator` is 0x14 bytes:

| Offset | Type | Meaning |
| --- | --- | --- |
| +0x00 | `SpriteAnimationProvider *` | animation provider |
| +0x04 | `SpriteAnimation` | current animation |
| +0x0C | `u16` | current frame index |
| +0x0E | `u16` | frame timer |
| +0x10 | `i16` | signed playback step |
| +0x12 | `bool` | one-shot changed flag |
| +0x13 | `u8` | padding |

The frame timer uses Q8 units: a frame duration is loaded as `duration << 8`, while each update subtracts the absolute value of `step`.

## Methods

### Constructor, `func_0805E824`

Stores the provider, requests the selected animation, starts at frame zero, loads the first frame duration into the Q8 timer, stores the playback step, and marks the animator changed.

### `Init`, `func_0805E850`

Replaces the provider and delegates the animation reset to `SetAnimation`.

### `SetAnimation`, `func_0805E860`

Requests a new animation from the current provider, resets the frame index and timer to the first frame, and sets the changed flag.

### `WillFinish`, `func_0805E894`

Predicts whether consuming the next playback step will run past the available frame range.

A zero playback step or zero timer cannot finish. When a frame boundary is crossed, zero-duration frames are skipped while walking in the current direction. Forward playback finishes when the index reaches the frame count; reverse playback finishes when the index would move before frame zero.

### `Update`, `func_0805E8F0`

Consumes the one-shot changed flag, advances the Q8 timer by the signed playback rate, skips exhausted or zero-duration frames, wraps the frame index when needed, and reports state changes as a bitmask.

Observed return bits:

| Value | Proven behavior |
| --- | --- |
| `0x1` | a frame boundary was processed |
| `0x2` | the visible sprite changed, including the one-shot animation-change latch |
| `0x4` | frame index wrapped at an animation boundary |

The comparison against the previous sprite ID means advancing to a different frame does not necessarily set `0x2` when both frames use the same sprite.

## Integration boundary

The source object occupies exactly 0x178 bytes in the retail build:

- `func_0805E824`: `0x0805E824..0x0805E84D`
- alignment: `0x0805E84E..0x0805E84F`
- `func_0805E850`: `0x0805E850..0x0805E85D`
- alignment: `0x0805E85E..0x0805E85F`
- `func_0805E860`: `0x0805E860..0x0805E893`
- `func_0805E894`: `0x0805E894..0x0805E8EF`
- `func_0805E8F0`: `0x0805E8F0..0x0805E999`
- alignment: `0x0805E99A..0x0805E99B`
- next assembly routine: `func_0805E99C`

The alignment halfwords are not animation logic and must not be recreated with fake source operations.

## Validation

The integrated class and its typed entity call sites must preserve the retail ROM SHA1:

`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

Because `SpriteAnimator::Update` depends on the FoMT compatibility compiler's pointer-only post-dead ordering behavior, exact validation must use the repository's tracked `tools/install_agbcp.sh` compatibility path. That behavior is already part of the current tracked patch and installer.


## Packed provider / item icon bank - October 5, 2026

The provider immediately before `SpriteAnimator` is now partly source-recovered.
`func_0805E6CC` parses seven sequential packed pools and `func_0805E760`
performs the exact animation lookup. For the item icon bank `gUnk_086678A0`,
the counts are **493, 500, 101, 1624, 342, 0, 532**.

The item-asset round trip now proves the important pool roles:
- pool 0: 493 animation-index entries `{u16 frame_count, u16 first_frame}`;
- pool 1: 500 16-byte sprite descriptors;
- pool 2: 101 eight-byte GBA OBJ/OAM layout records;
- pool 3: 4bpp OBJ tile graphics in 32-byte tile units;
- pool 4: 16-color BGR555 palettes in 32-byte units;
- pool 5: unused by this bank (count 0);
- pool 6: 532 `SpriteAnimationFrame {u16 sprite_id, u16 duration}` records.

Retail item icon IDs reach 492, and animation 492 reaches frame 531 and sprite
descriptor 499, so the top of the animation/frame/descriptor namespaces is
fully occupied. New unique item art requires extending the packed bank; existing
icon IDs may be reused or edited without changing the provider.

func_0805E790, the sprite-descriptor lookup, remains assembly at
0805E790..0805E81C, 140 linked bytes. Full linked comparison reproduces
34 middle evaluation/register-schedule differences. The older two-byte
symbol-size shortfall was ordinary alignment; an explicit-local rewrite
regressed. Further constructor/helper spellings reproduced or worsened the
same frontier. This target is parked until new structural evidence appears.

On October 9, 2026, the following two accessors became exact source in the provider unit:

| Method | Retail range | Return |
| --- | --- | --- |
| GetSpriteCount / func_0805E81C | 0805E81C..0805E820 | counts[1] |
| GetAnimationCount / func_0805E820 | 0805E820..0805E824 | counts[0] |

They own eight bytes in .text.sprite_animation_provider_counts, between the
assembly descriptor getter and exact SpriteAnimator. Both forced isolated and
production full-ROM comparisons pass. The inventory formerly included these
anonymous bytes in the getter range; that range now describes its true 140 bytes.

### Packed sprite descriptor return

The concrete getter uses a 16-byte pool 1 index record with four count/offset
pairs. Each returned span is eight bytes: pointer, u16 size/count, two padding
bytes. The complete returned value is 32 bytes, matching SpriteFrameData.

| Index fields | Pool | Offset unit | Returned u16 size |
| --- | --- | --- | --- |
| +0 count, +2 first part | 2 | eight-byte part records | part count |
| +4 count, +6 first tile | 3 | 32-byte tiles | count * 32, truncated to u16 |
| +8 count, +A first palette | 4 | 32-byte palettes | count * 32, truncated to u16 |
| +C count, +E first fourth-span record | 5 | eight-byte records | record count |

An out-of-range sprite ID clears all four pointers and size/count fields.
Span padding is not initialized. Pool 5 is unused by the item bank; its
transform interpretation remains a hypothesis.
This packed-provider layout does not resolve the shared post-getter memcpy
observed in resource owners and the livestock offer builder.

## Item icon PNG round trip - October 5, 2026

The packed item/UI sprite bank is now an active source-asset pipeline rather
than a view-only reverse-engineering result.

`tools/packed_sprite_bank.py` exports every retail Tool/Food/Article icon to an
indexed 4bpp-compatible PNG plus JSON metadata under `assets/item_icons/`.
Coverage is 81 Tool + 171 Food + 95 Article icons plus two semantically
recovered special/item-state animations: wrapped present at 352 and Basket at
53 = **349 editable PNG assets**.

All 349 promoted animations use one frame, one OBJ part and one 16-color
palette. Their PNGs rebuild the complete `0x30080`-byte packed bank
byte-for-byte. The
normal Makefile generates `build/assets/item_icon_bank.bin` from the manifest,
and `asm/data/data_0813B288.s` includes that generated bank. A forced
`make -B -j4 compare` preserves the retail ROM SHA1.

Retail sharing is preserved explicitly. The 347 icons use 347 unique sprite
descriptors but only 232 unique graphics spans and 302 unique palette spans.
The builder checks all shared bytes and rejects conflicting PNG edits instead of
using last-write-wins behavior.

Across the whole 493-animation bank, 450 animations already fit the simple
one-frame/one-part/one-palette exporter. The remaining 43 are multi-frame.
Their harder frames are ordinary multi-part OAM sprites, not a new compression
or color format: sampled descriptors partition the graphics blob exactly through
each part's OAM tile offset and shape.

The current project policy is **not** to export the remaining bank anonymously.
Of the 450 simple animations, **349 are now semantically owned and 101 remain
unowned**. Animation 53 is the Basket held-item icon proven by exact
`func_08092754`; animation 352 is the wrapped-present state icon proven by the
wrapping renderer/mutation paths.
For each non-item family, trace the runtime owner/consumer first, recover the
relevant provider/rendering types, then add the simple or multi-frame/multi-part
authoring support required by that coherent family.

Animation 352 is the first completed paired target. The Rucksack renderer and
held-item renderer replace the ordinary item icon with `0x160` whenever the
item's wrapped flag is set, while `func_08092CD0` calls the wrapping mutation
and redraws the chosen slot. The editable asset is
`assets/item_icons/special/wrapped_present.png`; it contributes 128 newly
owned graphics bytes and reuses an already-owned 32-byte palette.

The authoritative checkpoint is
`tools/ches/checkpoints/item-icon-assets-2026-10-05/README.md`.
