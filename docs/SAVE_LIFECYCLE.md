# Retail save lifecycle — readable source and open matching frontiers

**Active highest-priority subsystem, reaffirmed October 11, 2026.** The objective is a
fully **human-readable and retail-byte-exact** reconstruction of the save
system before adding custom persistent content. Not all save functions have
reached that standard yet; do not confuse a recovered behavior with an exact
C++ production replacement. Keep retail changes on `main` and do not alter
the `custom-game` worktree during this priority.

**Publication verified October 11:** `ec6d61b` pushed to `ches/main`, following `ac239ba` (exact Barn/Farmer assignments and typed Rucksack cleanup). `497395f` and `f069823` are historical checkpoints; check Git for newer HEAD. Source-exact save code also includes Farm/Dog assignments, GameState cleanup, byte-buffer and transition methods; consult the [evidence matrix](SAVE_EVIDENCE_MATRIX.md) and [current handoff](../tools/ches/NEXT_AGENT_HANDOFF.md). The GameState-loader behavioral pseudocode below is research, not an exact compiled replacement. The save system remains incomplete.

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

`CopySavedFarmState` / `func_080D64C8` now replaces the original 180-byte Farm saved-state assignment with byte-identical C++ in `src/farm_state_copy.cc`, retaining Farm's real name/packed flags, 11-word Horse placeholder, shipping records, farmhouse, specialized Coop/Barn copies and field. The declared counter/source pointer order naturally reproduces original compiler register ownership, without register forcing. Standalone `compare-function.py` and forced full-ROM `make -B -j4 compare` passed (`sh_mv2sly7y_cf9bd46e`, `fomt.gba: OK`, unchanged SHA1). The Barn copy at `080D657C` is now byte-exact natural C++ (**296 bytes**), with independent zero-byte difference and isolated/production full-ROM proofs (`sh_mv2tshhj_2b10282d`, `sh_mv2ttfmz_7d3abce8`). See [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md). Farmer `func_080D68C0` is also now exact typed C++ (**448 bytes**), including a binding to the original `memcpy` library call for a two-byte ToolStack and the original address alias. Isolated and production full-ROM gates passed (`sh_mv2ub3me_43db97be`, `sh_mv2ubxc2_e766423e`); see [SAVE_FARMER_STATE_COPY.md](SAVE_FARMER_STATE_COPY.md). The adjacent 64-byte cleanup at `080D6B00` was already exact but has now been rewritten with real Rucksack types and independently full-ROM verified (`sh_mv2utzp3_be621085`); this does not increase recovered code bytes. The **128-byte** saved Rucksack copy at `080D6A80..080D6B00` remains original ASM; see [SAVE_RUCKSACK_COPY_RESEARCH.md](SAVE_RUCKSACK_COPY_RESEARCH.md). Remaining saved GameState copying still includes 776-byte parent `func_080D4178`, nested Rucksack, MoneyState, and loader. The 292-byte Coop copy was later recovered exactly; see the October 11 production update below. Full detail [SAVE_FARM_STATE_COPY.md](SAVE_FARM_STATE_COPY.md).

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

## 2k. Nonzero random GameState initialization helper (October 11)

`GenerateNonzeroRandomValue` / `func_08010348` at `0x08010348..0x08010358` (16 linked bytes) is source-exact in `src/game_state_random.cc`. It calls `rand()` until the returned value is nonzero, then returns that value. The sole original assembly caller is the default-state initializer `func_08010358`. The source keeps the original symbol alias, and the linker inserts it before the remaining `asm/game_state.s` initializer body. Standalone `compare-function.py` reported 16/16 exact bytes (`nonzero-state-random-v1`); forced `make -B -j4 compare` passed (`sh_mv2y9q05_335fc8c0`, original ROM SHA1 unchanged). This is a genuine **16-byte whole-game source-coverage increase**, but not part of the bounded 12-function save-copy evidence matrix and does not complete save loading.

The existing `/mnt/data/Github/gba/fomt/baserom.sav` was inspected read-only on October 11 with `tools/ches/inspect_sram.py`: correct 32KiB geometry and retail header signature, but valid-mask 0 and invalid record lengths/checksums for both slots. It provides **no real saved slot** for a load round-trip; synthetic tests remain the only SRAM inspection proof.

## 2l. Exact daily shipping settlement and double-payout research (October 11)

