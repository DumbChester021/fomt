# Packed native-call state copy: behavioral recovery, not a byte match

**Status October 11, 2026:** Original copy `func_080D44D4` at `0x080D44D4..0x080D60B0` (**7,132 bytes**) is still assembly and contributes zero exact-source bytes. **Its adjacent initializer `func_0809C6BC` is now 1,724-byte exact readable C++** in `src/saved_native_call_ctor.cc`, using the same typed `SavedNativeCallState` in `include/saved_native_call_state.hh`. The full ROM remains retail byte-identical.

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

## October 11 follow-up: a typed persisted subobject

The saved 0x80-byte native-call state now has a source-only layout in `include/saved_native_call_state.hh`, positioned at `GameState+0x214C` in `include/save_persisted_layout.hh`. Its count, three 16-bit active IDs, untouched +0x0A halfword, and +0x0C sentinel are compile-time checked. The 0x72-byte region is now typed as 461 neutral offset-named bitfields plus reserved bits, proven by the **exact source-owned constructor**. This is not proof of their gameplay meanings or of a matched 7,132-byte copy.

An instruction-level comparison aligned **all 148 packed-region destination stores** between retail and the source candidate in the same order, at the same offsets and with the same store widths and effective copied-bit masks under the contrasting test patterns. Retail executes 3,522 instructions on the zero-count trace, versus 3,470 in the candidate, a 52-instruction difference. Copying the logic through a C++ member operator or member method compiled identically to the existing 7,028-byte / 6,523-difference candidate. The raw compiler binary without optional compatibility flags also produced identical output. Thus the established compatibility flags and simple member-wrapper hypotheses are not the cause of this mismatch. The neighboring initializer's exactness confirms the field-type/bitfield layout; investigate this copy's genuinely different source structure and register lifetimes, not register forcing or superficial syntax variants.

### Constructor cross-check (independent retail code)

The original constructor `func_0809C6BC` (`0x0809C6BC..0x0809CD78`) was separately executed under the same bounded Thumb interpreter for both all-zero and all-one initial destination states. Both traces executed 836 original instructions with 149 state writes. The constructor preserves exactly 11 bits in the packed range: `+0x22.bit7..+0x23.bit3` (five bits), `+0x2A.bit0` (one bit), and `+0x5A.bit2..bit6` (five bits). The assignment's neutral source model independently leaves the first five bits untouched while *copying* the other six. This cross-check matches the original direct-access findings in `docs/DECOMP_NOTES.md` and distinguishes constructor-preserved live flags from copy-excluded reserved fields.

Production **`make test` passed** after the typed persisted-state layout was added (Ches `sh_mv35k2c3_4ec3c0fd`, exit 0, `fomt.gba: OK`, unchanged original ROM SHA1). The tracked exact-source coverage stays **93,184/940,036**, with this entire 7,132-byte routine still in ASM. The local scratch includes `constructor_cleared_bits.json`; the historical 93,184-byte figure above predates the newly exact 1,724-byte constructor (now 94,908 source code bytes). Original ROM comparison is not an independent emulator save round-trip.

## October 11 follow-up: constructor fully recovered as exact source

The neighboring native-call constructor **`func_0809C6BC`, 0x0809C6BC..0x0809CD78 (0x6BC = 1,724 bytes)** is now integrated in `src/saved_native_call_ctor.cc` as `InitializeSavedNativeCalls`, with original symbol alias, a separately linked code section and shared `include/saved_native_call_state.hh` layout. All 455 actually zeroed packed fields are assigned in source, while the 11 observed untouched bits remain untouched. Field names are deliberately storage-offset labels rather than invented gameplay concepts.

