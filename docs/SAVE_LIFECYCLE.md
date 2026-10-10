# Retail save lifecycle — readable source and open matching frontiers

**Active highest-priority subsystem, October 10, 2026.** The objective is a
fully **human-readable and retail-byte-exact** reconstruction of the save
system before adding custom persistent content. Not all save functions have
reached that standard yet; do not confuse a recovered behavior with an exact
C++ production replacement. Keep retail changes on `main` and do not alter
the `custom-game` worktree during this priority.

**Last exact production-code checkpoint:** `f069823` (seven SRAM-header functions, 472 bytes). The GameState-loader behavioral pseudocode below is research, not an exact compiled replacement. The save system remains incomplete.

## Verified SRAM organization

```text
Physical cartridge SRAM: 0x8000 bytes
  0x0000..0x001F   fixed 32-byte header signature (compared to gUnk_080E862C)
  0x0020..0x0023   u32 bit mask: slot 0 bit 0, slot 1 bit 1
  0x0024..0x0027   u32 selected slot (0 or 1)
  0x0028..0x4013   slot 0 (0x3FEC bytes)
  0x4014..0x7FFF   slot 1 (0x3FEC bytes)

Within either slot (relative offsets):
  0x0000..0x0003   u32 payload length, required 0x34F4
  0x0004..0x34F7   serialized GameState, exactly 0x34F4 bytes
  0x34F8..0x34FB   u32 unsigned sum of all payload bytes
  0x34FC..0x3FEB   retail-unused 0xAF0 bytes; NOT yet deployed for custom state
```

The physical slot mask and selected-slot field are independent: the verifier
accepts a selected index 0 or 1 even if its valid-mask bit is zero. A zero
returned by the mask/selected readers can mean a valid zero or a read failure;
the caller must check the low-level error and validity where relevant.

## 1. Fully source-exact SRAM header helpers

These are **seven independently byte-exact functions totaling 472 linked
bytes**, now defined in `src/save_slot_header.cc` with public semantic
declarations in `include/save_format.hh`. The original numeric entrypoint
aliases remain available for existing assembly callers.

| New source API | Original address and true range | Retail role | Bytes |
| --- | --- | --- | ---: |
| `VerifySaveHeader` | `080002E0..08000358` | Read 32-byte signature, mask, selected index; check low-level errors, signature, allowed mask bits and selected<=1 | 120 |
| `InitializeSaveHeader` | `08000358..080003A0` | Write signature then zero mask and selected index if each preceding stage succeeds | 72 |
| `ReadValidSaveSlotMask` | `080003A0..080003DC` | Verify header, read valid-slot bits, return zero on failure | 60 |
| `MarkSaveSlotValid` | `080003E8..0800042C` | Read mask and set bit `1<<slot` if the SRAM read succeeded | 68 |
| `ClearSaveSlotValid` | `0800042C..08000470` | Read mask and clear bit `1<<slot` if the SRAM read succeeded | 68 |
| `WriteSelectedSaveSlot` | `08000470..08000488` | Store the chosen index at SRAM header offset 0x24 | 24 |
| `ReadSelectedSaveSlot` | `08000488..080004C4` | Verify header and read selected index; zero on failure | 60 |

`ClearSaveSlotValid` was previously **anonymous raw .byte Thumb code**
at `0800042C`. Its matching C++ source proves the clear-bit behavior, rather
than merely guessing the function name from adjacency. The already exact
`GetSaveSlotOffset` at `080003DC..080003E8` remains in `src/save_format.cc`.
The SRAM header region `080002E0..080004C4` is thus **fully source-owned**.
`asm/sram_proxy_1.s` now has no executable body; the continuing low-level
read/write proxy remains in `asm/sram_proxy_2.s`.

Source prototypes intentionally do not claim that these routines enforce
valid slot indices: the actual GUI callers pass slot 0 or 1. There is no new
bounds check in the exact retail implementations.

