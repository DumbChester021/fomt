# Historical FoMT save decompilation handoff records

Archived October 11, 2026. Each earlier heading claiming 'latest' was only latest AT THAT TIME. Refer to the current canonical handoff for live state.

# FoMT Next Agent Handoff

## Latest exact Farm saved-state copy integration (October 11, 2026)

**Major save-copy win — +180 original byte-exact readable C++ bytes:** `CopySavedFarmState` / `func_080D64C8`, retail range `0x080D64C8..0x080D657C`, is now implemented in `src/farm_state_copy.cc` using the real `Farm` type, named members and normal C++ assignments. It copies the farm name, packed farm flags, 11-word horse placeholder, shipping stats, farmhouse, specialized Coop/Barn copies and full field. Both the readable name and original symbol alias remain at the original entrypoint. It calls existing still-ASM subcopies `func_080D66A4` and `func_080D657C`. **No registers pinned, compiler modified, inline assembly added, or ROM patches.** Exact source diff `/mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/proofs/farm-production.diff`: expected 0xB4, actual 0xB4, 0 linked byte differences.

**Natural compiler-shape breakthrough:** The earlier naive `*dst=*src` implicit Farm copy produced 788 bytes vs 180 original. Real per-member C++ cut it to 184 bytes/54 differences; explicit 11-word horse loop cut it to 180 bytes/6 differences; declaring the loop count between destination and source pointers produced **zero differences**. Full bounded scratch experiments `fomt-farm-copy-20261011/farm-shape-probes.py` and `farm-order-probes.py`. Original loop counts from 10 down through zero (11 words, 0x2C bytes). The matching solution preserves genuine Farm source and original compiler; don't repeat discarded implicit or unrolled alternatives.

**Complete forced retail build PASSED** after linker/ASM promotion: `make -B -j4 compare`, Ches execution `sh_mv2sly7y_cf9bd46e`, output `fomt.gba: OK`, original retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Inventory regenerated `sh_mv2smhrl_9e529554`: **90,644/940,036 = 9.6426%** source-owned game-code bytes, linked ASM **849,392 bytes / 1,948 functions**, original data/assets **75,554 bytes**, meaningful ROM **166,594/7,717,440 = 2.1587%**. This batch added exactly 1 function/180 matching bytes. The saved GameState's two exact source dependencies now include Farm 180B and Dog 132B; parent `func_080D4178` 776B, farmer copy `func_080D68C0`, MoneyState copy `func_080D6B40`, Coop/Barn nested copies and `func_08011650` 740B loader **still ASM**. `docs/SAVE_FARM_STATE_COPY.md` has full proof and methodology. This is NOT complete save decompilation.

**Next action:** continue source-exact neighboring Farmer/Rucksack and Coop/Barn assignment family, then natural GameState parent and loader; read prior nonmatching MoneyState/loader ledger before new variants. The Farm source file and matching linker seam are already integrated, so preserve them. Both save-slot GUI handlers, retry/error semantics and real backed-up SRAM/emulator tests remain unfinished. No modifications to custom-game; retail `main` has intentionally dirty local, **not committed or pushed**, working tree. No unrelated checkout/reset.

## Latest GameState typed save layout + fieldwise assignment map (October 11, 2026)

**High-value save-structure advance, full retail exactness retained:** The compile-time-checked source view `include/save_persisted_layout.hh` now embeds **seven actual project-native GameState subobjects** at proven retail offsets:
`Farm` +0x14 (0x1A94 bytes); `MoneyState` +0x1AA8 (0x130); `Farmer` +0x1BD8 (0x98); `Dog` +0x1C70 (0x30); `SavedByteBuffer` +0x1CA0 (0x2C); `SavedTransitionState` +0x2C74 (0x0C); `FishingRecords` +0x2C80 (0x1D8). The first 0x14 GameState-header bytes and remaining +0x1CCC..2C73 and +0x2E58..34F3 spans are still opaque. Note these **named classes themselves contain incompletely understood fields**, so typed layout is NOT complete semantic save decompilation. **41 compile-time size/offset invariants** now pass under the authentic old compiler, including Farm's horse/shipping/house/coop/barn/field offsets, Farmer's location/held-item/rucksack offsets, MoneyHistory capacity/record layout, fishing record stride, both save slots and header geometry.

**Final full retail ROM comparison passed:** `make -B -j4 compare` returned 0, `fomt.gba: OK`, Ches run `sh_mv2saxgu_aed05dc4`, unchanged US ROM SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. No new executable C++ bytes were integrated in this turn: matching game-code total remains **90,464/940,036 = 9.6235%**; ASM **849,572 bytes / 1,949 functions**; meaningful ROM **166,414/7,717,440 = 2.1563%**. The last new matching function is still `CopySavedDogState` 132-byte C++. The 776-byte GameState assignment `func_080D4178`, the 740-byte `func_08011650` loader and the 200-byte MoneyState nested assignment `func_080D6B40` remain original ASM. Full save/load/copy/erase and actual emulator testing remain unfinished.

**New complete fieldwise GameState copy map:** `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md` traces the original 776-byte `func_080D4178`: typed Farm/Money/Farmer/Dog calls, active saved-buffer count copy, social-state calls, transition, the 59 fishing entries and tail. The user's full read-save workflow still uses exact cleanup(old,mode 2), ASM fieldwise copy, exact cleanup(new,mode 3). This clarifies *why a raw memcpy/pointer-swap would be wrong*, but is not a source-exact replacement for the parent copy.

**Farm copy source-shape negative oracle:** Trying the actual implicit `Farm` assignment `*dst = *src` in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-farm-copy-20261011/farm-implicit-copy.cc` compiled to **788 bytes**, far larger than the 180-byte retail `func_080D64C8` (769 linked-byte differences). The original Farm copy is a specialized member-aware sequence, not the legacy compiler's default class-wide assignment; leave ASM and reconstruct only the proven member operations. See `docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`.

**Money copy source-shape hypothesis closed for now:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/money-copy-v1.cc` is 196 vs 200 bytes, 157 mismatching linked bytes. `money-placement-probes.py` tested natural placement-new construction and entry copies (same 196/157) plus direct typed-field copy (192/151), no exact result. Do not repeat those or force registers; `func_080D6B40` remains ASM. Its proven identity as `MoneyState` is useful downstream. Existing source `include/money.hh` owns the 30 daily + 4 seasonal records.

**Read-only SRAM inspector expanded:** `tools/ches/inspect_sram.py` now summarizes FishingRecords, using the exact source-backed `GetTotalFishCaught` index range 8–58 and 1-billion cap, counts nonzero Fish King entries 53–58, and retains verified MoneyState, buffer/transition values. It exposes fields only when header validity bit, record length and checksum all agree. Synthetic fixtures tested populated index 8, King index 53, pre-fish index 4 exclusion and 1-billion cap; `python3 tools/ches/inspect_sram.py --self-test` passed. No real player SRAM was loaded, edited, or claimed to work in game. Details `docs/SAVE_SERIALIZED_LAYOUT.md`.

**Canonical next save work:** recover natural byte-exact Farm/Farmer/Money assignments and other fieldwise dependencies, then `func_080D4178` and `func_08011650`, using the Oct 4–5 loader closed-experiments ledger. Continue save-menu/slot errors, SRAM write/erase/copy and backed-up emulator load tests, not unrelated code throughput. Local retail `main` remains intentionally dirty and uncommitted/unpushed; custom-game worktree untouched. The docs listed above plus `docs/SAVE_LIFECYCLE.md` are authoritative for this checkpoint.

## Latest verified persisted Money/Dog layout + offline field inspection (October 11, 2026)

