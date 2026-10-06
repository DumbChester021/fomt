# FoMT Zero-Context Start Here

## Current NPC/entity family frontier - October 6, 2026

The throughput strategy continues to produce exact family passes. The adjacent `vtable_unk_080E7380` entity/controller family now owns **316 exact retail bytes** in `src/entity_unk_08038740.cc`: the 224-byte entity small surface plus 92 bytes of controller helpers. Controller constructor `0x08038820` is behavior-complete and exact-size in scratch but parked on register-lifetime codegen. The retail SHA1 remains unchanged.

## Current throughput inventory - October 6, 2026

`tools/ches/build_decomp_inventory.py` generates the machine-readable remaining-function database and ranked queue. After the controller-helper integration the linker-backed inventory is **2,356 linked assembly functions / 870,356 asm code bytes**, with inferred function ranges covering **869,192 bytes = 99.8663%** and **1,164 unattributed asm bytes**. The extra 88 unattributed bytes are the already-existing raw block at `0x080390DC..0x08039134`, exposed when the old misleading `func_080390D0` 0x64 range was split correctly. Continue with controller +0x10 collection builder `0x08038EE0`; keep the exact-size constructor parked.

## Current project status

- `make progress` tracks reconstruction across code and non-code ROM bytes instead of reporting only executable code.
- Current **code reconstruction** is **69,680 / 940,036 = 7.4125%**.
- Current **data/assets reconstruction** is **75,334 / 6,777,404 = 1.1115%**:
  - 31,110 bytes are linked typed/source non-code data;
  - 44,224 bytes are editable generated packed-sprite graphics/palettes;
  - the generated packed-sprite total is 33,664 graphics bytes + 10,560 palette bytes;
  - 396 mixed source-owned `.rom_header` bytes count only toward overall reconstruction.
- Current **overall meaningful-ROM reconstruction** is **145,410 / 7,717,440 = 1.8842%**. Final ROM padding is excluded from this denominator.
- PRET-style ROM-space reporting remains **671,168 bytes = 655.44 KiB = 8.0009% contiguous tail free space**.
- Asset/data progress is conservative: an opaque `.incbin` does not count merely because it was identified or extracted; editable project-side source must regenerate the retail bytes exactly.
- Progress implementation: `tools/scripts/calcprogress.py`, `tools/progress_manifest.json`, and `docs/ASSET_DECOMPILATION.md`.
- The current retail priority is **whole-game throughput by coherent TU/type/similarity family**. `Entity38740` plus its newly promoted controller helpers now account for **316 exact bytes**. `func_08038820` is behavior-complete and exact-size but parked on register lifetimes. Next target `func_08038EE0` (0x1F0), which builds/replaces the controller +0x10 five-entry 0x40-stride collection; pivot to `0x08039134` if that large helper becomes compiler-sensitive.
- Raw binary relocation does not count as progress. Retail SHA1 remains the final authority.


## Item icon PNG source milestone - October 5, 2026

- The full retail Tool/Food/Article icon set is now editable source under `assets/item_icons/`: **81 tools + 171 foods + 95 articles = 347 PNGs**, each with a JSON sidecar and one manifest.
- `tools/packed_sprite_bank.py` decodes/encodes the packed `gUnk_086678A0` bank. For current item icons it round-trips GBA OBJ/OAM layout, 4bpp tile graphics, and BGR555 palettes.
- `asm/data/data_0813B288.s` now includes generated `build/assets/item_icon_bank.bin`; the Makefile builds it from the PNG manifest before assembly.
- All 347 item icons simultaneously rebuild the **196,736-byte (`0x30080`) bank exactly**. `make -B -j4 compare` still reports **`fomt.gba: OK`** and retail SHA1.
- A temporary one-pixel Turnip edit changed exactly one packed-bank byte, proving PNG edits are active build inputs rather than previews.
- Retail sharing is explicit: 347 sprite descriptors, 232 unique graphics spans, 302 unique palette spans. The builder rejects conflicting edits to shared graphics/palettes rather than silently using last-write-wins.
- Contact sheet: `tools/ches/checkpoints/item-icon-assets-2026-10-05/all_item_icons.png`.
- Across all 493 animations in this bank, **450 are simple one-frame/one-part/one-palette** and **43 are multi-frame**. The remaining hard frames are ordinary multi-part OAM sprites; sampled part tile offsets exactly partition their graphics blobs, so no new codec is indicated. All 347 named item icons are in the simple class.
- Detailed authority: `tools/ches/checkpoints/item-icon-assets-2026-10-05/README.md`.
- **Item-lane status:** the cooking UI is the first completed table-driven family. `func_080989DC` / `func_08098CE8` consume `gCookingUtensilIconIds` through `gUnk_086678A0`; eight exact PNGs now live under `assets/item_icons/cooking/`: Knife 265, Frying Pan 204, Pot 346, Mixer 64, Whisk 472, Rolling Pin 313, Oven 327, Seasoning Set 400. Retail availability bits and the special `Seasoning Set` label prove the mapping. `func_08092A70` remains parked at `0x260 / 3` and `func_080CAC7C` remains parked at `0x8C / 52`; this item lane is parked behind the current whole-game Ball/entity throughput work.
- Current validated baseline remains `fomt.gba: OK`: **69,588 code bytes / 75,334 data-asset bytes / 145,318 overall meaningful-ROM bytes**, **671,168 bytes free**.


