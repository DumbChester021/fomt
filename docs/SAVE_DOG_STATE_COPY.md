# Exact Dog state copy used by GameState save loading

## Verified integration

`func_080D67C8` at original ROM range `0x080D67C8..0x080D684C` (132 bytes) is now source-owned by `CopySavedDogState` in `src/dog_state_copy.cc`. Both the original function symbol and the readable name resolve to the same address. It copies the dog subobject of a GameState during the larger fieldwise assignment `func_080D4178`, which remains retail assembly.

Unlike a flat `memcpy`, the original function first invokes the **compiler-generated `Animal::operator=`**, then copies dog-specific fields individually: `adequacy`, `has_played_today`, `has_talked_today`, `unk_20`, the full `UnkBarnAnimal2C_x2 unk_24` pair, `frisbee_record`, `unk_2D_2` and `frisbee_gauge_limit`. These are the project's existing real `Dog` and `Animal` types from `include/dog.hh` and `include/animal.hh`, not an invented source clone. The copied fields include packed bitfields, which is why ABI correctness matters.

## Legacy compiler assignment linkage

**Critical anti-regression:** Do **not** add an explicit copy-assignment declaration to `Animal` in `include/animal.hh` as a shortcut. That suppresses the old compiler's *implicit* definition of its `__as__6AnimalRC6Animal` symbol. A forced full-ROM link actually failed with unresolved references from other Animal users after that experiment. The original header was fully restored.

Instead, `src/dog_state_copy.cc` uses a **readable declaration of the original external ABI symbol**:
```cpp
EXTERN_C Animal * CopyAnimalBase(Animal *, Animal const *)
    asm("__as__6AnimalRC6Animal");
EXTERN_C_END
```
The symbol-name declaration is an existing project-supported way to specify old ABI entrypoints. It is not inline assembly, a compiler patch, or register forcing; the original linker-owned Animal assignment remains generated elsewhere. The ordinary C++ Dog copy then calls `CopyAnimalBase(dest, src)` and assigns the actual typed fields. No unrelated base-class header or implicit-assignment behavior has been changed.

A temporary research candidate with an explicit `Animal::operator=` generated the original 132 bytes in isolation but broke the full link. A subsequent candidate using the external original assignment symbol passed the **forced full-ROM comparison** after restoring the real header. Keep the latter and do not repeat the failed approach.

## Proof and integration

- Standalone source with the actual `Dog` and `Animal` member types, before ABI correction: `proofs/dog-copy-actual-v1.diff` (0 differing bytes, subject to original compiler-generated symbol availability).
- **Final production source proof:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-loader-ownership-20261011/proofs/dog-copy-production.diff`, 132/132 original bytes matched.
- Forced full-ROM build **passed**: Ches execution `sh_mv2r9hc0_aff9e3e5` returned exit 0 with `fomt.gba: OK`, retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Linker seam: `src/dog_state_copy.o(.text.save_dog_copy)` is placed between `asm/code_linkonce.o(.text.after_game_state_cleanup)` and the original `*(.gnu.linkonce.t.__as__6AnimalRC6Animal)`. Only the original 132-byte assembly block in `asm/code_linkonce.s` was deleted; all neighboring code remains original.
- Inventory after build: **90,464 / 940,036 exact C++ game-code bytes (9.6235%)**; **849,572 remaining ASM bytes / 1,949 linked functions**; meaningful reconstructed ROM **166,414 / 7,717,440 (2.1563%)**.
- The persistent retail branch `main` contains local uncommitted changes and the custom-game worktree was not touched.

## Next work

The much larger `func_080D4178` also copies farm, farmer, money, social, fishing/mine and saved-byte-buffer state. The nested block at GameState+0x1AA8 is now **proven to be actual `MoneyState`** by the established `MoneyHistory<30>` and `MoneyHistory<4>` type offsets; the persisted layout now embeds it with compile-time size/offset checks. The read-only inspector decodes source-backed MoneyState fields only for structurally valid slots. A typed standalone MoneyState assignment candidate remains nonmatching (196 versus 200 original bytes); see the current handoff. Its nested block copy `func_080D6B40` at `080D6B40..080D6C08` is understood behaviorally (two counted collections, packed flags and two trailing records), but the researched ordinary C++ candidates `nested-copy-v1.cc` and `nested-copy-v2.cc` in the same scratch directory do **not** match original code (192 vs 200, and 180 vs 200 bytes respectively; many differing bytes). Neither was promoted. Do not replace the parent assignment with raw `memcpy` or assume this individual dog copy completes save/load. Read the October 4–5 loader experiment ledger before new `func_08011650` compiler probes.