Scratch proof and reversible linker/assembly stages:
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-priority-20261010/`
(`probe.py`, `probe_00358_more.py`, `probe_verifier.py`, `integrate.py`,
`integrate_init.py`, `integrate_clear.py`, `integrate_verify.py`,
`proofs/` and `before-*.` backups). Each accepted function showed
**zero differing linked bytes** before production integration.

## 1a. New exact SRAM bootstrap, read, and context-word functions (October 10)

`src/sram_proxy.cc` now owns four original entrypoints, totaling 108 bytes, with readable source and independently proved exact linked bytes:

| API | Original address | Exact bytes | Behavior |
| --- | --- | ---: | --- |
| `EmptySramHook` | `0800063C` | 4 | No-op return; role beyond that not assumed |
| `BeginSramAccess` | `08000640` | 36 | On first use, mark initialized and clear the 16-bit error indicator; always return context |
| `ReadSram` | `080006E4` | 48 | Clear error, return false for zero length, otherwise read from `0x0E000000 | offset` through `func_080D379C` and return true |
| `ReplaceSramContextWord` | `08000714` | 20 | Select global context word index `((context_byte[4] & 3) + 3)`, write a new value through `func_080D100C`, and return the prior word |

The read boolean reports whether a nonzero-size read was invoked; callers also inspect `gUnk_03000400` where appropriate. The associated SRAM read library relocates a byte-copy routine into stack RAM before calling it. The write library retries/compares data and returns a nonzero verification-failure indication.

The 64 anonymous bytes at `08000664..080006A4` are still preserved in assembly, not falsely claimed as source. They implement a whole-SRAM 0xFF erase in eight-byte writes, with an uninitialized-stack OR pattern that must not be blindly transliterated into undefined C++. The formerly anonymous `08000714..08000728` function is now fully source-exact. All new source/linker boundaries and aliases were verified after integration. A forced `make -B -j4 compare` passed (`sh_mv27vo4d_00e2cb02`, exit 0, `fomt.gba: OK`). Scratch comparisons and nonmatching writer/error candidates: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/`.

**Remaining SRAM source frontiers:** the 64-byte anonymous SRAM eraser at `08000664` and `func_080006A4` write proxy (64 bytes; the improved natural `write-v9.cc` candidate is exact size but has four differing linked bytes, caused by swapped parameter-register allocation). `func_08000728` is **now exact source**, superseding the first failed switch. SRAM stack-relocation and physical-write helpers `080D379C`, `080D3800`, and `080D3870` also remain ASM. Do not use mismatching candidates or artificial register constraints.

## 1b. Verified error dispatcher and SRAM write/verify library (October 10)

Four further functions totaling **336 byte-exact C++ bytes** have joined the earlier 108-byte SRAM source. Every listed function has a zero-difference isolated source proof, including the named source alias:

| API | Original address | Bytes | Proven contract |
| --- | --- | ---: | --- |
| `OrSramErrorFlag` | `08000728` | 196 | OR recognized low-16-bit SRAM error flags into `gUnk_03000400`; other inputs leave it unchanged |
| `CopySramBytes` | `080D3778` | 36 | Copy raw bytes; routine is copied into executable RAM by the original read wrapper |
| `FindSramMismatch` | `080D3840` | 48 | Return the address of the first mismatched destination byte, or null on success; routine is relocated to RAM during verification |
| `WriteSramWithVerification` | `080D38D4` | 56 | Up to three write-and-compare attempts; return a mismatch address on failure, null on success |