**Compile-time-checked GameState save type graph extended, no new matching function bytes:** `include/save_persisted_layout.hh` now embeds the project's actual `MoneyState money` at GameState+**0x1AA8** (`sizeof 0x130`) and actual `Dog dog` at GameState+**0x1C70** (`sizeof 0x30`), while retaining existing `SavedByteBuffer` at +0x1CA0 and `SavedTransitionState` at +0x2C74. Opaque intervals and original 0x34F4 payload size are preserved. **Twenty-five** legacy-compiler compatible layout/size assertions verify binary placement (13 newly added in this continuation, including MoneyHistory capacities and maxima offsets). This is true source re-use, not invented local byte structs. The final forced `make -B -j4 compare` completed successfully (`sh_mv2rxa31_286ba6d5`, `fomt.gba: OK`, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`).

**Read-only diagnostics improved:** `tools/ches/inspect_sram.py` still checks ROM-derived 32-byte signature, slot mask/selection, exact 0x34F4 length and payload checksum; for structurally **header-and-record-consistent slots only**, it now decodes `MoneyState` balance, daily/seasonal history counts and four recorded maxima, saved-buffer count, and transition indices/countdown, with nonauthoritative capacity-range diagnostics. It does not modify saves or imply emulator loading works. Synthetic fixtures assert exact parsed offsets/values and suppress decoding on corrupted checksum/signature; passed (`sh_mv2rs4ed_cdfcc88a`). **No real player SRAM was used.** See `docs/SAVE_SERIALIZED_LAYOUT.md`.

**Important newly recognized identity:** `func_080D6B40` (`080D6B40..080D6C08`, 200 bytes) is the actual `MoneyState` memberwise/counted-history copy, called by the larger GameState assignment at +0x1AA8; it is not an anonymous generic block. `MoneyHistory<30>` at MoneyState+0x08 (GameState+0x1AB0), `MoneyHistory<4>` at +0xFC (+0x1BA4), trailing totals +0x120..0x12C explain all fields. A normally typed candidate at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-money-copy-20261011/money-copy-v1.cc` compiled to **196 vs original 200 bytes, 157 differing linked bytes**: semantically explanatory but compiler-generated register/lifetime differences remain; `func_080D6B40` **stays ASM**. Prior generic `nested-copy-v1/v2` also remain nonmatching. Do not promote partial matches, replace nested record logic with full-struct memcpy, or repeat spelling-only variants without new ABI evidence.

**Latest exact-source inventory unchanged:** **90,464 / 940,036 = 9.6235%** source-matched C++ bytes; **849,572 remaining ASM bytes / 1,949 linked functions**, meaningful ROM **166,414 / 7,717,440 = 2.1563%**. The matching `CopySavedDogState` 132-byte production result remains the latest newly integrated function. Save-system completion itself is not measured by these whole-game percentages. The larger 776-byte `func_080D4178` GameState assignment and 740-byte `func_08011650` loader are still ASM. Continue recovering the typed assignment/loader and save/load/copy/erase/write paths, respecting the closed Oct 4–5 loader/compiler probes.

**Working tree:** local, intentional dirty `main` tracking `ches/main`; no commits/pushes in this continuation, no custom-game edits. New docs and inspector are in the same retail tree. Preserve all uncommitted work.

## Latest production exact Dog save-state assignment (October 11, 2026; local)

**New full-ROM-exact code:** `CopySavedDogState` / `func_080D67C8`, original range `0x080D67C8..0x080D684C` (132 original bytes), is now natural C++ source at `src/dog_state_copy.cc`. It uses the real project `Dog` and `Animal` member definitions and preserves Animal's original out-of-line inherited assignment call, plus Dog's adequacy, played/talked flags, `unk_20`, full eight-byte `unk_24`, and packed frisbee state. The original symbol remains an alias, linked in `.text.save_dog_copy` immediately before original `.gnu.linkonce.t.__as__6AnimalRC6Animal`. Only the 132-byte original span was deleted from `asm/code_linkonce.s`; surrounding code stayed original.

**Important ABI trap now closed:** A scratch version explicitly declared `Animal::operator=(Animal const&)` in `include/animal.hh`. This **suppressed emission** of the old compiler-generated `__as__6AnimalRC6Animal` required by Farm/Livestock/Dog; the intermediate full build failed with unresolved symbols. The production header was restored to its exact original contents. The final production C++ uses a normally named `CopyAnimalBase(Animal*, Animal const*) asm("__as__6AnimalRC6Animal")` external declaration: ABI labeling, **not** inline assembly, forced register code or a compiler patch. The old original implicit operator remains generated and shared. **Production exact linked-byte comparison: zero differences** (Ches `sh_mv2ra2im_2899433e`). **Forced whole ROM `make -B -j4 compare` passed** after the correction (Ches `sh_mv2r9hc0_aff9e3e5`, `fomt.gba: OK`; US retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`). Do NOT add that explicit Animal operator declaration again.

**Live inventory** regenerated (`sh_mv2ra9ak_4a06bede`): **90,464 / 940,036 = 9.6235% exact C++ bytes**, **849,572 ASM bytes / 1,949 linked functions**, mapped inferred ASM **846,536 bytes**, unattributed ASM **3,036 bytes**, unchanged recovered assets/data **75,554 bytes**, overall meaningful ROM **166,414 / 7,717,440 = 2.1563%**. This turn added 1 function / 132 source-exact bytes beyond the preceding 228-byte GameState cleanup cluster. All modifications are local on `main` tracking `ches/main`, **uncommitted and unpushed**, with the custom-game worktree untouched.

**New permanent evidence:** `docs/SAVE_DOG_STATE_COPY.md`, scratch sources and proof diffs in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-loader-ownership-20261011/`, especially `proofs/dog-copy-production.diff`. Dog copy is a dependency of the 776-byte `func_080D4178` GameState assignment, **NOT** that whole assignment. Two behavioral typed copies for another nested block, `func_080D6B40`, exist as scratch `nested-copy-v1.cc` (0xC0 vs 0xC8) and `nested-copy-v2.cc` (0xB4 vs 0xC8) and DO NOT match; do not promote. The 740-byte `func_08011650` loader, save/load UI paths, and SRAM writer/erase remain ASM. Read Oct 4–5 loader failure ledger first, avoid register-hack syntax roulette, and prioritize complete readable GameState copy/load flow rather than miscellaneous functions. Original `Animal` header unchanged.

## Latest exact GameState save-load cleanup integration (October 10, 2026)

**Three contiguous-in-callchain source-exact cleanups, 228 original linked code bytes** were integrated into natural readable C++ in `src/game_state_cleanup.cc`:
- `CleanupGameState` / `func_080D4480` at `080D4480..080D44D4`, 84 bytes. Walks inline SavedByteBuffer range (+0x1CA0/+0x1CA4), calls nested cleanup at GameState+0x1C38 and +0x1AA8 with mode 2, frees self only when `mode & 1`.
- `CleanupGameStateBlock1C38` / `func_080D6B00` at `080D6B00..080D6B40`, 64 bytes. Walks two collection ranges of 2-byte and 4-byte entries using embedded counts, conditionally frees self.
- `CleanupGameStateBlock1AA8` / `func_080D6C08` at `080D6C08..080D6C58`, 80 bytes. Walks two eight-byte-entry collection ranges using embedded counts, conditionally frees self.

**All three have independent 0-difference isolated proofs, including named-source versions; final forced complete retail `make -B -j4 compare` passed** (Ches `sh_mv2ko6kd_c44d36db`, output `fomt.gba: OK`, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`). Note the intermediate full build `sh_mv2kkki2_81f0a2fd` failed solely on a harmless `void*`/`u8*` duplicate declaration; corrected in production and full build passed `sh_mv2kl8lh_eb63eaed` before integrating the third. No compiler or ABI patches, forced registers, source-inline assembly, fake barriers, or ROM patching. The important natural source discovery was calculating the collection's byte count before its end pointer to reproduce the original compiler's register lifetime and pointer order. Source and exact linker/assembly seams are now permanent local edits; old original symbols are kept as aliases.

