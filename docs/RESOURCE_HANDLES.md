# Resource handles

`UnkHandleBase` is a client of the shared allocation manager at
`gUnk_03000408`. `UnkHandle` adds a packed resource value and releases that
value before destroying the client. The first word of the client object has
no established meaning and retains its existing neutral name.

The same eight-byte handle layout is used by the entity effect resource base.
Several graphics callers use a resolved allocation start as
`0x06010000 + (start << 5)`. Starts therefore identify 32-byte units in this
resource arena. Higher-level resource identities remain unresolved.

## Packed values and entries

`ResourceId` exposes the packed value:

| Bits | Meaning |
| --- | --- |
| 0..7 | entry index |
| 8..23 | generation |
| 24..31 | unused by the recovered validation and allocation paths |

Zero is the invalid handle. Validation also requires the index's occupancy
bit and equality between the handle generation and the entry generation.
Generation zero marks an entry released by the normal release path.

Each entry is eight bytes. Its allocated and free representations overlap:

| Offset | Allocated representation |
| --- | --- |
| +0x00 | 10-bit start, 4-bit order, two unresolved bits |
| +0x02 | `u16` reference count |
| +0x04 | `u16` generation |
| +0x06 | unresolved halfword |

The first word holds the next free-entry pointer while the entry is free.
The pool has 256 entries and a single head pointer. Acquisition removes the
head; the last release inserts its entry at the head.

## Shared owner

The manager occupies 0x92C bytes:

| Offset | Proven role |
| --- | --- |
| +0x000 | `BitArray<256>` occupancy |
| +0x020 | free-entry pool: head and 256 entries |
| +0x824 | 1,024-unit binary block allocator |
| +0x920 | `u16` active-entry count |
| +0x922 | `u16` generation counter |
| +0x924 | `u32` client count |
| +0x928 | `u16` reserved interval start |
| +0x92A | `u16` reserved interval length |

The allocator recursively divides each block into two children. Orders 10
through 6 have full/empty bytes and two children; order 5 is a 32-bit
occupancy word. The corresponding sizes are 0xFC, 0x7C, 0x3C, 0x1C, 0x0C,
and 4 bytes. Allocation orders 0 through 10 request `1 << order` units.
The reservation routine invalidates overlapping entries and updates the
reserved interval. Reservation, block allocation/release, and subtree helpers
remain assembly. The root fill and clear routines are recovered in source.

The client constructor lazily allocates the manager and increments its
client count. It does not write the client's first word. It also does not
initialize the manager generation counter at +0x922. Preserve these observed
initialization boundaries rather than introducing additional stores.

Destroying the last client deletes the manager and clears the global. The
legacy destructor has a hidden flags argument: bit 0 also deletes the client
object. The resource-owning `UnkHandle` releases its resource first.

## Recovered interface

| Entry | Method | Behavior |
| --- | --- | --- |
| `08007874` | `UnkHandleBase` constructor | lazily constructs the manager and increments clients |
| `080079E8` | `UnkHandleBase` destructor | decrements clients; deletes the manager at zero; honors destructor flags |
| `08007B54` | `Acquire(order)` | allocates a block and entry; returns a packed value, or zero |
| `08007C28` | `Release(value)` | validates; decrements references; returns the block and entry at zero |
| `08007CD8` | `Retain(value)` | validates; increments references; returns the original value on success |
| `08007D4C` | `GetStart(value)` | validates; returns start, or -1 |
| `08007DB8` | `GetOrder(value)` | validates; returns order, or 11 |
| `08007E24` | `GetReferences(value)` | validates; returns references, or zero |
| `08007EA8` | root fill | fills both children, then marks the root full and nonempty |
| `08007EC8` | root clear | clears both children, then marks the root empty and nonfull |

`Retain` rejects reference-count overflow: it restores the previous count and
returns zero. Invalid handles also return zero. `Release` ignores invalid
handles. Releasing the last reference frees the allocation, clears the entry
generation and occupancy bit, returns the entry to the pool, and decrements
the active-entry count.

Acquisition allocates a block before taking an entry, rolls the block back
when the pool is empty, and sets the entry reference count to one. Its
generation counter increments and wraps 65535 to one.

Manager construction initializes occupancy, the entry free list, the block
tree, active/client counts, and the reserved interval. Root fill visits child
zero before child one; root clear visits child one before child zero. Both
update the root flags after their subtree calls.

The effect constructors in `src/code_080A46AC.cc` use the shared handle type
and its inline `GetStart()` forwarding method. The forwarding method passes
both the client pointer and its packed value; the retail lookup consumes its
second argument. `src/code_080A480C.cc` uses the same declared ABI.

See [entity effects](ENTITY_EFFECTS.md) for the containing resource object
and [hardware transfers](HARDWARE_TRANSFER.md) for the upload queue.

## Retail integration

`src/resource_handle.cc` owns these retail ranges:

| Range | Source boundary |
| --- | --- |
| `08007874..080079CF` | client construction and inlined manager construction |
| `080079E8..08007A27` | client destruction |
| `08007B54..08007C27` | acquisition |
| `08007C28..08007E8B` | release, retain, and three queries |
| `08007EA8..08007EE7` | root fill and clear |

Acquisition, the order and reference queries, and root clear each have two
ordinary alignment bytes after their function bodies. The raw copy-constructor
island at `080079D0..080079E7`, reservation at `08007A28..08007B53`, and tiny
query helpers at `08007E8C..08007EA7` retain their assembly positions.

Use the pinned compiler installed by `tools/install_agbcp.sh` and validate
with `make -B -j4 compare`. The required ROM is 8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