`ApplyDailyShippingRevenue` / `func_0801140C` at **`0x0801140C..0x08011458` (76 bytes)** is now natural, linked-byte-exact retail C++ in `src/game_state_shipping_revenue.cc`, with the original address alias and linker/source ownership. The input is the live serialized GameState image: `ShippingBin` at `GameState+0x54`, `MoneyState` at `GameState+0x1AA8`, and an unresolved single-byte extra-payout flag at `GameState+0x34C5`. The original **reads** `GetValueShipped`, **credits** MoneyState once through `func_0809ABD8`, credits the same amount a second time only when the flag is nonzero, clears the flag after the second credit, then **resets** ShippingBin value and returns whether the pre-reset value was nonzero. Preserve the order and separate saturation behavior of the two calls; do not replace them with one call of `2 * amount`. The original branch-free nonzero result compiles exactly from `(amount | (0u - amount)) >> 31`. No change to serialized offsets, save-writing format, or intentional game behavior.

- Scratch proof: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-shipping-save-20261011/shipping-revenue-v2.mismatch.txt`, `.diff`, and compiled artifacts: 76 expected / 76 generated, **0 differing linked bytes**. v1 had 80 bytes and 21 differing bytes because `amount != 0` compiled a conditional branch; v2 expresses the unsigned nonzero bit calculation already present in retail.
- Production proof: forced `make -B -j4 compare` `sh_mv2yncvw_ce4aa268` exited 0, `fomt.gba: OK`, original SHA1 unchanged. Inventory regeneration `sh_mv2yo6sx_4eeb4252` now reports 91,480 exact code bytes / 940,036 (9.7315%) and 1,944 remaining ASM functions. The bounded 12-function *saved-state copy* evidence matrix remains 7 exact / 5 ASM, unchanged.
- **External gameplay correlation, not yet ROM-proven flag identity:** The GBA game's Shooting Star event (Fall 10, every fifth year) offers a wish that doubles shipping profits the next day. See the original-game [GameFAQs GBA cheats page](https://gamefaqs.gamespot.com/gba/589702-harvest-moon-friends-of-mineral-town/cheats) and [2004-era Neoseeker discussion](https://forums.neoseeker.com/1504/t318965-all-need-to-know-about-random-events/). The observed double credit/one-shot clear is consistent with that event, but **the specific script or caller setting the byte at `GameState+0x34C5` has not yet been proven**. Keep the neutral field name until its writer or a controlled emulator trace is identified. Data Crystal's [GBA RAM map](https://datacrystal.tcrf.net/wiki/Harvest_Moon_-_Friends_Of_Mineral_Town%3ARAM_map) documents load-dependent memory relocation; never equate a fixed emulator RAM address with a serial payload offset without deriving the active GameState base.

**Money-history cluster:** The immediately related ordinary-day money rollover `func_0809ADA8` (196 bytes) and season boundary `func_0809AE6C` (428 bytes) remain ASM. Two typed ordinary-day candidates in the same scratch folder describe the high-level max-history update, bounded oldest-record shift, and zero-record append: `money-daily-rollover-v1.cc` compiles to **168 bytes / 160 differing linked bytes**; the `std::copy` shift variant `money-daily-rollover-v2.cc` compiles to **172 bytes / 157 differences**. Neither is a matching replacement. A structurally different original counted-shift/copy shape (and old compiler's MoneyHistory iterator/placement semantics) must be established before proceeding. A separate 72-byte packed ScriptEngine owner initializer `func_080D4130` was tested as `script-owner-record-v1.cc` (68 bytes/65 differing) and left in ASM; it is not a save-copy completion. These failed probes were scratch-only, never installed.

## 2m. Packed saved-state readers and high-animal-affection predicate (October 11)

**Nine byte-exact C++ routines totaling 220 bytes** now replace the consecutive retail region `0x08010E48..0x08010F24` without gaps: four packed-bit readers (32 B), a 156-byte animal-affection predicate, then four more packed-field readers (32 B). The subsequent four state bit setters at `0x08010F24..0x08010F54` were already exact and are **not** new coverage. Their original ABI symbols and function entrypoints remain linked at their retail addresses.

- `src/game_state_packed_readers.cc`: `func_08010E48`, `func_08010E50`, `func_08010E58`, `func_08010E60` each extract bits 0..3 of the first byte, with exact 8-byte Thumb bodies. `func_08010F04` extracts bit 4; `func_08010F0C` extracts a five-bit field starting at bit 13 of the first word; the formerly raw-byte, **unlabeled** routine at `0x08010F14` extracts a seven-bit field starting at bit 2 of the halfword at offset +2; `func_08010F1C` extracts a six-bit field starting at bit 1 of the byte at +3. Each is 8 bytes. Neutral names are intentional: callers and storage widths are proven, but the gameplay meaning of all flags is not.
- `src/game_state_animal_affection.cc`: `AllOwnedAnimalsHaveHighAffection` / `func_08010E68` is a **156-byte** predicate on the existing typed `PersistedGameStateLayout`. It returns true only if the Dog and every **present** Horse, Chicken, Cow or Sheep have `Animal::GetAffection() > 199`. Missing slots are skipped; a present Cow is checked before attempting Sheep at the same stall. The original predicate is referenced by a completion-condition dispatch near the shipping-category completeness queries in `asm/code_0803EE94.s` (around the call at line 6348). This establishes the behavior, not the name of any unseen achievement/event.
- The seven originally labeled getter routines were already entered by assembly callers. The new `func_08010F14` alias marks a previously unlabeled eight-byte machine-code region, not a new original source symbol discovery. The assembly inventory consequently dropped **eight** linked ASM *function records*, whereas the source batch exposes **nine** C++ entrypoints. Never count the record delta as nine without noting this distinction.
- Matching proof directory: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-header-flags-20261011/`. `bit_getters.cc` with byte bitfields matched size but differed in the first load width (`ldr` instead of `ldrb`), 1 linked byte each. `bit_getters_v2.cc` uses type-correct byte/halfword/word loads and natural unsigned two-shift extraction, **zero differences for all seven named addresses**. `field_middle.cc` matches the eighth unlabeled 8 B address exactly. `animal-affection-v1.cc` naturally matched 156-byte size with **16 differing bytes**, solely loop-init vs farm-base address scheduling. Moving loop-counter initialization before the typed Coop and Barn references in `animal-affection-v2.cc` matched **all 156 bytes**, without forced registers/patches. All scratch variants remain outside production.
- Full forced `make -B -j4 compare` proof: Ches execution **`sh_mv2z76qn_80272299`**, exit 0, `fomt.gba: OK`, original retail SHA1 unchanged. Regenerated inventory `sh_mv2z7vsr_967346fb`: 91,700 / 940,036 exact C++ bytes (9.7549%), **848,336** ASM bytes / **1,936** linked ASM functions. The tracked 12-function saved-state assignment subset remains 7/12 exact, 37.5% of that subset only; loader, memory state copies and real SRAM round-trip are still unfinished.

