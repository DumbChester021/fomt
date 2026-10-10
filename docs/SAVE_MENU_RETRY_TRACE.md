# Save/load menu retry and ownership trace

Verified from the original retail assembly in `asm/new_game.s`, primarily `func_08003F9C` (0x08003F9C..0x080040A0) and `func_080040A0` (0x080040A0..0x080041DC), together with byte-exact source APIs `GetSaveSlotOffset`, `WriteSaveSlotRecord`, `MarkSaveSlotValid`, `WriteSelectedSaveSlot`, and the known loader model in `docs/SAVE_LIFECYCLE.md`.

**Status:** This is a human-readable, evidence-based *behavioral trace*. These two menu handlers and the 740-byte loader are **still in retail assembly**, not newly matched C++. The expressions below are explanatory pseudocode only, not original-source claims.

## Scene fields actually used

| Scene-relative byte/word offset | Observed role | Confidence |
| --- | --- | --- |
| `+0x08` | Current game-state or owner pointer, checked before save and during load ownership replacement | Callsite-proven |
| `+0x0C` | Wrapper/owner reference in new-owner load path | Callsite-proven; exact type pending |
| `+0x10` | Message/menu output object receiving success or failure text | Callsite-proven |
| `+0x18` | Status/message identifier destination for `func_08008B6C` | Callsite-proven; exact UI class pending |
| `+0x85` | Save-slot choice (used as slot number) | Callsite-proven |
| `+0x8C` | UI-state/status word set to 3 on terminal success/failure paths | Callsite-proven |
| `+0x90` | Save context passed to SRAM record/header functions | Callsite-proven |
| `+0x98 + 0x80*slot` | Slot-associated preview object | Callsite-proven; exact type pending |

## Write path, `func_08003F9C`

1. If `scene+0x08` is null, skip attempts and display the failure path.
2. Read chosen slot from `scene+0x85`; derive SRAM base using `GetSaveSlotOffset(scene+0x90, slot)`.
3. Start a three-attempt loop. On each attempt, save the old state associated with interrupt mask `0x1000` using `func_08000528`; use `func_080004F4` to restore it conditionally after the attempted write. These helper names' higher-level policy is not yet source-proven.
4. Call `WriteSaveSlotRecord(scene+0x08, scene+0x90, slotBase)`. A zero return is the only successful outcome, and a nonzero return enters retry.
5. On success, call `func_08003788` for slot-associated state/preview, display success information, set the UI status word to 3, call `MarkSaveSlotValid(context, slot)`, then `WriteSelectedSaveSlot(context, slot)`, restore the saved interrupt state if needed, and return 1.
6. On a failed attempt, restore the saved interrupt state if needed and decrement the remaining attempts. When all three fail, display failure information, set the status word to 3 and return 0.

**Important ordering:** the record write must succeed **before** the valid-slot bit and selected-slot field are updated. An unsuccessful or partially written record can exist while the header still considers the slot invalid. Header mutation itself has SRAM error state that must not be silently ignored by a port or mod.

## Read path, `func_080040A0`

1. Read chosen slot from `scene+0x85`; derive its SRAM base from `scene+0x90` and initialize a three-attempt loop.
2. On each attempt, preserve the same interrupt-state mask information as the write path and allocate a **fresh 0x34F4-byte buffer** via `__builtin_new`.
3. Call `func_08011650(newState, scene+0x90, slotBase, &errorWord)`; keep the returned pointer separately. The loader first initializes default GameState subobjects, then reads length/payload/checksum, as described in `SAVE_LIFECYCLE.md`.
4. **Check `errorWord`, not merely the returned pointer.** A nonzero `errorWord` causes the freshly allocated returned state to be deleted and the attempt retried. The old active state/owner must remain unaffected by a failed attempt.
5. If `errorWord == 0` and `scene+0x08` already refers to a state/owner, pass the new state into the existing owner through `func_080D4178` after `func_080D4480` (exact object lifetime contracts remain to be recovered).
6. If no active owner exists, allocate an eight-byte wrapper object, initialize its vtable, attach the newly loaded GameState to its second word, and replace the `scene+0x0C` owner reference, invoking the old reference's virtual cleanup when required.
7. On success, update success UI, write the selected-slot header, release temporary state where appropriate, restore interrupt state if needed, and return 1. On three consecutive failures, set the failure UI/status, return 0, and do **not** commit a new active GameState.

