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

The initializer links each entry to its successor and the last entry to a
supplied tail. It writes the tail first, then walks backward through the
array, and returns the first entry. Manager construction supplies 256 entries
and a null tail. The initializer assumes a nonzero count.

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
reserved interval. Reservation and block allocation remain assembly. Root
fill/clear, partial range updates, root release, and the order-9 release helper
are recovered in source; their remaining subtree dependencies are assembly.

Partial range updates ignore a start outside the 1,024-unit root or a zero
length. A range starting at zero and covering the whole root uses the full
fill/clear routine. Other ranges split at 512 units: the left child receives
the smaller of the requested length and its remaining capacity; the right
child receives a relative start and the remaining length. Fill recomputes the
root's full flag and clears its empty flag. Clear resets the full flag and
recomputes emptiness. The range arithmetic uses unsigned 32-bit values.

Root release dispatches orders below 10 according to start bit 9; order 10
clears the whole root. The order-9 helper similarly uses bit 8 for smaller
orders and clears its whole block for order 9. Both pass the original start
to the child, whose own level selects the relevant bit. Larger orders are
ignored. After child release, the parent is nonfull and its empty flag is the
conjunction of the children's empty flags.

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
| `08007EE8` | root range fill | splits a partial range between the two children and updates flags |
| `08007F84` | root range clear | clears the affected child ranges and updates flags |
| `080080A0` | root block release | releases an order-selected child or clears the whole root |
| `080D76C0` | order-9 block release | releases an order-selected child or clears the whole block |
| `080D770C` | entry pool initializer | links the entry array to a supplied tail and returns its first entry |

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
| `08007EE8..0800801F` | root partial range updates |
| `080080A0..080080EB` | root block release |
| `080D76C0..080D770B` | order-9 block release |
| `080D770C..080D772B` | entry pool initializer |

Acquisition, the order and reference queries, and root clear each have two
ordinary alignment bytes after their function bodies. Root and order-9 block
release also have two alignment bytes each. The raw copy-constructor island
at `080079D0..080079E7`, reservation at `08007A28..08007B53`, tiny query helpers
at `08007E8C..08007EA7`, block allocation at `08008020..0800809F`, and the raw
helper island beginning at `080080EC` retain their assembly positions.

Use the pinned compiler installed by `tools/install_agbcp.sh` and validate
with `make -B -j4 compare`. The required ROM is 8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
