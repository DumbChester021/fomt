# GameState assignment: fieldwise dependency and typed-layout map

## Retail 0x080D4178 (776 bytes): current reconstruction evidence

`func_080D4178` at ROM `0x080D4178..0x080D4480` is the retail GameState assignment/copy operation. It is **still assembly**, not a matching C++ function. It is used by successful save loading to preserve the existing live GameState allocation. This map is grounded in the original `asm/code_linkonce.s` callsites and the existing C++ types, not a claim that the original entire object-copy logic is reconstructed.

| GameState-relative offset | Bytes | Verified action in assembly | Typed source / status |
| --- | ---: | --- | --- |
| 0x0000..0x0013 | 0x14 | Copy packed GameState header members with field masks and 12-byte word run | Header still partially opaque |
| 0x0014..0x1AA7 | 0x1A94 | Call `func_080D64C8(dst+0x14,src+0x14)` | **`CopySavedFarmState` exact 180-byte C++** using real Farm fields, original address; specialized Barn copy is exact 296-byte C++; the nested Coop copy is also exact typed C++ (292 bytes) |
| 0x1AA8..0x1BD7 | 0x130 | Call `func_080D6B40(dst+0x1AA8,src+0x1AA8)` | `MoneyState` exactly located; counted daily/seasonal copy **ASM** |
| 0x1BD8..0x1C6F | 0x98 | Call `func_080D68C0(dst+0x1BD8,src+0x1BD8)` | **`CopySavedFarmerState` exact 448-byte C++**, original alias; nested Rucksack copy `080D6A80` remains ASM |
| 0x1C70..0x1C9F | 0x30 | Call `func_080D67C8(dst+0x1C70,src+0x1C70)` | **`CopySavedDogState` exact 132-byte C++**, original address |
| 0x1CA0..0x1CCB | 0x2C | Set destination count to zero; copy active bytes individually; restore count, copy six-byte location | `SavedByteBuffer` methods partially exact; parent assignment **ASM** |
| 0x1CCC..0x1CD1 | 0x06 | Raw `memcpy` 6 bytes | Spatial/location-style data; specific semantics pending |
| 0x1CD4..0x214B | 0x478 | Call `func_080D60B0(dst+0x1CD4,src+0x1CD4)` | **`CopySavedSocialState` exact natural C++**: 1,048 linked code bytes, 41 typed NPC/bachelorette/sprite records and packed/child fields; [evidence](SAVE_SOCIAL_STATE_COPY.md) |
| 0x214C..0x21CB | 0x80 | Call `func_080D44D4(dst+0x214C,src+0x214C)` | **`SavedNativeCallState` typed at +0x214C**, its 1,724-byte initializer exact C++; **413 fields now have retail-verified action-selector names**, checked by `tools/ches/native_selector_map.py`. Its 7,132-byte copy remains ASM; bounded behavior passes, codegen does not. [Evidence](SAVE_PACKED_NATIVE_COPY_RESEARCH.md) |
| 0x21CC onward | variable | Assign scalar/short packed fields, strings via `strcpy`, larger opaque data via `memcpy` | Full assignment **ASM** |
| 0x2C1C onward | 0x30+ | Copy three groups of scalar/aggregate words before transition state | Unknown packed saved records |
| 0x2C74..0x2C7F | 0x0C | Copy three words, no deep allocation | `SavedTransitionState` and 8 exact separate member methods |
| 0x2C80..0x2E57 | 0x1D8 | `memcpy(dst+0x2C80,src+0x2C80,0x1D8)` | `FishingRecords`, 59 count/max-size records, source-owned accessors |
| 0x2E58..0x34F3 | 0x69C | Copy remaining saved progress, packed records and other tail data | Still partially opaque |

Boundaries where specialized calls copy overlapping or adjacent components are listed as their source-owner regions. The exact subranges handled inside the trailing opaque segments need further callsite/type reconstruction. Do not infer every field is a simple POD byte copy from these high-level descriptions.

### Three save loader lifecycle operations

The active-state load route first validates length, bytes and checksum through `func_08011650` and checks its out-error value. Upon success when there is an existing owner:

```cpp
CleanupGameState(existing, 2);        // Exact source; deallocate nested objects but not existing allocation
func_080D4178(existing, loaded);     // Original ASM; subobject-specific copy
CleanupGameState(loaded, 3);         // Exact source; nested cleanup plus free loaded allocation
```

The no-owner path instead attaches the loaded GameState to a fresh owner wrapper; on failed loads, the unsuccessful buffer is deleted before retry. **The user must not customize the save system until these owner transfer/copy methods are fully understood and runtime tested.**

### Proved binary types and remaining matching frontier

`include/save_persisted_layout.hh` now directly places real `Farm`, `MoneyState`, `Farmer`, `Dog`, `FishingRecords`, `SavedByteBuffer`, **`SavedNativeCallState`** and `SavedTransitionState`. It enforces **47 compile-time size/offset checks** covering the 32 KiB SRAM geometry, old compiler ABI and named child components. The verified complete build `make -B -j4 compare` passed with retail SHA1 unchanged (`sh_mv2saxgu_aed05dc4`, `fomt.gba: OK`). This structured model emits no extra ROM instructions, so byte-exact code metrics stay unchanged.