## Historical item icon provider checkpoint - October 5, 2026 (superseded)

- Recovered the concrete packed sprite/animation provider used by item icon rendering.
- Added `include/sprite_animation_provider.hh` and `src/sprite_animation_provider.cc`.
- `func_0805E6CC` at `0x0805E6CC` is now readable source for the seven-pool parser. Its symbol body is **0x92 with an empty retail diff**, plus the exact 2-byte section alignment pad completing the retail **0x94-byte region**.
- `func_0805E760` at `0x0805E760` is now exact source, **0x30 / 0 differing bytes**. It is the provider's first indexed virtual lookup and returns a directly constructed packed animation `{frames, frame_count}`.
- Production linker placement is verified at the original addresses: `func_0805E6CC=0x0805E6CC`, `func_0805E760=0x0805E760`, assembly resumes at `func_0805E790=0x0805E790`, and existing `SpriteAnimator` source still begins at `0x0805E824`.
- Full validation passes: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean.
- At this superseded provider checkpoint the worktree was **63,896 / 940,036 = 6.7972% source**. Current totals are listed in the live progress block below; HEAD remains `9078f36` and October 5 work is uncommitted.
- The item icon bank `gUnk_086678A0` is a packed seven-pool resource blob. Its verified pool counts are **493, 500, 101, 1624, 342, 0, 532** with first-six entry strides **4, 16, 8, 32, 32, 8** bytes.
- For this bank:
  - pool 0 is the 493-entry animation index table `{u16 frame_count, u16 first_frame}`;
  - pool 1 is the 500-entry 16-byte sprite descriptor table;
  - pool 6 begins with 532 `SpriteAnimationFrame {u16 sprite_id, u16 duration}` records.
- Retail item definitions fully consume the animation-ID range: Tool max icon ID 469, Article max 489, Food max **492**. Therefore animation IDs **0..492** are all within a bank whose count is exactly 493. There is **no numeric headroom above the current retail maximum** for a new unique icon.
- The frame/descriptor chain is also saturated at the top end: animation 492 -> frame 531 -> sprite descriptor 499, while pool 6 has exactly 532 frames and pool 1 has exactly 500 descriptors. Frame sprite IDs span 0..499.
- A unique custom item icon therefore requires, at minimum:
  1. increase pool-0 animation count and append animation ID 493;
  2. append at least frame 532 and increase pool-6 count;
  3. add sprite descriptor 500 and increase pool-1 count;
  4. extend whichever graphics/palette sub-pools that descriptor references.
  Reusing an existing icon ID does **not** require provider expansion.
- `func_0805E790` (provider virtual +0x10) is semantically recovered but not integrated: best scratch V1 is **0x8A vs retail 0x8C / 36 differing bytes**, localized to evaluation/register scheduling. It resolves a 16-byte sprite descriptor into four pointer/u16 resource pieces. Explicit-local V2 regressed badly; do not resume syntax roulette without new evidence.
- Descriptor field interpretation is strongly supported:
  - +0 value0, +2 pool2 index;
  - +4 value1, +6 pool3 index;
  - +8 value2, +A pool4 index;
  - +C value3, +E pool5 index.
  The pointer strides are 8, 32, 32, 8 bytes respectively; values at +4/+8 are scaled by 32.
- **Superseded:** the packed-bank authoring/import step was completed by the PNG source milestone above. Keep this section as the provider-discovery evidence; do not resume `func_0805E790` scheduling work without new structural evidence.


