# Rendering resource owners

Two related owners in `asm/code_0803A8A4.s` manage sprite frame descriptors,
resource-handle clients, provider values and queued graphics transfers. Their
constructors begin at `0x0803AB30` and `0x0803AEA0` and remain assembly.
The first owner's destructor, graphics update and renderer forwarding, plus
the sibling destructor, are now exact source in `src/resource_owner_cached.cc`
and `src/resource_owner_variable.cc`, with shared `include/resource_owners.hh`. This page records recovered interfaces and layouts;
candidate versions and matching results belong in the research checkpoint.

The names below describe observed roles, not established original class names
or a proven gameplay identity. Retain address-derived owner names until that
identity is known.

## Shared descriptor and provider contracts

A frame descriptor is **0x20 bytes**, composed of four eight-byte spans. Each
span has a pointer at +0, a `u16` size at +4 and two alignment bytes, matching
the existing `GraphicsBlob` in `include/entity_effect.hh`.

| Descriptor offset | Evidence |
| --- | --- |
| +00 | First span; detailed format remains unresolved |
| +08 | Graphics source pointer and transfer size |
| +10 | Data passed to the provider's +0x54 callback |
| +18 | Fourth span; transform interpretation remains a hypothesis |

The rendering-resource provider's vtable has these observed slots:

| Vtable byte offset | Contract |
| --- | --- |
| +48 | Acquire a byte-valued resource; the three-record constructor passes `0xF` |
| +4C | Release a stored byte-valued resource |
| +54 | Queue resource chunks using descriptor span +10, the first stored byte and mode `1` |
| +68 | Obtain the sprite-animation/frame provider |

The sprite provider's +0x0C virtual returns the existing **eight-byte
`SpriteAnimation`** by value. Its +0x10 virtual returns the **32-byte frame
descriptor** by value, using a sprite ID from the animation. Keep these receiver
types separate. Existing source in `src/code_080A46AC.cc`,
`include/sprite_animator.hh` and `include/entity_effect.hh` supplies the shared
ABI evidence. Historical MFoMT notes are type hints; FoMT addresses, consumers
and return conventions remain authoritative.

## Three-record owner at 0x0803AB30

Constructor/allocation callers establish an object size of **0xA0**.

| Object offset | Layout |
| --- | --- |
| +00 | Rendering-resource provider pointer |
| +04 | Three records, each **0x2C bytes** |
| +88 | `FixedVec<u8,16>` count |
| +8C | Sixteen bytes of value storage |
| +9C | Byte flag; exact public meaning remains unresolved |

Each record contains the 32-byte descriptor, an existing eight-byte
`UnkHandle` at +0x20, a cached tile-start halfword at +0x28 and two alignment
bytes. The constructor obtains animations `0x91A..0x91C`, their first frame
descriptors, order-2 handles and cached starts.

The destructor releases the first stored provider value, then normal C++
member-array destruction releases the three handle clients backwards. Preserve
the old compiler's hidden destructor flags and base-destructor calls when
introducing source aliases.

`func_0803ACD8` processes all three records and appends a `GraphicsTransfer`
descriptor for each, using size zero when the graphics pointer is absent.
The destination is OBJ VRAM at
`0x06010000 + (handle.GetStart() << 5)`. Its vector-growth algorithm is already
represented by exact source in `src/code_080A480C.cc`. The final provider +0x54
call uses the first record's span +0x10 and the first stored value.

`func_0803AE58` selects a record and calls the IWRAM renderer at `0x030004DC`
with the renderer, coordinates, `0xAA`, flags `0x8000`, descriptor, provider,
cached tile start and value-storage pointer. Further meanings of those fixed
arguments remain unresolved.

## Variable-count sibling at 0x0803AEA0

The allocation in `func_0801FAC8` establishes an object size of **0x46C**.

| Object offset | Layout |
| --- | --- |
| +00 | Rendering-resource provider pointer |
| +04 | `FixedVec<Record,5>` count |
| +08 | Five record slots, each **0x28 bytes**: descriptor + handle, without a cached start |
| +D0 | `FixedVec<u8,16>` count |
| +D4 | Sixteen bytes of value storage |
| +E4 | Byte copied from the constructor's third explicit register argument |
| +E5 | Dirty/update guard |
| +E6 | Live byte initialized to zero; **not padding** |
| +E8 | `FixedVec<AnimationEntry,32>` count |
| +EC | Thirty-two entry slots, each **0x1C bytes** |

Each animation entry consists of the existing 20-byte `SpriteAnimator` and
two unresolved words at entry +0x14/+0x18. There is one alignment byte at
object +0xE7.

The destructor releases the provider value, destroys the active animation
entries, then destroys the active record clients. Existing `FixedVec` uses raw
storage and has no element-destroying destructor: these explicit destruction
walks are required. Do not add a global `FixedVec` destructor to express this
one owner's behavior.

`func_0803B128` walks the active records, obtains handle starts at update time,
queues graphics transfers and performs the same final provider callback. The
constructor receives a rendering-resource provider and sprite provider in
r1/r2, plus the +0xE4 byte from r3. The additional stack argument and full
constructor interface remain unresolved.

## Integration boundaries

The update bodies end at **0x0803AE56** and **0x0803B2A6**. Each is followed
by two ordinary alignment bytes before the next function at AE58/B2A8. A
function-body proof must use those true ends; full-ROM integration must still
preserve both alignment seams and all neighboring addresses.

Reuse the existing handle, fixed-vector, animation and hardware-transfer types.
Private default-handle/byte-assignment constructor experiments are not changes
to those production interfaces. Before replacing assembly, require final
combined-source target proofs, an isolated build with the tracked compiler,
and the production full-ROM compare/hash. These gates now pass for AC78,
ACD8, AE58 and B0A8, adding 680 linked source bytes including alignment.
Exact progress counts only integrated source. See [MAP_DATA.md](MAP_DATA.md) for the preceding completed resolver and
[NEXT_AGENT_HANDOFF.md](../tools/ches/NEXT_AGENT_HANDOFF.md) for continuation.