**Current regenerated inventory** (after `sh_mv2kovhu_c2768b1b`): exact code **90,332 / 940,036 (9.6094%)**, remaining ASM **849,704 bytes / 1,950 linked functions**, mapped inferred ASM **846,668**, unattributed ASM **3,036**, original data/assets **75,554**, meaningful ROM **166,282 / 7,717,440 = 2.1546%**. This continuation itself added 3 functions / 228 exact code bytes. The user's separate custom-game worktree is untouched. These changes are **local and uncommitted** on `main` tracking `ches/main`; no push occurred.

**Reference:** `docs/GAME_STATE_SAVE_CLEANUP.md` describes all offsets, proven contracts, saved scratch candidates and tests. Scratch: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-loader-ownership-20261010/`, `proofs/cleanup-named.diff`, `proofs/nested-farm-cleanup-named.diff`, `proofs/nested-money-cleanup-named.diff`. Explicit full-ROM gate after third integration `sh_mv2ko6kd_c44d36db`. Do not re-run v1/v2 first-shape experiments without new evidence.

**Next highest-leverage save work:** 776-byte `func_080D4178` fieldwise/subobject-aware GameState assignment, 740-byte `func_08011650` constructor/load/checksum path, and `func_08003F9C`/`080040A0` menu retry/owner-transfer. The existing GameState is cleaned without freeing (mode=2), overwritten through **subobject-aware assignment**, then fresh temp is cleaned and freed (mode=3). Never replace assignment with raw memcpy or swap active pointer. Nested meaning beyond collection byte widths and offsets is still uncertain. Also finish SRAM write/erase (the writer remains 4 linked bytes off due compiler register allocation) and actual backed-up emulator save testing. The old Oct 4–5 loader mismatch ledger is mandatory to read before new loader work; do not repeat 100+ dead compiler candidate variations. Remaining load/save/copy/erase routines are **NOT finished**.

## Latest save-header diagnostics and menu-flow verification (October 10, 2026)

**Typed header now complete at field level:** `include/save_persisted_layout.hh` contains `SaveSramHeaderLayout` (`u8 signature[32]` at +0, `u32 valid_slot_mask` at +0x20, `u32 selected_slot` at +0x24), as well as the existing two slot types and partially typed GameState payload. The original agbcc C++ compiler now enforces **twelve** size/offset assertions including all header fields. The forced `make -B -j4 compare` after these changes passed, Ches execution `sh_mv2bppv3_97061b82`, `fomt.gba: OK`, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. The new type is source-layout research, **not additional source-matched function bytes**.

**Read-only save integrity tool upgraded:** `tools/ches/inspect_sram.py` now checks the exact 32-byte `gUnk_080E862C` signature (verified 32/32 independently against the built retail ROM at file offset 0xE862C), valid-mask range (only bits 0–1), selected-slot range (0–1), and each slot's 0x34F4 length and payload byte-sum checksum. The output separates header validity, a slot being marked valid, record length/checksum consistency, combined header/record consistency, and selected slot. Synthetic tests passed for clean records, bad checksum/length, corrupt signature, mask/selection out of range, empty/unmarked slots and malformed file sizes. Do **not** treat this as a running-game load test or claim a real SRAM sample was checked. Source-backed field/proven limitations: `docs/SAVE_SERIALIZED_LAYOUT.md`.

**Save-menu ASM behavior now explained for reconstruction:** `docs/SAVE_MENU_RETRY_TRACE.md` records the exact observed three-attempt save and load loops. Save `08003F9C` only sets the slot-valid bit and writes selected-slot header **after successful record writing**. Load `080040A0` allocates 0x34F4, calls `08011650`, and uses the **error out-param**, not nonnull returned pointer, to decide acceptance; on error it deletes the fresh state before retry. New-state owner transfer/cleanup calls `080D4178` and `080D4480` remain to be typed. Both handlers and the 740-byte loader are **still ASM**. The error dispatcher `08000728` has already been fully exact-source decompiled; older lifecycle notes mistakenly saying it remains ASM have been corrected.

**Bounded writer ABI cross-check:** scratch probes `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/write-abi-probes.py` tried the now-proven pointer return type of `func_080D38D4`, explicit null comparison, typed source/destination and signed offset. Correct-sized `func_080006A4` candidates remain **4 differing bytes**, exactly two swapped saved-input registers. No new source-promotion, compiler patch, or forced register solution. The relocated SRAM reader `080D379C` likewise remains original ASM.

**Latest reconstruction total unchanged:** 90,104 / 940,036 code bytes = **9.5852%**, linked ASM 849,932 bytes / 1,953 functions. This is *not* a save-system completion percentage; completing the loader, menu/owner lifecycle and real save tests is substantial remaining work. Retail `main` has local uncommitted changes only, no push/commit; the separate custom-game worktree stays untouched.

**Ownership insight now verified from raw assembly:** `func_080D4480` is an 84-byte GameState cleanup with nested releases at +0x1C38 and +0x1AA8, deallocating the GameState allocation only when `flags & 1`. `func_080D4178` is a 776-byte **subobject-aware GameState copy/assignment**, not raw memcpy: it copies or delegates farm, money, farmer, dog, social, inline buffer, transition, fishing/mine and tail state. After successful load into an existing game, the menu calls cleanup(existing, 2), copy(existing, newlyLoaded), then cleanup(newlyLoaded, 3), preserving the active object address. If no active game exists, it adopts the new pointer into an eight-byte wrapper instead. Failed load deletes the fresh buffer without committing it. Detail and exact offsets are recorded in `docs/SAVE_MENU_RETRY_TRACE.md`. These routines **remain ASM**, and the nested helpers still need source contracts.

**Next priority:** natural byte-exact source for the GameState copy/cleanup and loader `08011650`, using the Oct 4–5 closed-experiment ledger rather than repeating compiler-zero/register hacks. Then finish UI/copy/erase and real backed-up SRAM emulator validation. Preserve the user's custom-game isolation and evidence-based names.

## Latest save-image layout / read-only SRAM tooling checkpoint (October 10, 2026)

**New typed source (no new matched code bytes):** `include/save_persisted_layout.hh` defines exact-size and offset-checked `PersistedGameStateLayout` (0x34F4), `SaveSlotStorageLayout` (0x3FEC), and `SaveSramStorageLayout` (0x8000). It anchors recovered `SavedByteBuffer` at GameState+0x1CA0 and `SavedTransitionState` at +0x2C74, while leaving other bytes opaque; two 0x3FEC SRAM slots follow the 0x28 header. Each slot has a 4-byte length, payload at +4, checksum at +0x34F8 and 0xAF0 unclaimed tail. The existing `src/save_format.cc` now includes the view, and **nine compile-time size/offset assertions** pass under the original agbcc C++ toolchain. `offsetof` is required: initial `__builtin_offsetof` syntax failed under the legacy compiler; this was fixed. No game behavior was changed or data was erased.

**New read-only diagnostic:** `tools/ches/inspect_sram.py` validates 32 KiB SRAM length and each slot's 0x34F4 length/checksum by reproducing the original 32-bit sum of payload bytes. `python3 tools/ches/inspect_sram.py --self-test` passed (`sh_mv2b8vce_014365ab`) with synthetic intact/corrupt/wrong-length/empty/wrong-file-size cases. For a backed-up real player SRAM, run `python3 tools/ches/inspect_sram.py /path/to/copy.sav`. It **does not** mutate files, parse header-validity bits, or claim successful in-game loading. Detailed offsets, limitations and tests: `docs/SAVE_SERIALIZED_LAYOUT.md`.

**Latest forced full retail gate:** `make -B -j4 compare` passed (`sh_mv2b5kc6_e91285a6`, `fomt.gba: OK`), retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Code metrics unchanged: **90,104 / 940,036 = 9.5852%**, linked ASM **849,932 bytes / 1,953 functions**, meaningful ROM **166,054 / 7,717,440 = 2.1517%**. These changes are in the local uncommitted `main` working tree; no commits/push or custom-game edits.

**Bounded source research:** A natural typed `func_080D379C` SRAM reader probe `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/relocated-read-v1.cc` compiled to the correct 0x64 bytes but had **75 linked differences** because code relocation, Thumb entry, register identities and literal pools differ. This is not production source. Original SRAM reader/verification relocation wrappers stay ASM. Do not substitute ordinary byte-copy code; original copies executable helpers to stack RAM before SRAM access.

**Next high-value work:** connect this typed on-disk parent view with the existing 740-byte `func_08011650` loader model, reuse the exact saved subobjects and avoid the October 4–5 compiler experiments already closed. The save/load UI paths, SRAM writer/eraser, copy/retry/repair paths, and tests with a backed-up *actual* SRAM image still need completion. Do not mistake a matching checksum for in-game validity, and do not present the read-only inspector as a full save loader. Previous exact-source work is documented in the sections below.

## Latest retail-exact save progress marker (October 10, 2026; local/uncommitted)

The packed-state helper `func_08011458` is now source-owned by natural, fully readable C++ as `MarkSavedPackedFlag(u8*)` in `src/save_packed_flag.cc`. It ORs bit 4 of the first record byte, preserving others; the record's higher-level owner is not yet proven. `12 linked bytes` at `0x08011458..08011464` matched the original machine code with **zero differences**, including the named alias and original address, and source/linker splitting preserves all neighboring ASM. The new section is `.text.saved_packed_flag` followed by `.text.after_save_packed_flag`. Proof: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/proofs/packed-flag-named.diff`. Full forced `make -B -j4 compare` **passed**, execution `sh_mv2amxjc_ee34fb1b`, `fomt.gba: OK`, retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Inventory regenerated in `sh_mv2anl4k_e9fa68eb`.

