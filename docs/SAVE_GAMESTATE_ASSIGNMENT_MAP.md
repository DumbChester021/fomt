# GameState assignment: fieldwise dependency and typed-layout map

**Current nested-copy correction:** Rucksack (128 B) and MoneyState (200 B) are now exact source. Their older failed candidates below are historical, superseded by the range-construction proof at the end. MoneyState maxima at +0x120/+0x128 are paired `MoneyRecord` objects, with unchanged serialized offsets.

## Retail 0x080D4178 (776 bytes): current reconstruction evidence

`func_080D4178` at ROM `0x080D4178..0x080D4480` is the retail GameState assignment/copy operation. It is now **exact C++** in `src/game_state_copy.cc`, exported as `CopySavedGameState` with the original alias. It is used by successful save loading to preserve the existing live GameState allocation. The full 776-byte parent matches retail, including its call to the still-ASM packed-state child. Unknown gameplay meanings remain neutral in the complete typed storage layout.

| GameState-relative offset | Bytes | Verified action in assembly | Typed source / status |
| --- | ---: | --- | --- |
| 0x0000..0x0013 | 0x14 | Copy packed GameState header members with field masks and 12-byte word run | `SavedHeader`: exact bitfield/word copy; field meanings partly unknown |
| 0x0014..0x1AA7 | 0x1A94 | Call `func_080D64C8(dst+0x14,src+0x14)` | **`CopySavedFarmState` exact 180-byte C++** using real Farm fields, original address; specialized Barn copy is exact 296-byte C++; the nested Coop copy is also exact typed C++ (292 bytes) |
| 0x1AA8..0x1BD7 | 0x130 | Call `func_080D6B40(dst+0x1AA8,src+0x1AA8)` | `MoneyState` exactly located; counted daily/seasonal copy **exact C++ (200 B)** |
| 0x1BD8..0x1C6F | 0x98 | Call `func_080D68C0(dst+0x1BD8,src+0x1BD8)` | **`CopySavedFarmerState` exact 448-byte C++**, original alias; nested Rucksack copy `080D6A80` is exact C++ (128 B) |
| 0x1C70..0x1C9F | 0x30 | Call `func_080D67C8(dst+0x1C70,src+0x1C70)` | **`CopySavedDogState` exact 132-byte C++**, original address |
| 0x1CA0..0x1CCB | 0x2C | Set destination count to zero; copy active bytes individually; restore count, copy six-byte location | `SavedByteBuffer`: exact active-range construction in the parent; inactive storage preserved |
| 0x1CCC..0x1CD1 | 0x06 | Raw `memcpy` 6 bytes | Spatial/location-style data; specific semantics pending |
| 0x1CD4..0x214B | 0x478 | Call `func_080D60B0(dst+0x1CD4,src+0x1CD4)` | **`CopySavedSocialState` exact natural C++**: 1,048 linked code bytes, 41 typed NPC/bachelorette/sprite records and packed/child fields; [evidence](SAVE_SOCIAL_STATE_COPY.md) |
| 0x214C..0x21CB | 0x80 | Call `func_080D44D4(dst+0x214C,src+0x214C)` | **`SavedNativeCallState` typed at +0x214C**, its 1,724-byte initializer exact C++; **455 fields now have retail-verified action-selector names**, checked by `tools/ches/native_selector_map.py`. Its 7,132-byte copy remains ASM; bounded behavior passes, codegen does not. [Evidence](SAVE_PACKED_NATIVE_COPY_RESEARCH.md) |
| 0x21CC onward | variable | Assign scalar/short packed fields, strings via `strcpy`, larger opaque data via `memcpy` | `SavedNames` and offset-named records: parent copy exact C++, semantics partly unknown |
| 0x2C1C onward | 0x30+ | Copy three groups of scalar/aggregate words before transition state | Unknown packed saved records |
| 0x2C74..0x2C7F | 0x0C | Copy three words, no deep allocation | `SavedTransitionState` and 8 exact separate member methods |
| 0x2C80..0x2E57 | 0x1D8 | `memcpy(dst+0x2C80,src+0x2C80,0x1D8)` | `FishingRecords`, 59 count/max-size records, source-owned accessors |
| 0x2E58..0x34F3 | 0x69C | Copy remaining saved progress, packed records and other tail data | Still partially opaque |

