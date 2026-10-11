# Persistent inline byte-buffer subobject

Retail `GameState+0x1CA0` is initialized both in the normal default-state creation path and in the save loader `func_08011650`. The byte span to the next separately initialized state at `+0x1CCC` is **0x2C bytes**. The typed source header is `include/save_byte_buffer.hh`; the field names below are conservative where the in-game meaning is not yet proven.

| Field offset | Size | Current source type | Evidence / caution |
| --- | ---: | --- | --- |
| +0x00 | 4 | `u32 count` | First word returned by `FFD0`, used by the buffer-end accessor and append path |
| +0x04 | 0x20 | `u8 payload[32]` | Beginning returned by `FFD4`; end computed with count by `FFD8` |
| +0x24 | 6 | `Location location` | Copied in/out verbatim by `FFE0`/`10014`; packed map/x/y type confirmed by the exact constructor; buffer owner remains unknown |
| +0x2A | 2 | `u8 trailing[2]` | Placeholder bytes to the next separate GameState field; semantic ownership unresolved |

Six accessors/append/copy operations are now independently **100% byte-exact natural typed C++** in `src/save_byte_buffer.cc`:

| Source API | Retail address | Bytes | Contract |
| --- | --- | ---: | --- |
| `SavedBufferCount` | 0800FFD0 | 4 | Return count |
| `SavedBufferData` | 0800FFD4 | 4 | Return inline payload address |
| `SavedBufferEnd` | 0800FFD8 | 8 | Return payload + count |
| `AppendSavedBufferByte` | 0800FFF4 | 32 | Append a low byte when count is at most 29; accepts full-width `unsigned int` argument |
| `GetSavedBufferLocation` | 0800FFE0 | 20 | Copy 6-byte location from buffer to caller's output and return that output |
| `SetSavedBufferLocation` | 08010014 | 16 | Copy caller's 6-byte location into buffer |

Total **84 newly source-owned code bytes**. Linker section splits preserve original entrypoints and the assembly that remains between them. Original names remain aliased. Typed standalone probes and original scratch variants: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-buffer-20261010/`. The latest forced full-ROM build `sh_mv29b73e_17d0d3da` passed (`fomt.gba: OK` and original SHA1).

**Still assembly:** the 40-byte `func_08010024` clears the active range/count. The 68-byte `func_0800FF8C` constructor is now exact C++ (proof below). The typed constructor scratch `ctor-v1.cc` matched the 0x44 length but differed by 59 bytes. The first append candidate `append-typed-v1.cc` failed because its argument was incorrectly typed `u8`, generating extra narrowing instructions; fixing the ABI to `unsigned int` gave exact 32-byte matches in `append-typed-v2.cc` and `append-named.cc`, now integrated. Preserve these as behavioral evidence, not source to integrate. The constructor's location bitmask sequence should not be simplified into invented field identities. No custom SRAM schema or migration code was added.

This type is **partially understood, not a complete save-system decompilation**. It helps the `GameState` type graph, but the full save loader, other subobjects, and save-menu lifecycle still require separate exact-source work.


### October 11: exact active-range reconstruction

The exact 776-byte parent in `src/game_state_copy.cc` now reconstructs this
buffer. Const/nonconst `begin()` return a one-byte `SavedBufferByte` record
view over the existing `u8 payload[32]`; its size is compile-time checked.
A captured count and standard uninitialized range copy preserve inactive
storage, followed by the original six-byte location call. The six public
accessors and raw storage layout are unchanged. The byte record's gameplay
meaning remains unknown. See [parent proof](SAVE_GAMESTATE_ASSIGNMENT_MAP.md).

### October 11: exact constructor and typed location

`SavedByteBuffer::SavedByteBuffer()` in `src/save_byte_buffer.cc` owns
**0x0800FF8C..0x0800FFD0, 68 linked bytes**. Its normal member-initializer
list is `count(0), location(MAP_NONE, 0, 0)`. The existing packed
`Location` type replaces the six opaque location bytes without changing
size, offsets or the six accessor ABIs. Payload bytes, trailing padding
and Location's reserved bits remain untouched. The original
`func_0800FF8C` aliases the compiler-verified `__15SavedByteBuffer` symbol.

A direct typed field setter emitted 68 bytes / 55 differences; the actual
constructor emitted 68 / 0. Linked binary SHA256:
`4fa36d2d802fa4011df4e357c75681e374007b725f1a85c95d9bac0d4dbdde8b`.
Isolated forced comparison `sh_mv3f94au_7a2e6f31` and production
`make test` `sh_mv3fbl43_261a3c49` both passed original ROM SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
This adds 68 code bytes outside the bounded 12-function subset; no compiler
changes, forced registers or custom-game edits.

The adjacent 40-byte clear routine remains ASM. Closed natural probes
(size/differences): standard destruction 34/33, captured range/count
36/32, destruction-count helper 36/31, member erase 36/32, vector-style
copy/destroy erase 34/38. Preserve the saved preprocessed inputs: their
headers predate the new constructor/Location declaration. Local paths are
in ignored AGENTS.local.md. These results do not establish a real-save
runtime round trip.