## Typed shop catalogs + exact catalog helpers checkpoint - October 5, 2026

- Shop catalog reconstruction is now production source in `include/shop_catalog.hh`, `src/data_shop_catalog.cc`, and `src/shop_catalog.cc`.
- `ShopItemEntry` is the proven 8-byte retail shape: `{u32 item_or_service_id, u32 unit_price}`.
- Six retail catalog blobs are now typed source at their exact ROM positions with surgical rodata seams:
  - `gUnk_080FDDD8[13]`: Tool seed catalog.
  - `gUnk_080FDFA4[8]`: supermarket Food catalog, seven goods plus `{0,0}` terminator.
  - `gUnk_080FE050[4]`: Bodigizer/Turbojolt Food catalog.
  - `gUnk_080FE484[10]`: mixed catalog; entries 0-2 are Articles (Ball, Frisbee, Jewel of Truth), entries 3-9 are specialty-seed Tools.
  - `gUnk_080FE740[2]`: Wine/Grape Juice Food catalog.
  - `gUnk_080FE8FC[15]`: Article/special catalog.
- Critical semantic correction: `gUnk_080FE8FC` entry value `0x0A` at catalog index 10 is **not ARTICLE_WOOL_X** in this shop. It is `SHOP_SPECIAL_RECORD_PLAYER`; buying it calls `FarmHouse::AddRecordPlayer`. Entries other than that special value flow through Article storage.
- Five compact catalog-description helpers are exact production source:
  - `func_0807D1DC` seed Tool description: **0x3C / 0**.
  - `func_0807DE0C` supermarket Food description: **0x30 / 0**. Note that `0x0807DE08..0x0807DE0B` is the previous raw function's literal; the helper truly starts at `0x0807DE0C`.
  - `func_0807E51C` medicine Food description: **0x3C / 0**.
  - `func_0807F684` mixed Tool/Article description: **0x64 / 0**. Its filtered catalog index is signed `i32`; indices <=2 are Article, >2 are Tool.
  - `func_08081108` record/special description: **0x44 / 0**; catalog index 10 uses a dedicated Record Player description string.
- Full validation after all code/data integration: `make -j4 compare` and `make progress` report `fomt.gba: OK`; `git diff --check` is clean.
- Current exact code progress is **63,700 / 940,036 = 6.7763% source**, **876,336 assembly bytes = 93.2237%**. Typed rodata conversion does not increase the code percentage, so shop-data readiness improved more than the percentage shows.
- Filtered shop stock uses a common scene-local buffer at approximately `scene + 0x2A4`: a `u32 count` followed by up to **40 i32 catalog indices** at `+0x2A8`. Retail append sites guard with `count <= 0x27`.
- Proven retail stock-index domains:
  - seed catalog can expose indices 0..12;
  - medicine catalog 0..3 (conditionally ordered 0,2,1,3);
  - winery catalog 0..1;
  - mixed catalog 0..9 with ownership/availability gates on early special entries and specialty seed entries following;
  - record/special catalog 0..14 with gating; index 10 is the Record Player service;
  - supermarket is different and directly uses its seven-item catalog plus terminator rather than this filtered-list pattern.
- The four remaining purchase scenes previously flagged as 'missing catalogs' actually use **20-byte service records**, not 8-byte item catalogs: `gUnk_080FD988`, `gUnk_080FED8C`, `gUnk_080FF6A8`, and `gUnk_080FFB90`. Do not force them into `ShopItemEntry`; recover their service-record fields separately.
- Asset/provider probe: `func_0805E860` is a generic icon-resource loader, not an item-specific bound. It forwards the icon ID to the provider object's virtual slot `+0x0C`, stores the returned two-word resource pair, initializes frame/state fields, and contains no local Tool/Food/Article count check. The real graphics bound therefore lives in the concrete provider/table behind that virtual call.
- **Exact next action:** stay out of the giant shop scene bodies. Follow the concrete provider used by `func_0805E860` to recover the icon/resource table and its bounds. Only detour into the 20-byte service-record shops if that materially helps the custom-game goal.


## Exact money core + supermarket catalog frontier - October 5, 2026

