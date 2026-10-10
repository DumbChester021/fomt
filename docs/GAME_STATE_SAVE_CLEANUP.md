# GameState save-load cleanup: exact C++ cluster

## Source-verified integration (October 10, 2026)

The three routines below participate in destruction/cleanup of the persistent GameState loaded from SRAM. They are now normal, readable C++ in `src/game_state_cleanup.cc`, with unchanged original aliases and linked entrypoints.

| Readable C++ API | Retail symbol and address | Exact code bytes | Proven contract |
| --- | --- | ---: | --- |
| `CleanupGameState` | `func_080D4480`, 0x080D4480 | 84 | Walk saved-byte-buffer count/range at +0x1CA0/+0x1CA4, clean the nested blocks at +0x1C38 and +0x1AA8 using cleanup mode 2, and release GameState allocation only when mode bit 0 is set |
| `CleanupGameStateBlock1C38` | `func_080D6B00`, 0x080D6B00 | 64 | Walk a two-byte-entry collection using count +0x24 and a four-byte-entry collection using count +0x00; release the enclosing allocation only when mode bit 0 is set |
| `CleanupGameStateBlock1AA8` | `func_080D6C08`, 0x080D6C08 | 80 | Walk an eight-byte-entry collection using count +0xFC and another using count +0x08; release allocation only when mode bit 0 is set |

**Total: 228 newly exact linked bytes, three fewer unresolved linked assembly functions.** Nested block suffixes identify the GameState-relative offsets and are not assertions about a specific gameplay object. The zero-effect element walks are preserved because original retail code advances over those ranges without invoking element cleanup functions. Do not replace these routines with a raw `memset`, unconditional `delete`, or an unrelated allocator protocol.

### Why it matters for loading

`func_080040A0` in `asm/new_game.s` checks the loader's **error out-parameter** before accepting a newly loaded GameState. When an existing GameState object is present, it performs the observed sequence:

1. `CleanupGameState(existingState, 2)` calls nested cleanup but **does not free the existing allocation**.
2. `func_080D4178(existingState, newlyLoadedState)` performs a fieldwise, subobject-aware **assignment** rather than replacing the existing GameState pointer.
3. `CleanupGameState(newlyLoadedState, 3)` destroys nested data and **does free the temporary GameState allocation**.

The no-existing-state branch instead transfers ownership of the freshly allocated GameState to a new eight-byte owner wrapper. The failed-read branch deletes the newly allocated buffer without changing the active state. See [SAVE_MENU_RETRY_TRACE.md](SAVE_MENU_RETRY_TRACE.md) for the UI/retry branches.

**Still assembly:** the 776-byte `func_080D4178` GameState assignment, 740-byte `func_08011650` default-initializer/loader, write/load menu handlers `func_08003F9C`/`func_080040A0`, and other slot maintenance. Matching these is still required before claiming the whole save system has been decompiled.

### Evidence, integration and proof

- Independent scratch directory: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-loader-ownership-20261010/`.
- Standalone zero-difference proofs: `proofs/cleanup-v4.diff`, `proofs/cleanup-named.diff`; `proofs/nested-farm-cleanup-v3.diff`, `proofs/nested-farm-cleanup-named.diff`; `proofs/nested-money-cleanup-v1.diff`, `proofs/nested-money-cleanup-named.diff`.
- All three are **ordinary C++**, with no pinned registers, forced assembly instructions, compiler modification, fake volatile state or ROM patching. The key source-shape improvement was calculating each collection's total byte count before its endpoint; this reproduced the original compiler's pointer arithmetic and allocation.
- Original code was removed only from its exact spans in `asm/code_linkonce.s`. New production entrypoints are owned by `src/game_state_cleanup.cc` using linker sections `.text.game_state_cleanup`, `.text.game_state_block_1c38_cleanup`, and `.text.game_state_block_1aa8_cleanup`; remaining neighboring assembly is preserved.
- Forced full-ROM `make -B -j4 compare` **passed** with original retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, after the final integration (Ches execution `sh_mv2ko6kd_c44d36db`, `fomt.gba: OK`). Earlier passes `sh_mv2kg40p_c4e970d1` and `sh_mv2kl8lh_eb63eaed` verified earlier stages.
- New inventory: **90,332 / 940,036 = 9.6094% matching source game-code bytes**, **849,704 linked ASM bytes / 1,950 remaining functions**, meaningful ROM **166,282 / 7,717,440 = 2.1546%**.
- The custom-game worktree was not modified. All changes are local and uncommitted until separately published.

### Newly recovered adjacent assignment dependency

The Dog state assignment called from `func_080D4178` at GameState+0x1C70 is now byte-exact: `CopySavedDogState` / `func_080D67C8`, another **132 linked source bytes**, in `src/dog_state_copy.cc`. The base `Animal` class still generates its original implicit assignment symbol; a named C++ ABI declaration preserves the call without changing shared `include/animal.hh`. See [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md). This was integrated in a subsequent matching batch and is separate from the three cleanup functions / 228 bytes above.

### Next useful dependencies

Reconstruct `func_080D4178` into a meaningful field/subobject assignment (do not collapse it to raw memcpy), recover the complete `func_08011650` loader's real typed default initialization, and test actual backed-up player SRAM in both menu and failure paths. Reading the October 4–5 loader anti-rediscovery ledger before new source experiments is mandatory.
