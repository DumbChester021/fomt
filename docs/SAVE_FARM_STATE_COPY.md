# Retail-exact Farm state assignment (save-load dependency)

## Matched source integration (October 11, 2026)

`CopySavedFarmState` in `src/farm_state_copy.cc` now replaces `func_080D64C8`, original US FoMT `0x080D64C8..0x080D657C` (**180 machine-code bytes**). This is the specialized `Farm` assignment called by GameState's larger `func_080D4178` source/destination copy at GameState+0x14. It is not a raw Farm-wide memcpy or the implicitly generated `Farm::operator=`.

The function is written using the project's actual `Farm` type. It copies the fixed farm name through `FixedStr`, the tracked 10-bit farm value and three packed farm flags through typed assignments; advances through **11 32-bit words of the 0x2C-byte horse placeholder** in a normal for-loop; assigns `ShippingBin` and `FarmHouse` using their existing C++ types; invokes the original specialized `Coop` and `Barn` assignments `func_080D66A4` and `func_080D657C`; and copies the full `Field<43,25>` member by its actual C++ type. All result sizes/offsets are already validated by `include/save_persisted_layout.hh`.

### Why the original 180-byte instruction shape appeared

The naive `*dst = *src` implicit Farm assignment compiled to **788 bytes**, unlike retail's 180, because it copies nested structures differently. A typed per-member assignment using the actual `Farm` class was much closer: `farm-specialized-v1.cc` compiled to 184 bytes with 54 linked differences, chiefly because copying the horse placeholder aggregate in one expression emitted unrolled load/store groups.

Replacing just that aggregate copy with an **ordinary counted word loop** produced correct-size 180-byte code with six byte differences; the copy loop and all other instructions matched. The remaining difference was the order of source-pointer and counter initialization. Declaring `count = 10` between the target and source pointers (while looping `count != -1`) generated the retail's original instruction order and **zero byte differences**. This uses no forced registers, compiler patches, fake volatility or handwritten assembly.

Independent scratch evidence:
- `/mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/farm-shape-probes.py` — candidate comparison, initial 184/54 down to 180/6.
- `/mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/farm-order-probes.py` — declaration-order bounded probe; variants order-a, order-c, order-d matched 180/180.
- **Final named production proof:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/proofs/farm-production.diff` — `expected=0xb4, actual=0xb4, differing linked bytes=0`.

The original 180-byte ASM (including associated literal pool) was removed from `asm/code_linkonce.s` only at its own boundary, preserving surrounding ASM. The linker now places `src/farm_state_copy.o(.text.save_farm_copy)` immediately after `asm/code_linkonce.o(.text.after_game_state_cleanup)`, followed by `asm/code_linkonce.o(.text.after_save_farm_copy)` and previously integrated Dog code. Readable `CopySavedFarmState` and retail alias `func_080D64C8` resolve to the same location.

**Full forced retail match:** `make -B -j4 compare` passed (Ches execution `sh_mv2sly7y_cf9bd46e`, `fomt.gba: OK`), unchanged retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Inventory regenerated (`sh_mv2smhrl_9e529554`); newly recovered +180 C++ bytes, 1 fewer ASM function. Current totals: **90,644 / 940,036 (9.6426%)**, linked ASM **849,392 bytes / 1,948 functions**, meaningful ROM **166,594 / 7,717,440 (2.1587%)**.

### Still required for fully understandable saves

The Farm copy's `Coop` and `Barn` subcopy methods, Farmer, MoneyState, parent GameState assignment `080D4178` (776 bytes), and principal loader `08011650` (740 bytes) still contain original assembly and unknown semantic parts. Matching the Farm copy is one concrete dependency solved, **not** full save-system completion. The production `Farm` class was not modified, and the custom-game worktree remains untouched.

Cross-reference [SAVE_GAMESTATE_ASSIGNMENT_MAP.md](SAVE_GAMESTATE_ASSIGNMENT_MAP.md), [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md), [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md) and [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md).
