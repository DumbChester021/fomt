# Save format and extension space

The original US FoMT layout contains two primary slots after a 0x28-byte SRAM
header. Each slot begins at `0x28 + slot * 0x3FEC`. Preserve the serialized
retail `GameState` size and offsets when adding compatible custom state.

**Current verified checkpoint, October 11:** 91,776 matching C++ code bytes (9.7630%), 1,934 linked ASM functions left. Forced ROM `sh_mv2zjs7o_1c4bad58` passed with the original SHA1. This is NOT complete save-system decompilation, runtime-load proof, or custom-game save readiness.

## Current source-owned save components

- SRAM header helpers: seven newly exact methods /472B; SRAM proxy/error/verify methods eight /444B.
- GameState cleanup: three functions /228B. Specialized exact state assignments: **Farm 180B**, **Dog 132B**, **Barn 296B**, **Farmer 448B**; original address aliases remain.
- SavedByteBuffer six exact methods /84B, SavedTransitionState eight /120B; packed progress flag setter 12B. GameState initialization's 16-byte nonzero random helper and **76-byte shipping payout handler** are exact C++ (`src/game_state_random.cc`, `src/game_state_shipping_revenue.cc`). The latter copies ShippingBin value into MoneyState, optionally credits it twice, clears the bonus flag and resets the shipping value. The newly exact **52-byte** capped progress updater and **24-byte** packed flag initializer live in `src/game_state_packed_progress.cc` and `src/game_state_header_flag_init.cc`; the adjacent 48-byte B/C setters remain ASM. Eight packed-state field readers (64 B) and an all-owned-animals affection predicate (156 B) are also exact at `0x08010E48..0x08010F24`, with their own linked source and preserved original entrypoints; see [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md).
- Source-only serialized layout: **41 binary checks** for 32KiB SRAM, 0x28-byte header, two 0x3FEC slots, 0x34F4 GameState, and seven typed persistent subobjects (Farm, MoneyState, Farmer, Dog, buffer, transition, fishing). Unproven bytes remain opaque.
- Read-only tools/ches/inspect_sram.py verifies signature, valid-mask, selected-slot, record length and sum, and only for consistent slots displays known money, buffer, transition and fishing values. Tests pass including u32 fishing sum wrap. The included `baserom.sav` has zero valid-slot bits and both records are invalid; **no real player SRAM/emulator load tested**.
- Missing exact code: 740-byte loader, 776-byte GameState assignment, MoneyState/Rucksack/Coop copies, save/load UI and some low-level SRAM write/erase paths. Do not customize until compatible behavior is verified.

Proof and status: [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md), [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md), [GAME_STATE_SAVE_CLEANUP.md](GAME_STATE_SAVE_CLEANUP.md), [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md), [SAVE_FARM_STATE_COPY.md](SAVE_FARM_STATE_COPY.md), [SAVE_GAMESTATE_ASSIGNMENT_MAP.md](SAVE_GAMESTATE_ASSIGNMENT_MAP.md), [SAVE_MENU_RETRY_TRACE.md](SAVE_MENU_RETRY_TRACE.md). Older source proof per-subobject: [SAVED_BYTE_BUFFER.md](SAVED_BYTE_BUFFER.md), [SAVE_TRANSITION_STATE.md](SAVE_TRANSITION_STATE.md), [SAVE_PACKED_PROGRESS.md](SAVE_PACKED_PROGRESS.md).

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
offsets.

## Recovered mine-floor subobject

The next block at payload+0x2E58..0x347F is now structurally recovered as a
0x628-byte mine-floor state. It contains a four-byte layout/mode word, 784
two-byte packed tiles, and a four-byte packed mine-progress word. The tile
layout is 4/6/6 bits; the two six-bit fields remain conservatively unnamed.

Within the progress word, nine bits track the known Kappa Jewel floors and nine
track the known Goddess Jewel floors. Four additional mine-progress bits remain
semantically unresolved and ten high bits are preserved by the initializer.
`func_0809CE8C` is retail-exact source. See
[MINE_FLOOR.md](MINE_FLOOR.md) for the field and bit map.

The next payload block at **+0x3480..+0x3493** is now structurally recovered
as a **0x14-byte `CursedToolState`**:

- `+0x00..+0x05`: six active/progression-enabled bytes;
- `+0x06..+0x0B`: six completed/blessed bytes;
- `+0x0C..+0x11`: six progression counters;
- `+0x12..+0x13`: alignment/padding.

Both GameState initialization paths call `func_0809C144` at exactly +0x3480,
and the next independently initialized persistent block starts at +0x3494.
The typed initializer is retail-exact at its true **0x1A / 0** body bound
(C144..C15E), followed by two function-alignment bytes. The shared type is
`include/cursed_tool_state.hh`.

These recovered subobjects advance the payload layout without changing the
parked whole-save loader.

## Proven unused tail

The static SRAM census covered all 17 high-level proxy calls (8 writes and 9
reads), three slot-base callers, and the complete low-level library call graph.
Header access ends at SRAM offset 0x27; retail slot access ends at relative
0x34FB. No separate retail path materializes or accesses the remaining tail.
This establishes **0xAF0 = 2,800 bytes per slot** of retail-unused space.
It does not establish a character count or compatibility with other hacks
that independently use this range.

## Current expansion readiness (October 10, 2026)

**The retail SRAM geometry is proven, but the complete save system is not fully
decompiled and the custom-game extension is not installed.** The 740-byte
legacy `func_08011650` loader remains assembly, as do the two menu-side loader
callers (`func_080040A0`, `func_080041DC`) and writer-side menu handler
(`func_08003F9C`). The format and error output are understood; a fully typed
`GameState`, error-safe hook lifecycle, and custom save migration are not.

The separate `custom-game` worktree now contains a **host-only proposed
extension** at `tools/save_extension_reference.py` and 16 passing synthetic
SRAM-image tests at `tools/test_save_extension_reference.py`. Its two 1,400-byte
banks fit exactly inside the 2,800-byte retail-unused tail and preserve the
original retail record. **None of that code is in the GBA ROM, and it does not
make new custom NPC/item/quest state persistent.** It is a design/test aid, not
a finalized save format. The custom branch's
`docs/SAVE_EXTENSION_READINESS.md` tracks the staged integration gates.

The two critical compatibility hazards are (1) retail and extension writes
cannot be assumed atomic across separate SRAM operations, and (2) overwriting
a save slot with **byte-identical** retail data does not change a CRC-based
binding and could wrongly restore old extension records. Explicit overwrite,
new-game, copy and erase hooks, tested with real copied `.sav` files, are
required before persistent custom features are safe to ship. Keep the retail
0x34F4-byte payload and 0x34FC-byte record unchanged.

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


## Ground pickup and resource state

GameState+0x34C8..+0x34D7 is a recovered 16-byte GroundPickupState:
56 availability bits and fifteen three-bit durability counters, with 116
actual twelve-byte table records. See GROUND_PICKUP_STATE.md.
Next independent four-byte state begins at +0x34D8, actor state at +0x34DC.