There is a **separate read-on-failure cleanup path** and explicit 0x34F4 allocation, so a reconstruction that overwrites the current state in place before checksum validation is not behaviorally equivalent.

## GameState cleanup and deep-copy contracts (newly traced)

The original assembly and now-matched C++ cleanup routines clarify the successful-load ownership sequence:

**`func_080D4480(GameState*, flags)`, 0x080D4480..0x080D44D4 (84 bytes):** a destructor-like cleanup, not an unconditional delete. It walks the inline saved-byte-buffer range at `state+0x1CA4` using the count at `+0x1CA0`, invokes nested cleanup helpers `func_080D6B00(state+0x1C38, 2)` and `func_080D6C08(state+0x1AA8, 2)`, and calls `__builtin_delete(state)` **only if `flags & 1`**. The walk's exact C++ type/lifetime reason is still unresolved and must not be replaced with an invented user-visible behavior.

**`func_080D4178(destination, source)`, 0x080D4178..0x080D4480 (776 bytes):** GameState field-copy/assignment routine, returning its destination. This is demonstrably **not a raw `memcpy(state, state, 0x34F4)`**. It copies packed header fields, uses subobject-specific calls for farm (+0x14), money (+0x1AA8), farmer (+0x1BD8), dog (+0x1C70), social (+0x1CD4/+0x214C), and directly copies the saved byte buffer (+0x1CA0), packed index/countdown (+0x2C74), fishing/mine and tail state. `func_080D4178` stores the destination's saved-buffer count as zero before copying the source's active bytes, then assigns the new count and copies the six-byte location. The complete original fields are still in ASM, and nested helper contracts remain to be typed.

For the active game-state case, `func_080040A0` performs the following verified high-level sequence after `errorWord == 0`:

```cpp
// Behavioral sketch, not recovered retail C++ source:
CleanupGameState(existing, 2);        // Destruct nested data; do not free allocation.
CopyGameState(existing, newlyLoaded);  // Fieldwise/subobject-aware assignment.
CleanupGameState(newlyLoaded, 3);       // Destruct nested data AND free allocation.
```

When there is **no existing state**, the menu instead constructs a new eight-byte owner wrapper and transfers the `newlyLoaded` pointer to it, setting the temporary cleanup pointer to null. On a failed load it invokes `__builtin_delete` on the new buffer before any owner transfer. This distinction affects object identity, nested allocations, and error cleanup; a plain pointer swap or raw payload memcpy into the active object is **not behaviorally equivalent**.

**New source completion:** `CleanupGameState` / `func_080D4480` now has natural, byte-exact production C++ in `src/game_state_cleanup.cc` (84 bytes), along with nested cleanup helpers `func_080D6B00` (64 bytes) and `func_080D6C08` (80 bytes). All three retain their retail addresses and pass the complete ROM comparison. The 776-byte `func_080D4178` assignment, full loader and UI handlers remain ASM. One of that assignment's typed dependencies, `func_080D67C8` (the 132-byte Dog/Animal state copy), is now separately byte-exact C++ in `src/dog_state_copy.cc`, with inherited `Animal` assignment preserved via the original compiler-generated ABI symbol. See [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md) and [GAME_STATE_SAVE_CLEANUP.md](GAME_STATE_SAVE_CLEANUP.md).

## Validation still required

- Finish source-exact reconstruction of `func_080D4178`, the eight-byte owner wrapper/vtable, and all final pointer ownership transitions. Parent/nested cleanups are already exact C++.
- Decompile the entire menu handlers, not only the three-attempt loops, to normal byte-exact C++.
- Back up real player SRAM and test: successful/failed slot writes, invalid headers, selected vs valid mask discrepancies, checksum mismatch, failed read cleanup, retries and state ownership.
- Do not treat a matching header+checksum offline as proof that an emulator can load the save.
- Never modify the custom-game worktree as part of retail source matching.

The read-only `tools/ches/inspect_sram.py` independently checks the source-matched header fields and each slot's length and checksum. See `docs/SAVE_SERIALIZED_LAYOUT.md`. This behavioral trace and the inspector improve understanding, but neither adds byte-exact matched code.