Boundaries where specialized calls copy overlapping or adjacent components are listed as their source-owner regions. The exact subranges handled inside the trailing opaque segments need further callsite/type reconstruction. Do not infer every field is a simple POD byte copy from these high-level descriptions.

### Three save loader lifecycle operations

The active-state load route first validates length, bytes and checksum through `func_08011650` and checks its out-error value. Upon success when there is an existing owner:

```cpp
CleanupGameState(existing, 2);        // Exact source; deallocate nested objects but not existing allocation
CopySavedGameState(existing, loaded); // Exact parent C++; one packed-state child still ASM
CleanupGameState(loaded, 3);         // Exact source; nested cleanup plus free loaded allocation
```

The no-owner path instead attaches the loaded GameState to a fresh owner wrapper; on failed loads, the unsuccessful buffer is deleted before retry. **The user must not customize the save system until these owner transfer/copy methods are fully understood and runtime tested.**

### Proved binary types and remaining matching frontier

`include/save_persisted_layout.hh` now covers the complete 0x34F4 storage span: packed header, existing Farm/Money/Farmer/Dog, saved buffer, shared `SavedSocialState`, native-call state, string metadata, word records, transition and fishing records. Size/offset assertions enforce all parent copy boundaries. Opaque blocks and neutral offset names retain unresolved gameplay semantics. The shared social header removes the old private duplicate layout without changing its exact 1,048-byte copy.

The `Farm`, `Barn` and `Farmer` copies **are now exact source** (see [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md)). The `Farm` copy **is now exact source** (`CopySavedFarmState` / `func_080D64C8`, 180 bytes) in `src/farm_state_copy.cc`. The failed implicit whole-object copy yielded 788 bytes, but member-aware C++ plus a counted **11-word horse-placeholder loop** reduced to 180 exact bytes with zero differences. The specialized Coop copy now targets source-exact `CopySavedCoopState` (292 bytes); the Barn copy targets source-exact `CopySavedBarnState` at the original ABI address. See [SAVE_FARM_STATE_COPY.md](SAVE_FARM_STATE_COPY.md) for scratch evidence, original-symbol alias, and forced full-ROM gate (`sh_mv2sly7y_cf9bd46e`).

The nested `MoneyState` assignment has a saved, behaviorally readable natural C++ candidate in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/money-copy-v1.cc` (196 generated bytes against retail 200, 157 differing bytes). Four additional **placement-construction/typed field-copy** probes were tested in `money-placement-probes.py`: 3 equivalent variants still emitted the same 196/157 differences, a member-field variant 192/151. This is a *closed first-pass source-shape hypothesis*, not a production match; the original `func_080D6B40` remains untouched in ASM. Don't add artificial compiler register constraints or alter `MoneyState` types merely to force matching.

The read-only `tools/ches/inspect_sram.py` can extract basic original MoneyState, saved-buffer, transition, and 59-entry fishing summary fields only when a slot has consistent header, length and checksum. Its synthetic tests exercise the original fish total saturation at 1 billion, indices 8–58, six fish kings at 53–58, and rejection of invalid slots. It never modifies SRAM or proves a save will load in an emulator. No genuine save was used.

**Next work:** the 740-byte loader/default initializer `func_08011650`, consulting its closed-experiment ledger first. The parent, Rucksack, MoneyState, Farm, Farmer, Barn, Coop, Dog and Social copies are exact. The 7,132-byte native-state child needs new structural evidence; its failed source families are recorded separately. Real-save runtime testing remains open. Keep retail `main` and custom-game isolated.

Other related documentation: [SAVE_SOCIAL_STATE_COPY.md](SAVE_SOCIAL_STATE_COPY.md), [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md), [SAVE_SERIALIZED_LAYOUT.md](SAVE_SERIALIZED_LAYOUT.md), [GAME_STATE_SAVE_CLEANUP.md](GAME_STATE_SAVE_CLEANUP.md), [SAVE_DOG_STATE_COPY.md](SAVE_DOG_STATE_COPY.md), [SAVE_MENU_RETRY_TRACE.md](SAVE_MENU_RETRY_TRACE.md).

### October 11: alternative MoneyState container-copy models (scratch-only; negative evidence)

The 200-byte retail `func_080D6B40` MoneyState assignment remains ASM. Earlier typed `money-copy-v1.cc` yields 196 bytes / 157 different linked bytes. Two **structurally different** nested C++ historical-container hypotheses were now tested without modifying the production source: `money-member-model-v1.cc` uses a copy-assignment operator and placement-new style per-entry construction; it compiled to **266 bytes / 255 differences**, worse. `money-history-member-v2.cc` uses an `inline CopyActive` method with a typed record pointer walk and counted capacity; it compiled to **208 bytes / 139 differences**. Both are saved at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/`, with linked-byte proofs in `proofs/money-member-v1.mismatch.txt` and `proofs/money-history-member-v2.mismatch.txt`. **Neither is a candidate for production.** Do not repeat the same high-level nested-copy ideas without original per-entry constructor/copy ABI evidence. The Coop sibling has since been integrated and verified in production with the general call-crossing compiler refinement (see [SAVE_BARN_STATE_COPY.md](SAVE_BARN_STATE_COPY.md)); its exactness does not establish an equivalent source match for MoneyState.


