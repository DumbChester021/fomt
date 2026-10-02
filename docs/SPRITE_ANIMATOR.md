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

Because `SpriteAnimator::Update` depends on the FoMT compatibility compiler's pointer-only post-dead ordering behavior, exact validation must use the repository's tracked compatibility compiler path once that behavior is installed there.