## 2n. Exact capped packed-field update and first-byte flag initialization (October 11)

Two additional functions adjoining the exact shipping payout and record flag (see [SAVE_PACKED_PROGRESS.md](SAVE_PACKED_PROGRESS.md)) are now linked byte-exact source:

- `func_08011464` at `0x08011464..0x08011498` (52 B): `src/game_state_packed_progress.cc`, `IncreasePackedHeaderProgress`. Reads the 5-bit field at **bits 13..17** in GameState's first 32-bit word, caps the request at 99, only updates if the current five-bit field is smaller, writes the low five bits of the capped request, returns a success boolean. Its unusual cap/field-width mismatch is **retail behavior**, not a decompilation defect to repair here. Typed `u32` bitfield source `header_setters_v3.cc` matched 52/52 bytes with zero differences. More conventional mask expressions were different in the original compiler.
- `func_080114F8` at `0x080114F8..0x08011510` (24 B): `src/game_state_header_flag_init.cc`, `InitializePackedHeaderFlags`. Clears flag **bit 0**, sets **bits 1, 2, 3**, preserves other bits. The exact original source shape uses four natural `bool` bitfield assignments and produces all 24 retail bytes; isolated proof `flag-v4`. Note that the original `negs` instruction creates **-2, which clears bit 0**.
- The shared packed word layout is supported from both read and write evidence as **13 low bits, 5-bit first field, 7-bit second field, 6-bit third field and 1 high bit**, totaling 32 bits. **`func_080114C8` is now exact 48-byte C++**, with a genuine packed 8-bit bitfield at `GameState.header+3` (6-bit field bits 25..30), as validated by full retail SHA1. The **other 48-byte setter `func_08011498` remains ASM**: manual masks and natural unsigned 16-/32-bit bitfield forms remain nonmatching. See [SAVE_PACKED_PROGRESS.md](SAVE_PACKED_PROGRESS.md) for the new packed-type ABI proof and older failures.
- Full forced production compare `sh_mv2zjs7o_1c4bad58` passed (`fomt.gba: OK`, unchanged retail SHA1) after integrating both via original aliases and linker slots. Inventory `sh_mv2zkp8n_0ced8014` reports **91,776/940,036 (9.7630%) exact C++ bytes**, **848,260 remaining ASM bytes**, **1,934 linked ASM function records**. This 76-byte source ownership increase is outside the bounded 12-function save-copy subset, which remains 7/12 exact. No actual saved SRAM round-trip was tested.