- Initial generated `void` initializer from the traced reset fields compiled at exactly **1,724 bytes, only 15 linked-byte differences**. Disassembly isolated all differences to the epilogue and alignment. The original returns its destination pointer; a natural pointer-return C++ signature produced **1,724 bytes and zero differences**, with no forced registers or assembly (`packed-init-v2-return.cc`, Ches `sh_mv35unfh_b542b7cf`).
- Reproducing the same code with the shared header and out-of-line source kept **1,724 / 0** (`packed-init-trial-split`, Ches `sh_mv35wbrf_f798ed33`). Integration replaced the original ASM function only, preserved its address and neighbors, and `make -j4 compare` returned **`fomt.gba: OK`** (Ches `sh_mv35x570_8a3ea322`). Coverage is **94,908 / 940,036 exact C++ code bytes (10.0962%), 1,929 linked ASM functions remain**. The bounded 8/12 save-copy tracker is unchanged because this constructor sits outside that subset.
- The **7,132-byte copy is STILL ASM**. Recompiling its behavioral candidate with the newly proven exact C++ field-type declarations left the old result unchanged: **7,028 linked bytes / 6,523 differing** (`packed-copy-real-header`, Ches `sh_mv360g1t_4c25c51c`). Short/byte/mixed base-type variants were also checked in scratch. An all-`u16` field variant produced 7,088 bytes / 6,420 differences; do not infer which original base type was used from constructor matching alone: narrower declared types can also match the same 1,724 bytes exactly. Do not promote nonmatching source or assert that the initializer completion means the copy is solved.

**Next high-value question:** distinguish the actual bitfield base types through independent getters/setters, then determine why the original copy retains destination `r7` and source `sl` across its many packed stores, while the all-`u32` candidate chooses different pointer liveness? Compare original and candidate register-lifetime provenance and CSE/allocator pass artifacts using the **now-exact constructor as a type/code-generation canary**. Reject target-specific forced registers or extra dummy code. The private scratch tree `/mnt/waydroid-hdd/home-chester-waydroid/fomt-packed-state-20261011` holds the original compare logs, the isolated type probes, candidate output and source generator.

## 2026-10-11: constructor exactness does NOT establish original bitfield base types

**Correction to earlier interpretation:** Although the initializer at `func_0809C6BC` is source-exact with `u32` bitfields, compiling that SAME initializer from alternative C++ declarations using `u16`, selective `u8`, or selective mixed `u8/u16/u32` base types produced **the identical 1,724 retail code bytes, 0 differences** in all three tests. This confirms initialized bit positions and reset semantics but **does not prove the original C++ declared all these fields as `u32`**. The neutral `u32` declarations in `include/saved_native_call_state.hh` remain the verified production-compatible representation, not a unique historical type reconstruction. The base-type ambiguity can affect the complicated copy through reload/CSE and register allocation.

The original `func_080D44D4` copy was compared against the alternative declarations under the unchanged pinned compiler. Selected evidence:

| Scratch declaration strategy | Generated linked bytes | Differing retail bytes | Observation |
| --- | ---: | ---: | --- |
| All `u32` source candidate | 7,028 | 6,523 | Destination retained in `sl`, source in `r9`; 0x18 stack |
| `u16` wherever representable | 7,088 | 6,420 | Destination in `r7`, source in `sl`; extra spills / 0x30 stack |
| `u8` for byte-contained flags | 7,492 | 6,930 | Original pointer registers, but 0x24 stack and much longer code |
| Minimum-width `u8/u16/u32` | 7,364 | 6,790 | Original pointer registers **and** 0x18 stack, but copy instruction choices differ |
| `u16` on +0x0E..+0x62; `u32` on +0x63..+0x7F (`quarter-q4`) | 7,092 | **6,401** | Best linked-byte mismatch observed in these bounded type probes; 40 bytes short, **NOT exact** |

The `quarter-q4` candidate preserved original state semantics under the **bounded Thumb interpreter in 24/24 seeded randomized 128-byte state comparisons**, six at each valid active-count 0..3. This is a local test-harness differential, *not* a real save-load test or exact-match evidence. None of the type strategies passed the linked-byte verifier; differences remain thousands of bytes. Changing the source-only type header in production to these arbitrary width guesses is **not justified**.

