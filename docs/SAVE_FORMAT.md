# Save format and extension space

The original US FoMT layout contains two primary slots after a 0x28-byte SRAM
header. Each slot begins at `0x28 + slot * 0x3FEC`. Preserve the serialized
retail `GameState` size and offsets when adding compatible custom state.

## Recovered record interface

[save_format.hh](../include/save_format.hh) supplies the proven constants;
[save_format.cc](../src/save_format.cc) reconstructs these matching helpers.
Original assembly names remain aliases.

| Helper | Retail address | Contract |
| --- | --- | --- |
| `GetSaveSlotOffset` / `func_080003DC` | 0x080003DC | SRAM-relative slot base |
| `CalculateSaveChecksum` / `func_08011588` | 0x08011588 | Additive unsigned byte sum; zero for null data or zero length |
| `GetSaveSlotRecordSize` / `func_080115A8` | 0x080115A8 | Returns 0x34FC, including length and checksum |
| `WriteSaveSlotRecord` / `func_080115B0` | 0x080115B0 | Writes length, payload, checksum; returns zero on success |

## Retail slot record

| Relative range | Size | Contents |
| --- | ---: | --- |
| 0x0000..0x0003 | 0x4 | Serialized payload size, exactly 0x34F4 |
| 0x0004..0x34F7 | 0x34F4 | Complete serialized `GameState` payload |
| 0x34F8..0x34FB | 0x4 | Additive checksum of the payload bytes |
| 0x34FC..0x3FEB | 0xAF0 | Unused by retail code |

Because the payload is the complete in-memory `GameState` image, runtime field offsets transfer directly into the save payload. Newly binary-proven early fields are: `GameState+0x08` current weather, `+0x0C` tomorrow's forecast, and `+0x10..+0x13` the packed year/date/time calendar. Relative to the start of a slot record, including the four-byte size word, these begin at **0x000C**, **0x0010**, and **0x0014** respectively. `func_08010F54` proves the weather roles by copying forecast to current weather at the daily transition, generating the next forecast, and passing current weather into `Farm::DayUpdate`.

The checksum covers only the 0x34F4-byte payload, modulo 2^32. The writer
performs three separate SRAM writes. Failure results combine the low-level
error value with 0x10000 (length), 0x20000 (payload), or 0x30000 (checksum).
This routine does not write an extension record or establish atomicity between
retail and custom data.

The legacy loader `func_08011650` remains assembly in
[game_state.s](../asm/game_state.s). It initializes state, requires the stored
length to equal 0x34F4, reads the complete payload and checksum, and reports
errors through its existing error output. Its returned state pointer alone
must not be treated as a success flag.

The loader is bounded at `0x08011650..0x08011933` (0x2E4 / 740 bytes).
Both callers allocate 0x34F4 bytes and pass the destination state, save
context, slot-relative SRAM offset, and an error-output pointer. It always
returns the destination state pointer and zeros the error output before I/O.
Failures OR the low-level `gUnk_03000400` value with `0x10000` for
length/generic/checksum failure, `0x20000` for payload-read failure, or
`0x30000` for stored-checksum-read failure. `func_080006E4` is the
four-argument read primitive used for all three reads. A successful 0x34F4-byte
payload load has no migration/fixup pass afterward. The pre-read half builds a
complete default state; that initializer is still private matching research,
not completed source. Once payload I/O starts, partial or invalid payload bytes
may overwrite those defaults. Failure does not guarantee a usable fallback;
callers must check the error output before using the returned state.

Each failure stage sets the flag below, ORed with the low-level error value.

| Failure | Stage flag | Assembly evidence |
| --- | --- | --- |
| Size read fails, size is invalid, or checksum differs | 0x10000 | Shared branch at 0801190E, 0x80 shifted by 9 |
| Payload read fails | 0x20000 | Payload failure path, 0x80 shifted by 10 |
| Stored-checksum read fails | 0x30000 | Checksum failure path, 0xC0 shifted by 10 |

In [new_game.s](../asm/new_game.s), `func_08003F9C` calls the writer;
`func_080040A0` and `func_080041DC` call the loader. These are integration seams
to recover and audit before a custom save implementation. Existing social
records occupy a fixed 0x478-byte block at GameState+0x1CD4; inserting more
records there would move later serialized fields.

## Recovered fishing subobject

The block at payload+0x2C80..0x2E57 is now typed source: 59 eight-byte records,
each a catch count and maximum size. It occupies 0x1D8 bytes and ends exactly
at the next object at +0x2E58. Eight associated methods are retail-exact source.
See [FISHING_RECORDS.md](FISHING_RECORDS.md) for index groups and slot-relative
offsets. This advances the payload layout without changing the parked loader.

## Proven unused tail

The static SRAM census covered all 17 high-level proxy calls (8 writes and 9
reads), three slot-base callers, and the complete low-level library call graph.
Header access ends at SRAM offset 0x27; retail slot access ends at relative
0x34FB. No separate retail path materializes or accesses the remaining tail.
This establishes **0xAF0 = 2,800 bytes per slot** of retail-unused space.
It does not establish a character count or compatibility with other hacks
that independently use this range.

## Proposed extension contract

This custom extension remains deferred design reference. Retail persistent-type
recovery is active through subobject initializers and consumers, including the
completed fishing-record block. Exact matching of the whole legacy loader is
still paused pending new structural evidence. These are independent tasks;
recovering the retail layout does not implement an extension format.

A separately versioned record in that tail is a candidate for added NPCs,
quests, or other mod-owned state. No serializer, loader, allocation registry,
or migration protocol has been implemented. The first persistent custom system
should define the shared budget rather than allocating the entire tail to one
feature.

A design should include its own magic, version, bounded length, and integrity
check; use stable record identities and explicit serialized fields rather than
RAM pointers or mutable array positions. Header/bookkeeping, any recovery
copies, and other mods reduce the 2,800-byte data budget.

The load/write lifecycle must specify:

- Validate the retail load before applying custom records. Preserve the retail
  length, payload geometry, and checksum contract.
- Initialize defaults for a legacy save with no extension. Define handling for
  corrupt, truncated, unsupported, or stale extension records without reading
  beyond the tail or silently attaching one save's state to another.
- Associate custom and retail records, and define behavior when only part of a
  save succeeds. The three-write retail helper supplies no combined transaction.
- Handle both slots, new game, overwrite, copy/erase paths, schema migration,
  and record reordering/removal. Audit every relevant path before claiming
  compatibility.

Character-specific staging and gameplay checks are in
[CUSTOM_CHARACTERS.md](CUSTOM_CHARACTERS.md).

## Matching validation

The slot-base helper is linked between sections of `asm/sram_proxy_1.s`;
the checksum/size/writer block occupies 0x08011588..0x0801164F between sections
of `asm/game_state.s`. The loader starts at its original 0x08011650 address.
Run `make compare` and `sha1sum -c fomt.sha1` after source/interface changes.
Documentation-only changes do not require rebuilding unchanged code.