The `Farm`, `Barn` and `Farmer` copies **are now exact source** (see [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md)). The `Farm` copy **is now exact source** (`CopySavedFarmState` / `func_080D64C8`, 180 bytes) in `src/farm_state_copy.cc`. The failed implicit whole-object copy yielded 788 bytes, but member-aware C++ plus a counted **11-word horse-placeholder loop** reduced to 180 exact bytes with zero differences. The specialized Coop copy now targets source-exact `CopySavedCoopState` (292 bytes); the Barn copy targets source-exact `CopySavedBarnState` at the original ABI address. See [SAVE_FARM_STATE_COPY.md](SAVE_FARM_STATE_COPY.md) for scratch evidence, original-symbol alias, and forced full-ROM gate (`sh_mv2sly7y_cf9bd46e`).

The nested `MoneyState` assignment has a saved, behaviorally readable natural C++ candidate in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/money-copy-v1.cc` (196 generated bytes against retail 200, 157 differing bytes). Four additional **placement-construction/typed field-copy** probes were tested in `money-placement-probes.py`: 3 equivalent variants still emitted the same 196/157 differences, a member-field variant 192/151. This is a *closed first-pass source-shape hypothesis*, not a production match; the original `func_080D6B40` remains untouched in ASM. Don't add artificial compiler register constraints or alter `MoneyState` types merely to force matching.

The read-only `tools/ches/inspect_sram.py` can extract basic original MoneyState, saved-buffer, transition, and 59-entry fishing summary fields only when a slot has consistent header, length and checksum. Its synthetic tests exercise the original fish total saturation at 1 billion, indices 8–58, six fish kings at 53–58, and rejection of invalid slots. It never modifies SRAM or proves a save will load in an emulator. No genuine save was used.

**Next work:** source-recover the remaining nested `Rucksack`/`MoneyState` assignments (Farm, Farmer, Barn, Coop and Dog now exact) and the full `func_080D4178`, then the 740-byte default constructor/loader `func_08011650` using the closed-experiment oracle ledger. Test backed-up actual saves and error paths. Keep retail `main` and custom-game isolated.

Other related documentation: [SAVE_SOCIAL_STATE_COPY.md](SAVE_SOCIAL_STATE_COPY.md), [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md), [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md), [GAME_STATE_SAVE_CLEANUP.md](GAME_STATE_SAVE_CLEANUP.md), [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md), [SAVE_MENU_RETRY_TRACE.md](SAVE_MENU_RETRY_TRACE.md).

### October 11: alternative MoneyState container-copy models (scratch-only; negative evidence)

The 200-byte retail `func_080D6B40` MoneyState assignment remains ASM. Earlier typed `money-copy-v1.cc` yields 196 bytes / 157 different linked bytes. Two **structurally different** nested C++ historical-container hypotheses were now tested without modifying the production source: `money-member-model-v1.cc` uses a copy-assignment operator and placement-new style per-entry construction; it compiled to **266 bytes / 255 differences**, worse. `money-history-member-v2.cc` uses an `inline CopyActive` method with a typed record pointer walk and counted capacity; it compiled to **208 bytes / 139 differences**. Both are saved at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/`, with linked-byte proofs in `proofs/money-member-v1.mismatch.txt` and `proofs/money-history-member-v2.mismatch.txt`. **Neither is a candidate for production.** Do not repeat the same high-level nested-copy ideas without original per-entry constructor/copy ABI evidence. The Coop sibling has since been integrated and verified in production with the general call-crossing compiler refinement (see [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md)); its exactness does not establish an equivalent source match for MoneyState.


## October 11 — direct assembly contract for the remaining 776-byte GameState assignment

An October 11 re-read of original `asm/code_linkonce.s` at `0x080D4178..0x080D4480` established the following **specific copy mechanisms**. This is a behavioral/ABI map, **not** matched C++ or a newly exact byte count. Nested operations may copy more fields than the caller's direct stores.