A read-only instruction-group shape comparator (`shape_score.py`, scratch only) compares the 148 corresponding packed destination stores. It finds the all-`u16` candidate somewhat closer in opcode sequence (530 edits) than all-`u32` (562), while minimum-width mixed (736 edits) is worse despite fixing long-lived pointer registers and stack. Two-regime splits and rule-based one-bit/byte-contained declarations did not show a reliable convergent reduction. Heuristic shape scores are **not** retail proof and should not be optimized blindly. The compiler's `-dglf` pass dump on the all-`u32` candidate identifies long-lived pseudos 22 (186 refs; 3,676 instruction-liveness length) and 23 (143 refs; 3,664 length), allocated to `r10/sl` and `r9` respectively. This confirms the concrete allocator symptom without proving the historical source choices. Natural `register` parameters have no effect on these allocations and produce the same code.

**Next productive research:** obtain independent field *read/write* ABI evidence from the retail packed-state accessors and script dispatch, especially wherever a declared `u8`, `u16` or `u32` changes the actual generated access and not merely the initialization. Derive genuine source-level group boundaries/types before trying further copy matches. No function-specific register assignments, padding, or new compiler compatibility hacks were added.

Scratch and proof inputs: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-packed-state-20261011/`, notably `probe_initializer_types.py`, `probe_base_types.py`, `probe_wide_regions.py`, `probe_type_cutoffs.py`, `shape_score.py`, `quarter-q4.cc/.mismatch.txt`, `packed-copy-rtl.i.greg`. All these are local-only experiments, not linked into `main`.

## 2026-10-11: native action selector -> packed-field recovery

**Readable semantic linkage, no extra exact code bytes.** The retail `func_08048FFC` native-action dispatcher has a **562-entry jump table** (`0x01C..0x24D`). Its case handlers contain **450 direct references** to the 0x80-byte native-call state at GameState `+0x214C` (109 distinct byte offsets). The source-only, dependency-free `tools/ches/native_selector_map.py` resolves **413 one-to-one selector-to-bitfield identities** by checking each branch handler's address literal, bit shift and where present the source value mask against the exact 0x80-byte structure declarations. **Zero contradictory bit positions or explicit masks** were observed among those 413 verified cases; cases requiring more than one direct byte offset, indirect field access, or an unclassified shared writer are left unmapped.

The 413 verified members are now named `native_selector_048`, `native_selector_04d`, etc. in `include/saved_native_call_state.hh` and in the exact constructor `src/saved_native_call_ctor.cc`. These numbers are **native action selectors**, not VM `CALL` opcode IDs or proven event names; they tell us which original dispatcher case writes each field, not the gameplay meaning. The remaining entries retain offset-based `flag_XX_bY` names. The **renamed initializer still compiles to exactly 1,724 retail bytes, with zero linked differences** (isolated `native-selector-named-ctor-413`), and `make compare` preserves the original ROM SHA1. This is verified *readability* progress: **94,908/940,036 C++ bytes and 1,929 ASM functions remain unchanged**. The 7,132-byte copy remains ASM, and these cases still do not uniquely establish original `u8/u16/u32` base types.

Independent live-bit examples: selector `0x0F8` writes `+0x2A.bit0`, and selectors `0x1C3..0x1C7` write `+0x5A.bits2..6`. All six bits are left untouched by the initializer but *copied* by the still-ASM copy helper. Original selector `0x0DC/0x0DD` writes `+0x22.bits1..4`; `0x24B/0x24C` writes `+0x22.bits5..6`; `0x0DE` writes a cross-byte seven-bit field beginning `+0x23.bit4`. These examples frame the five-bit `+0x22.bit7..+0x23.bit3` interval preserved by both copy and initializer; the mapped selector cases do **not** write that gap, but do not establish it as globally unused.

Run `python3 tools/ches/native_selector_map.py --check` or `make save-check` to reproducibly verify mapping and source names without private scratch access. Use `--json` for the 413-row full mapping with assembly handler references. The private scratch proof includes `index_native_dispatch.py`, `map_dispatch_bits.py`, and `native-selector-named-ctor-413.mismatch.txt`; no historical original field semantics are fabricated.