- Added typed `MoneyState`, `MoneyHistory<Capacity>`, and `MoneyRecord` in `include/money.hh` and exact source in `src/money.cc`.
- `func_0809AB8C` constructor is **0x4C / 0**, `func_0809ABD8` credit is **0xE8 / 0**, and `func_0809ACC0` guarded debit is **0xE8 / 0**. Production linker resumes assembly at `func_0809ADA8`.
- Full validation passed: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean; linked addresses remain `0809AB8C`, `0809ABD8`, `0809ACC0`, `0809ADA8`.
- Current exact progress is **63,364 / 940,036 = 6.7406% source**, **876,672 assembly bytes = 93.2594%**. HEAD remains `9078f36`; October 5 work is uncommitted.
- Exact money semantics now source-proven: starting balance 500; credits saturate at 1,000,000,000; debits reject amounts above balance; daily/seasonal income and spend records saturate at 1,000,000,000. Daily threshold >99,999 sets flag bit 0; balance >99,999,999 sets flag bit 1.
- The recovered history container is `u32 count` followed by fixed 8-byte `{income, spend}` records. Exact `push_back` uses placement-new into raw storage at `count * 8 + 4`; exact `back()` decrements a copied index before indexing.
- Shop acquisition research isolated a general 8-byte catalog entry shape `{u32 item_id, u32 unit_price}`. In `func_0807DE3C`, scene `+0x6A4` indexes `gUnk_080FDFA4`; the same entry drives display, affordability, debit, held-item placement, Rucksack insertion, and Fridge overflow.
- `gUnk_080FDFA4` is the 0x40-byte supermarket food catalog: Rice Ball 100G, Bread 100G, Oil 50G, Flour/FLOWER 50G, Curry Powder 50G, Muffin Mix 100G, Chocolate 100G, then `{0,0}`.
- Data-section verification: `gUnk_080FDFA4` is at line 1077 inside the initial `.rodata` section; the next existing split is only at line 2085. A surgical data split at this symbol is therefore available.
- Additional behavior-filtered 8-byte purchase catalogs were found at `gUnk_080FDDD8`, `gUnk_080FE050`, `gUnk_080FE484`, `gUnk_080FE740`, and `gUnk_080FE8FC`; keep them provisional until each caller/type is verified.
- **Exact next action:** promote `gUnk_080FDFA4` into a typed `ShopItemEntry const` source array with a rodata split, require full-ROM SHA1 exact, then use that type to generalize sibling shop catalogs. Do not decompile the giant shop scene yet.


## Article mutation + economy frontier checkpoint - October 5, 2026

- `func_0801D7B0` (GameObject runtime vtable `+0xE4`) is now exact readable source inside `src/game_object_article_interaction.cc`. The decisive source shape used two lookup-record aliases (`result_x`, `result_y`) around the field-grid lookup. Scratch V16 has symbol size 0xDA plus the exact 2-byte section alignment pad, for a complete **0xDC-byte retail section with 0 differing bytes**.
- Production now owns the contiguous item-interaction pair in one source object: `func_0801D7B0` at `0x0801D7B0` applies the article and refreshes neighboring field visuals; `func_0801D88C` at `0x0801D88C` classifies handled/blocked/unhandled. Assembly resumes at `func_0801D8CC`.
- Full production verification passed: `make -j4 compare` -> `fomt.gba: OK`; linked symbols are exactly `0801d7b0`, `0801d88c`, `0801d8cc`; `git diff --check` is clean.
- Current exact worktree progress is **62,824 / 940,036 = 6.6831% source**, **877,212 assembly bytes = 93.3169%**. HEAD remains `9078f36`; October 5 work remains uncommitted.
- `func_0801C0F8` stays parked at semantic recovery plus **0xA0 / 4 differing bytes**. Do not reopen its equivalent lower-bound branch spelling without new evidence.
- The next item/acquisition lane was narrowed to the shared player-money object used by shops and shipping. Binary-proven anchors remain `GameState + 0x1AA8`, starting balance 500, saturating credit to 1,000,000,000, and guarded debit.
- New scratch `candidate-money-init-v1.cc` exactly matches `func_0809AB8C` at **0x4C / 0 differing linked bytes**. The recovered layout includes balance at +0x00, two flag bits at +0x04, daily count at +0x08, seasonal count at +0xFC, and four maxima at +0x120..+0x12C; constructor calls `func_0809AE6C` after initialization.
- **Exact next action:** promote the exact money initializer into a typed `MoneyState` source/header boundary and linker split at `0x0809AB8C`, full-ROM verify, then use that type to decompile the adjacent credit/debit pair `func_0809ABD8` and `func_0809ACC0`. Do not jump into giant shop/menu bodies yet.

