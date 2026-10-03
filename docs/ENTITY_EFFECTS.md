# Entity effects

`UnknownEntityThing` is the shared actor render/effect object declared in
`include/entity_effect.hh`. Its higher-level identity remains unresolved, so the
existing name is retained. It contains two complete effect objects rather than
two independent animation fields.

## Layout

The object is 0x8C bytes on the retail ABI.

| Offset | Type | Proven role |
| --- | --- | --- |
| +0x00 | `AActorEntity *` | borrowed owner |
| +0x04 | vtable pointer | inherited virtual interface |
| +0x08 | `EntityEffect` | primary actor effect |
| +0x48 | `EntityEffect` | secondary effect |
| +0x88 | `u8` | draw-mode selection |
| +0x89 | `i8` | additional renderer state |
| +0x8A | `EntityEffectState` | two-bit secondary mode and six-bit offset-table index |
| +0x8B | `u8` | primary attribute selection |

`EntityEffectState` occupies one byte. Its packed byte is used during
construction; its named bitfields are used during update and rendering.

Each `EntityEffect` occupies 0x40 bytes:

| Offset | Type | Proven role |
| --- | --- | --- |
| +0x00 | `EffectBase` | resource handle and graphics-part state, 0x28 bytes |
| +0x28 | `SpriteAnimator` | provider, animation, frame and timer state |
| +0x3C | `u8` | graphics refresh pending |
| +0x3D | `u8` | upload sprite parts on every graphics refresh |
| +0x3E | `u8` | sprite parts have been uploaded |
| +0x3F | `bool` | skip one animator update after a caller reset |

The two animators therefore begin at object +0x30 and +0x70. Existing actor
accesses now use the containing effect objects and preserve those offsets.

`EffectBase` holds a game-object pointer at +0x00, an eight-byte handle at +0x04,
two halfwords at +0x0C/+0x0E, a count at +0x10, sixteen byte values at +0x14, and
a vtable pointer at +0x24. The complete meanings of the handle's first word and
the two halfwords remain unresolved.

## Construction and updates

The constructor at `080324BC` passes one value to the primary effect; the
constructor at `08032560` passes a counted array. Both initialize the owner and
retail vtable. The primary animation resource is `owner->anim_id + owner->facing`
and its context comes from the game-object virtual call at +0x68.

Both constructors initialize the secondary effect from the game-object virtual
call at +0x6C, resource zero, and the fixed values 2 and 14. They clear +0x89 and
the low two bits of +0x8A, and retain caller-provided values for +0x88, the upper
six bits of +0x8A, and +0x8B.

`EntityEffect::Update` normally calls `SpriteAnimator::Update`. Result bit `0x2`
marks graphics refresh pending. When the reset byte is nonzero, it clears that
byte and returns `0x2` without advancing the animator. The recovered effect
constructors do not write +0x3F; its initialization contract outside the observed
actor reset paths remains unresolved.

The virtual update at `0803260C` always updates the primary effect. It updates
the secondary effect when its mode is nonzero. An animation wrap (`0x4` in the
animator result) clears the secondary mode unless that mode is 2. The actor
helper at `08032384` selects modes 1 or 2 and resets the secondary animation;
`080323C8` clears the mode. Mode 3 has no established normal caller meaning.

See [SpriteAnimator](SPRITE_ANIMATOR.md) for animation descriptors, timing, and
the complete result-bit contract.

## Rendering and graphics refresh

The renderer at `08032690` obtains camera-relative coordinates from the owner's
Q16 position. It draws the secondary effect for modes 1 and 2, applying the
signed offset selected by the upper six state bits and the owner's facing.
It draws the primary effect using the attribute choice at +0x8B and the owner
state. A further game-object call is selected by +0x88/+0x89; its broader purpose
remains unresolved.

The animation provider's virtual method at +0x10 supplies current sprite render
data. Drawing reaches the IWRAM routine at `030004DC` only when the resource
handle is nonzero. After a successful draw, an active effect queues its graphics
transfer through `080A480C`. It uploads parts through `080A4944` either on every
refresh or once until the +0x3E latch is reset, then clears its active byte.

[Hardware transfers](HARDWARE_TRANSFER.md) documents the shared graphics
descriptor and transfer-vector boundary.

## Destruction and virtual table

`080DC8F8` destroys the secondary resource base, then the primary resource base,
using `080A47B4` with flags 2. It restores the lower base vtable at `080E65E0` and
calls `operator delete` only when bit 0 of the incoming flags is set. The owner
pointer is borrowed and is not destroyed here.

This entry is represented explicitly because the legacy destructor flags and
vtable-store sequence are part of the recovered ABI. The linker binds the C++
destructor name to that entry.

The typed table at `080E68B4` contains two zero header words followed by the
destructor, update, and render entries. The two header words retain neutral
names because their general ABI meanings have not been established here.

## Retail integration

`src/entity_effect.cc` contains the two constructors, update, and renderer at
`080324BC..080328FF`. `src/entity_effect_dtor.cc` contains the 0x34-byte destructor
at `080DC8F8..080DC92B`. `src/entity_effect_vtable.cc` contains the 0x14-byte table
at `080E68B4..080E68C7`. The surrounding assembly and data retain their retail
positions.

Install the pinned compatibility toolchain with `tools/install_agbcp.sh`, then
validate with `make -B -j4 compare`. The required ROM is 8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