## October 11: original assembly contract, now recovered exactly

An October 11 re-read of original `asm/code_linkonce.s` at `0x080D4178..0x080D4480` established the following **specific copy mechanisms**. This originally served as a behavioral/ABI map; the exact parent proof below now supersedes its former ASM-only status. Nested operations may copy more fields than the caller's direct stores.

| GameState destination offset | End (exclusive) | Retail operation | Matching implication |
| --- | --- | --- | --- |
| `+0x0000..+0x0004` | `+0x0004` | Piecewise packed flag masks across byte, halfword, word; bits handled individually | Preserve exact bitfield setters and old values of unaffected bits; no raw header memcpy |
| `+0x0004` | `+0x0005` | Assign only bit 0 in byte at `+4` | Higher seven bits of this byte are **not assigned by this operation** |
| `+0x0008` | `+0x0014` | Copy **three 32-bit words** using `ldm/stm` | Remaining `+0x0005..+0x0007` are not directly copied |
| `+0x0014` | dependent | Call `func_080D64C8` (Farm) | Typed exact nested call |
| `+0x1AA8` | dependent | Call `func_080D6B40` (MoneyState) | Exact nested copy; not a generic 0x130-byte memcpy |
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

**Critical non-POD constraints:** A complete `PersistedGameStateLayout` assignment or `memcpy(0x34F4)` is not retail behavior. It would overwrite at least skipped header/padding bytes, inactive saved-buffer entries, and string tail bytes which the original routine does not necessarily overwrite. All old source snapshots for the 776-byte function must be evaluated against **these** original behavior boundaries before a whole-function compilation trial. The byte counts here describe input regions, not matched executable bytes. The parent now has a matching typed implementation; the packed-state child still has its own unresolved source frontier. Linked boundaries show `func_080D44D4` spans `0x080D44D4..0x080D60B0` (0x1BDC bytes) and remains ASM, while `func_080D60B0` at `0x080D60B0..0x080D64C8` (0x418 bytes) is **now exact C++** ([proof](SAVE_SOCIAL_STATE_COPY.md)). Claiming the parent's 776-byte function as "complete save copying" without these would be misleading. Do not brute-force compiler permutations.

### October 11 archived MoneyState hypotheses recompiled under three toolchains

After the typed Coop copy enabled a general, verified call-crossing liveness rule, seven **archived preprocessed MoneyState copy hypotheses** were recompiled with the new production compiler, retaining their frozen source input. None became exact: `money-copy-v1` **196/157**, `money-history-member-v2` **208/139**, `money-member-v1` **268/257** (slightly worse), `placement-entry`, `placement-range`, `placement-template` each **196/157**, and `typed-copy-array` **192/151** (size / differing linked bytes). The original May-2000 ARM and October-2003 Nintendo/Cygnus compilers both reproduced the same nonmatching **196/157** and **208/139** outcomes for the two representative hypotheses. This rules out the newly corrected compiler liveness behavior as a sufficient solution *for these source forms*; it does not prove the original `MoneyState` source layout. Original 200-byte `func_080D6B40` still ASM, **0 new matching code bytes**. Use genuinely new evidence about the nested counted-history constructor/copy ABI, not another compiler tweak or spelling variant.

### October 11: exact MoneyState range-construction integration

The Rucksack range-construction discovery supplied new ABI evidence for
MoneyHistory. A member `CopyConstructFrom`, const/nonconst `begin()`, captured
source count, and inline standard-library range construction reproduce both
active-entry loops. The final copy pairs at +0x120 and +0x128 are two
`MoneyRecord` aggregates, each containing income and spend, rather than four
independent scalar assignments. The byte layout is unchanged.