## Item article-interaction exact checkpoint - October 5, 2026

This is a completed historical retail-decomp checkpoint. Its exact source and compiler evidence remain valid, but its next-action language is superseded by the current throughput plan below.

- Corrected an important vtable interpretation error: `GameObject` stores `vtable_unk_080E5EC4` itself as its vptr, so runtime slot `+0xE8` is table label `+0xE8`, not `+0xF0`. Raw retail table `0x080E5EC4 + 0xE8` contains `0x0801D88D`, so the real Thumb target is **`0x0801D88C`**. The previously documented `0x0801CFB8` is the unrelated `+0xF0` slot.
- `func_0801D88C` is now exact readable source in `src/game_object_article_interaction.cc`: **0x40 / 0 differing linked bytes** in scratch and exact at linked address `0x0801D88C` after production integration. It resolves a field plot for the supplied `Location`, returns article-interaction result 2 when no plot exists, otherwise delegates to `FieldPlot::method_0800A6C8(article)` and returns 0 for handled or 1 for blocked.
- The constructor-time `vtable_unk_080E6038` has the same 0x168 span but points `+0xE8` to the pure-virtual stub `0x08000639`; the other large `0x080E7xxx/0x080E8xxx` tables are unrelated class families. No second concrete GameObject `+0xE8` override was found.
- Production seam: `asm/game_state.s` now splits at `0x0801D88C`, `fomt.lds` inserts `src/game_object_article_interaction.o(.text)`, then assembly resumes at `func_0801D8CC`. `make -j4 compare`, `make progress`, linked-symbol checks, and `git diff --check` all pass; `fomt.gba: OK`.
- Current exact worktree progress is **62,604 / 940,036 = 6.6597% source**, **877,432 assembly bytes = 93.3403%**. HEAD is still `9078f36`; the October 5 source integrations remain uncommitted.
- The supporting field-plot resolver `func_0801C0F8` is semantically recovered: map 2 only; world coordinates divide by 8; valid tile bounds x 0x22..0x77 / y 0x16..0x47; 43x25 plot grid; output record is 12 bytes containing `FieldPlot *`, anchor x/y, and plot x/y. Scratch V2/V4 are exact size **0xA0 / 4 differing bytes**, only equivalent lower-bound branch spelling (`cmp 34; bcc` vs `cmp 33; bls`). Park this helper instead of syntax roulette.
- The immediately preceding GameObject virtual at runtime `+0xE4`, Thumb **`0x0801D7B0`**, is the article mutation partner. It is the ROM's only direct caller of `FieldPlot::method_0800A6F4`: resolve plot, apply Stone/Branch/Lumber/Golden-Lumber state, require current map match, choose vertical neighbor plots, call `FieldPlot::method_0800AF5C`, then `func_080AA6D0` for field visual/update refresh. Scratch V3/V4 reach exact retail size **0xDC** with **106 differing linked bytes**. The front half through the map check is already structurally aligned; remaining differences are register/lifetime/order in the neighbor-refresh half.
- **Historical next action (superseded):** the saved `candidate-gameobject-apply-article-v4.cc` frontier remains useful evidence if this TU ranks highly again. Do not resume it merely because this older checkpoint once called it next.

## Active scope — October 6, 2026

The active retail goal is **throughput-first whole-game decompilation**. Preserve
the byte-identical US ROM on `ches-dev`, keep custom behavior in the separate
custom-game worktree, and exploit the already-recovered shared infrastructure
across the remaining assembly.

The normal work unit is an inferred original translation unit or coherent
structural/type/similarity cluster. Build the unified function/TU inventory,
infer TU and data ownership, cluster repeated assembly, map vtables/classes,
score coherent units, and work the ranked queue. A fixed function-count cadence
and one-resource-at-a-time sprite tracing are no longer current policy.

The save loader and documented compiler-sensitive islands remain parked unless
new structural evidence raises their leverage. Runtime work should grow into
deterministic scripted coverage and indirect-call collection. Custom behavior
still belongs only in the separate custom-game worktree.


This is the authoritative live dashboard for the local FoMT retail decompilation and custom-game work. It is a private coordination file and must not be included in upstream-facing contribution commits.

## Read this in order

