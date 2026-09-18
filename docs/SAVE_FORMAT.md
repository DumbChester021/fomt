# Save format and extension space

The retail save layout contains two primary slot regions after a 0x28-byte
header. `GetSaveSlotOffset` returns a slot's SRAM-relative base:

```text
0x28 + slot * 0x3FEC
```

`src/save_format.cc` is a byte-matching reconstruction of the original helper
at 0x080003DC. The original `func_080003DC` symbol remains as an alias for
assembly callers. Constants in `include/save_format.hh` describe the proven
record boundaries for tooling and expansion work.

## Retail slot record

| Relative range | Size | Contents |
| --- | ---: | --- |
| 0x0000..0x0003 | 0x4 | Serialized payload size, exactly 0x34F4 |
| 0x0004..0x34F7 | 0x34F4 | Complete serialized `GameState` payload |
| 0x34F8..0x34FB | 0x4 | Additive checksum of the payload bytes |
| 0x34FC..0x3FEB | 0xAF0 | Unused by retail code |

The checksum is an unsigned byte sum over only the 0x34F4-byte payload,
accumulated modulo 2^32. The retail loader requires the stored size to equal
0x34F4, reads that complete payload, and compares its checksum. Existing save
compatibility therefore depends on the retail `GameState` size and field
offsets remaining stable.

## Mod extension record

The 0xAF0-byte tail at slot-relative 0x34FC is a practical place for persistent
mod data, including state for added characters, scenes, quests, or systems. A
mod can leave the retail payload and checksum unchanged and maintain a separate
extension record in this tail.

A robust extension format should begin with its own magic, format version,
payload length, and checksum. Loaders should treat absent or invalid extension
data as an empty/default extension so unmodified retail saves remain usable.
Coordinate this allocation with other hacks: retail leaves the range unused,
but an unrelated hack may independently claim it.

The unused-tail conclusion comes from a complete static census of the retail
SRAM paths: 8 calls to the high-level write proxy, 9 calls to the read proxy,
3 callers of the slot-base resolver, and the full low-level SRAM-library call
graph. Header access ends at SRAM offset 0x27, primary slot access ends at
relative 0x34FB, and no separate source path materializes or accesses the tail.

## Matching validation

The linker places `src/save_format.cc` between the two sections of
`asm/sram_proxy_1.s`, preserving the original helper address and every
following address. `make compare` and `sha1sum -c fomt.sha1` must pass after
changes to this interface.