Scratch `money-stl-records.cc` / `money_range_records.hh` in the existing
local MoneyState research directory produces **198 exact instruction bytes**
at `0x080D6B40..0x080D6C06`; the final two bytes of the 200-byte linked
interval are ordinary alignment. The full-interval diagnostic is 198/2
(execution `sh_mv3bw4yy_62545b26`); the production source owns all 200 linked bytes. Isolated forced compare
`sh_mv3byvcj_2a8c31b0` and production compare `sh_mv3by797_02b6e467` passed
the original ROM SHA1. Direct inline ranges without the member boundary gave 200/160;
the member boundary without begin accessors or paired tail records gave
210/110. These supersede the old source-shape frontier, not the old recorded
failures. No compiler changes were made.

Final production `make test` passed (`sh_mv3c69xf_76631a07`, exit 0): portable
checks, layout/source evidence, selector negative cases, readability and forced
whole-ROM SHA1 comparison. The original 200-byte MoneyState linked interval,
next cleanup address and serialized record offsets remain exact.


### October 11: exact GameState parent copy and complete storage layout

`src/game_state_copy.cc` owns **0x080D4178..0x080D4480, 776 bytes**.
It copies the packed header field by field; calls the recovered Farm, Money,
Farmer, Dog and Social APIs; constructs only the saved buffer's active range;
retains the packed-native ASM call; and copies metadata, three strings and
tail records according to the table above. Reserved header bits, inactive
buffer bytes, padding and string tails are preserved. The destination is
returned, preserving the existing allocation.

The decisive source evidence was the already recovered counted-range
construction. `SavedByteBuffer::begin()` exposes one-byte
`SavedBufferByte` records over unchanged byte storage. A captured count and
`std::uninitialized_copy` reproduce the retail placement-copy loop.
This is a compatible source representation, not proof of the original
class name or the bytes' gameplay meaning. The old STL's class-type path
is essential: its unsigned-byte POD path emits a different bulk copy.
The two six-byte copies use explicit external `memcpy` symbol binding,
as required by the retail call boundaries. The metadata loops use separate
destination/count/source locals, consistent with the exact Coop copy.

Bounded local experiments at
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-game-state-copy-20261011/`:

| Candidate | Bytes / differing linked bytes | Finding |
| --- | --- | --- |
| v1 | 768 / 459 | Inlined six-byte copies lose retail call boundaries |
| v2 | 772 / 446 | Library calls restored; reused metadata-loop locals differ |
| v3 | 772 / 432 | Separate metadata loops; direct byte range still differs |
| v4, v6, v7 | 776 / 389 | Direct helper range, local cursor and construct helper are closed |
| v5 | 756 / 526 | Standard unsigned-byte POD path is wrong |
| v8 | compile rejected | Unpacked byte record is not one byte under this ABI |
| v9 | 776 / 389 | One-byte class range without begin accessors still differs |
| v10 | 776 / 0 | Typed byte records plus begin accessors match |
| v11 | 772 / 432 | Free accessors with direct helper do not reproduce the STL shape |
| v12 | 776 / 0 | Same exact range over existing raw byte storage; integrated form |

v12 linked binary SHA256:
`d040433ee888fcf6d3a389d9864166f100809669bec356509963c9abcfc0d664`.
No compiler edits, forced registers, forced inline attributes or padding
instructions were introduced. `saved_social_state.hh` shares the existing
social type and all its offset checks; the parent adds explicit checks for
its header, names and previously opaque tail boundaries.

Isolated forced `make -B -j4 compare` passed
(`sh_mv3e0jys_50a3be25`, exit 0). Production `make -j4 compare` also passed
(`sh_mv3e1uvh_cbf62c2a`, exit 0), both with original ROM SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
The initial isolated builds stopped at the readability guard's lexical
classification of an EC-macro symbol binding; explicit `extern "C"`
declaration resolves it without changing or relaxing the guard.
Full production `make test` passed (`sh_mv3e7mvb_c049a043`, exit 0): documentation and ownership checks, selector negative tests, synthetic SRAM checks, portable tests, readability, forced ROM rebuild and progress/hash verification. The parent and its original alias remain at 0x080D4178 (size 0x308), cleanup at 0x080D4480 and the packed-state child at 0x080D44D4. No real player-save round trip was tested.
