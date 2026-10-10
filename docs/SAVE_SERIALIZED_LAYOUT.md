# SRAM image and persisted GameState layout: compile-time checked

## What is verified

The original US Friends of Mineral Town SRAM uses exactly **0x8000 / 32,768 bytes**, with one 0x28-byte header followed by two 0x3FEC-byte slots. Every slot has a 4-byte payload-length prefix, 0x34F4 bytes of serialized GameState, a 4-byte checksum, and 0xAF0 bytes not assigned a definite retail meaning. The payload checksum is the modulo-2^32 sum of all 0x34F4 payload bytes, not a checksum of the prefix or entire slot.

The source-only `include/save_persisted_layout.hh` now expresses this as `SaveSramStorageLayout`, `SaveSlotStorageLayout`, and `PersistedGameStateLayout`. The header is included by `src/save_format.cc`, so the project's original old-GCC toolchain checks the layouts whenever the retail source is built. Forty-one compile-time typedef checks enforce total structure sizes, header/slot geometry, and the real `Farm`, `MoneyState`, `Farmer`, `Dog`, `SavedByteBuffer`, `SavedTransitionState` and `FishingRecords` offsets. Farm child components, Farmer held-item/rucksack locations, MoneyHistory capacities and fishing record stride are also checked. No source data or runtime logic is emitted. **No new ROM logic or static global objects are emitted**, and the forced retail ROM rebuild remains byte-identical.

| SRAM absolute offset | Bytes | Verified interpretation |
| --- | ---: | --- |
| 0x0000 | 0x20 | Exact 32-byte retail header signature |
| 0x0020 | 4 | Valid-slot bitmask: only bits 0 and 1 allowed |
| 0x0024 | 4 | Selected slot index, 0 or 1 |
| 0x0028 | 0x3FEC | Slot 0 |
| 0x4014 | 0x3FEC | Slot 1 |
| Slot+0x0000 | 4 | GameState payload length, expected 0x34F4 |
| Slot+0x0004 | 0x34F4 | GameState in unchanged binary representation |
| Slot+0x34F8 | 4 | Little-endian 32-bit sum of payload bytes |
| Slot+0x34FC | 0xAF0 | Unclaimed slot tail; do not assume its purpose or erase it casually |

Seven independently grounded GameState objects now live in `PersistedGameStateLayout`: existing `Farm`, `MoneyState`, `Farmer`, `Dog`, and `FishingRecords` types, plus exact-source `SavedByteBuffer` and `SavedTransitionState`. The named types themselves still contain fields whose semantics are not fully recovered, and the remaining bytes stay opaque.

| GameState-relative offset | Span | Typed view / status |
| --- | --- | --- |
| 0x0000..0x0013 | 0x14 | GameState header, packed fields not yet fully typed |
| 0x0014..0x1AA7 | 0x1A94 | `Farm`: horse, shipping bin, farmhouse, coop, barn, field |
| 0x1AA8..0x1BD7 | 0x130 | `MoneyState`: balance, two histories and four maxima |
| 0x1BD8..0x1C6F | 0x98 | `Farmer`: location, tool/held-item, rucksack |
| 0x1C70..0x1C9F | 0x30 | `Dog`, source-exact assignment |
| 0x1CA0..0x1CCB | 0x2C | `SavedByteBuffer`, six exact methods |
| 0x1CCC..0x2C73 | 0xFA8 | Remaining untyped saved systems and social state |
| 0x2C74..0x2C7F | 0x0C | `SavedTransitionState`, eight exact methods |
| 0x2C80..0x2E57 | 0x1D8 | `FishingRecords`, 59 eight-byte records |
| 0x2E58..0x34F3 | 0x69C | Remaining untyped saved systems |

`Farm` uses 0x1A94 bytes beginning at +0x14; its horse/ship-bin/farmhouse/coop/barn/field offsets are enforced by the original compiler. `Farmer` is 0x98 bytes with real location, held-item and rucksack fields. `MoneyState` is 0x130 bytes and its two counted histories and four maxima are compile-time checked. `FishingRecords` contains exactly 59 consecutive eight-byte count/max-size entries. These are actual existing project types, not speculative local clones.

Reference details: [SAVED_BYTE_BUFFER.md](SAVED_BYTE_BUFFER.md), [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md), [SAVE_TRANSITION_STATE.md](SAVE_TRANSITION_STATE.md), [SAVE_FORMAT.md](SAVE_FORMAT.md), and [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md). These opaque spans are **not** assertions that their contained gameplay structures are unknown; they indicate that the complete parent GameState type has not yet been integrated as an exact typed source object.

## Read-only dump inspection

`tools/ches/inspect_sram.py` verifies actual on-disk geometry without mutating SRAM. On the user's PC:

```bash
cd /mnt/data/Github/gba/fomt
python3 tools/ches/inspect_sram.py --self-test
python3 tools/ches/inspect_sram.py /path/to/copy-of-32k-sram.sav
```

The inspector requires an exact 32,768-byte input and independently checks the **retail 32-byte signature** (ROM constant `gUnk_080E862C`), the little-endian valid-slot mask at header +0x20, and selected-slot index at +0x24. The signature must match exactly, valid-mask bits must fit 0..1, and the selected index must be 0 or 1, matching the source-exact `VerifySaveHeader` logic in `src/save_slot_header.cc`. It also checks both slots' payload lengths and recalculated byte-sum checksums.

The JSON separates `retail_header_fields_valid`, `header_reports_valid` (slot's mask bit), `record_shape_matches` (length/checksum only), and `header_and_record_consistent` (both categories agree). For header-and-record-consistent slots only, `saved_state_view` now exposes MoneyState balance, daily/seasonal history counts and recorded maxima, saved-byte-buffer count, transition indices/countdown, and a source-backed `FishingRecords` summary. The fishing total follows `GetTotalFishCaught`: indices 8..58 and an exact cap of 1,000,000,000; fish-king entries are indices 53..58. This is not a gameplay-achievement or save-load success assertion. Capacity booleans are diagnostic, **not** additional retail load-validity rules. The selected slot is shown separately, because header selection and slot validity are distinct. **Consistency does not prove that the running game can load it**, and the inspector cannot simulate cartridge read errors or in-memory object reconstruction. An empty all-zero slot has a matching zero checksum but no valid length or header bit. The script never writes to the SRAM file.

**Validated:** `python3 tools/ches/inspect_sram.py --self-test` passed for intact/corrupt records, bad header signature, invalid mask, invalid selected index, empty/unmarked slots, malformed sizes, injected MoneyState/buffer/transition fields and fishing totals in a synthetic consistent slot (including capping and exclusion of pre-fish indices). No real player SRAM was loaded or modified. The independently extracted literal signature also matched all 32 bytes of `fomt.gba` at ROM file offset `0xE862C`. No real player SRAM image was loaded or claimed to pass this test.

## Exact retail build gate

The compile-time layout checks initially used the newer `__builtin_offsetof`, which the original project compiler does not accept. Those were replaced with the compiler-supported `offsetof` macro from the project's `prelude.h`. The latest forced `make -B -j4 compare` passed (Ches `sh_mv2t0b0a_4bb83627`, `fomt.gba: OK` and original retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`).

**Current matching C++ total:** 90,644 / 940,036 (9.6426%), 1,948 remaining linked ASM functions. The 180-byte Farm copy is now source-exact, alongside Dog and nested cleanups, but MoneyState/Farmer copy, 776-byte parent assignment and 740-byte loader remain ASM. The read-only fishing summary reproduces the retail u32 wrapping addition before the 1-billion saturation cap. This is NOT evidence of successful emulator loading.