**Latest live totals:** exact C++ game code **90,104 / 940,036 = 9.5852%**; remaining linked ASM **849,932 bytes / 1,953 functions**; inferred mapped ASM **846,896 bytes**; unattributed **3,036 bytes**; recovered data/assets **75,554 bytes**; meaningful ROM **166,054 / 7,717,440 = 2.1517%**. Prior snapshot was 90,092 / 1,954. The source, metrics, docs, linker and inventory are local modifications on `main` tracking `ches/main`; **not committed or pushed**. Custom-game untouched.

**Bounded research (not exact):** `08011464`, `08011498`, `080114C8`, `080114F8` packed progress/value setters were probed from existing typed sources; historical best `packed-level4` had 7 differing bytes, new `level8` reduced this to 5, `packed-flags3` has 3, none is matchable currently without compiler codegen work; not integrated. Other variants `progress-up1..5`, `progress-mid1..3`, `level6..10`, `flags4..7` are saved under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/`. This is a closed natural-shape exploration absent new ABI evidence, **do not spin registers or blindly retry**. See `docs/SAVE_PACKED_PROGRESS.md`.

**Next priority:** full meaningful save-system decompilation, not miscellaneous throughput. Reuse exact `SavedByteBuffer` (`GameState+0x1CA0`) and `SavedTransitionState` (`GameState+0x2C74`) to reconstruct save loader `func_08011650`, then save/load UI wrappers, SRAM write/erase and save slot copy/repair/retry paths. Loader remains 740-byte ASM, with 100+ exhausted natural candidates from Oct 4–5 checkpoint: read the documented closed experiments first. The source-exact progress percentage is **not** a save system completion percentage. Preserve custom-game isolation, natural source and exact-ROM gate.

## Newest exact GameState save subobject checkpoint (October 10, 2026; local, not committed)

**Eight contiguous natural C++ functions (120 exact code bytes) were just added** for the persisted `SavedTransitionState` at `GameState+0x2C74`. `src/save_transition_state.cc` and `include/save_transition_state.hh` own `0x08011510..0x08011588`, using eight original-address aliases: Initialize (11510, 12), current getter (1151C, 4), pending getter (11520, 4), readiness predicate (11524, 28), current setter (11540, 4), arm pending (11544, 12), clear transition (11550, 24), day countdown tick (11568, 32). The original `GameState` default initializer and `func_08011650` loader both call the constructor on +0x2C74, and the daily update calls the tick on the same state. Initial sentinel for both indices is 16, countdown starts at 0 and arms at 2. What game-world indices identify remains **unknown**; do not invent a gameplay-specific name. Detailed typed offsets and callers: `docs/SAVE_TRANSITION_STATE.md`.

Every individual probe compiled at correct address size with **zero different linked bytes**; natural source forms and diffs are under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-transition-20261010/`. Original assembly was removed only for this contiguous exact span, and the linker now owns separate `.text.save_transition_state` and `.text.after_save_transition_state` seams. The forced full-ROM gate `make -B -j4 compare` passed, Ches execution `sh_mv2a88yy_5e2116a0`, `fomt.gba: OK`, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Inventory regenerated `sh_mv2a8yxy_b7a0ddfa`: matching code **90,092 / 940,036 = 9.5839%**, remaining ASM **849,944 bytes / 1,954 linked functions**, inferred ASM range **846,908 bytes**, unattributed ASM **3,036 bytes**, unchanged data/assets **75,554**, meaningful ROM **166,042 / 7,717,440 = 2.1515%**. Prior local source was 89,972 bytes; **120 added this turn**. These changes are intentionally uncommitted on `main`, tracked remote `ches/main`, last HEAD observed `459abd8`; the separate custom-game worktree was not touched.

**Bounded failed neighbors:** `SavedByteBuffer` constructor `0800FF8C` v1–v10 still differs (best `ctor-v5` 28 differing linked bytes); reduction `08010024` v1–v10 remains nonmatching (compiler folds its pointer arithmetic). Nearby packed-state functions `080114C8` and `080114F8` are semantically probed only; natural `packed-level4` has 7 differing bytes and `packed-flags3` has 3. They remain in original ASM, with diffs in the transition scratch folder. `func_08000540` from interrupt library is naturally zero-difference in isolated proof (`/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-critical-20261010`) but is **not integrated** due to save-only priority. No compiler changes or forced-register work.

**Next work:** use the now-readable transition/buffer subobjects to improve `func_08011650` (740 bytes) and typed default initializer in a fresh evidence-based way, without repeating the 100+ closed loader candidates from the October 4–5 checkpoint. Then pursue GUI load/save wrappers `func_08003F9C`, `080040A0`, `080041DC`, SRAM write/erase/proxy completion and actual saved-SRAM emulator tests. The loader, complete GameState structure, copying, and erasure **remain unfinished**. All older sections below are historical proof context.

## Latest verified save-state type integration (October 10, 2026; local/uncommitted)

**This is the latest source/inventory truth**, superseding the previous 336-byte SRAM section below while preserving its proof history. Six `GameState+0x1CA0` typed byte-buffer accessors, append, and location-copy methods totaling **84 byte-exact linked bytes** are now in `src/save_byte_buffer.cc` and `include/save_byte_buffer.hh`. Names and addresses: `SavedBufferCount`/0800FFD0 (4), `SavedBufferData`/0800FFD4 (4), `SavedBufferEnd`/0800FFD8 (8), `GetSavedBufferLocation`/0800FFE0 (20), `AppendSavedBufferByte`/0800FFF4 (32), `SetSavedBufferLocation`/08010014 (16). Original aliases remain. The struct has count +0x00, 32-byte payload +0x04, 6-byte location +0x24, and two still-unknown tail bytes +0x2A, covering the 0x2C span until the next GameState field +0x1CCC. **Do not invent its game-world identity or tail semantics.** Stable detail and unfinished neighbors: `docs/SAVED_BYTE_BUFFER.md`.