1. `AGENTS.md`
2. `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`
3. this file
4. `docs/DECOMP_PLAYBOOK.md`
5. `docs/DECOMP_PRIORITY_MAP.md`
6. `tools/ches/NEXT_AGENT_HANDOFF.md`
7. the current snapshot at the top of `tools/ches/SESSION_STATUS.md`
8. relevant experiment/failure/subsystem docs

Do not infer the current task from older chronological sections. The current snapshot and current handoff supersede historical entries.

## Mission

Retail track:
- branch: `ches-dev`
- recover the original US FoMT GBA game into readable source
- preserve byte-identical retail behavior and ROM
- prefer project-native readable C++ and typed data
- keep uncertain names conservative
- understand callers, ABI, object layout, ownership, and gameplay purpose instead of merely translating instructions

Custom-game track:
- separate worktree/branch
- implement QoL improvements, bug fixes, and added-content systems from understood retail source
- current enablement targets include NPCs/bachelorettes, items/tools, crops, dialogue/events, inventory/shops, and assets
- persistence/save expansion is paused until the non-save runtime/content boundaries are substantially healthier
- never mix custom behavior into a retail-matching commit

## Current verified state

Date: 2026-10-05

### Earlier exact data milestone: character metadata

- All 43 existing `CharacterInfo` records are editable C++ in
  `src/data_character_info.cc`, with a bounded public table declaration.
- All 344 data bytes match. Six layout assertions and the complete 956-byte
  identity-helper canary pass. Original name pointers, birthday bytes, padding,
  `gUnk_08104258` alias, name pool and `bad_alloc` neighbor are preserved.
- Fresh tracked isolated installation and both corrected `make -B -j4 compare`
  builds exited 0. Both reproduce all 8,388,608 retail bytes and SHA1
  `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
  All 16 checked addresses and two data boundaries pass; compiler unchanged.
- Executable source remains **61,072 / 940,036 = 6.4968%**. This unit recovers
  **344 readonly data bytes and 0 executable bytes**. Custom-game code is unchanged.
- Proof: `tools/ches/checkpoints/character-enablement-2026-10-04/`, including
  the data/layout proof, helper canary, V2 integration plan, fresh installer,
  forced build logs and both full-ROM proofs.
- V1 placed the exact table after the wrong parent section, causing 6,341
  differences. Preserved failure/ROM/map/plan explain the rejected placement.
  V2 places it after `.rodata.after_cursed_tool_requirements`; the corrected
  inputs are promoted, with no source or compiler permutations.

Contribution saved as `56f343454bcb98d2712b9043b8c5d410cb22cc98` (`56f3434 decompile character metadata table`), committed, pushed to `ches/ches-dev` and independently remote-verified. Index empty.

### Earlier executable milestone: NPC support (565529c)

- Retail branch `ches-dev`; this NPC-support contribution is `565529c3e521db9eaaf75e0a75253ce9d68044de`.
- Five functions recovered: `GetCharacterLocation` (080A03B8,100/0),
  `ApplyNpcSchedule` (0803D688,348/0), `InitializeCharacterSchedules`
  (0803D7E4,576/0), Lillia constructor (08035AFC,60/0) and effect factory
  (08035B38,44/0). Existing `ANpcEntity` module remains exact across 1,684 bytes.
- Source **61,072 / 940,036 = 6.4968%**; assembly **878,964 = 93.5032%**.
  This unit adds **1,128 linked source bytes**.
- Both isolated and production `make -B -j4 compare` exit 0 and reproduce
  all **8,388,608 bytes**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
  Isolated compiler was freshly installed from the tracked pinned installer.
- `include/entity_npc.hh` exposes the existing base and proven 0x48-byte Lillia
  class. Normal ABI aliases preserve callable symbols and retail vtable
  ownership. All 34 checked addresses and six linker boundaries pass.
- Current compiler remains the same 13-flag reconstruction, patch SHA256
  `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.
  No compiler changes, forced registers, volatile or new inline assembly.
- Private proof: `tools/ches/checkpoints/npc-support-2026-10-04/`, including
  baseline/backups, first candidates, `results-v1.json`, combined candidates,
  `combined-results.json`, `production/`, `integration-plan.json`, both forced
  logs, `isolated-proof.json`, `production-proof.json` and the reproduction
  scripts/commands. Detached `/mnt/data/Github/gba/fomt-npc-support-integration`
  preserves the exact isolated result.