| GameState destination offset | End (exclusive) | Retail operation | Matching implication |
| --- | --- | --- | --- |
| `+0x0000..+0x0004` | `+0x0004` | Piecewise packed flag masks across byte, halfword, word; bits handled individually | Preserve exact bitfield setters and old values of unaffected bits; no raw header memcpy |
| `+0x0004` | `+0x0005` | Assign only bit 0 in byte at `+4` | Higher seven bits of this byte are **not assigned by this operation** |
| `+0x0008` | `+0x0014` | Copy **three 32-bit words** using `ldm/stm` | Remaining `+0x0005..+0x0007` are not directly copied |
| `+0x0014` | dependent | Call `func_080D64C8` (Farm) | Typed exact nested call |
| `+0x1AA8` | dependent | Call `func_080D6B40` (MoneyState) | Nested copy still ASM; not a generic 0x130-byte memcpy |
| `+0x1BD8` | dependent | Call `func_080D68C0` (Farmer) | Typed exact nested call |
| `+0x1C70` | dependent | Call `func_080D67C8` (Dog) | Typed exact nested call |
| `+0x1CA0` | dependent | Reset destination active count to zero, copy **source-count bytes** from `+0x1CA4` one by one, then restore count | Inactive buffer entries must not be overwritten as a full-buffer memcpy |
| `+0x1CC4` | `+0x1CCA` | 6-byte `memcpy` of trailing saved-buffer member | Separate from next 6-byte copy; do not merge on intuition |
| `+0x1CCC` | `+0x1CD2` | Another 6-byte `memcpy` | `+0x1CD2..+0x1CD3` are not assigned directly |
| `+0x1CD4`, `+0x214C` | dependent | Calls to `func_080D60B0`, `func_080D44D4` | **`+0x1CD4` exact typed social copy (1,048 linked bytes)**; **`+0x214C` still ASM** (0x1BDC linked bytes); [social proof](SAVE_SOCIAL_STATE_COPY.md) |
| `+0x21CC` | `+0x21D4` | Two word assignments | Inline scalar block |
| `+0x21D4` | `+0x21DC` | Eight one-byte assignments in a counted loop | Explicit byte loop, not assumed array assignment |
| `+0x21DC` | `+0x21E0` | Four one-byte assignments in a counted loop | Explicit byte loop |
| `+0x21E0`, `+0x21F0`, `+0x2200` | variable | Three **separate `strcpy` calls** | String length/terminator semantics are material; not a fixed-length memcpy |
| `+0x2210` | `+0x2214` | One 32-bit word | Inline scalar block |
| `+0x2214` | `+0x2C1C` | `memcpy(..., 0xA08)` | Opaque contiguous block of 2,568 bytes |
| `+0x2C1C` | `+0x2C4C` | Four 12-byte `ldm/stm` bursts | Exact 48-byte structured word block |
| `+0x2C4C` | `+0x2C74` | Three 12-byte bursts and one word | Exact 40-byte structured word block |
| `+0x2C74` | `+0x2C80` | One 12-byte word burst | Known typed `SavedTransitionState` |
| `+0x2C80` | `+0x2E58` | `memcpy(..., 0x1D8)` | Known typed `FishingRecords`, 472 bytes |
| `+0x2E58` | `+0x3480` | `memcpy(..., 0x628)` | Opaque contiguous 1,576-byte block copied by existing ASM; its field semantics remain unresolved |
| `+0x3480` | `+0x3494` | 20 bytes by `ldm/stm` (12+8) | Direct structured word copy |
| `+0x3494` | `+0x34C4` | Four 12-byte word bursts | 48 bytes |
| `+0x34C4`, `+0x34C5` | `+0x34C6` | Two distinct one-byte assignments | Does **not** establish semantic identity of either flag |
| `+0x34C8` | `+0x34D8` | 12-byte burst and one word | 16 bytes |
| `+0x34D8` | `+0x34DC` | One word | 4 bytes |
| `+0x34DC` | `+0x34F4` | Two 12-byte bursts | 24 bytes to exact end of saved GameState |

**Critical non-POD constraints:** A complete `PersistedGameStateLayout` assignment or `memcpy(0x34F4)` is not retail behavior. It would overwrite at least skipped header/padding bytes, inactive saved-buffer entries, and string tail bytes which the original routine does not necessarily overwrite. All old source snapshots for the 776-byte function must be evaluated against **these** original behavior boundaries before a whole-function compilation trial. The byte counts here describe input regions, not matched executable bytes. Next high-value source evidence: recover the remaining real types at `+0x214C` and the original GameState header bitfields before a whole-function matching attempt. Linked boundaries show `func_080D44D4` spans `0x080D44D4..0x080D60B0` (0x1BDC bytes) and remains ASM, while `func_080D60B0` at `0x080D60B0..0x080D64C8` (0x418 bytes) is **now exact C++** ([proof](SAVE_SOCIAL_STATE_COPY.md)). Claiming the parent's 776-byte function as "complete save copying" without these would be misleading. Do not brute-force compiler permutations.

### October 11 archived MoneyState hypotheses recompiled under three toolchains

After the typed Coop copy enabled a general, verified call-crossing liveness rule, seven **archived preprocessed MoneyState copy hypotheses** were recompiled with the new production compiler, retaining their frozen source input. None became exact: `money-copy-v1` **196/157**, `money-history-member-v2` **208/139**, `money-member-v1` **268/257** (slightly worse), `placement-entry`, `placement-range`, `placement-template` each **196/157**, and `typed-copy-array` **192/151** (size / differing linked bytes). The original May-2000 ARM and October-2003 Nintendo/Cygnus compilers both reproduced the same nonmatching **196/157** and **208/139** outcomes for the two representative hypotheses. This rules out the newly corrected compiler liveness behavior as a sufficient solution *for these source forms*; it does not prove the original `MoneyState` source layout. Original 200-byte `func_080D6B40` still ASM, **0 new matching code bytes**. Use genuinely new evidence about the nested counted-history constructor/copy ABI, not another compiler tweak or spelling variant.
