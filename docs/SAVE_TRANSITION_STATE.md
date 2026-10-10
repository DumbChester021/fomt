# Saved transition state at GameState+0x2C74

This persisted subobject is constructed both in the normal GameState creation path and in the loader `func_08011650`. The daily update calls `func_08011568` on the same offset. The high-level identity of the two indices is **not yet proven**; field names are neutral descriptions of observed operations, not a claim about which game feature owns them.

## Verified layout

`include/save_transition_state.hh` currently models:

| Offset | Type | Semantics supported by retail assembly |
| --- | --- | --- |
| +0x00 | `u32 current_index` | Initialized to 16 (unset); directly writable and readable |
| +0x04 | `u32 pending_index` | Initialized to 16; copied from current when armed, reset on clear |
| +0x08 | `u8 countdown` | Initialized to 0; set to 2 when armed; decremented once per eligible daily update |
| +0x09..0x0B | 3 reserved bytes | Included for four-byte-aligned 12-byte working type; ownership/meaning unproven |

The exact original-entrypoint range **`0x08011510..0x08011588` (120 bytes)** is now wholly source-owned in `src/save_transition_state.cc`. Each function has independent zero-difference proof under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/proofs/`.

| API | Address | Exact bytes | Observed behavior |
| --- | --- | ---: | --- |
| `InitializeSavedTransitionState` | 08011510 | 12 | Set both indices to 16, countdown to 0 |
| `GetSavedTransitionCurrentIndex` | 0801151C | 4 | Read first index |
| `GetSavedTransitionPendingIndex` | 08011520 | 4 | Read second index |
| `IsSavedTransitionReady` | 08011524 | 28 | True iff pending index is not 16 and countdown is zero |
| `SetSavedTransitionCurrentIndex` | 08011540 | 4 | Assign current index, without bounds checking |
| `ArmSavedTransition` | 08011544 | 12 | Copy current to pending; set countdown to 2 |
| `ClearSavedTransition` | 08011550 | 24 | Clear current to 16 only if equal to pending; always clear pending |
| `TickSavedTransition` | 08011568 | 32 | Decrement countdown if both indices are not 16 and countdown is nonzero |

**Integration proof:** the new typed source, original names as aliases, linker seam and neighboring assembly yielded a full forced `make -B -j4 compare` with exit 0 (Ches execution `sh_mv2a88yy_5e2116a0`, output `fomt.gba: OK`, original retail SHA1). A later inventory rebuild `sh_mv2a8yxy_b7a0ddfa` confirmed eight fewer linked assembly functions.

This subsystem provides typed initialization and state evolution on the save-loader path. It does **not** imply the entire `GameState` loader, save-menu UI, erasure/copy/validation, or any untested migration is decompiled. The previously unknown identity of the indices must be resolved through their nonconstructor callsites before renaming the state to a gameplay-specific concept.

## Neighboring exact source

The function immediately before the packed progress setters, `func_08011458`, is now exact 12-byte C++ in `src/save_packed_flag.cc`: it sets bit 4 in the record's first byte. The symbol is a standalone packed-record function and has **not** been inferred to operate on `SavedTransitionState`; see [SAVE_PACKED_PROGRESS.md](SAVE_PACKED_PROGRESS.md).

## Neighboring packed-state probes

`asm/game_state.s` also contains `080114C8` and `080114F8` immediately before this subsystem. Natural scratch candidates identify packed flags and a 6-bit progress field, but these have not passed an exact comparison. `packed-level4` was correct-size (0x30) with seven register-order differences, and `packed-flags3` was correct-size (0x18) with three. They remain assembly. Scratch versions and proof diffs are saved beside the transition-state probes; do not claim them as source, and do not add forcing hacks.