Original ASM/linker seams preserve `0800FF8C` constructor and `08010024` buffer clear/reduction. `AppendSavedBufferByte` / `0800FFF4` now matches all 32 retail bytes exactly in natural typed C++ when the value parameter is **unsigned int**, not `u8`, even though only the low byte is stored. Proven via `append-typed-v2.cc` and `append-named.cc`, both zero differences. Historical failing `append-typed-v1.cc` uses the wrong narrow argument and must not be repeated. The constructor `ctor-v1.cc` is still nonmatching (0x44 length, 59 differences). Named/typed individual proofs are all 0 differences under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-buffer-20261010/`.

**Forced full-ROM gate** `make -B -j4 compare` passed, execution `sh_mv29b73e_17d0d3da`, original SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. New inventory, regenerated after the source integration: **89,972 / 940,036 = 9.5711%** exact C++ code; remaining ASM **850,064 bytes / 1,962 linked functions**, mapped inferred ASM **847,028 bytes**, unattributed **3,036 bytes**; unchanged recovered data/assets **75,554 bytes**; overall meaningful ROM **165,922 / 7,717,440 = 2.1500%**. This turn's total new exact code is **420 bytes across ten functions** (336 SRAM + 84 typed saved-buffer). Prior local SRAM exact total of 108 bytes is already included in current totals. Retail branch `main`, last tracked HEAD observed `459abd8` following the published code source `f069823`; all source changes remain local, **not committed or pushed**. Custom-game worktree left unchanged.

**Next objective:** complete natural, exact `GameState+0x1CA0` constructor / buffer-clear semantics if new type or source-shape evidence arises (append is now exact source), then prioritize the much larger 740-byte save loader `func_08011650` and remaining persistent `GameState` type graph. The SRAM write proxy `080006A4` remains 4 linked bytes off in natural candidate `write-v9.cc` (r4/r5 swap); physical writer `080D3800` remains 2 bytes off in `physical-write-v2.cc` (WAITCNT register order), with variants exhausted. Eraser `08000664` and hardware RAM-relocation wrappers remain ASM. Do not repeat closed candidates or introduce forced registers/compiler patches. Save-menu save/load/erase/copy/slot-selection and backed-up emulator SRAM tests remain required. Read `docs/SAVE_LIFECYCLE.md` and the 004–005 Oct loader closed ledger before attempting `11650`.

## Latest verified SRAM-source continuation (October 10, 2026; uncommitted)

**This section supersedes the earlier 108-byte SRAM update below.** This turn recovered **four additional byte-exact natural C++ functions / 336 linked bytes**:
- `OrSramErrorFlag` / `func_08000728`: 196 bytes at `08000728..080007EC`, now in `src/sram_proxy.cc`. The successful `errors-v3.cc`/named candidate used a truncated `u16` flag and retail's nonnumeric switch case-body order: 1, 2, 256/512, 4, 32, 8, 16, 64, 128. No register forcing/compiler patch.
- `WriteSramWithVerification` / `func_080D38D4`: 56 bytes at `080D38D4..080D390C`, now `src/sram_write_verify.cc`. Retry write then compare up to three times, returning a mismatch pointer or null.
- `CopySramBytes` / `func_080D3778`: 36 bytes at `080D3778..080D379C`, now `src/sram_byte_copy.cc`. Byte-copy body is relocated into RAM by the original SRAM reader; its exact bounds and bytes are preserved.
- `FindSramMismatch` / `func_080D3840`: 48 bytes at `080D3840..080D3870`, now `src/sram_byte_compare.cc`. Returns the first mismatched destination byte or null; the original SRAM verifier relocates it into RAM.

Each named standalone source has an independently saved zero-difference proof. Original function aliases and the five relevant linker/assembly seams were preserved. **Forced full-ROM gate** `make -B -j4 compare` exited 0 (`sh_mv28lmfg_96561a9b`, `fomt.gba: OK`, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`). Regenerated `tools/ches/decomp_inventory.json`/`DECOMP_QUEUE.md`: matching code **89,888 / 940,036 (9.5622%)**, linked ASM **850,148 bytes / 1,968 remaining functions**, inferred ranges **847,112 bytes**, unattributed **3,036 bytes**, recovered assets **75,554**, meaningful ROM **165,838 / 7,717,440 (2.1489%)**. This includes **444 exact SRAM bootstrap/read/context/error/library bytes** from this and the immediately preceding uncommitted continuation. Prior published source commit still `f069823`; current tracked HEAD before edits was documentation commit `459abd8`. **Do not claim pushed/committed.** The `custom-game` worktree was not touched.

**Saved proof/rejected experiment directory:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/`. Writer `func_080006A4` is structurally matched down to **4 differing linked bytes** with exact-sized natural `write-v9.cc` (`write-v13.cc` and variants) due solely to swapped r4/r5 allocation. Do not force register names or loop through already exhausted v1–v30 wording variants. The anonymous 64-byte `08000664` full-SRAM eraser remains ASM; defined clean fill candidate `erase-clean-v1.cc` is 0x44 vs retail 0x40 / 33 differences; *do not* transcribe original read-before-OR of uninitialized stack bytes as undefined C++. The former `errors-v1.cc` failure is superseded by exact `errors-v3.cc`. Low-level relocated SRAM read `func_080D379C`, physical-byte writer `func_080D3800`, and relocated comparison `func_080D3870` remain ASM.

**Additional bounded physical-writer investigation (unintegrated):** `func_080D3800` clean C++ `physical-write-v2.cc` is the correct 64-byte size with just **two differing linked bytes**, both the ordering of WAITCNT value/mask loads (`r0`/`r1`); variants v3–v13 retain the same two differences. Do not escalate this to compiler patches, hard registers, or syntax roulette. It remains original ASM, as do the stack-relocation wrappers. All details saved under the SRAM scratch folder.

**Next highest-value work:** complete remaining SRAM write/erase/read-verify boundaries using a structural evidence-led approach, but pivot promptly to the 740-byte `func_08011650` save loader and persistent `GameState` type graph if register-only matching is the frontier. Recover save/load/erase/copy UI handlers `03F9C/040A0/041DC` and deterministic backed-up emulator save tests before claiming completion. Review old loader checkpoint anti-rediscovery ledgers first. No compiler patches, no custom-game features, no commits/pushes without fresh user authorization. The prior 108-byte section is historical, not the live inventory.

## Latest local exact SRAM continuation (October 10, 2026; not yet committed)

Four SRAM-entrypoint functions are now **production-integrated, 108 byte-exact C++ bytes** in `src/sram_proxy.cc`: `EmptySramHook` / `func_0800063C` (4 bytes), `BeginSramAccess` / `func_08000640` (36 bytes), `ReadSram` / `func_080006E4` (48 bytes), and `ReplaceSramContextWord` / formerly anonymous `08000714` (20 bytes). All independently matched, including the 0x28-byte combined bootstrap source block. Original aliases remain at 063C, 0640, 06E4 and 0714. The **64-byte anonymous 08000664..080006A4 SRAM-erasure routine** stays in assembly. Its machine code fills eight stack bytes with 0xFF using an OR, writes eight bytes per iteration over the 32-KiB SRAM through `func_080006A4`, ignores write results, and returns 1; do not introduce an uninitialized-stack OR into production C++ simply to reproduce this codegen. It is the remaining 64 unattributed bytes in this immediate cluster.

**Verified forced full-ROM gate:** `make -B -j4 compare` exited 0, execution `sh_mv27vo4d_00e2cb02`, `fomt.gba: OK`, original SHA1 unchanged. Local production code **89,552 / 940,036 = 9.5264%**; linked ASM **850,484 bytes / 1,972 functions**; inferred ASM function ranges **847,448** bytes; unattributed **3,036** bytes; recovered data **75,554** bytes; meaningful ROM **165,502 / 7,717,440 = 2.1445%**. `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md` were regenerated. Changes are in the working tree, **not a published checkpoint**; `f069823` remains the last published production-code checkpoint unless Git changes later.

**Scratch proofs and rejected candidates:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-sram-proxies-20261010/`. The SRAM write proxy `func_080006A4` is behaviorally understood: clear the 16-bit error, return false for zero length, call `func_080D38D4(source, 0x0E000000 | offset, size)`, return true on verified copy, otherwise call `func_08000728(context, 0x100)` and return false. The best natural source `write-v3.cc` or `write-v6.cc` matches expected 64-byte length but has **11 differing linked bytes** due to register allocation/zero lifetime. Other failed write candidates v1 (50 differences), v2 (20 plus 4 extra bytes), v4/v5 (43). Do not promote or force-register the writer. A natural switch for `func_08000728` (`errors-v1.cc`) was 0xC0 vs retail 0xC4 and 165 differences, so source structure needs further evidence.

