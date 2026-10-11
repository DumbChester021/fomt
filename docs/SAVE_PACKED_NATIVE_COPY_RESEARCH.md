# Packed native-call state copy: behavioral recovery, not a byte match

**Status October 11, 2026:** Original `func_080D44D4` at `0x080D44D4..0x080D60B0` (**0x1BDC = 7,132 linked bytes**) is still assembly. No C++ has been promoted for this function, and it adds **zero** source-owned bytes to the verified retail ROM progress.

## What the original function copies

The 128-byte saved subobject begins at **GameState+0x214C** and ends at +0x21CB, immediately before the next GameState field. Previously verified independent game-call helpers establish the first members:

| State offset | Storage | Verified behavior |
| --- | --- | --- |
| +0x00..+0x03 | 32-bit count | Number of active entries, 0..3 under valid retail callers |
| +0x04..+0x09 | Three `u16` entries | Native-call identifiers; copy ONLY `count * 2` bytes with `memmove`, leave inactive entries untouched |
| +0x0A..+0x0B | Unassigned/padding candidate | Not written by this copy |
| +0x0C..+0x0D | `u16` marker | Separate value, initialized to 0xFFFF by constructor |
| +0x0E..+0x7F | Packed state | Individual fields, often 1- and 2-bit and sometimes spanning storage bytes; must NOT be replaced by wholesale memcpy |

Original code first temporarily sets destination count to zero, reads the source count, conditionally copies the active `u16` region with `memmove`, restores the source count, copies the marker, and performs a long series of packed-member assignments. The packed fields include script/native-call progress and state. Individual field names are not yet established.

## New read-only structural analysis

The local scratch work at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-packed-state-20261011` implemented a deliberately bounded Thumb interpreter for **this original function's instruction set**. It reached 3,522 original executable instructions along the zero-count path, traced 150 effective destination writes, and derived field provenance across the +0x0E..+0x7F packed range.

The inferred source-level partition has **462 contiguous regions**, of which **461 are assigned** by the candidate and one five-bit region at **+0x22 bit 7 through +0x23 bit 3** is deliberately preserved. Existing mask/source accessor evidence independently supports preservation here. These are reconstructed storage regions, **not 462 separately proven semantic game attributes**. Never rename them to gameplay meanings on the basis of this analysis alone.

A compact **local-only, intentionally Git-ignored** checkpoint is in `tools/ches/checkpoints/save-packed-native-copy-2026-10-11/` (see its `README.md`). It is preserved on this machine, but not part of a public clone:
- `packed-copy-v2.cc`: readable, isolated source candidate with typed active-entry/marker members and bounded neutral packed flags, including original-only active-entry copy behavior.
- `field_partition.json`: tentative bitfield boundary model, including preserved bits.
- `store_masks.json`: source/target write-mask trace from original Thumb.
- `packed-copy-v2.mismatch.txt`: original linked-byte comparison for the current candidate.

**Compiler proof:** the original is **7,132 bytes**. The first natural C++ candidate compiled to **7,032 bytes / 6,537 differing linked bytes**. Adjusting the counted-region pointer source to the original post-increment shape produced **7,028 bytes / 6,523 differing linked bytes** (Ches `sh_mv34ygnr_d2489d11`). Because this comparison is very far from zero, it is NOT a retail-exact C++ contribution. Plain implicit struct assignment collapsed to 18 bytes; synthetic nested assignment to 16 bytes. Both are closed as whole-object-copy hypotheses for this specific source layout; the underlying original uses per-member field operations.

**Behavioral proof within the model:** the compiled 7,028-byte candidate and original instructions produced identical 128-byte destination results in **64/64 seeded randomized state trials**, with **16 each** for count 0, 1, 2, and 3 (Ches `sh_mv351inb_600c079e`), plus extreme all-zero/all-one comparisons. This is a strong *bounded interpreter differential*, not a substitute for an independently checked GBA emulator, and definitely not an exact ROM match. Do not claim full save readiness from it.

## Why matching remains difficult

The compiler outputs nearly the correct total code size and assignment semantics but has different pointer/register allocation and instructions throughout. For example, retail places destination in `r7` and source in `sl`, while the candidate commonly places destination in `sl` and source in `r9`, altering many literal/mask generation choices and every shifted address. Repeating arbitrary field spellings or adding register-forcing hacks would not establish authentic original C++.

Useful next work: compare allocation/liveness from compiler RTL between source and retail, compare true member types against `func_0809C6BC` constructor and packed accessors, and test a source-structural rather than optimizer-specific hypothesis. For original verified offsets and native-call meanings see [DECOMP_NOTES.md](DECOMP_NOTES.md) and [GAME_STATE assignment map](SAVE_GAMESTATE_ASSIGNMENT_MAP.md). Only integrate into production after an exact 0-difference linked-byte proof, unchanged full retail SHA1, and `make test`.

No source, compiler configuration, or custom-game save layout was changed by these failed matching probes. The existing exact 1,048-byte social-state helper is unaffected. This target is still **not done**.