The dispatcher required a `u16` switch selector and the original, nonnumeric case-body order (1, 2, 256/512, 4, 32, 8, 16, 64, 128). This is ordinary readable source, **not** a compiler patch. The byte-copy, mismatch finder and three-attempt retry functions likewise use natural typed loops. The original entrypoint aliases, linker locations, and adjacent assembly remain intact. Verified via forced `make -B -j4 compare` execution `sh_mv28lmfg_96561a9b` (exit 0, `fomt.gba: OK`). Proofs and rejected candidates: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/`.

**Remaining:** `08000664` SRAM erasure and `080006A4` SRAM write proxy, plus hardware/stack-relocation library functions `080D379C`, `080D3800`, and `080D3870`. Natural eraser `erase-clean-v1.cc` is nonmatching; do not copy the retail uninitialized-byte OR as undefined C++. The write proxy is structurally reconstructed down to a four-byte register allocation difference with `write-v9.cc`. A fresh natural reconstruction of the lower physical writer `func_080D3800` (saved `physical-write-v2.cc`) also matches its 64-byte length with just **two differing linked bytes** caused by reversed hardware-control-value/mask loads. All natural variants v3–v13 hit the same compiler frontier; the retail ASM remains installed. No save loader or menu flow was decompiled in this cluster.

## 2. Already source-exact record writer and checksum

`src/save_format.cc` implements:
`GetSaveSlotOffset`, `CalculateSaveChecksum`,
`GetSaveSlotRecordSize`, `WriteSaveSlotRecord`.

The writer makes **three separate operations**, in this order:

```cpp
write(saveContext, slotBase + 0x00, &constantLength0x34F4, 4);
write(saveContext, slotBase + 0x04, gameState, 0x34F4);
checksum = sum_every_unsigned_byte(gameState, 0x34F4);
write(saveContext, slotBase + 0x34F8, &checksum, 4);
```

Return zero means all three writes succeeded. On failure it ORs the
underlying 16-bit SRAM error with 0x10000 for length write, 0x20000 for
payload write or 0x30000 for checksum write. This is **not atomic**.

## 2b. Typed persistent buffer within GameState

Six original methods totaling **84 linked byte-exact C++ bytes** now operate on the 0x2C-byte persistent byte buffer at `GameState+0x1CA0`. `SavedByteBuffer` in `include/save_byte_buffer.hh` describes a count (+0), 32-byte inline payload (+4), six-byte copied location (+0x24), and two bytes of unresolved meaning (+0x2A). `src/save_byte_buffer.cc` recovers the count accessor `0800FFD0`, buffer begin `0800FFD4`, buffer end `0800FFD8`, location read/copy `0800FFE0`, append `0800FFF4` (32 bytes, full-width integer argument), and location write/copy `08010014`. All independently matched, and forced `make -B -j4 compare` passed (`sh_mv29b73e_17d0d3da`, `fomt.gba: OK`). See [SAVED_BYTE_BUFFER.md](SAVED_BYTE_BUFFER.md) for evidence and intentionally unknown fields. Constructor `0800FF8C` and follow-on handler `08010024` remain assembly; these six functions do **not** complete the GameState/save loader.

## 2c. Source-exact persisted transition/index state

Eight natural typed C++ functions, **120 contiguous byte-exact code bytes** in `0x08011510..0x08011588`, now reconstruct the `SavedTransitionState` subobject at `GameState+0x2C74`. Both the default constructor and the main loader `func_08011650` call its initializer, and GameState's daily update calls the countdown method. The model contains two 32-bit indices with unset sentinel 16 and a byte countdown initialized to 0, set to 2 when armed, decremented on eligible daily updates. Its true gameplay identity remains unconfirmed; the final three bytes in the 12-byte source type are explicitly reserved rather than asserted as game data. Read [SAVE_TRANSITION_STATE.md](SAVE_TRANSITION_STATE.md) for the verified layout, all eight original addresses, code proof and research closure.

The independent zero-difference isolated comparisons and the forced full-ROM gate `sh_mv2a88yy_5e2116a0` passed (`fomt.gba: OK`). The loader itself remains in ASM: recovering initialization of this type is an important dependency, **not** proof the entire loader is understood.

## 2d. Saved packed-state progress flag

`MarkSavedPackedFlag` now replaces the original `func_08011458` in natural typed C++ (`src/save_packed_flag.cc`), preserving all **12 retail bytes** exactly at `0x08011458`. It sets bit 4 of the first record byte and leaves other bits unchanged. The game's higher-level field meaning is still unconfirmed. The original alias, linker order and all neighboring assembly remain intact; forced full-ROM `make -B -j4 compare` passed (`sh_mv2amxjc_ee34fb1b`, `fomt.gba: OK`). See [SAVE_PACKED_PROGRESS.md](SAVE_PACKED_PROGRESS.md). Four neighboring packed setters remain ASM; best natural shapes have register/codegen differences and are not production source.

## 2e. Full binary layout checked in retail compiler

The new `PersistedGameStateLayout`, `SaveSlotStorageLayout`, and `SaveSramStorageLayout` types in `include/save_persisted_layout.hh` express the full 0x8000-byte SRAM image and anchor the two recovered typed GameState subobjects. Twelve original-compiler compatible assertions enforce image size, the now-typed 32-byte header signature plus valid-mask and selected-slot fields, slot payload/checksum offsets, and both known subobject offsets. No additional game functions were decompiled. The forced full-ROM `make -B -j4 compare` gate passed (`sh_mv2bppv3_97061b82`, `fomt.gba: OK`). The read-only `tools/ches/inspect_sram.py` now verifies the exact ROM-derived 32-byte signature, valid-slot mask and selected-slot field as well as each slot's size/checksum. Synthetic signature/mask/selection/corruption fixtures passed, but no real saved SRAM has been evaluated, and offline consistency cannot prove the game accepts a slot. See [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md).

## 2f. Three exact GameState cleanup methods

The parent `CleanupGameState` / `func_080D4480` (84 bytes) and both nested cleanup methods `func_080D6B00` (64 bytes) and `func_080D6C08` (80 bytes) are now natural byte-exact C++ in `src/game_state_cleanup.cc`, totaling **228 source-owned code bytes**. They preserve counted collection walks and the mode-bit distinction between cleaning nested objects and freeing allocations. Full forced ROM comparison passed (`sh_mv2ko6kd_c44d36db`, original SHA1). See [GAME_STATE_SAVE_CLEANUP.md](GAME_STATE_SAVE_CLEANUP.md).

The **776-byte GameState assignment `func_080D4178`** and **740-byte loader `func_08011650`** remain assembly. Successful active-game loading still requires cleanup(old, mode=2), subobject-aware copy(old,new), then cleanup(new, mode=3). This is not interchangeable with memcpy or pointer replacement.

## 2g. Dog state assignment now exact C++

The real `Dog` and `Animal` model now participates in source-exact save-state assignment. `CopySavedDogState` / `func_080D67C8` at `0x080D67C8..0x080D684C` matches all **132 original bytes**. It copies the inherited Animal state through the existing compiler-generated Animal assignment and then assigns the dog's adequacy, played/talked flags, packed frisbee fields and eight-byte `unk_24` record. A named external ABI declaration retains `__as__6AnimalRC6Animal` without changing the base Animal header. The full forced `make -B -j4 compare` passed (`sh_mv2r9hc0_aff9e3e5`, `fomt.gba: OK`). The complete GameState assignment `func_080D4178` remains original assembly. See [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md).

## 2h. Exact-size persisted MoneyState and Dog layout now proven

The binary save image now embeds existing `MoneyState money` (size 0x130 at GameState+0x1AA8) and `Dog dog` (size 0x30 at +0x1C70), alongside the source-recovered `SavedByteBuffer` (+0x1CA0) and `SavedTransitionState` (+0x2C74). `include/save_persisted_layout.hh` has **25 legacy-toolchain size/offset assertions**. The complete forced ROM comparison passed (`sh_mv2rxa31_286ba6d5`, `fomt.gba: OK`). The read-only `tools/ches/inspect_sram.py` exposes source-known money balance/history/maxima, saved buffer and transition fields only for header-and-record-consistent slots, with synthetic field tests passed (`sh_mv2rs4ed_cdfcc88a`). No real player SRAM was tested. The 200-byte nested `func_080D6B40` is now conclusively a MoneyState copy but **remains ASM**, as do the 776-byte overall GameState assignment and 740-byte loader; see [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md).

## 2i. Complete major-type save layout and fieldwise copy map

The source-only persisted GameState view now contains original project-native `Farm` (+0x14, size 0x1A94), `MoneyState` (+0x1AA8, size 0x130), `Farmer` (+0x1BD8, size 0x98), `Dog` (+0x1C70, size 0x30), `SavedByteBuffer` (+0x1CA0, size 0x2C), `SavedTransitionState` (+0x2C74, size 0x0C) and `FishingRecords` (+0x2C80, size 0x1D8). Forty-one binary checks validate child/parent offsets including farm and farmer members, history records, two SRAM slots and checksums. Real class names do **not** imply all nested semantics are already recovered. Forced full ROM exact build passed (`sh_mv2saxgu_aed05dc4`). The original `func_080D4178` fieldwise copy call graph and boundaries are mapped in [SAVE_GAMESTATE_ASSIGNMENT_MAP.md](SAVE_GAMESTATE_ASSIGNMENT_MAP.md), but the parent function is still 776 bytes of retail ASM. The read-only SRAM inspector now adds fishing totals/Kings for consistent slots; synthetic tests passed, no real SRAM tried. The 740-byte loader remains ASM too.

## 2j. Farm save-state copy now natural exact C++

`CopySavedFarmState` / `func_080D64C8` now replaces the original 180-byte Farm saved-state assignment with byte-identical C++ in `src/farm_state_copy.cc`, retaining Farm's real name/packed flags, 11-word Horse placeholder, shipping records, farmhouse, specialized Coop/Barn copies and field. The declared counter/source pointer order naturally reproduces original compiler register ownership, without register forcing. Standalone `compare-function.py` and forced full-ROM `make -B -j4 compare` passed (`sh_mv2sly7y_cf9bd46e`, `fomt.gba: OK`, unchanged SHA1). Remaining saved GameState copying still includes 776-byte parent `func_080D4178`, Farmer, MoneyState, Coop, Barn, and loader. Full detail [SAVE_FARM_STATE_COPY.md](SAVE_FARM_STATE_COPY.md).

## 3. Main unresolved loader — readable behavioral model

Retail: `func_08011650` in `asm/game_state.s`,
`08011650..08011934` (**740 bytes**). Previous scratch candidate
`tools/ches/checkpoints/save-loader-08011650-2026-10-04/candidate-v103.cc`
already describes the full control flow but is **not byte-exact** and
contains compiler-register forcing; it must not enter `src/`.

Readable **behavioral pseudocode** (not compiled source):

```cpp
GameState *LoadExistingGame(GameState *target, SaveContext *context,
                            unsigned slotBase, unsigned *error)
{
    InitializeDefaultGameState(target); // MUST run before any SRAM read.
    *error = 0;

    unsigned length = 0;
    if (!ReadSram(context, &length, slotBase, 4) ||
        length != 0x34F4) {
        *error |= 0x10000 | CurrentSramError();
        return target;
    }

    if (!ReadSram(context, target, slotBase + 4, length)) {
        *error |= 0x20000 | CurrentSramError();
        return target;
    }

    unsigned storedChecksum = 0;
    if (!ReadSram(context, &storedChecksum, slotBase + 0x34F8, 4)) {
        *error |= 0x30000 | CurrentSramError();
        return target;
    }

    if (CalculateSaveChecksum(target, length) != storedChecksum)
        *error |= 0x10000 | CurrentSramError();

    return target;  // The pointer is nonnull even on many failure paths.
}
```

**Crucial:** `*error==0` determines success. The loader initializes a
default state *before* attempting to overwrite its raw payload. A truncated
or partially failed read can overwrite some defaults. No post-read field
migration/fixup runs on its successful path.

### Verified default initializer call order

These are offsets **within the serialized 0x34F4-byte GameState**, not
addresses of SRAM records. Some names remain deliberately neutral until
their consumers and fields are fully understood.

| Offset | Action before the first save read |
| --- | --- |
| +0x08,+0x0C,+0x10.. | Zero weather/forecast, initialize year/date and packed time flags |
| +0x14 | Construct Farm using fixed name/default data |
| +0x1AA8 | Initialize a farm-adjacent subobject (`func_0809AB8C`) |
| +0x1BD8 | Construct Farmer using the default date |
| +0x1C70 | Construct Dog |
| +0x1CA0 | Initialize neighboring animal/pet state (`func_0800FF8C`; exact role to confirm) |
| +0x1CCC | Set location/map sentinel `0x234` and clear packed location fields |
| +0x1CD4 | Initialize fixed social state (`func_0809EEE8`; 0x478-byte region) |
| +0x214C | Initialize adjacent social/character state (`func_0809C6BC`) |
| +0x21CC..+0x2200 | Initialize state words, status and string/byte ranges |
| +0x2210,+0x2214 | Initialize two persistent neighboring blocks |
| +0x2C1C..+0x2C74 | Reset packed status/flag data and a ten-record region |
| +0x2C80 | Initialize fishing records (`func_0809CD78`; 59 × 8 bytes) |
| +0x2E58 | Initialize mine state (`func_0809CE8C`; 0x628 bytes) |
| +0x3480 | Initialize cursed-tool progression (`func_0809C144`; 0x14 bytes) |
| +0x3494..+0x34C4 | Reset parts of two adjacent 0x10-byte blocks; more structure needed |
| +0x34C8 | Initialize 16-byte ground-pickup state |
| +0x34D8 | Initialize four-byte state |
| +0x34DC | Initialize actor-associated tail state |

The **real loader** needs meaningful typed structures for all these regions
and the identical C++ initialization order, not just a giant `memset`.
The exact source is presently blocked by compiler temporary/zero ownership
and register-lifetime effects, not a missing high-level read/checksum concept.
Read the October 4–5 closed experiments before attempting another compiler
candidate. The latest diagnostic identifies a constructor/first-fill zero
identity split under the tracked 13-rule compiler; do not add target-specific
compiler patches, hard registers or fake volatile barriers to claim success.

## 4. UI/scene save and load lifecycle, still assembly

| Original function | Evidence-based responsibility | Remaining work |
| --- | --- | --- |
| `func_08003F9C` | Save-menu writer: choose slot base from UI selection, call `WriteSaveSlotRecord` with up to three attempts, then mark slot valid and write selected slot on successful save | Reconstruct complete UI, failure and retry paths as readable exact C++ |
| `func_080040A0` | Active-game load: allocate exactly 0x34F4 bytes, call loader, **check error output** before replacing the owner, then write selected-slot header | Recover owner-transfer/error/retry and UI branches |
| `func_080041DC` | Construct/load selection scene, inspect valid-slot mask, call loader for each occupied slot to populate the display/state | Recover slot iteration, preview and ownership behavior; validate success/failure branches |
| SRAM writer/error dispatcher | Read `func_080006E4` and error dispatcher `func_08000728` are source-exact C++; write proxy `func_080006A4` remains ASM (best natural candidate differs by four register-allocation bytes) | Recover write/erase and remaining hardware code without codegen forcing |

The loader calls and direct header functions prove these paths; the detailed three-attempt retry, error-word, and new-state ownership branches are recorded in [SAVE_MENU_RETRY_TRACE.md](SAVE_MENU_RETRY_TRACE.md). The *complete* UI control flow is not yet fully typed or byte-exact. The loader
and UI remain in assembly until proven natural source exists.

## 5. Acceptance conditions — user-directed save-first priority

Before declaring save decompilation **done**:
1. Convert the `func_08011650` default initializer and read/validate path
   to natural, typed, fully byte-exact C++; independently match the real ROM.
2. Recover all relevant persistent `GameState` subobjects into documented,
   meaningful types without inventing the semantics of unresolved bits.
3. Recover `func_08003F9C`, `func_080040A0`, `func_080041DC` and remaining
   save menu/new-game/copy/erase/cancel/slot-selection paths as readable source.
4. Recover and type the SRAM I/O proxies, read/write error paths and header
   lifecycle; preserve every retail behavior.
5. Run isolated matching proofs and a **forced full** `make -B -j4 compare`.
   Verify retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
6. Validate real backed-up emulator SRAM files (both slots, valid/corrupt and
   failures, new game, overwrite, clear/erase, retries, selected-slot handling).
7. Keep the user's **custom-game** worktree untouched until the save
   reconstruction meets these gates; a readable behavioral reference is a
   research aid, not proof that any unfinished function has been decompiled.

The save system is **not yet complete** despite full header management source.
It takes precedence over unrelated throughput work until the user changes
priorities.