- The custom-game source stays at `60eaccafa2c92056ee56283ea4ee8f5d6c59377c`.
  Custom NPC implementation remains deferred. This NPC-support milestone was
  later followed by typed character metadata and the GameObject entity
  lookup/teardown contributions described below.

Contribution saved as `565529c3e521db9eaaf75e0a75253ce9d68044de` (`565529c decompile character location, schedules and Lillia entity`), committed, pushed to `ches/ches-dev` and independently remote-verified. Index empty.

### Active exact `Live-temp` throughput checkpoint

- Production `ches-dev` remains at `9078f368c02d861f7cd71685e1f9dd1d95c7c384`; private exact decompilation continues on `Live-temp` with durable pushed checkpoints.
- Current exact progress is **69,056 / 940,036 = 7.3461% source** and **870,980 / 940,036 = 92.6539% assembly**. Data/assets remain **75,334 bytes** and overall meaningful-ROM reconstruction is **144,786 / 7,717,440 = 1.8761%**.
- The unified inventory/queue is live at `tools/ches/decomp_inventory.json` / `tools/ches/DECOMP_QUEUE.md`: **2,375 linked asm functions**, **870,980 canonical asm bytes**, **188 repeated opcode-shape clusters**, and **882 functions participating in repeated clusters** after the BallEntity batch.
- `include/entity_resident_npcs.hh` + `src/entity_resident_npcs.cc` now reconstruct all 35 resident constructors exactly. IDs 1..34 also have source-owned +0x30 factories; Child's +0x30 remains assembly while Child's +0x3C override is source. `include/entity_unk_08037008.hh` + `src/entity_unk_08037008.cc` own the newly recovered location-bound actor base, exact sibling animation/speed helpers, and exact 7218/725C constructors through `0x08037BE0`; variant constructors at `0x08037C08/68` remain parked exact-size assembly candidates.
- The full factory `0x0801A8E0..0x0801B497` remains mapped as 94 selectors / 58 unique targets. Selectors 1..34 are resident character IDs, 35 is Child, 36..42 are Harvest Sprites, and 43 is occupied.
- Raw queue rank 1 contains the deliberately parked save loader. The `UnkEntity37008` family is now bounded. Continue with the sourced thrown Ball family: destructor `0x08038098`, wrappers `0x08038300/20/34`, then the 0x48-byte visual/controller family beginning at `0x0803853C`. The remaining `0x08038374..0x0803A8A4` entity region is queue rank **19** after the latest integration; re-rank after the next exact Ball/controller batch.
- Legacy loader `func_08011650` and the other documented compiler-sensitive islands remain parked unless new structural evidence changes their leverage.

## Authoritative compiler/build path

Do not use old private compatibility packages as the final build authority.

Use:
`tools/install_agbcp.sh`

Pinned compiler source commit:
`1caa6becde5e4676b59c31c74d68f45ced79557c`

Tracked patch:
`tools/agbcp_fomt_compat.patch`

Patch SHA-256:
`aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`

The installed wrapper enables thirteen validated structural compatibility rules. Private diagnostic compiler changes are not production build inputs.

Final retail validation command:
`make -B -j4 compare`

Critical lesson:
Do not copy an arbitrary generated `tools/agbcc` directory into an integration worktree. A stale generated copy already caused a false four-byte global layout shift. Install from the tracked pinned path for authoritative integration proof.

## Current next work

The current exact worktree has enough shared infrastructure that the fastest
route forward is no longer one-resource-at-a-time tracing. The next phase is a
**whole-game throughput pipeline** built around coherent translation units and
structural/type clusters.

The following are already recovered enough to act as leverage rather than as
primary research targets: indexed GameObject lookup/teardown, character/social
resolvers, article classification/mutation, MoneyState, typed shop catalogs,
hardware/DMA/list infrastructure, entity effects, resource handles,
SpriteAnimator/provider parsing, and the editable packed-sprite families.
Do not redo those investigations.

### Immediate priority

1. Build one machine-readable inventory of every remaining assembly function:
   address, size, callers/callees, global/data xrefs, inferred subsystem/TU,
   vtable/class evidence, similarity cluster, status, and known
   compiler-difficulty evidence.
2. Infer original translation-unit boundaries from section/address locality,
   padding/literal pools, static data ownership, internal call locality,
   vtables, constructor/destructor families, and related evidence.
3. Normalize and cluster remaining assembly so repeated NPC/entity/menu/map/
   wrapper/state families can be solved from one strong source/type oracle
   instead of independently.