## 2o. Newest-first money-history accessors (October 11)

`func_0809B018` (daily, 32-byte linked span) and `func_0809B038` (seasonal, 36-byte linked span) are now natural C++ methods in `src/money_history_lookups.cc`. Each accepts `MoneyState *` and an unsigned reverse index: index 0 returns the newest stored `MoneyRecord`; larger valid indices walk backward, and an out-of-range index returns a pointer to the **first record**. This out-of-range fallback is retail behavior, not a suggested new API design; neither routine checks whether the history count is nonzero. The code uses the existing `MoneyHistory<30>` and `MoneyHistory<4>` fields without artificial codegen hints. Original address aliases and text-section boundaries remain intact.

**Matching trap resolved:** isolated `--symbol` comparisons of the natural v3 implementations each reported only a **2-byte size shortfall**, with **no differing positions** and empty instruction diffs. In AGBCC output the two routine bodies were 30 and 34 bytes, followed by the assembler's ordinary `.align 2,0` instruction alignment to 32/36-byte linked spans. A **single contiguous two-function** comparison `0x0809B018..0x0809B05C` found **68/68 matching linked bytes**, zero differences: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-accessors-20261011/lookup-pair.{diff,mismatch.txt}` (Ches `sh_mv30r4xu_6ade28bf`). That is a real linker/compiler behavior—not permission to insert arbitrary padding into source. Production forced `make -B -j4 compare` then passed original SHA1 (`sh_mv30sdba_08cf59fc`). The generated inventory reports **91,844/940,036 exact source bytes (9.7703%), 848,192 assembly bytes, 1,932 unresolved linked assembly function records**.

**Unfinished nearby**: daily/season boundary rollovers `0x0809ADA8` / `0x0809AE6C` (196/428 bytes) and the four adjacent peak-record queries `0x0809B05C..0x0809B104` (168 linked bytes total) remain ASM. The latter were tested as one six-method scratch batch; initial v1, pointer-oriented v2 and history-reference v3 leave 7–19 differing bytes on the peak accessors. V3 resolved the lookup layout, not peak register selection. Revisit peaks only after structural pointer-lifetime/compiler evidence; do not prematurely count them exact. This batch adds **zero** to the separate 12-function save-copy matrix, still 7/12 exact. No real save-file/emulator round-trip was performed.

## October 11 production update — typed Coop state copy exact

`func_080D66A4` Coop-state assignment (**292B**) is now owned by `src/coop_state_copy.cc`, not `asm/code_linkonce.s`. The natural packed-header/memberwise field copy matches both the local October-2003 Nintendo/Cygnus compiler and the unmodified May-2000 compiler byte for byte. A compiler-internal **call-crossing liveness** distinction in the existing tracked FoMT compatibility rule restores exact output across both Coop copy and `Coop::DayUpdate`; a previous blanket source-variable approach produced a 4-byte regression in DayUpdate, now resolved without magic numeric thresholds or register forcing. A newly rebuilt pinned official compiler and default production **`make test` passed with `fomt.gba: OK`**, `sh_mv32kflp_e537e2d3`. Code-source ownership **92,136/940,036 bytes (9.8013%)**; **847,900** ASM bytes / **1,931** unresolved linked ASM functions remain. The bounded saved-state copy/cleanup matrix is **8/12 exact, 1,576/3,420B (46.1%)**, *not* the complete save system. Loader 740B, parent GameState assignment 776B, active Rucksack copy 128B and MoneyState copy 200B are still ASM, alongside separate save/SRAM/UI logic. **No real player save/load emulator round-trip has been tested**. See [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md) and [FOMT_COMPILER_RESEARCH.md](FOMT_COMPILER_RESEARCH.md).
