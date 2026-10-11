# Exact social-state copy (0x080D60B0)

## Current result, October 11, 2026

`CopySavedSocialState` in [src/social_state_copy.cc](../src/social_state_copy.cc) now owns the retail `func_080D60B0` code at **0x080D60B0..0x080D64C8** (1,048 linked bytes, consisting of 1,046 instruction/literal bytes and 2 trailing alignment zeros). The original linker address is preserved by an `ALIAS`; `fomt.lds` places `.text.save_social_copy` between the remaining `0x080D44D4` block and the exact Farm copy at `0x080D64C8`.

This replaces the large nested assignment called by `func_080D4178` for **GameState+0x1CD4** (0x478-byte social block). It does **not** recover the parent 776-byte GameState assignment, its other still-ASM nested 0x1BDC-byte assignment `func_080D44D4`, or any save-loading runtime path.

## What the source establishes

- Seven packed header bitfields copy only their assigned bits, preserving untouched destination flags. Do not replace this with a raw 32-bit overwrite.
- The child's variable-length name copies through `strcpy`, not full-buffer `memcpy`. Its two adjacent saved bytes, one active flag, word and eight 8-byte records use separate assignments.
- The fixed NPC roster uses existing typed `Npc` (0x14), `Bachelorette` (0x18) and `HarvestSprite` (0x24) members at the exact documented character offsets. Three 0x18-byte normal-record regions have `Npc` plus an additional 32-bit word (Saibara, Gotz, Lou); their extra field is not semantically identified.
- The trailing 0x38-byte region is copied via `memcpy`, followed by one word and one byte. The final three padding bytes are not copied.
- Compile-time checks verify the social-state struct is 0x478 bytes and all 41 roster offsets align with `docs/CHARACTERS.md`. Opaque saved fields remain intentionally neutral; no original-source provenance is claimed.

## Proof and anti-repeat evidence

Scratch source and probes are preserved outside the retail checkout in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-social-copy-20261011/`. Important outputs:

- `social-records-probe.cc` (final accepted natural typed source before production naming/section), `social-child-temp.bin`, `social-child-temp.mismatch.txt`, and `social-child-temp.diff`.
- The isolated `compare-function.py` check reports **expected 0x418 / symbol body 0x416 / 2 differences**, with **empty mismatch positions and empty disassembly diff**. This is not a code mismatch: the compiler-owned aligned `.text` binary is 0x418 and its full 1,048 bytes equal the retail byte slice, including the trailing `0000` padding, verified independently using Python.
- In isolated detached integration worktree `/mnt/waydroid-hdd/home-chester-waydroid/fomt-social-integration-20261011`, forced `make -B -j4 compare` passed (Ches execution `sh_mv3437si_d3574194`, exit 0, `fomt.gba: OK`). This worktree temporarily used a symlink to the verified local compiler installed in retail, not an independent historical compiler build.
- In **production retail main**, `make test` (Ches execution `sh_mv3449du_39356f13`, exit **0**) rebuilt the full ROM and passed original SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**, source-readability guard, save evidence, synthetic SRAM inspection and other automated tests.
- The newly source-owned linked bytes are **1,048**. Whole-game C++ coverage rises from 92,136 to **93,184 / 940,036 (9.9128%)**. Remaining linked ASM functions go from 1,931 to **1,930**. The bounded save-copy subset **remains 8/12**, because this social helper is outside those 12 rows.

The key original-compiler source-shape observation is the child's two-byte copy: setting the first element through a destination pointer, loading the second source byte to a local *before incrementing that destination pointer*, then assigning the second byte reproduces the exact order of ARM Thumb operations. `u8[8]`-based typed child records reproduce individual 8-byte `ldm/stm` transfers; scalar word-pair struct assignments do not. Avoid adding artificial registers, assembly shims, padded dummy instructions, or compiler exceptions.

## Next work

The **0x1BDC-byte `func_080D44D4`** at GameState+0x214C is now the **only large nested GameState assignment still in ASM**. Recover its real typed subobject and its packed bitfields/record layout, then source-recover the 776-byte parent assignment; Rucksack, MoneyState, loader, SRAM/save-menu cases and player-save runtime proof remain separate outstanding tasks. This social recovery does not authorize customizing save formats or touching the custom-game worktree.


The October 11 exact GameState parent integration moves this existing
`SavedSocialState` definition and its offset assertions into
`include/saved_social_state.hh`, shared by both copies. The social routine
retains its original 1,048 linked bytes and address; this header move adds
no separately counted code.