**Exact next action:** reconstruct the 64-byte 08000664 SRAM-erasure routine without uninitialized reads, and finish `func_080006A4` and `func_08000728` with fresh structural/caller evidence instead of spelling-only compiler probes; then the loader default-state type graph and `func_08011650`. Context exchange at `08000714` now has exact source; `func_080D100C` writes the selected global word and returns its previous contents. Keep all save/menu paths in scope. Update this handoff and `docs/SAVE_LIFECYCLE.md` after each exact cluster. No custom-game files were touched. Check current Git status before further edits.

## Save-only priority — current user directive (October 10, 2026)

**Priority change:** The user will not resume customization until the entire retail save system has been decompiled and documented in **human-readable C++**. Stop unrelated menu/tree/resource/owner throughput. Both gates matter: readable evidence-based semantics and original-ROM-exact linked code. The previous 100+ attempts to match `func_08011650` are in `tools/ches/checkpoints/save-loader-08011650-2026-10-04/`; do not reopen compiler spelling or add forcing hacks without genuinely new evidence.

**Just verified this continuation:** `src/save_slot_header.cc` + `include/save_format.hh` now own **7 exact functions / 472 linked bytes**: `VerifySaveHeader` (002E0, 120), `InitializeSaveHeader` (00358, 72), `ReadValidSaveSlotMask` (003A0, 60), `MarkSaveSlotValid` (003E8, 68), `ClearSaveSlotValid` (formerly raw code 0042C, 68), `WriteSelectedSaveSlot` (00470, 24), and `ReadSelectedSaveSlot` (00488, 60). The existing `GetSaveSlotOffset` at 003DC stays exact. Complete contiguous header region `080002E0..080004C4` is now source-owned. Every new function isolated compare had zero differing bytes, including the formerly unlabeled raw clear-valid code. Forced `make -B -j4 compare` execution `sh_mv25lwpc_e4c43b4c` exit 0; `fomt.gba: OK`; retail SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**. New inventory: code **89,444 / 940,036 (9.5150%)**, remaining ASM **850,592 bytes / 1,975 functions**, inferred range **847,620**, unattributed **2,972**, assets **75,554**, meaningful ROM **165,394 / 7,717,440 (2.1431%)**.

**Scratch:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-priority-20261010/` holds independent `compare-function.py` proof/diff artifacts and four reversible linker/ASM integration scripts, including original backup copies. The verifier's first natural candidate did not match; initializing mask/selected locals immediately before each read matched all 120 bytes. Header initializer's successful read-error-result zero reuse gives original 72 bytes. **Readable subsystem documentation:** `docs/SAVE_LIFECYCLE.md`, `docs/SAVE_FORMAT.md`.

**Next save-only work:** (1) Read `docs/SAVE_LIFECYCLE.md` and 004–005 Oct loader checkpoint anti-rediscovery ledger. (2) Recover the SRAM read/write proxy `func_080006A4` and `func_080006E4` and their error contract in exact natural C++. (3) Recover the default initializer/type graph and 740-byte `func_08011650` loader as readable source, using a behaviorally readable, explicitly nonmatching scratch candidate where necessary. (4) Recover GUI `func_08003F9C` save, `func_080040A0` load and `func_080041DC` slot-screen flow, and all erase/copy/slot-mask mutations. (5) Finish type ownership and deterministic copied-save emulator tests. User will not customize until *complete*. Any compiler-only nonmatching code stays out of production `src/`; update docs and matching metrics after each exact batch.

## Current production authority — 2026-10-10

**This is the live handoff.** The former chronological handoff is preserved
byte-for-byte in [handoff history](checkpoints/menu-throughput-docs-2026-10-10/HANDOFF_HISTORY.md).
Superseded next-target claims in that history are not instructions.

- Retail workspace: `/mnt/data/Github/gba/fomt`; branch `main` tracking `ches/main`; latest published source checkpoint **`f069823`** (seven exact SRAM header functions and save-first handoff). Confirm any later documentation-only commit with `git log -1`. Keep new readability-only edits separate from production code progress. Check `git log -1` and `git status -sb` for any newer work.
- **The previously dirty verified retail source is committed as 1e522c9.** The retail branch was clean and even with its tracked remote at the start of the October 10 documentation audit; documentation-only edits may now be pending review. The separate custom-game worktree has independent uncommitted docs. Preserve both worktrees; never reset, clean or stash without review.
- Retail SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**, ROM size **8,388,608**.
- Latest full forced comparison: `make -B -j4 compare` -> **`fomt.gba: OK`**; execution `sh_mv25lwpc_e4c43b4c`, exit 0. No background build pending.
- **Code 89,444 / 940,036 = 9.5150%**. Assembly: **850,592 bytes / 1,975 linked unresolved functions**; mapped inferred ranges **847,620** bytes, unattributed **2,972**, explicitly parked **27**.
- **Data/assets 75,554 / 6,777,404 = 1.1148%**; meaningful ROM **165,394 / 7,717,440 = 2.1431%**; free tail **671,168 bytes**.
- The thirteen-rule compiler compatibility layer is unchanged; see `docs/FOMT_COMPILER_FINGERPRINT.md`. The full save loader/GameState remains unfinished and **is now active**, not parked, under the save-first directive.
- **Save expansion readiness (October 10):** retail SRAM header/slots, record length/checksum/writer, loader validation stages and 2,800 unused tail bytes per slot are established. The loader `func_08011650` (740 linked bytes) and higher-level save/load handlers `func_08003F9C`, `func_080040A0`, `func_080041DC` remain assembly, and full `GameState` is incomplete. The separate `custom-game` worktree contains *host-only* reference tooling (`tools/save_extension_reference.py`) and **16 passing synthetic tests**, plus `docs/SAVE_EXTENSION_READINESS.md`. There is **no on-ROM serializer/loader, migration, overwrite/erase hook, or proven end-to-end persistence**. Do not treat this as release-ready or mix custom behavior into retail `main`.
- Readability audit: `docs/SOURCE_READABILITY_AUDIT.md`; repeatable heuristic scan: `python3 tools/ches/audit_source_readability.py`. The code-percentage metric counts exact bytes, not semantically complete functions. The three recent GameState/menu units are structurally readable but have unresolved slot meanings and address-derived external names.
- The live machine-generated truth is `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md`.

## Prior save-system investigation (before exact header reconstruction)

Static proof and the existing `tools/ches/save_load_map.json` confirm: SRAM is exactly 0x8000; header 0x28; two 0x3FEC-byte slots; per-slot record 0x34FC (size 4, GameState payload 0x34F4, checksum 4) and unused tail 0xAF0. The verified writer makes three independent low-level writes, and the loader defaults the state before validating the record but has no migration step. Loading is only valid when its **error output** indicates success, not when it returns a nonnull state pointer. The reference codec is separate and does not change the retail ROM.

The offline extension design uses two 1,400-byte banks per slot, each a 32-byte header plus up to 1,368 bytes of TLV data, and it has 16 passing synthetic tests. It also **proves a compatibility blocker**: a new game replacing a slot with an identical retail payload can inherit the old extension unless an explicit invalidation hook is installed. Separately, a power failure between retail write and extension commit can discard extension state. Do not deploy persistent custom features until both are handled and emulator save/load/overwrite/copy/erase tests pass. Retail `docs/SAVE_FORMAT.md` and custom `docs/SAVE_EXTENSION_READINESS.md` are authoritative.

**Historical plan (before the save-only directive):** auditing menu save/load transitions and then building custom extension hooks was contemplated. Custom work is now on hold until the retail loader, full GameState type graph, SRAM proxies and entire menu lifecycle are reconstructed in meaningful exact C++; follow the active plan at the top of this handoff. REA may clarify a particular unresolved branch but is unnecessary to re-prove the already understood retail record and loader stages. **Do not return to unrelated throughput targets until the entire save lifecycle is readable and exact, or the user explicitly changes priority.**

## Earlier verified exact integration: 2 functions / 48 bytes

`src/game_state_audio_callbacks.cc` replaces exactly `080167AC..080167DC` with two independently zero-difference C++ functions: a 32-byte child callback getter at `167AC` (child operation +0x90 still semantically unknown) and a 16-byte sound-player busy check at `167CC`. The latter uses the existing named `IsSoundPlayerBusy` ABI at `func_08008CD0`, cross-confirmed by `src/game_object_discard.cc` and `src/entity_unk_08038740.cc`.

Neighbor `func_08016784` is behavior-understood (checks sound player and fades out over 5) but **remains assembly**: a natural 40-byte source differs by 15 linked bytes (branch orientation), a local-result variant by 27. Saved scratch and diff proofs: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-audio-menu-20261010/`.