4. Build a vtable/class/global-ownership map and feed those types back into the
   function inventory.
5. Rank TUs/clusters by expected source bytes, downstream unlock value, type
   readiness, coherence, and estimated difficulty. Re-score after meaningful
   integrations.
6. Decompile the highest-ranked coherent TUs/clusters. Keep exact source as the
   production gate; preserve understood-but-nonmatching candidates privately
   rather than letting a few allocator/scheduling bytes stall the whole unit.
7. Grow the emulator work into deterministic savestate + scripted-input
   scenarios that log function coverage and indirect caller/callee targets.
   Runtime tracing should classify and answer targeted questions, not drive the
   primary work queue.

The packed bank remains at **416 / 493 semantically owned animations: 405 / 450
simple and 11 / 43 multi-frame**, leaving **77** unowned. The direct packed
consumer/provider census is already exhausted at the documented scope. Keep the
77 IDs as a parked open list and let them resolve as their scenes, tables,
events, minigames, and owning TUs are reconstructed. Do not spend the main
decompilation lane manually hunting individual remaining IDs.

The durable opening-farm savestate at
`/mnt/data/Ches/runtime-saves/fomt/opening-farm.ss1` is retained as the first
runtime-scenario asset. Its exact load path is still unverified, but verifying
it is now runtime-harness work rather than the blocking next decompilation
action.

For data/assets, bulk-catalog recognizable structures when cheap, then assign
meaning through consumers. Continue to count only editable project-side source
that regenerates the retail bytes exactly. Anonymous binary relocation does not
count as reconstruction.

Keep the save loader `func_08011650`, `func_080455D8`,
`func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and
`func_08092940` parked unless new structural evidence raises their leverage.
Do not expand `ShippingBin::product_stats[NUM_PRODUCTS]` yet because a larger
product count changes persistent state layout.

Use `make progress` for exact code, data/assets, overall meaningful-ROM
reconstruction, and contiguous tail free space. A future semantic/understood
coverage metric must remain separate from the exact matched-source percentage.

## Non-negotiable rules

- Retail byte accuracy is required.
- Compiling or matching size is not enough.
- Use existing project types before inventing duplicate layouts.
- Search experiment/failure docs before trying a new family.
- Keep speculative candidates out of `src/`.
- Do not start compiler research while credible source-shape explanations remain.
- Do not hardcode target identity into compiler behavior.
- Integrate in a detached worktree first.
- Use the tracked installer in full-ROM integration worktrees.
- Require exact full-ROM SHA1 after integration.
- Update docs as part of the engineering work.
- Treat every run as potentially the last before conversation/context exhaustion: never leave the only copy of important progress, reasoning, candidates, or exact next action in chat.
- Keep stable recovered subsystem/type architecture in dedicated tracked `docs/*.md` pages when warranted; keep transient experiments and failed paths in private `tools/ches/` research.
- **Publish every durable checkpoint:** after checkpoint docs/artifacts are saved and verified, commit the checkpoint on `Live-temp` and push it to `ches/Live-temp`. This includes private coordination/research docs that belong on the live working branch. If push fails, record the failure and local HEAD before stopping.
- Keep private research/docs out of retail contribution commits to `ches-dev`; the `Live-temp` checkpoint history is separate.
- Commit/push fully exact retail contribution units to `ches-dev` only under the standing exactness gates.
- Never mix custom-game behavior into retail contribution commits.
- Preserve original project style and avoid generated-looking noise.

## Private dirty files are intentional

The main worktree intentionally contains private local documentation/research files such as:
- `README.md` local changes
- `AGENTS.md`
- `START_HERE.md`
- `docs/DECOMP_PLAYBOOK.md`
- `docs/DECOMP_NOTES.md`
- `docs/FOMT_COMPILER_RESEARCH.md`
- `docs/REPO_MAP.md`
- `tools/ches/`

Do not reset, clean, stash, or stage them into a retail contribution merely because they are dirty/untracked.

## Definition of a completed batch

A batch is complete only when its functions are:
- exact at the target
- integrated into source/asm/linker correctly
- isolated full-ROM exact
- production full-ROM exact
- SHA1 verified
- progress/map checked
- relevant docs updated
- contribution diff reviewed
- committed and pushed to `ches-dev`

For the full process, read `docs/DECOMP_PLAYBOOK.md`.
