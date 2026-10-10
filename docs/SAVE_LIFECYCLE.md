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
| SRAM read/write proxies | `func_080006E4` reads and `func_080006A4` writes; error indicator `gUnk_03000400` | Reconstruct their full low-level contracts, remaining assembly and hardware edges |

The loader calls and direct header functions prove these paths, but the
*complete* UI control flow is not yet fully typed or byte-exact. The loader
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