**Important integration seam:** `asm/game_state.s` source order puts `167AC..167DC` between `.text.after_gmcb_15950` and `.text.game_state_actions_16ba4`. The first integration erroneously inserted the new object after the later `16EF0` section and failed the ROM gate; correcting `fomt.lds` to the actual retail order restored exactness. Forced `make -B -j4 compare` execution `sh_mv2471un_7d10991c` exited 0 with `fomt.gba: OK` and exact SHA1.

**Historical pre-header inventory:** exact code **88,972 / 940,036 = 9.4647%**; remaining ASM **851,064 bytes / 1,981 linked functions**, inferred ranges **848,092**, unattributed **2,972**, parked **27**; meaningful ROM **164,922 / 7,717,440 = 2.1370%**; assets/data unchanged at **75,554**. Since the three earlier GameState/menu batches, cumulative continuation is **56 exact functions / 1,736 linked bytes**.

**Separate readability finding:** matching does not guarantee maintainable semantic C++. The reproducible `tools/ches/audit_source_readability.py` scans 136 C++ units / 19,919 lines and flags 135 address-named function definitions in 16 files, numeric child callback slots, layout padding and register-constrained code. These indicators are not a semantic completion percentage. Manual audit rubric and urgent debt: `docs/SOURCE_READABILITY_AUDIT.md`. The three recent GameState/menu source units have now been formatted/commented to describe proven offsets and unknown names. Do not speculate about missing gameplay names.

See `docs/GAME_STATE_AUDIO_CALLBACKS.md` for the stable audio/child ABI and proof location. Next pursue a coherent higher-byte and more semantically understandable family. If continuing nearby, recover callers of `16F60`, `16784`, and `167DC` using saved types; do not repeat source-shape puzzles. The existing 18-member ownership-transfer and 3-member tree insertion families remain in the prioritized queue but are codegen-sensitive.

## Previous verified exact integration: 13 functions / 444 bytes


Thirteen GameState/menu callback and incubation methods now have byte-exact natural C++ in `src/game_state_menu_callbacks.cc`, linked in five source/ASM islands. Each method independently matched its retail size and linked bytes; the forced clean `make -B -j4 compare` passed (`sh_mv22yrzy_255645e2`, exit 0, `fomt.gba: OK`).

| Address range | Functions | Linked bytes |
| --- | ---: | ---: |
| `0801468C..080146FC` | 4 | 112 |
| `08014C0C..08014C34` | 1 | 40 |
| `08014D5C..08014D9C` | 2 | 64 |
| `0801589C..08015920` | 3 | 132 |
| `08015950..080159B0` | 3 | 96 |
| **Total** | **13** | **444** |

The state holds a save pointer at +0x8C, status +0x9C and target +0xA8. Incubation wrapper `func_080146CC` calls `BeginIncubation__4CoopUi(saveState+0x410, argument)` and forwards that argument through target virtual slot +0xAC; two related forwarders use target slots +0x150 and +0x154. Children obtained from target slot +0x40 expose operations slots +0x44, +0x64, +0x68, +0x78, +0x7C, +0x80, +0x84, +0x88 and +0x8C. Selected callbacks set status to 0x19, and +0x68 narrows to `u16`. `func_0801468C` returns state+0xD0.

`func_08014BD8` remains untouched assembly: a readable loop candidate compiles to the right 52-byte size but has 5 differing linked bytes at best (loop v2; v1 has 9, v3 has 6). Preserve the closed register-lifetime frontier; do not repeat spelling-only compiler attempts. Other untouched complex neighbors include 14C34, 14D30 and 15920.

Scratch sources and individual diff/mismatch proofs are under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch3/`, together with `probe.py`, the loop alternatives, `incubation_v1.cc`, `integrate.py`, and the exact original ASM/linker backups. Stable subsystem doc: `docs/GAME_STATE_MENU_CALLBACKS.md`. No REA or custom compiler work was required for this matching batch.

At this previous checkpoint, the three GameState/menu batches had recovered **54 functions / 1,688 bytes**, all retail-exact. The newer 2-function audio integration and current inventory are authoritative at the top of this handoff.

## Earlier verified exact integration: 18 functions / 560 bytes


`src/game_state_menu_actions.cc` provides 18 natural, independently zero-difference C++ routines replacing four carefully bounded source/assembly regions. The full forced `make -B -j4 compare` passed (`sh_mv22h75z_27840b97`, exit 0, `fomt.gba: OK`), retail SHA1 unchanged.

| Retail range | Functions | Exact linked bytes |
| --- | ---: | ---: |
| `08016BA4..08016CEC` | 11 | 328 |
| `08016D80..08016DB0` | 2 | 48 |
| `08016E7C..08016EC4` | 2 | 72 |
| `08016EF0..08016F60` | 3 | 112 |
| **Total** | **18** | **560** |

Evidence: menu proxy -> state pointer at +4, target at state +0xA8, status at +0x9C, target vtable slots +0xFC/+0x100/+0x104/+0x10C/+0x110/+0x164. The latter three pass through a second incoming argument and naturally use the retail r2 indirect call. Factory slot +0x40 returns the child, and the 0x5D selector is forwarded to four helper wrappers; additional child callback slots are +0x6C/+0x70/+0x74/+0x9C/+0xA8/+0xAC. Status values include 0x1B/0x1C/0x19. Two exact helpers access an enabled byte and a 32-bit value at `gUnk_0300040C + 0x36C`, setting value 0x234 or reading the field.

All per-function sources, mismatch proofs, `probe_batch.py`, `probe_more.py`, `probe_fix.py`, integration script, and pre-mutation assembly/linker backups are preserved at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch2/`. The still-ASM functions around this region include 16CEC, 16D48, 16DB0, 16EC4, and 16F60, alongside larger owner/allocation functions. Reopen only with new natural structural evidence.

At this earlier 18-function checkpoint, the prior 23-function dispatch unit in `0bef5b7` contributed another 684 bytes, totaling 41 exact functions / 1,244 bytes across those two batches. The authoritative newer inventory and next actions are at the top of this handoff.

REA was unnecessary here: original assembly, ABI/struct offsets and per-function compiler matches were decisive. See `docs/GAME_STATE_MENU_ACTIONS.md` for the stable subsystem account.

## Earlier verified exact integration: 23 functions / 684 bytes


New natural source in `src/game_state_menu_dispatch.cc` owns 23 GameState/menu forwarding and saved-state flag functions. Every function independently matched its exact retail linked bytes. The combined source and linker/assembly seams passed a forced full-ROM comparison for each integration stage (`make -B -j4 compare`, latest execution `sh_mv21rcv0_8fb063b4`, exit 0, `fomt.gba: OK`).

| Original source island | Exact functions | Linked bytes |
| --- | ---: | ---: |
| `08014034..0801412C` | 10 | 248 |
| `08014164..08014198` | 1 | 52 |
| `08014198..08014264` | 6 | 204 |
| `08014264..080142B8` | 2 | 84 |
| `080142B8..08014318` | 4 | 96 |
| **Total** | **23** | **684** |

Only `func_0801412C` remains assembly. `14164`, `14264`, and `14290` were independently proved exact and integrated as a second incremental batch (+136 linked bytes); their forced clean ROM gate passed (`sh_mv21rcv0_8fb063b4`, exit 0). The first, 1412C, has behavior-recovered but nonmatching 56-byte v1 (14 differing bytes, branch orientation) and v2 (29 differences) in scratch. Revisit only with fresh ABI/control-flow evidence; do not repeat compiler spelling variations.

Recovered ABI facts: target pointer at state +0xA8, status +0x9C, saved-state pointer +0x8C; virtual table slots +0x80 through +0xA8 and +0x118/+0x11C. Two forwarding wrappers preserve an incoming second argument (the retail `r2` call register), and the chained callback at 1410C returns `u32` through r0. Child callback table slots +0x38, +0x40, +0x4C, +0x50, +0x54, +0x5C and +0x60 are anchored by exact source. Two flag setters write the saved-state byte at +0x34C4. Stable details: `docs/GAME_STATE_MENU_DISPATCH.md`.

Scratch candidates, exact per-function comparison output, integration dry run, and original assembly/linker backups: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-virtual-dispatch-20261010/`. One shared callback-table padding error initially produced only five ROM differences; after correcting the four-byte offset, the entire 8 MiB ROM matches. REA was unnecessary for this family.

At the prior 23-function checkpoint, the inventory was lower; the authoritative current inventory is in the latest 18-function section above. Data/assets and unattributed ASM remain unchanged.

## Prior menu/owner integration — 18 functions / 632 bytes
All four independent source families were isolated, proven byte-exact, integrated
with original linker/assembly seams, and followed by a successful forced retail
ROM gate. Scratch proofs are under
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/`,
including `matching/*.mismatch.txt`.

| Family | Exact function addresses | Production source | Recovered |
| --- | --- | --- | ---: |
| Polymorphic owner destructors | DCE60, DCEEC, E4510 | `src/menu_owner_dtors.cc` | 3 / 156 bytes |
| Global-owner destructors | D7AAC, D7B04, E581C, E5844 | `src/menu_global_owner_dtors.cc` | 4 / 160 bytes |
| Resource checks and two initializers | D7F60, D7F74, D7F88, D6F1C, D6F5C | `src/menu_resource_helpers.cc` | 5 / 124 bytes |
| Vtable-only destructors | D3ED4, DE220, E103C, E3D94, E4190, E4544 | `src/menu_simple_dtors.cc` | 6 / 192 bytes |

Forced ROM execution IDs, in sequence: `sh_mv1z65ct_8e774db6`,
`sh_mv1z8v52_19acc033`, `sh_mv1zdh6z_e0e0ec96`,
`sh_mv1zgcf1_407a2abd`. All exited 0 and ended with `fomt.gba: OK`.
The **64 bytes** of raw code/data following `DE220` remain in assembly; they
were reclassified as unattributed, increasing this subtotal from 2,908 to
2,972 bytes. They were neither reconstructed nor removed.

Earlier October 10 integrations included glyph-cache/provider/canvas methods,
range cleanups, tree rotations/balancing/release methods, ten menu emitters,
four subobject initializers and entity destructors. Their original experiments
are preserved in the archived history, corresponding subsystem pages, and
local matching workspace. Do not repeat already exact work.

## Highest-leverage next work

The three newest GameState/menu clusters total 54 exact functions / 1,688 bytes. `1412C` and nearby larger allocators/complex routines remain assembly. Rank coherent families after the regenerated inventory; do not return to compiler-only puzzles without structural evidence.

Re-rank coherent TUs/families by source-byte payoff, downstream type leverage,
existing structural evidence and compiler difficulty. The inventory queue is
a heuristic, **not** automatically an execution order.

1. **Ownership-transfer wrapper cluster:** 18 similar methods of **72 linked
   bytes each** (potential 1,296 bytes), including `func_080DB394`. Retail
   moves a temporary owned pointer into output and only conditionally releases.
   Scratch `db394-owned-v1.cc` is **0x40 versus 0x48 / 50 differing bytes**
   and semantically releases the result incorrectly. `db394-owned-v2.cc`
   zeroes a temp, but compiles to **0x2C versus 0x48 / 49 differences**.
   Recover the 16-byte stack smart-owner/move layout and destructor/allocator
   ABI *before* using one exemplar across siblings. Park if codegen archaeology
   dominates; never integrate nonmatching candidates.
2. **Typed tree-insertion family:** three ~192-byte siblings at `E2294`,
   `E27FC`, `E54F0`; layout and left/right rotations are source-exact,
   plus the `E21E0` balancer. E2294 scratch v1/v2 is behavior-recovered but
   nonmatching. Require new allocator/pointer-lifetime/type evidence.
3. **Other compiler-sensitive parked work:** two D6EAC/D6EEC pair initializers
   have correct 32-byte size but 7 mismatching linked bytes due to flag-store
   register order; E3610/E375C bit predicates, ten 36-byte DD410 field-copy
   helpers, F060 glyph-row rotation, E1C70, and the save loader remain parked
   until new structure provides leverage.

## Verification and continuation rules

- Read `AGENTS.md`, `START_HERE.md`, the fast path in
  `docs/DECOMP_PLAYBOOK.md` and the current ranked inventory. Reuse source
  types and saved scratch proofs; do not re-run completed experiments.
- Compare **single-function scratch sources** using
  `python3 tools/ches/compare-function.py scratch.cc name --start 0x08... --end 0x08... --out-dir <dir>`.
  The existing `--symbol` comparator is unreliable when one scratch object
  contains multiple independently named `.text.*` sections. An experimental
  fix failed and was reverted byte-for-byte to tracked HEAD; do not rely on
  multi-section proofs without a proper regression-tested fix.
- Check exact body, trailing alignment, literals, relocations and ABI before
  production. Split only the proven ranges in the applicable assembly file and
  `fomt.lds`. Preserve all neighboring ASM and raw literal/data islands.
- Force `make -B -j4 compare`, verify ROM SHA1, regenerate inventory with
  `python3 tools/ches/build_decomp_inventory.py`, run `git diff --check`,
  update the live dashboard/status/handoff and relevant stable subsystem page
  **once per coherent batch**.
- Keep custom-game edits isolated. Exact retail source is committed in
  **`1e522c9`**; inventory/handoff docs followed in **`38718be`**.
  Subsequent documentation alignment was published in **`98e093a`**, and the newer exact GameState/menu batch supersedes the old 18-function status. Verify current HEAD before further publication. Verify live state with
  `git status -sb` and `git log -1` before resuming.
