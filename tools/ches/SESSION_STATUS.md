# Ches Session Status — FOMT decomp

## CURRENT SNAPSHOT - 7.3682%; Ball virtual/controller surface exact - October 6, 2026

- Active branch `Live-temp`; continued from pushed handoff `0c0e10870abf130113ceeb207fe20f22f9a092e6`.
- Ball family source now owns **396 retail bytes** total; this checkpoint adds **208 exact bytes**: destructor `0x08038098`, wrappers `0x08038300/20`, factory `0x08038334`, and controller update `0x08038580`.
- Progress: **69,264 / 940,036 = 7.3682% code**, **870,772 asm bytes**, **75,334 data/assets**, **144,994 meaningful-ROM bytes = 1.8788%**, **671,168 bytes free**. `fomt.gba: OK`.
- Regenerated inventory: **2,370 linked asm functions**, **869,696 / 870,772 inferred range bytes = 99.8764%**, **1,076 unattributed bytes**.
- Proven controller is 0x48 bytes = 8-byte helper base + 0x40 `EntityEffect`; constructor `0x0803853C` is exact-size 0x44 with only 8 linked bytes differing in four argument-setup instructions, while update `0x08038580` is exact source.
- Next: continue `0x080385B0` and adjacent Ball helpers `0x08038374/398/4FC`; bound the constructor-order mismatch instead of syntax roulette; keep `0x08038110` deferred.

## SUPERSEDED SNAPSHOT - 7.3261%; location-bound actor island bounded - October 6, 2026

- Active branch `Live-temp`; base pushed checkpoint `ec62cc9`; exact ROM unchanged.
- Full +0x40 family is behavior-complete and exact-size, each with the same 6-byte weighted-index register-order mismatch.
- 72E4/72A0 +0x3C schedule methods are behavior-complete with packed year/date/hour and weekday gating, but remain assembly due register allocation.
- No production code promotion in this checkpoint; metrics remain **68,868 / 940,036 = 7.3261%**, **871,168 asm bytes**, **144,598 meaningful-ROM bytes**, **671,168 bytes free**.
- Next: queue-rank-11 entity region after the parked `0x08037C08/68` constructors, beginning around `0x08037CC4`.

## SUPERSEDED SNAPSHOT - 7.3261%; concrete sizes corrected and SetBox exact - October 6, 2026

- Active branch `Live-temp`; base checkpoint `da790aa`.
- Exact progress: **68,868 / 940,036 = 7.3261% code**, **871,168 asm bytes**, **75,334 data/assets**, **144,598 meaningful-ROM bytes = 1.8737%**, **671,168 bytes free**. Retail SHA1 still exact.
- `UnkEntity37008::SetBox` is new exact source at `0x08037244`.
- Retail allocation proves 7218/725C size 0x44; 72A0/72E4 size 0x48 with the +0x44 2-bit variant.
- 7218/725C simple factory wrappers scratch-match 0x38/0 when ctors inline, but standalone constructor emission still needs a natural source arrangement.
- 7218 +0x40 is understood and parked at exact-size 6-byte register-order mismatch.
- Next: scratch the two location-reset +0x3C siblings, then propagate the weighted +0x40 source model across the other concrete classes.

## SUPERSEDED SNAPSHOT - 7.3248%; helper layer and two concrete constructors exact - October 6, 2026

- Base pushed checkpoint entering this pass: `eb59192`.
- Current exact progress: **68,856 / 940,036 = 7.3248% code**, **871,180 asm bytes**, **75,334 data/assets**, **144,586 overall meaningful-ROM bytes = 1.8735%**, **671,168 bytes free**.
- Full ROM compare and retail SHA1 still pass.
- Added exact sibling GetAnim/GetSpeed helpers plus exact 7218/725C constructors at `0x08037BB8/0x08037BE0`.
- 72A0/72E4 variant constructors at `0x08037C08/0x08037C68` are understood exact-size source candidates but remain assembly due register-allocation mismatch.
- Next: factory wrappers `0x08037A5C..0x08037BB7` and remaining +0x40/+0x3C methods; use recovered helper methods as anchors.

## SUPERSEDED SNAPSHOT - 7.2967%; resident specials and location-bound actor source exact - October 6, 2026

- Active branch: `Live-temp`; start checkpoint for this integration was pushed `82450e7`.
- Full retail verification after integration: `make compare` -> **`fomt.gba: OK`**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Progress: **68,592 / 940,036 = 7.2967% code**, **871,444 asm bytes**, **75,334 data/assets**, **144,322 overall meaningful-ROM bytes = 1.8701%**, **671,168 bytes free**. +760 exact source bytes this pass.
- Resident selector/class state: all **35 constructors source-owned**; IDs **1..34 +0x30 source-owned**; Child +0x30 remains assembly; Child +0x3C source-owned.
- New exact hierarchy source: `entity_unk_08037008.*`; stable layout/behavior in `docs/ENTITY_08037008.md`.
- Mapper upgraded for multiline source constructors/member initializers and ELF-derived source symbol sizes; regenerated map covers all 35 residents.
- Inventory: **2,385 linked asm functions**, **871,444 canonical asm bytes**, **191 repeated shape clusters / 891 participating functions**, **182 exact normalized clusters**.
- Next structural-continuity work: queue rank 5 `asm/code_entities_08034CEC.s:08037A48-0803A8A4`, focusing first on remaining +0x40/+0x3C sibling methods and concrete constructors/factories. Raw rank-1 save loader remains parked.

## SUPERSEDED SNAPSHOT - Lou exact; Child bounded; location-bound actor base recovered - October 6, 2026

- Clean start from pushed `ad6300d`; no production code/linker/assembly mutations in this research checkpoint.
- Lou constructor + +0x30 are scratch-exact: **0x3C + 0x2C = 0x68 bytes**.
- Child constructor is **0x44/0**; Child +0x3C is an exact 0x1A body + 2-byte alignment. Child +0x30 semantics are recovered but parked at a source-lifetime/codegen mismatch; `0x08036F68` is Child +0x18, not destructor.
- New neutral `UnkEntity37008` hierarchy proven from vtables 0x080E7328/72E4/72A0/725C/7218. Base has `ActorLocation*` +0x30, embedded `Box` +0x34, u16 +3C/+3E, bool +40, pure virtual +3C/+40.
- Base exact proofs: ctor **0x40/0**, dtor **0x50/0**, +0x34 getter **0x4/0**, +0x14 **0x14/0**; +0x10 and `GetBox` bodies are exact with only 2-byte alignment pads. GetBox is 14x14 centered at `(x,y-2)`.
- Four concrete +0x30 effect factories solved (three 0x2C exact, one 0x2E exact body + 2-byte align); two `u16` table-backed GetAnim helpers are **0x10/0** each. One simple +0x3C body is exact + alignment; its sibling differs only by scratch Thumb thunk placement.
- Next: production-integrate this proven family with exact section interleaving, verify full ROM, regenerate inventory/progress/maps/docs, commit/push, then continue +0x40/+0x3C siblings.

## SUPERSEDED SNAPSHOT - 64 resident NPC methods exact in production - October 6, 2026

- New exact source: `include/entity_resident_npcs.hh` + `src/entity_resident_npcs.cc`, **64 methods / 3,296 bytes** across nine retail-positioned source runs.
- Resident selector/class state: IDs 1..32 and 34 have source constructor/+0x30 pairs; Lou 33 and Child 35 remain special assembly cases.
- Full ROM: **`fomt.gba: OK`**, retail SHA1 unchanged.
- Progress: **67,832 / 940,036 = 7.2159% code**, **872,204 asm bytes**, **75,334 data/assets**, **143,562 overall meaningful-ROM bytes = 1.8602%**, **671,168 bytes free**.
- Inventory after integration: **2,399 linked asm functions**, **872,204 canonical asm bytes**, **192 repeated shape clusters / 898 participating functions**, **183 exact normalized clusters**.
- The raw rank-1 save region contains the parked loader; next structural-continuity work is `asm/code_entities_08034CEC.s:08036DC4-08039E18`, beginning Lou/Child.
- Next: recover Lou/Child special layout/virtuals, classify adjacent entity families, scratch-prove a coherent next batch, then integrate exact-only and regenerate queue/docs.

## SUPERSEDED SNAPSHOT - resident NPC selector/vtable map proven; Rick exact representative - October 6, 2026

- `tools/ches/map_npc_entity_classes.py` now generates the durable 35-character selector -> constructor -> schedule -> vtable -> virtual-method map in `tools/ches/npc_entity_class_map.json` and `tools/ches/NPC_ENTITY_CLASS_MAP.md`.
- Selectors 1..35 are proven directly from the retail jump table and decoded Thumb constructor calls. All corresponding 0x40-byte vtables are decoded from baserom and joined to current symbols/similarity families.
- Family counts among IDs 2..35: constructors `shape0007=19`, `shape0033=6`, `shape0118=2`, `shape0119=2`, solo=5; +0x30 methods `shape0005=16`, `shape0026=7`, `shape0024=7`, `shape0117=2`, unlabeled=2.
- Rick representative proof: constructor **0x38/0 diff** and +0x30 virtual **0x2C/0 diff** on the first Lillia-shaped scratch source attempts. Production source remains unchanged.
- Next: mass scratch-match Rick-family siblings, then the other dominant +0x30 families; integrate only after exact family proof.

## SUPERSEDED SNAPSHOT - function inventory live; sibling NPC/entity region is first ranked target - October 6, 2026

- Strategy checkpoint `e68144f7055fc4896b49cc31429f90c64fef3be1` is published on `ches/Live-temp`.
- New durable analysis: `tools/ches/build_decomp_inventory.py` -> `tools/ches/decomp_inventory.json` + `tools/ches/DECOMP_QUEUE.md`.
- Inventory: **2,463 linked asm functions**, **875,500 canonical asm bytes**, **874,452 function-range bytes (99.8803%)**, **1,048 unassigned asm bytes**, **199 repeated opcode-shape clusters / 960 participating functions**, **190 exact normalized-body clusters**.
- Top coherent target: `asm/code_entities_08034CEC.s:08035B64-08038DF0`, **157 functions / 12,940 bytes**, **107 repeated-family functions**. It begins directly after exact-source LilliaEntity and is adjacent to the dense NPC/entity vtable sequence, making sibling-class recovery the leading hypothesis.
- Next: map this region against vtables + entity factory selectors, establish class boundaries/names where evidence supports them, then reconstruct a representative repeated family and propagate the proven shape.

## SUPERSEDED SNAPSHOT - whole-game throughput pivot adopted - October 6, 2026

- Strategy changed from individual packed-sprite provenance to **throughput-first whole-game decompilation**.
- Exact state is unchanged: **64,536 / 940,036 = 6.8653% source**, **75,334 data/asset bytes**, **140,266 overall meaningful-ROM bytes**, retail ROM still exact at the prior verified baseline.
- Normal work unit is now an inferred **translation unit or coherent structural/type/similarity cluster**, not five functions.
- Immediate next tooling: complete remaining-function inventory with size/call/xref/TU/class/similarity/status/difficulty fields; infer TU and data ownership; cluster similar asm; map vtables/classes; score coherent units; work the ranked queue.
- Production remains exact-only. Understood but nonmatching source stays private research unless a supported NONMATCHING convention is deliberately added later.
- Packed-bank ownership remains **416 / 493**, leaving **77** unowned; those IDs are parked as a by-product lane, not the main queue. Closed provider/consumer evidence remains closed.
- Durable runtime seed remains **`/mnt/data/Ches/runtime-saves/fomt/opening-farm.ss1`**, 81,767 bytes. Load semantics are still unverified, but this is now scenario-harness work rather than the blocking next action.
- Future runtime work should use deterministic savestate + scripted inputs for bulk function coverage, indirect/virtual call targets, and targeted RAM diffs. Watchpoints answer focused questions only.
- Keep `func_08011650`, `func_080455D8`, `func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and `func_08092940` parked unless new structural evidence changes their leverage.
- Standing checkpoint publication rule: after every durable checkpoint is made continuation-ready and diff-verified, commit it on `Live-temp` and push to `ches/Live-temp`. Retail contribution pushes to `ches-dev` remain governed separately by exactness gates.
- **Next:** publish this documentation/strategy checkpoint to `ches/Live-temp`, then build the first machine-readable remaining-function database from existing project/map/call-graph evidence, derive TU guesses and similarity clusters, rank coherent units, and continue from that queue.

## Current checkpoint - Dog Ball 21..48 and menu-special family exact - October 6, 2026

- Added menu-special packed animations: Water 461, Box Lunch 401, Milk 290, Spaghetti 422, Snow-cone 247. Gain **544 bytes = 384 gfx + 160 pal**.
- Proved selector `0x4B` Ball field `+0x28` is a packed animation resource ID. `func_08038398` maps dog anim selector + facing into IDs 21..48; `func_0803853C` sends that field through GameObject vfunc +0x64 packed provider.
- Added all 28 Dog Ball animations as exact `packed-animation-v1` sources, 53 frames total, 10 multi-frame. Gain **1,024 graphics bytes**.
- Ownership: **416 / 493 = 405 / 450 simple + 11 / 43 multi**, leaving **45 simple + 32 multi = 77**.
- Progress: **64,536 code / 75,334 data-assets / 140,266 overall**; generated packed sprites **44,224 = 33,664 gfx + 10,560 pal**; `fomt.gba: OK`.
- `func_080722DC` is closed as a false direct-consumer lead: its packed provider at `sp+0x48` is not referenced after construction before teardown.
- **Next:** trace the remaining 32 multi-frame IDs through table/state-derived GameObject +0x64 / `func_080A4A00` effect-resource paths.


## Current checkpoint - Six Fish Kings promoted exactly - October 6, 2026

- Final collection indices `0x35..0x3A` map through exact `func_0809CE30` to packed IDs **252,249,254,253,250,251**.
- Retail `gUnk_08103A18` names them **Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, Squid**.
- Added six exact PNG/JSON sources under `assets/item_icons/fish_kings/`; manifest total is **383**.
- Gain: **800 unique bytes = 768 graphics + 32 palette**.
- Packed bank and full ROM remain exact: `fomt.gba: OK`.
- Ownership: **382 / 450 simple + 1 / 43 multi-frame = 383 / 493**, leaving **68 simple + 42 multi-frame = 110**.
- Progress: **64,536 code / 73,766 data-assets / 138,698 overall**, generated packed-sprite bytes **42,656 = 32,256 graphics + 10,400 palette**.
- **Next invariant:** in `func_080722DC`, the `gUnk_086678A0` provider is concretely constructed at **`sp+0x48`**. `[sp+0x2D0]` is only a reused pointer slot holding that address at `0x080730EC`. Trace aliases/copies of `sp+0x48` and its vtable +0x0C `GetAnimation` calls; keep the separate `gUnk_0858BA28` provider at `sp+0x18` distinct.


## Current checkpoint - Water Splash 425 promoted; multi-frame authoring proven - October 6, 2026

- Water Splash 425 / 0x1A9 is now canonical under `assets/item_icons/effects/water_splash/` as a 5-frame `packed-animation-v1` bundle.
- Exact `src/game_object_discard.cc` names `EFFECT_WATER_SPLASH = 0x1A9` and constructs it on `IsFootprintOnWaterSurface`; this is the first semantically owned multi-frame packed-bank family.
- `tools/packed_sprite_bank.py export-animation` / `verify-animation` round-trip the complete 0x30080-byte bank byte-for-byte; the canonical 377-entry manifest build is exact and `make -j4 compare` reports `fomt.gba: OK`.
- `tools/scripts/calcprogress.py` now counts resource spans across every animation frame. Water Splash contributes **384 unique graphics bytes**; its palette was already shared.
- Ownership: **377 / 493 total**, comprising **376 / 450 simple** and **1 / 43 multi-frame**. Remaining: **74 simple + 42 multi-frame = 116**.
- Current progress: **64,536 code / 72,966 data-assets / 137,898 overall**, generated packed-sprite resources **41,856 = 31,488 graphics + 10,368 palette**, free tail **671,168 bytes**.
- **Next:** rank the 42 unowned multi-frame animations against known effect/UI call sites and tables, then trace the strongest code-backed `gUnk_086678A0` family. Do the census with separate calls because MCP `parallel_run` rejects `shell_exec` children.

## Current checkpoint - overnight forage/map family promoted - October 6, 2026

- Added 18 exact PNG/JSON sources under `assets/item_icons/overnight/`; manifest total is **376**, leaving **74** simple animations unowned.
- Packed-bank rebuild is byte-exact and `make -j4 compare` reports **`fomt.gba: OK`**.
- Overnight family adds **544 unique editable palette bytes** and no new graphics bytes because all pixels are shared with paired item icons.
- Current progress: **64,536 code / 72,582 data-assets / 137,514 overall**, generated PNG resources **41,472 = 31,104 graphics + 10,368 palette**, free tail **671,168 bytes**.
- Active branch: `Live-temp`, HEAD `9078f36`.
- **Next:** continue indirect/table-driven `gUnk_086678A0` ownership tracing for the remaining 74 simple animations.

## Current checkpoint - 18 overnight forage variants proven - October 5, 2026

- `func_080A95A4` is a map/world renderer method using temporary provider `gUnk_086678A0`. Its helper `func_080AAF28` selects one of two packed-animation IDs per forageable.
- Exact hour classifier `func_0801A8C0`: 06-11 mode0, 12-17 mode1, 18-23 mode2, **00-05 mode3**. Only mode3 selects the second table column.
- Proven 18 overnight IDs: **51, 310, 307, 246, 282, 66, 217, 377, 491, 323, 358, 257, 474, 9, 304, 338, 273, 453**, paired respectively with Bamboo Shoot, Wild Grapes, Mushroom, Poisonous Mushroom, Truffle, Blue/Green/Red/Yellow/Orange/Purple/Indigo/White Grass, Apple, Moon Drop Grass, Pink Cat Grass, Blue Magic Grass, Toy Flower.
- Each overnight ID reuses its paired item graphics but uses a darker palette; some also change OBJ layout. These 18 are currently unowned.
- **Next:** export/promote all 18 as the overnight forage/map family, exact packed-bank rebuild, full ROM compare, then update coverage.
- Current validated totals remain **358 owned / 92 simple unowned**, **64,536 code / 72,038 data-assets / 136,970 overall**, free tail **671,168 bytes**.


## Current checkpoint - Money Bag 106 recovered - October 5, 2026

- Animation 106 is proven to use `gUnk_086678A0`: main GameObject +0x64 returns embedded provider +0xDE4, whose constructor is `func_0805E6CC(..., gUnk_086678A0)`.
- `func_08025B64` case 2 generates a random 5-20 G mine reward; `func_0802771C` credits it through exact MoneyState code and switches the effect animator to 106. Promoted semantic asset: **Money Bag**.
- Added `assets/item_icons/mine/money_bag.png/.json` and manifest `MONEY_BAG` ID 106. Exact packed-bank rebuild and full ROM compare pass.
- Bank ownership: **358** semantic PNGs, **92** simple animations unowned. Progress: **64,536 code / 72,038 data-assets / 136,970 overall**, free tail **671,168 bytes**.
- IDs 4, 7, and 21 are closed other-bank false leads. Fresh literal scan has no remaining candidate tied to `gUnk_086678A0`; cooking is the only direct no-`GetIconId()` packed-bank renderer.
- **Next:** trace indirect/table-driven ownership through objects/subobjects constructed from `gUnk_086678A0`; do not resume literal-ID hunting.

## Previous checkpoint - animation 106 provider chain narrowed - October 5, 2026

- `func_0802771C` installs animation 106 on the actor effect path using a provider returned by `UnknownEntityThing::owner->game_object` virtual slot +0x64.
- The live player action path is confirmed through `func_08025B64`; concrete player actor construction is `func_08024974`, which installs `vtable_unk_080E6658` and stores GameState/Farmer at +0x34/+0x38.
- The remaining unresolved link is the concrete runtime vtable of `AEntity::game_object`. Animation 106 remains unowned and must not be exported/named yet.
- **Next:** trace the GameObject pointer producer into `func_08024974`/`func_0802B908`, resolve that object's +0x64 vfunc, and identify its returned sprite provider.

## Previous checkpoint - seasoning path closed; animation 106 lead - October 5, 2026

- Sugar, Salt, Vinegar, Soy Sauce, and Miso are proven text/state-only selections beneath Seasoning Set. `func_08098CE8` draws only eight packed icons; `func_08099144` manages the five seasoning bits 7..11.
- Cooking constants/strings are now explicit semantic source in `asm/data/data_080F9EB8.s`; full retail compare remains exact and `git diff --check` is clean.
- Provider-aware fixed-ID scanning found no remaining unowned literal animation directly tied to `gUnk_086678A0`. `func_080522F8` IDs 201/167 are already-owned Frisbee/Fossil of Fish, and `Product::GetIconId()` delegates to Food/Article.
- ROM-wide animator/render scanning found **animation 106** in `func_0802771C` via `SpriteAnimator::Init` as the best next unowned-simple candidate. IDs 4 and 7 also occur in entity/intro paths; animation 21 remains a closed different-bank false lead.
- **Next:** prove the provider for animation 106 before naming or exporting it.

## Previous checkpoint - cooking utensil family recovered - October 5, 2026

- Consumer tracing moved beyond direct constants: ordinary packed-bank item render helpers carry dynamic Tool/Food/Article IDs and only hardcode already-owned Basket 53. Animation 21 is a closed false lead from a different bank (`gUnk_0874F34C`).
- `func_080989DC` / `func_08098CE8` consume the 8-entry table now aliased as `gCookingUtensilIconIds` and render it through `gUnk_086678A0`. Proven IDs are Knife 265, Frying Pan 204, Pot 346, Mixer 64, Whisk 472, Rolling Pin 313, Oven 327, Seasoning Set 400.
- Eight exact PNG/JSON assets were added under `assets/item_icons/cooking/`; manifest now owns **357** animations and **93** simple animations remain unowned. The family adds **1,152 unique asset bytes** (1,024 graphics + 128 palette).
- `make -j4 compare` -> `fomt.gba: OK`; final packed-bank rebuild after correcting ID 400 from Sugar to Seasoning Set is exact; `git diff --check` clean.
- Current progress: **64,536 code / 71,878 data-assets / 136,810 overall**, with **671,168 bytes free**.
- **Next:** trace cooking bits 8..11 / seasoning selection to determine whether Salt, Vinegar, Soy Sauce, and Miso own packed-bank animations or are text/state-only. Do not infer IDs from appearance.

## Previous checkpoint - 08092A70 parked; next consumer scan - October 5, 2026

- `func_08092A70` wrapping eligibility is behavior-complete and now **parked at exact size 0x260 / 3 differing linked bytes**. No production integration was made.
- Fresh tracked-compiler `-da` proof is under `tools/ches/checkpoints/ui-packed-sprite-2026-10-05/jump2-repro/`: only offsets 0x4D/0x4E/0x50 differ, and the first divergence remains final `jump2` cross-jumping.
- The exact October 3, 2003 Nintendo THUMB compiler reproduces the same three wrong branch-orientation bytes on unchanged v8. Its 0x260 / 7 result adds only four alignment-NOP bytes, so this does **not** justify a new compatibility-compiler rule.
- Focused CFG diagnostics are closed: v13 explicit source label -> 0x254/518 because the label is deleted before global allocation; v14 outer `else if` -> 0x254/518. v9 fresh repro is 0x260/6 and retains the same three trampoline bytes.
- The throughput decision is to rotate away until another recovered type/function provides genuinely new source-structural evidence.
- Next work is the **next code-coupled packed-bank consumer**. A read-only census confirmed exactly 450 simple animations, 349 manifest-owned PNGs, and 101 simple animations still unowned. Continue by tracing a raw `gUnk_086678A0` consumer that passes a constant unowned animation ID into the animator/render path, then recover that code and asset together.
- The broad raw-consumer scan is already done. Do not repeat anonymous exports or the parked `08092A70` compiler experiments. Canonical details: `tools/ches/checkpoints/ui-packed-sprite-2026-10-05/README.md`.

## Code-coupled asset frontier - October 5, 2026

- **Current direction supersedes the anonymous-asset export priority below:** asset recovery and code decompilation proceed together. The bank currently has **357 semantically owned PNGs** and **93 simple animations still unowned**. Do not export those 93 anonymously without first tracing the code/subsystem that owns and consumes them.
- First paired unit is now completed on the asset side: animation **352 / 0x160** is the **wrapped-present item-state icon**. `RucksackItem::IsWrapped()` and held-item wrapping render paths replace the ordinary item icon ID with 352; `func_08092CD0` calls `TryWrap()` / `TryWrapHeldItem()` and redraws the affected slot with 352.
- Editable source is `assets/item_icons/special/wrapped_present.png` plus JSON metadata and a manifest entry. Exact single-icon round trip and full-bank rebuild pass; the PNG adds 128 unique graphics bytes while its 32-byte palette is shared with an already-owned item icon.
- Historical MFoMT research plus direct US-ROM vtable inspection now proves the original-style sprite types: `AbstractSprite`, `DefinedSprite`, `SpriteAnimationData`, `SpriteFrameData`, and `SpriteAnimator`. US `vtable_unk_080E79C8` resolves directly to destructor `080E1984`, animation lookup `0805E760`, and frame-data lookup `0805E790`.
- A reusable 0x38 animated-sprite runtime component is proven from multiple UI objects: 4-byte position + 0x14 SpriteAnimator + 0x20 sprite/OAM draw state. `func_080CECE8` and `func_0805E99C` prove how the draw state becomes OAM.
- `func_080CAC7C` / `func_080CAD18` semantics are recovered as a 12-byte sprite-resource constructor/setter family. Current best natural `080CAC7C` candidate is **v9, exact size 0x8C / 52 differing linked bytes** after introducing the real `AbstractSprite::GetFrameData` virtual and provider lifetime. v8/v11/v12 are closed regressions; v13 proves explicit ABI spelling still lands at the same 52-byte scheduling boundary. Park exact spelling unless new structural evidence appears.
- Full evidence and anti-rediscovery: `tools/ches/checkpoints/ui-packed-sprite-2026-10-05/README.md`.
- `func_08092CD0` is integrated as exact source in `src/rucksack_wrapping.cc`: **0x94 bytes / 0 differing linked bytes**.
- Second paired unit is complete: animation **53 / 0x35** is the **Basket held-item icon** and is now editable at `assets/item_icons/special/basket.png`. `func_08092754` is integrated through the concurrently created `src/rucksack_item_render.cc` and matches retail exactly: **0x1EC bytes / 0 differing linked bytes**. The duplicate file created in this turn was removed after the concurrent collision was detected.
- Exact post-Basket verification: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean; symbols remain `func_08092754=0x08092754`, `func_08092940=0x08092940`, `func_08092CD0=0x08092CD0`, `func_08092D64=0x08092D64`.
- `func_08092940` is behaviorally recovered as the selected-item description/message refresh routine. Candidate v2/v3 correct the `Tool const *` ABI and repeated Rucksack getter structure and reach **0x128 vs retail 0x130**. Remaining delta is register/lifetime allocation; park unless new structural evidence appears.
- `func_08092A70` is now behaviorally recovered as the **wrapping eligibility / confirmation routine**. Correct retail boundary is **0x08092A70..0x08092CD0 = 0x260 bytes**; an earlier scratch comparison incorrectly extended through exact `func_08092CD0`, so ignore any old `0x2F4` result. It rejects tools, wrapped items, protected Articles, and unsupported held-item kinds; Dog uses the special “But...your poor dog!” refusal; unwrapped Food and discardable Article reach “How is this? / Yes / No”.
- Current best natural `08092A70` source is **candidate v8: exact 0x260 size / only 3 differing linked bytes**. The recovered key is one `confirmation_value`: Food leaves `GetKind()==0`; allowed Article leaves normalized `!CanBeDiscarded()==0`; retail reuses that same zero value for the three confirmation-dialog arguments.
- The final 3-byte mismatch is now causally localized to the compiler's **final `jump2` / cross-jump pass**, not missing game semantics, register allocation, ordinary thread-jumps, or the scratch harness. Pass dumps for unchanged v8 show the second `ToolStack::IsEmpty()` branch remains `NE -> label 206` through CSE2, flow, local allocation and global allocation; only `jump2` rewrites it to `EQ -> label 731 (cannot_wrap)`. That edge inversion later changes the Thumb long-branch trampoline bytes at positions `0x4D,0x4E,0x50`.
- Production `tools/agbcc/bin/agbcp` and the older scratch compatibility wrapper both produce the same v8 3-byte result. `-fno-thread-jumps` also leaves the result unchanged. Do not blame the ordinary thread-jump compatibility rule.
- Positive-condition v11 retains both `IsEmpty()` calls before `jump2`, but final cross-jumping merges the entire matching call/check sequence and regresses to **0x254 / 518 differences**. v8 avoids that whole-call merge, after which `jump2` merges only identical rejection-sound tails and chooses the opposite edge orientation from retail. v12 direct-label spelling regresses to **0x254 / 570**. Closed v6/v7/v9/v10/v11/v12 should not be repeated.
- **Exact next action:** resume from `candidate-wrap-eligibility-92a70-v8.cc`. Investigate the historical/compiler-level cross-jump orientation or a genuinely structural source distinction that changes the pre-`jump2` RTL without collapsing the two `IsEmpty()` calls. Do **not** resume cosmetic C++ syntax roulette, and do not modify the compatibility compiler without an independent structural discriminator plus regression proof. Keep CAC7C/CAD18 and 92940 parked.

## Multi-axis progress + code-coupled asset pivot - October 5, 2026

- `make progress` now tracks code, data/assets, overall meaningful-ROM reconstruction, and PRET-style contiguous tail free space.
- Code: **64,536 / 940,036 = 6.8653%**.
- Data/assets: **71,878 / 6,777,404 = 1.0606%**.
- Overall meaningful ROM: **136,810 / 7,717,440 = 1.7727%**.
- ROM free tail: **671,168 bytes = 655.44 KiB = 8.0009%** of the current 8 MiB ROM.
- Data/assets currently consist of 31,110 bytes of typed/source non-code data plus 40,768 bytes regenerated from editable packed-sprite PNG graphics/palettes (30,976 graphics + 9,792 palette); 396 mixed source-owned `.rom_header` bytes count only toward overall reconstruction.
- Asset progress is conservative: identified or relocated opaque incbins do not count; editable sources must regenerate the retail bytes.
- Tracker files: `tools/scripts/calcprogress.py` and `tools/progress_manifest.json`.
- Detailed authority and code-coupled asset roadmap: `docs/ASSET_DECOMPILATION.md`.
- Active retail priority: pair each asset family with the code that owns/interprets/loads/renders it, decompile/type that runtime boundary, then promote the corresponding resource to editable source with supported semantic ownership. The first paired unit is animation 352 plus `func_08092CD0`, `func_080CC728` / `func_080CCE58`, and active helpers `func_080CAC7C` / `func_080CAD18`. Do not export the remaining simple animations anonymously merely to raise coverage.
- Retail SHA1 remains the final authority.

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
- **Current follow-up:** the item-icon milestone's anonymous-103 export instruction is superseded. Resume `func_080CAC7C` from candidate v2, match `func_080CAD18`, identify the `func_08092CD0` state-machine purpose for animation 352, then promote that asset with a supported semantic owner/name. Repeat this code+asset pattern by coherent consumer subsystem. Keep `func_0805E790` parked unless new structural evidence appears.
- Documentation synchronization to the code-coupled policy is complete across `AGENTS.md`, `START_HERE.md`, `TODO.md`, `README.md`, `docs/ASSET_DECOMPILATION.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/CUSTOM_GAME_EXPANSION.md`, `docs/PROGRESS.md`, `docs/REPO_MAP.md`, `docs/SPRITE_ANIMATOR.md`, `assets/item_icons/README.md`, and the two canonical Ches handoff/status files. Validation: stale-current-priority scan clean, 26 live Markdown files with 0 missing relative links, `make progress` retains the documented metrics and reports `fomt.gba: OK`.

## Historical item icon provider checkpoint - October 5, 2026 (superseded)

- Recovered the concrete packed sprite/animation provider used by item icon rendering.
- Added `include/sprite_animation_provider.hh` and `src/sprite_animation_provider.cc`.
- `func_0805E6CC` at `0x0805E6CC` is now readable source for the seven-pool parser. Its symbol body is **0x92 with an empty retail diff**, plus the exact 2-byte section alignment pad completing the retail **0x94-byte region**.
- `func_0805E760` at `0x0805E760` is now exact source, **0x30 / 0 differing bytes**. It is the provider's first indexed virtual lookup and returns a directly constructed packed animation `{frames, frame_count}`.
- Production linker placement is verified at the original addresses: `func_0805E6CC=0x0805E6CC`, `func_0805E760=0x0805E760`, assembly resumes at `func_0805E790=0x0805E790`, and existing `SpriteAnimator` source still begins at `0x0805E824`.
- Full validation passes: `make -j4 compare` -> `fomt.gba: OK`; `git diff --check` clean.
- At this superseded provider checkpoint, code progress was **63,896 / 940,036 = 6.7972% source**. Current progress is the 64,536-byte live total above. HEAD remains `9078f36`; October 5 work is uncommitted.
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


## Save system research checkpoint - October 5, 2026

- Full forensic analysis of the save/load system completed. Checkpoint written to `tools/ches/checkpoints/save-system-research-2026-10-05/README.md`.
- Writer/loader symmetry analysis complete. Key finding: error codes are NOT symmetric between writer and loader (0x10000 means "size write failed" in writer but "checksum mismatch" in loader).
- Loader assembly fully mapped: `asm/game_state.s:2336-2670`, ROM `0x08011650..0x08011933` (740 bytes). It default-constructs the entire GameState before reading SRAM, then reads size/payload/checksum and validates.
- All 18 helper/infra entries catalogued: 8 decompiled, 7 non-trivial asm, 2 trivial asm, 1 no-op.
- Complete GameState offset map built (0x34F4 = 13,556 bytes, ~30 sub-structures with evidence levels).
- Partial-write failure model formalized: 5 failure points enumerated. Most dangerous is F2 (power loss during the ~13KB payload write), which destroys both old and new save for that slot.
- Extension proposal was follow-up audited before implementation:
  - Magic bytes are `FMTX`, represented as `u32 0x58544D46` on little-endian GBA.
  - 16-byte fixed header leaves exactly `0xAE0` = 2,784 payload bytes.
  - The original sequence-counter idea was rejected: a counter stored only in the extension cannot prove that it belongs to the current retail save.
  - Use a retail-binding checksum/fingerprint instead, plus an extension checksum and sub-record registry.
  - Graceful degradation remains the goal: corrupt/stale extension must never invalidate an otherwise valid retail record.
- Social block is not a flat Npc array. Resolver spans include 0x14, 0x18 and 0x24; the six Bachelorettes are 0x18 and HarvestSprites 0x24, while IDs 6/27/33 also occupy 0x18 spans with exact subtype semantics unresolved. ID 35 is the specially stored child.
- Raw 2,784-byte capacity is theoretically 139 x 0x14-byte records, 116 x 0x18-byte records, or 77 x 0x24-byte records before sub-record registry overhead. A practical 5-10 character addition remains comfortably within budget.
- Rule reaffirmed: retail GameState layout (0x34F4 bytes) MUST NOT change. Custom persistent state goes in extension block only.
- `func_08011650` decompilation remains **paused**. Core blocker unchanged: r8/r9 register allocation priority (6 refs vs needed 5) and year bridge (`mov low,r9; strb` vs reusing r0).
- No production code changes made. No commit/push.
- **Exact next action:** return to the non-save expansion pivot. The save system is now fully documented for when persistence work resumes. Follow the shop/item/provider lane per the prior checkpoint.

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

- `func_0801D7B0` (GameObject runtime vtable `+0xE4`) is now exact readable source inside `src/game_object_article_interaction.cc`. Scratch V16 has symbol size 0xDA plus the exact 2-byte section alignment pad, for a complete **0xDC-byte retail section with 0 differing bytes**.
- Production now owns the contiguous item-interaction pair: `func_0801D7B0` applies the article and refreshes neighboring field visuals; `func_0801D88C` classifies handled/blocked/unhandled. Assembly resumes at `func_0801D8CC`.
- Full production verification passed: `make -j4 compare` -> `fomt.gba: OK`; linked symbols are exact; `git diff --check` is clean.
- Current exact worktree progress is **62,824 / 940,036 = 6.6831% source**, **877,212 assembly bytes = 93.3169%**. HEAD remains `9078f36`; October 5 work remains uncommitted.
- `func_0801C0F8` stays parked at semantic recovery plus **0xA0 / 4 differing bytes**.
- New scratch `candidate-money-init-v1.cc` exactly matches `func_0809AB8C` at **0x4C / 0 differing linked bytes**. Recovered fields include balance +0x00, flag bits +0x04, daily count +0x08, seasonal count +0xFC, and maxima +0x120..+0x12C.
- **Exact next action:** promote the exact money initializer into a typed `MoneyState` source/header boundary and linker split at `0x0809AB8C`, full-ROM verify, then decompile adjacent `func_0809ABD8` credit and `func_0809ACC0` debit. Do not jump into giant shop/menu bodies yet.
## Item article-interaction exact checkpoint - October 5, 2026

- Corrected GameObject vtable math: the object stores `vtable_unk_080E5EC4` directly. Runtime `+0xE8` is therefore table `+0xE8` = pointer `0x0801D88D`, Thumb **`0x0801D88C`**. Old `0x0801CFB8` is unrelated `+0xF0`.
- `src/game_object_article_interaction.cc` now replaces retail `0x0801D88C..0x0801D8CB`, scratch **0x40/0**, linked at `0x0801D88C`; `make -j4 compare` and `make progress` pass with `fomt.gba: OK`.
- Progress: **62,604 / 940,036 = 6.6597% source**, **877,432 asm = 93.3403%**. HEAD remains `9078f36`; October 5 work is uncommitted.
- Semantics: `+0xE8` resolves a 12-byte field-plot lookup record via `func_0801C0F8`; no plot returns 2, otherwise `FieldPlot::method_0800A6C8(article)` maps to handled 0 / blocked 1.
- `func_0801C0F8` is recovered semantically; V2/V4 are exact size **0xA0/4**, differing only in equivalent lower-bound branch spelling. Park it.
- Paired runtime `+0xE4` virtual is Thumb **`0x0801D7B0`**, the ROM's sole direct caller of `FieldPlot::method_0800A6F4`. It applies the article, checks current map, selects vertical neighbors, calls `FieldPlot::method_0800AF5C`, then `func_080AA6D0` for field refresh. Candidate V3/V4 are **0xDC exact size / 106 differing bytes**.
- Exact next action: resume `candidate-gameobject-apply-article-v4.cc`; keep the solved front half and explicit validity booleans, and isolate only the post-`0x0801D7F4` live-range/register arrangement so retail uses r4/r5/r6 without the candidate's extra saved r7. Do not reopen `0x0801CFB8`, exact `+0xE8`, the resolver's 4-byte spelling, save-loader, or compiler research without new evidence.

## Documentation reconciliation checkpoint - October 5, 2026

This section records the completed docs sweep after the character/social integration and item/tool pivot.

- Updated live/canonical docs: `AGENTS.md`, `START_HERE.md`, `docs/CHARACTERS.md`, `docs/CUSTOM_CHARACTERS.md`, `docs/CUSTOM_GAME_EXPANSION.md`, `docs/DECOMP_NOTES.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/PROGRESS.md`, and `docs/REPO_MAP.md`.
- `README.md` and `docs/SAVE_FORMAT.md` were reviewed and did not need a new change: README stays intentionally generic; SAVE_FORMAT already marks persistence/save-loader work paused.
- All live docs now report the exact October 5 worktree state: **62,540 / 940,036 = 6.6529% source**, **877,496 assembly bytes**, `fomt.gba: OK`, retail SHA1 unchanged. HEAD remains `9078f36`; the October 5 source integrations are still uncommitted.
- Character docs now record both exact resolver blocks, social native calls 124..133 (NPC friendship/talk/gift), 134..136 (bachelorette love), exact `func_08045584`, and parked `func_080455D8` at an exact-size five-byte setup-order mismatch.
- Expansion/priority docs now make the item/tool lane first: recover/type the GameObject article-interaction virtual at runtime `+0xE8`, base Thumb target `0x0801CFB8`, and map concrete overrides. New tool/food/article IDs fit existing u8 IDs; product-count growth is explicitly deferred because `ShippingBin::product_stats[NUM_PRODUCTS]` changes persistent state layout.
- Compiler docs now explicitly state that neither the paused save loader nor parked `func_080455D8` justifies compiler research. No compiler changes were made.
- Verification completed: focused stale-live-state grep returned no matches; `git diff --check` passed; `make progress` returned `fomt.gba: OK` at 62,540 source bytes.
- No commit or push was performed.
- **Exact next action remains unchanged:** inspect/decompile the GameObject article-interaction vtable `+0xE8` base target at Thumb `0x0801CFB8`, identify concrete overrides, type the smallest honest interface, and exact-match one bounded article-interaction implementation. Save/product persistence work remains paused.
## Item/tool expansion boundary checkpoint - October 5, 2026

This is a historical checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- `func_080455D8` is now **parked, not blocking**. Its behavior is fully understood and scratch V4/V6 both compile to the exact 0x60-byte size with only **5 differing linked bytes**, all from one setup-order difference: retail emits stack-argument address materialization before the u16 event-id normalize, while the tracked compiler schedules those three instructions in the opposite order. The function body after that setup is instruction-identical. Do not spin more source/compiler variants unless a later exact-match batch naturally reveals the original shape.
- Current retail item ID spaces:
  - tools: **81** entries, IDs 0x00..0x50;
  - foods: **171** entries, IDs 0x00..0xAA;
  - articles: **95** entries, IDs 0x00..0x5E;
  - products: **103** entries, IDs 0x00..0x66.
- Tool/Food/Article/Product runtime IDs are stored in u8 fields. The metadata tables and validity checks are generated from `data/item/*.def` and `NUM_*` / `*_NONE`, so there is substantial ID headroom before 255 and no immediate need to widen the basic item ID representation.
- Important split for custom-game design:
  - adding a tool/food/article ID can reuse the existing u8 inventory/held-item representation without changing those object sizes;
  - adding a **product** grows `ShippingBin::product_stats[NUM_PRODUCTS]`, which is embedded inside `Farm` / game state, so product-count growth changes persistent state layout. Treat new shippable products as persistence-sensitive and keep them out of the first non-save prototype.
- Product conversion is data-driven: `Product(Food)` and `Product(Article)` scan `gProductInfo` up to `PRODUCT_NONE`. Product names/icons delegate back to the underlying Food/Article. This automatically follows an expanded product table, but the embedded shipping-stat array remains the structural blocker.
- Held-item representation has a 3-bit **kind** but Food and Article IDs remain u8, so a new ordinary food/article does not require a new held-item kind.
- `FarmerEntity::ClassifyHeldItemAction()` is the key runtime behavior gate:
  - food defaults to throw;
  - article IDs default to throw;
  - `ARTICLE_BALL` gets the special throw-ball path;
  - only Stones, Branches, Lumber, and Golden Lumber fall through to the GameObject article-interaction virtual;
  - that virtual is called through vtable offset **+0xE8** and returns handled / blocked / unhandled (0/1/2).
  Therefore a new interactable/placeable article will require extending this hardcoded article classification or replacing it with a more extensible policy.
- `FieldPlot::method_0800A6C8` / `method_0800A6F4` are the field-side handlers for Stones, Branches, Lumber, and Golden Lumber, mapping them to field plot state IDs 0x16/0x17/0x18/0x1A.
- The typed `GameObject` declaration currently stops at vtable +0x68, so the +0xE8 article-interaction slot is still an untyped architectural boundary. The main GameObject vtable is `vtable_unk_080E5EC4`; accounting for the GCC vtable header, the +0xE8 runtime slot corresponds to vtable word at label +0xF0, currently pointer **0x0801CFB9** (Thumb target 0x0801CFB8).
- **Exact next action:** inspect/decompile the GameObject +0xE8 target at 0x0801CFB8 with Thumb disassembly, identify its semantics and adjacent overrides across concrete GameObject vtables, then decide the smallest typed interface needed to expose article interaction safely. After that, choose one small concrete article-interaction implementation as the first item-lane exact C++ contribution. Do not expand ShippingBin/product count yet; save-loader work remains paused.

## Character social + heart-event integration checkpoint - October 5, 2026

This is a historical checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- Production retail exactness remains intact: after all integrations below, `make -j4` ends with **`fomt.gba: OK`**.
- Newly sourced exact retail block `080A01F8..080A03B7` (**0x1C0 / 448 bytes**) now lives in `src/character_info.cc`. It contains:
  - `func_080A01F8`: fixed six-bachelorette resolver;
  - `func_080A02B0`: Harvest Sprite resolver by character ID 36..42;
  - `func_080A031C`: Harvest Sprite resolver by sprite index 0..6;
  - `func_080A0384`: child resolver;
  - `func_080A039C`: 3-bit child-state getter;
  - `func_080A03A4`: matching 3-bit setter. The exact old-GCC source uses r1/r2/r3 register constraints plus an empty r2 clobber barrier; V7 matched the entire 448-byte block at **0 differing bytes**.
- Newly sourced exact retail block `080A06B0..080A0A1B` (**0x36C / 876 bytes**) now lives in `src/character_social.cc`. Whole-block scratch proof was **0 differing bytes**, and the integrated ROM remains exact. It contains the broad NPC resolver, fixed six-bachelorette resolver, both Harvest Sprite resolvers, and duplicate child resolver.
- Newly sourced heart-event helper `func_08045584` now lives in `src/heart_event_days.cc`. Its **0x52 instruction bytes are exact**; retail's following 2-byte alignment is supplied by the linker split, and the full ROM remains exact. Semantics:
  - resolve the requested bachelorette through `func_080A0878`;
  - for player events, return days-since-player-event only when player event count == 5;
  - for rival events, return days-since-rival-event only when rival event count == 4;
  - otherwise return 0.
- Native social-script API inside `func_0803F8DC` is now mapped:
  - call 124 = get friendship
  - 125 = add friendship
  - 126 = set friendship
  - 127 = days since last spoken
  - 128 = mark spoken
  - 129 = spoken today
  - 130 = spoken just now
  - 131 = met
  - 132 = mark gifted
  - 133 = gifted today
  - 134 = get love
  - 135 = add love
  - 136 = set love
- Calls 124..133 all gate through broad NPC resolver `func_080A06B0`; calls 134..136 gate through fixed bachelorette resolver `func_080A0878`. Heart-event condition/update helpers also gate through `func_080A0878`. Therefore a future added bachelorette must extend this resolver path or be unreachable from both love and heart-event logic.
- Production files changed this turn include `src/character_info.cc`, new `src/character_social.cc`, new `src/heart_event_days.cc`, `asm/code_809E804.s`, `asm/code_0803EE94.s`, and `fomt.lds`. No commit/push was made.
- **Exact next action:** decompile and exact-match the next bounded heart-event helper `func_080455D8` (`080455D8..08045637`, 0x60 bytes). Use the now-sourced `func_080A0878` and existing `Bachelorette` methods. If it matches cleanly, integrate it with another small linker split. Do not take on `func_08045638` unless its remaining behavior is still high-leverage and bounded; otherwise document its interfaces and pivot to the item/tool extension lane. Save-loader work remains paused.

## Character social resolver throughput checkpoint - October 5, 2026

This is a historical decomp checkpoint preserved from the earlier non-save expansion pivot; the top checkpoint owns current work.

- Scratch exact matches under the tracked compiler:
  - `func_080A06B0`: **0x1C8 / 0 differing bytes**. It is the broad NPC/social-record resolver and matches the already-proven `GetCharacterNpc` source shape when the child case calls `func_080A0A04`.
  - `func_080A0878`: **0xB8 / 0**. Fixed six-bachelorette resolver.
  - `func_080A0930`: **0x6C / 0**. Harvest Sprite resolver by character ID 36..42.
  - `func_080A099C`: **0x68 / 0**. Harvest Sprite resolver by sprite index 0..6.
- The earlier contiguous resolver block immediately after `character_info.cc`, retail `080A01F8..080A03B7` (**0x1C0 / 448 bytes**), was reconstructed as six C++ functions. V3 is exact size with only **7 differing linked bytes**, all inside the final 20-byte setter `func_080A03A4`.
- Therefore the first five functions in that block are already instruction-exact:
  - `func_080A01F8` bachelorette resolver, 0xB8;
  - `func_080A02B0` Harvest Sprite resolver by character ID, 0x6C;
  - `func_080A031C` Harvest Sprite resolver by index, 0x68;
  - `func_080A0384` child resolver, 0x16 instruction bytes plus retail alignment;
  - `func_080A039C` 3-bit child-state getter, 0x08.
- `func_080A0A04` is a later byte-for-byte duplicate child resolver. Its V2 scratch emits the exact retail instruction sequence; compare reports 0x16 symbol bytes versus the 0x18 bounded region solely because the following retail function alignment contributes two zero bytes.
- `func_080A03A4` semantics are solved: preserve byte 3 except bits 2..4 and replace those bits with `value & 7`. V3 differs only by register assignment. Retail keeps the incoming value in r1, uses r2 for mask/result, and r3 for the old byte; V3 swaps the r1/r2 roles after the initial `mov r2,#7`.
- Saved artifacts: `tools/ches/checkpoints/custom-expansion-2026-10-05/`, especially `candidate-character-social-block.cc`, `candidate-npc-resolver.cc`, and `match/character-social-block-v3.*`.
- **Exact next action:** perform only a small source-shape adjustment for `func_080A03A4` to keep the masked input in r1 and mask/result in r2. Once the whole `080A01F8..080A03B7` block is 0-diff, integrate that block into `src/character_info.cc`, trim the corresponding bytes from `.text.after_character_info`, and run the authoritative full-ROM compare. Then return to the later exact resolver family `080A06B0..080A0A04` for a second integration split. Do not reopen save-loader work.

## Non-save custom-game expansion pivot - October 5, 2026

This is the authoritative live direction and supersedes the save-loader exact-next-action sections below.

- Production remains `ches-dev` at `9078f36`; the retail ROM remains exact. No retail code/compiler change is made by this pivot.
- Legacy save loader `func_08011650` is **paused, not abandoned**. Preserve its checkpoint and do not spend more time on its compiler-sensitive zero/register problem unless explicitly resumed or required by a later persistence feature.
- Active goal: recover the non-save retail boundaries that let the separate custom-game branch add/extend NPCs, bachelorettes, items, tools, crops, dialogue/events, inventory/shops and assets.
- Use throughput-first target selection. Prefer coherent small/medium clusters and semantic/type leverage. A hard function may remain assembly after its behavior/interface is understood; checkpoint compiler archaeology and rotate.
- Character first frontier is now concrete: `func_080A0878` is the fixed six-bachelorette social-state resolver. Analyze/decompile it first, then the broader NPC resolver `func_080A06B0` and the bounded call sites in giant dispatcher `func_0803F8DC` that implement friendship/gift/love/event operations. Do not attack `func_0803F8DC` monolithically.
- Item/tool lane is already relatively mature: item definition tables, wrappers, rucksack/tool chest, held-item helpers, and `FarmerEntity::ClassifyHeldItemAction` are readable. Its next need is a fixed-ID/bounds/consumer audit and unresolved action/provider/shop helpers, not basic item-class reconstruction.
- Crop lane follows: recover semantic `FieldPlot` planting/growth/harvest/tool transitions and their item/product links.
- Dialogue/event/asset lane follows: native trigger/call registration plus Mary/script and portrait/display/provider round trips.
- Cross-system roadmap: `docs/CUSTOM_GAME_EXPANSION.md`.
- First pivot result: `func_080A0878` is confirmed as a fixed six-entry `Bachelorette *` resolver. Character IDs 3/12/19/21/25/31 map to social offsets 0x098/0x154/0x1E4/0x210/0x264/0x2E4 respectively; every other ID returns null. These offsets exactly match the existing Popuri/Mary/Karen/Elli/Ann/Harvest-Goddess social records.
- **Exact next action:** create one private scratch C++ candidate for `func_080A0878` using the existing `Bachelorette` type and character-ID constants, compile/compare it against 0x080A0878..0x080A092D, and promote only if exact. Then evaluate `func_080A06B0` as the broader NPC resolver and batch adjacent resolver helpers if straightforward. Do not attack `func_0803F8DC` monolithically.

## Nested ActorLocation boundary microprobe closure - October 5, 2026

This is the authoritative live loader checkpoint and supersedes the Dog/Farmer microprobe action below.

- Production remains unchanged at `9078f36`; no retail source, assembly, linker input, or tracked production compiler input changed.
- The one authorized source probe, `nested-actorlocation-zero-boundary-probe.cc`, was compiled under the normal tracked compiler with full `-da` dumps. It does produce a useful later ownership split: the early/source zero becomes r5, the post-copy narrow zero becomes r6 and owns the three later string clears, while `state+4` and the first-fill const-reference scalar remain on r5.
- Retail disassembly closes literal transplantation of that mechanism: the real `+0x1CCC` block has direct mask/field operations and no six-byte `memcpy` call. The aggregate-copy shape can only be an oracle, not the loader's literal source shape.
- **Important correction to the prior gate:** `proof-v96-da-current` is the private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` oracle, not stock tracked-compiler v96. Stock v96 is the recorded `proof-v96-stockzero-detail` result at exact size **0x2E4 / 495 differing bytes**; its generated code collapses the early/source/string zero family into r8 and sends the shared -125 mask to r9. The private v96 oracle instead creates the retail-like early r9 / later r5 split but still wrongly gives the first-fill scalar to r5.
- The exact same microprobe source was also compiled once under the existing private distinct-zero oracle only to compare environments, not as a second source experiment. It still fails the retail bridge: early/source zero stays r5; the post-copy facing zero is r6; the explicit later string zero is preserved separately in r4; the first-fill scalar remains r5. It never creates retail's initial low-zero -> high-r9 bridge.
- Therefore the **nested temporary + six-byte memcpy + post-copy zero field hypothesis is CLOSED as a transferable loader mechanism**. Do not spin variants, add a loader memcpy, reopen typed Location/placement forms, or reinterpret the private v96 oracle as stock behavior.
- The strongest remaining natural-source evidence is the existing stock `loader-constructor-zero-oracle.cc`, which already reproduces the complete desired ownership topology, versus stock `diagnostic-loader-constructor-full.cc`, whose first CSE over-merges the later `string_zero`. Typed `GameTime` was already tested and closed.
- **Exact next action:** read-only compare those two existing constructor artifacts at RTL -> first CSE around the later `string_zero` birth and first-fill const-reference temporary. Identify the precise source/RTL discriminator that lets the small stock oracle keep the later zero separate but makes the full stock constructor merge it. Focus on scope/lifetime, intervening calls, addressability/addressof, mode, and initializer/member boundaries. Do not create a new full loader candidate or compiler rule until that discriminator is isolated.

## Dog/Farmer nested ActorLocation zero-boundary checkpoint - October 5, 2026

This is the authoritative live loader checkpoint and supersedes older exact-next-action sections below.

- Production remains unchanged at `9078f36`; no retail source, assembly, linker input, or tracked production compiler input changed. New work is private save-loader oracle/research material only.
- A new exact-source `dog-ctor-oracle/` was built from the saved preprocessed `src/dog.cc` input with the normal tracked compiler and full `-da` dumps. Its extracted `.text` is byte-identical to current production `build/src/dog.o`.
- **Dog gives the strongest exact source discriminator so far.** In `Pet(name, ActorLocation(Location(2,0x17E,0x52), 0), 1)`, the outer ActorLocation facing value begins as its own SImode user zero (`reg112 = 0`). The inlined constructor copies the six-byte Location with `memcpy`, then stores the low byte of that zero at temporary +6. First CSE preserves `reg112` as a distinct zero across the memcpy/call boundary. Flow reports **4 refs/live29/crosses 2 calls**; local allocation reports **4 refs/live58/crosses 2 calls**. The same zero identity is later reused for one Dog zero field while another equal zero remains separate for the following field.
- **Farmer independently confirms the same structural boundary.** Source `location(Location(2,0,0), 0)` initially creates separate SImode zero pseudos for Location x/y and the outer ActorLocation facing argument (`reg132 = 0`). The outer constructor again performs a six-byte `memcpy` and then the post-copy +6 byte store. First CSE canonicalizes the facing value to an earlier HI zero (`reg62 = 0`), but that zero remains live across the copy: flow **2 refs/live20/crosses 1 call**, lreg **2 refs/live40/crosses 1 call**, naturally allocated to **r5**.
- The reusable discriminator is therefore narrower than “constructor”, “typed Location”, or “another zero literal”: it is a **nested aggregate temporary + six-byte memcpy + post-copy narrow zero field**. Dog proves a distinct SImode identity can survive it; Farmer proves CSE may instead reuse an earlier narrow equal-zero identity while preserving the same lifetime topology.
- Historical v65 is now more clearly closed for this question. Its `ConstructLocation` helper writes the Location directly in place at `bytes + 0x1CCC`; it has no nested temporary/copy/post-copy-field boundary and falls into the known wrong extra-high-zero family. Do not retry v65, typed Location assignment, placement construction, or broad whole-loader constructor rewrites.
- **Exact next action:** create exactly one small microprobe in the mature v96/plain-function ABI that isolates this proven boundary using a minimal six-byte POD payload, an outer seven/eight-byte temporary, a six-byte copy, and a post-copy zero byte. Compile with the normal tracked compiler and `-da`. The gate is strict: preserve v96's good header/old-zero topology, create the later low zero suitable for the +0x1CCC/string phase, and do not let it steal the first-fill scalar from the earlier zero. If the microprobe does not do this naturally, close this boundary hypothesis before any further loader source variant.

## Constructor-zero / natural distinct-zero checkpoint - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This continuation added only private research/oracle artifacts.
- **ResourceManager exact-source oracle is decisive.** `ResourceManager::ResourceManager()` has zero-valued member initializers and `fill_inl(..., 0)`. Initial RTL creates a fresh zero pseudo for the literal fill argument, but first CSE deletes that fresh pseudo and rewrites the fill const-reference slot to the earlier constructor-generated zero. By flow, one zero owns the constructor member zeros and the fill argument. This is normal tracked-compiler behavior, not a diagnostic rule.
- This proves the loader's desired first-fill ownership can arise naturally from constructor/member-initializer source shape. It also explains why plain literal `fill_n_inl(...,0)` in v96 creates the wrong competing zero when the earlier zero is modeled as a source user variable rather than constructor-generated compiler state.
- A focused constructor microprobe `loader-constructor-zero-oracle.cc` was built under the normal tracked compiler. Its zero-valued member initializers naturally produce one long-lived zero that survives four calls, owns two early word clears, year, a later full-width zero field, and the first `fill_n` const-reference scalar. A later `string_zero` remains separate. This is the first normal tracked-compiler microprobe to reproduce the complete desired ownership topology without a private zero-rewrite hook.
- A private full-loader structural diagnostic `diagnostic-loader-constructor-full.cc` was then built. Under the **normal tracked compiler**, its prologue is structurally retail-exact:
  `mov r0,#0; mov r8,r0; str r0,[this+8]; str r0,[this+0xC]; mov low,r8; strb low,[this+0x10]`.
  Thus constructor/member initialization naturally explains the retail low-zero -> high-copy -> two word stores -> high-to-low year bridge. The only allocation difference is long-lived zero r8 instead of retail r9.
- In that full constructor diagnostic, tracked CSE over-merges the later `string_zero`: state+4, all three string clears, and the first-fill const-reference scalar all use constructor zero r8. Flow/lreg show constructor zero reg26 at **9 refs/live102 -> 9/live204**. This is too merged.
- With the existing private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` diagnostic, the same full constructor source immediately restores retail-like string separation: constructor zero remains r8 for state+4 and first fill, while a distinct r5 clears the three strings. This is causal evidence only; the private flag is not production authority.
- Linked comparison of the whole constructor-form diagnostic is poor as a final candidate (tracked **0x2E8 / 630**, private **0x2EC / 633**) because changing the entire function into a C++ constructor perturbs ABI/register allocation far beyond the zero islands. Treat it as a structural oracle, not a v104/source candidate.
- A constructor + typed `GameTime` full-loader probe was tested because the small oracle's later zero appeared near the calendar update. It does **not** separate the strings under the tracked compiler and is closed. Retail binary also proves the loader's halfword clock mask literal is signed `0xFFFFF81F`; the small oracle's unsigned `0x0000F81F` helper-zero behavior is diagnostic only.
- Direct typed `Location` assignments were re-audited read-only and remain closed: v47 does not naturally materialize the retail r5 in the Location block. Historical v64 placement construction and v65 inline 3-argument constructor helper already tested Location constructor semantics; placement adds a null guard and the helper creates the wrong extra high zero. Do not repeat them.
- v90 was re-read as an allocation oracle. Its two literal weather stores naturally create the low-reference compiler zero in r9 and first fill already uses r9, but header year rematerializes a fresh low zero and state+4 collapses to the later string zero. Historical reload tracing already demoted this path; do not reopen broad reload work.
- v95 fully merged literal-zero source is still closed: merging year/state into the compiler zero makes the family too heavy and sends it back to r8.
- **New exact-source corpus result:** automated first-CSE scanning of the 54 exact-source Call238 modules found **59 functions where two or more equal zero pseudos survive CSE simultaneously**. Therefore distinct equal-zero identities are routine production behavior and do not require a Nintendo-only special rule.
- Constructor examples are especially relevant: BarnAnimal, Chicken, Dog, Horse, Farmer, Rucksack, and `Unk_Actor_0809BFE8` all retain multiple zero identities of SI/HI/QI modes.
- `Dog::Dog(char const*)` is a strong exact-source precedent. Source `: Pet(name, ActorLocation(Location(2,0x17E,0x52), 0), 1)` creates a distinct SImode zero pseudo for the nested `ActorLocation(..., facing=0)` argument. Flow keeps that zero as a user variable across the nested constructor/memcpy boundary while other zero-valued Dog fields later use separate zero identities. This proves constructor-argument/member boundaries can naturally preserve equal zeros under the stock tracked compiler.
- The loader's remaining source problem is therefore no longer “can GCC preserve separate zeros?” It can. The narrow question is **which real source boundary around the +0x1CCC Location/string phase gives retail's later r5 zero a distinct identity while allowing the earlier compiler/constructor zero to own weather/year/state+4/first-fill**.
- **Exact next action:** stay source-structural and read-only first. Compare the exact Dog/Farmer constructor pass patterns that preserve multiple zero identities against historical v65's inlined Location-helper zero lifetime. Identify the discriminator (constructor parameter, nested temporary, mode, call/memcpy boundary, or lifetime/death notes) that keeps Dog's later zero distinct without making it a long-lived high-register family. Only then create one small microprobe in the mature v96/plain-function ABI. Do not retry typed Location assignments, placement new, the v65 helper itself, typed calendar/time, v90 reload diagnostics, all-literal v95, hard registers, volatile/padding, or compiler-family hunting. Do not promote the whole constructor-form loader as v104.

## Natural post-flow ref-drop evidence - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This pass added only private research artifacts under the save-loader checkpoint.
- The five-ref/r9 conclusion from the prior checkpoint still stands. Do not resume work on old-zero allocation itself.
- Separate-year pass history was traced through RTL/CSE/combine/flow/lreg/greg. Its independent year pseudo is allocated directly to low `r0`; global allocation then deletes its explicit zero materialization because the weather-store `r0=0` is still available. This explains why separate-year cannot naturally emit retail's `mov low,r9; strb year`.
- v96 remains the best natural explanation for the retail header bridge. Its source shape naturally emits `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; mov low,r9; strb year`. Its only causal defect is that a later compiler-created zero identity steals the dead first-fill const-reference scalar.
- The saved private v96 flow-lifetime oracle was re-verified: it combines the retail-correct header/year bridge with old zero at **5 refs/live200 -> r9**, mask -> r8, and first-fill `[sp+4]` sourced from r9. It remains diagnostic only.
- A byte-exact `m4aMPlayStart` pass oracle was generated at `m4a-mplaystart-oracle/`. Exact FoMT source proves a high-register zero can later be copied low for a byte store, but that example requires an intervening `TrackStop()` call and therefore does not by itself explain the loader's call-free year bridge.
- A ROM-wide high-zero/low-reload census found many call-free retail examples, but the call-free examples are still assembly-only in the current decomp; no already-source-matched call-free analogue was found.
- The existing Call238 `full-flow-regression` corpus contains 54 preprocessed exact-source C++ modules. Those exact `.i` snapshots were compiled once with the tracked production compatibility compiler and `-da` into `natural-refdrop-corpus/`; all **54/54** compiled successfully. `natural-refdrop.tsv` records the automated comparison.
- The corpus proves post-flow reference loss with preserved or doubled lifetime is ordinary production compiler behavior: **54 register cases across 34 functions in 18 modules** have `flow refs > lreg refs` while `lreg live >= flow live`.
- `FarmHouse::FarmHouse()` provides several exact-source constant precedents where one reference disappears and the live length doubles, e.g. `-3: 3 refs/live44 -> 2/live88`, `-5: 3/42 -> 2/84`, `-9: 4/40 -> 3/80`, through `-65: 4/34 -> 3/68`. Therefore stale/doubled lifetime after a physical-use reduction is not unique to the private loader diagnostic.
- Two exact-source **zero** precedents were found in `src/code_actor_0809BFE8.cc`:
  - `func_0809C32C`: source `unsigned int result = 0`; flow **4 refs/live39/set2**, lreg **3 refs/live78/set2**.
  - `func_0809C38C`: source `unsigned int result = 0`; flow **4 refs/live29/set2**, lreg **3 refs/live58/set2**.
- The responsible natural transformation is **combine**. In `func_0809C32C`, flow still contains a boolean-normalization tail using `result` twice (`neg`, `or`, `>>31`); combine collapses that tail to a copy/self form. Local allocation later sees one fewer reference while the older lifetime accounting survives and doubles. This is the same class of accounting event modeled by the successful v96 flow-lifetime diagnostic.
- The focused diagnostic hook was inspected directly. It rewrites the first-fill full-width zero store from the compiler-created zero pseudo to the recent source/user zero, while deliberately preserving the compiler-zero's flow lifetime bookkeeping. Normal v96 combine has `[sp+4] <- reg33`; diagnostic combine has `[sp+4] <- reg27` while stale reg33 dead/equivalence notes remain. This is causal evidence, not a production rule.
- The frontend origin of the competing v96 zero is now explicit. `fill_n_inl(I,S,V const&)` binds literal `0` through a const-reference temporary. Initial RTL creates a fresh zero temporary and an addressable slot for that argument; CSE later canonicalizes it to the competing compiler-zero family. That is why v96's literal first fill steals the dead scalar.
- Explicitly passing source `zero` to the first `fill_n_inl` is already closed and was **not** retried: v98 (0x2DC/566), v76, v86 and v27 cover that family and spill/extend the source zero incorrectly.
- Direct exact-source template precedents were checked. `Barn::Barn()` uses `fill_n_inl(...,-1)`; the literal is materialized as its own const-reference temporary and carried into the fill loop rather than being replaced by an older equal constant. This agrees with the v96 competing-zero behavior.
- A newer exact source oracle for `ResourceManager` was started at `resource-fill-zero-oracle/`. Its constructor uses `fill_inl(occupied.begin(), occupied.end(), 0)`, making it the closest exact-source literal-zero const-reference analogue. Pass dumps were generated successfully, but detailed pass comparison was intentionally deferred at the checkpoint boundary.
- **Updated frontier:** the historical mechanism should be sought in normal post-flow/combine simplification around the const-reference temporary, not in another year-zero spelling and not in old-zero allocation. Exact FoMT code now proves that the required ref-drop/stale-lifetime accounting class is real.
- **Exact next action:** inspect `resource-fill-zero-oracle/resource_handle.i.{rtl,flow,combine,lreg}` around source line 94 and the inline `fill_inl` body. Determine whether its literal-zero const-reference temporary loses/replaces a reference after flow and whether an earlier equal zero identity participates. Then classify the 54 natural-refdrop corpus cases by the first pass where the reference disappears, prioritizing constructor/template/MEM cases. Do not create a new loader candidate until a normal compiler transformation from these exact-source oracles explains how v96's first-fill store could become old-zero27 while retaining the compiler-zero lifetime.

## Separate-year full-loader checkpoint - five-ref r9 achieved - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked production compiler input changed. This pass added only private research/oracle artifacts.
- A byte-exact real-source compiler oracle was created from `src/farmer.cc` at `farmer-ctor-oracle/`. Recompiling the current exact `Farmer::Farmer(char const *, GameDate const &)` with `-da` produced machine instructions/relocations identical to `build/src/farmer.o` for that constructor. Whole-object bytes differ only because the private artifact has different metadata/debug context. This makes its pass dumps a trustworthy source-style/compiler oracle.
- The Farmer oracle confirms original FoMT source style heavily uses member-initializer lists and nested temporary constructors. It also shows old GCC naturally creates multiple independent zero pseudos for distinct member initializers/nested objects rather than requiring one hand-written zero local.
- The MFoMT-derived nested calendar probe `game-data-nested-calendar-probe.cc` was tested. A nested 4-byte calendar subobject after the two weather words is semantically plausible, but old GCC collapses weather/year/later-state/first-fill zeros into one family. Closed as a matching mechanism.
- A ROM-wide pattern census found many generic low-zero/high-register-copy patterns, but the strongest loader-like examples `func_0807865C` and `func_080AC674` remain assembly-only. Exact source-matched `m4aMPlayStart` proves a literal zero can be hoisted into r8 across a call and later copied low for a byte store, but does not explain the loader's pre-call year bridge.
- **Most important new experiment:** `diagnostic-v83-separate-year.cc` changes only v83's year initialization from `header[8] = zero` to an independent `u8 year_zero = 0; header[8] = year_zero;`. This exact full-function case had not previously been tested. It was compiled only under the existing private distinct-zero diagnostic compiler.
- Full loader pressure gives the quantitative allocation target exactly:
  - semantic/source old zero pseudo27 = **5 refs / live200 / 7 calls -> r9**
  - independent year-zero pseudo33 = **2 refs / live4 -> r0**
  - shared `-125` mask pseudo44 = **3 refs / live58 -> r8**
  This is the first source-shaped full loader experiment to obtain the retail old-zero r9 / mask r8 allocation without hard-register forcing.
- The later zero ownership is also correct. Generated assembly uses `mov r0,r9; str r0,[state_21cc,#4]` and later `mov r0,r9; str r0,[sp,#4]`, while the three string clears remain on the separate r5 zero and the first fill loop still materializes its own immediate zero.
- The only critical early zero mismatch is now extremely specific. Candidate prologue is:
  `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; strb r0,[header+8]`.
  Retail is:
  `mov r0,#0; mov r9,r0; str r0,[state+8]; str r0,[header+4]; mov low,r9; strb low,[header+8]`.
  Thus the independent year source reaches the correct five-ref allocation but reload keeps using the still-live low r0 instead of rematerializing/copying the equal zero from r9.
- Linked comparison for the private separate-year full loader is exact size **0x2E4 / 221 differing bytes**. This is only one linked byte worse than v75's 220 despite changing the entire early allocation family. The raw count overstates the semantic regression because omitting retail's two-byte `mov low,r9` shifts the immediately following Farm/Farmer/Dog instruction stream by two bytes until later compensation realigns the total size.
- Therefore the earlier claim that an independent year zero could be dismissed solely from its low-pressure microprobe is superseded. Full loader pressure proves it is a highly useful causal model: it fixes old-zero allocation and all later old-zero ownership. It is still **not** a production/v104 candidate because the year bridge and early instruction length are wrong.
- `game-data-weather-pair-probe.cc` tested the remaining obvious constructor-boundary hypothesis suggested by MFoMT: a nested two-word WeatherPair constructor followed by outer year/date/time initialization. Under the distinct-zero oracle the weather constructor gets one zero family and the outer constructor gets another, but first CSE still assigns the dead first-fill scalar to the weather zero. Constructor scope alone therefore does not kill the early weather-zero equivalence. Closed.
- **Updated frontier:** stop trying to change old-zero reference count or r8/r9 allocation; that part is now empirically solved by the separate-year source model. The remaining question is narrower: why retail's independent/equivalent year-zero store uses the already-allocated r9 zero through `mov low,r9` instead of directly reusing the low r0 that performed the two weather stores.
- **Exact next action:** compare `diagnostic-v83-separate-year` pass history around the year store against retail-compatible source-matched examples where a distinct zero is forced/reloaded from a high register, with emphasis on lifetime/death of the low weather-zero temp at an inline/member-constructor boundary. Reuse the Farmer oracle and existing reload/CSE traces. Do not alter the old-zero allocation, do not add another compiler family, and do not retry aliases/copies, independent year scalar width variants, WeatherPair/nested-calendar constructors, chained assignments, literals/aggregates, hard registers, or broad compiler rules. A future full candidate is justified only by a natural mechanism that preserves the proven 5-ref r9 state while inserting the retail two-byte `mov low,r9` before the year byte store.

## GameData constructor-mode / five-reference checkpoint - October 5, 2026

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked compiler input changed. This pass added private microprobes and research evidence only. No v104/full-loader candidate was created.
- Caller topology now strongly establishes `func_08010358` and `func_08011650` as paired GameData/GameState construction modes. Every observed call first allocates exactly `0x34F4` bytes with `__builtin_new`, passes that pointer in r0, and stores/uses the returned pointer. Both functions return their original state pointer.
- Their construction prefixes match at the subsystem level and call the same first fifteen recovered constructors/helpers in the same order: Farm, `func_0809AB8C`, Farmer, Dog, `func_0800FF8C`, social/support initializers, `func_080114F8`, `func_0809A8AC`, `func_08011510`, `func_0809CD78`, `func_0809CE8C`, `func_0809C144`, `func_080A1A48`, `func_0809C4E4`, and `func_0809BFE8`. After that common construction, `func_08010358` performs new-game/randomization work while `func_08011650` performs SRAM size/payload/checksum reads.
- The sole known `func_08010358` caller `func_080D6C58` supplies four configuration values with clear roles: config+4 becomes the Farm string pointer, config+0x14 becomes the Farmer string pointer, config+0x24 supplies the one-byte GameDate passed to Farmer, and config+0x28 becomes the Dog string pointer. The special packed `sp+8..+0xB` Year 1 / Spring 2 / 6:00 calendar temporary is independent of those four inputs. This strengthens the interpretation that the sister constructor's second zero is born from internal calendar/date-time construction, not user configuration.
- `weather-chain-probes.cc`: `current_weather = forecast = zero` and the reverse produce a five-reference source-zero quantity, but first CSE still gives the dead first-fill scalar to the separate string/compiler-zero family. Five refs are therefore achieved for the wrong ownership reason. Closed.
- `weather-memset-probe.cc`: clearing the 8-byte weather pair with `memset` emits an actual `bl memset`, not retail's two word stores. Closed.
- `game-data-split-member-ctor-probes.cc`: letting an inner member constructor initialize only one weather field while the outer GameData constructor initializes the other separates the zero families, but the inner-constructor zero becomes the dead first-fill owner. This is the wrong direction and is closed as the matching source shape.
- `year-zero-narrow-probe.cc` is a new and useful near miss. An independent `u8 year_zero = 0` reduces the semantic/source zero to exactly **5 refs**, preserves that source zero for both weather words, the later full-width state zero, and the dead first-fill scalar, and keeps the string zero separate. However it emits a fresh low `mov #0; strb` for year instead of retail's `mov low, old-zero; strb`.
- Pass dumps show why that near miss will not become retail merely from full-function pressure. The independent year-zero is already represented as its own SImode user pseudo before the QI subreg store. Global allocation keeps it separate from the five-ref semantic zero; in the probe, semantic zero is reg23 (5 refs/live70) and year-zero is reg24 (2 refs/live4), with separate dispositions. There is no equivalence/copy bridge to the semantic zero. A same-width `unsigned int year_zero` would therefore restate the same RTL mechanism and is not a new experiment.
- Existing v91-v93 narrow/SI aliases are still closed: aliases/copies of the semantic zero either coalesce reference weight back into the bad allocation family or hit the known QI reload/rematerialization problem. Existing v95 fully merged literal-zero family is also closed.
- Existing later-state experiments v61/v66/v76/v77/v85 and explicit hard-r9 variants already cover attempts to manipulate `state_21cc+4` or late first-fill ownership. Do not repeat them.
- The exact semantic oracle remains v83 under the private distinct-zero diagnostic: source pseudo27 has six identifiable refs (definition, weather word 1, weather word 2, year byte, `state_21cc+4`, dead first-fill scalar), while separate string-zero pseudo78 owns the three string clears. Retail visibly uses that same semantic relationship but allocates the old zero to r9 and the shared -125 mask to r8.
- **Updated interpretation:** the new constructor-mode evidence makes v83's six-use semantic relationship more plausible as the original source model, not less. Source-shape probes that remove a weather/year reference consistently either create the wrong zero family or lose retail's high-to-low year bridge. The remaining question is therefore narrower: what genuine frontend/lifetime/accounting difference lets this six-use old zero receive retail's r9 allocation without re-opening broad compiler-version hunting?
- **Exact next action:** use the paired constructor evidence to compare the early zero/calendar lifetime of `func_08010358` against the loader and the saved v83/v96 pass histories, looking specifically for a natural temporary lifetime or frontend bookkeeping event shared by the two GameData constructors that changes allocation priority without changing semantic uses. Reuse the existing flow/lreg/combine evidence and failure ledgers first. Do not rerun compiler families, aliases/copies, Weather literals, memset/aggregate clears, chained assignments, split-member constructors, independent year-zero variants, typed/placement Location, hard registers, padding/volatile, or v95 literal merging. Only authorize v104 when a new mechanism preserves v83 ownership and retail's year bridge while explaining r9 naturally.

## Constructor/frontend checkpoint - nested GameData member model

- Production remains unchanged at `9078f36`. No retail source, assembly, linker input, or tracked compiler input changed. This pass added only private microprobes/research evidence.
- Historical MFoMT notes in `/mnt/data/Github/fomt-doc-call238/GameData.txt` explicitly describe the object constructed by MFoMT `0x08011730` as `GameData`, with a member object at `GameData+0x08` and its datetime at inner `+0x08`. The MFoMT address is only `+0xE0` from FoMT `func_08011650`, strengthening the interpretation of the FoMT loader as the sister GameData construction/load path.
- No MFoMT ROM/binary is present in the local GBA workspace. Public research found MFoMT script tooling but no maintained native MFoMT decomp suitable for a direct constructor comparison. Do not acquire or assume a sister ROM.
- The naturally aligned early member layout remains the only source-shape compatible with retail word stores: two 32-bit weather values at +0/+4, year byte +8, GameDate +9, and aligned GameTime +10. Marking the 12-byte object `PACKED` makes the old compiler emit byte stores for the Weather words and is closed.
- `weather-calendar-struct-probes.cc`: ordinary member initializer methods preserve aligned weather stores, but either collapse all semantic zeros together or create the same v96 competing-zero family that steals the first fill. Closed.
- `weather-calendar-copy-probes.cc`: `forecast = current_weather` and the reverse spelling do not remove a weather reference. CSE folds the copied field value back to the same source zero; the apparent five-use quantity is five for the wrong reason because the first-fill scalar is owned by a second zero family. Closed.
- `weather-narrow-bridge-probes.cc`: an 8-bit zero feeding one Weather store still becomes the zero family reused by the three string clears and first-fill const-reference slot. Closed.
- `weather-constructor-frontend-probes.cc`: real C++ member-initializer lists were tested. `current=SUNNY, forecast=SUNNY` and `forecast(current_weather)` compile identically. A constructor parameter used for weather/year gives the same split as earlier source forms: parameter zero owns both weather stores/year/later semantic store, while compiler zero owns strings/first fill. Closed.
- `weather-inline-parameter-probes.cc`: explicit inline Weather parameters, copy-through-field parameters, and a default Weather argument were tested. Old GCC inlines them to the same two zero families; none preserve first-fill ownership on the semantic zero while removing one early weather reference. Closed.
- `game-data-nested-ctor-probes.cc`: a real outer `GameData` constructor containing an inline default-constructed weather/calendar member at +0x08 is the first probe that mirrors the historical class structure. It restores the desired semantic ownership cleanly: one zero owns both weather words, year, the later full-width state zero, and first-fill stack scalar, while string zero is separate. However local allocation still reports the semantic zero as **six uses**, i.e. the same v83 family; nesting alone does not cross the r8/r9 priority boundary.
- A ROM-wide pattern census found an independent retail analogue in assembly-only `func_08027BFC`: `movs r0,#0; mov r8,r0; str r0,...; str r0,...; str r0,...`, later reusing r8. This proves the compiler naturally emits the visible low-zero/high-copy pattern, but the function has no recovered source and cannot identify the frontend form.
- Native symbol/string inspection exposes no original `Weather` or `Forecast` type name. Existing weather strings/debug names are gameplay text/current-project data symbols, not evidence for a wrapper class. Do not invent a Weather class solely to shape codegen.
- The v83 allocation target remains unchanged: semantic/source zero at six refs/live198 outranks the -125 mask; the desired source relation must either remove exactly one counted semantic-zero reference without creating a reusable competing const-zero family, or provide equally strong natural evidence for an allocator-lifetime change. So far every extra zero family steals the first fill during first CSE.
- **Exact next action:** stay in frontend/source-structure research, not compiler-family work. First test the remaining natural constructor expression relationship `current_weather = forecast = zero` / `forecast = current_weather = zero` as a tiny RTL microprobe, after confirming it is not already in the ledger. If chained assignment also retains two semantic-zero store references or creates the v96 family, close it immediately. Then inspect the FoMT new-game and save-load paths specifically as GameData constructor overloads/callers to recover any real member-construction source relationship before authorizing a full v104. Do not create v104 merely from constructor nesting because the five-reference gate has not been met.

## External save-format/weather research checkpoint - October 4, 2026

- Production source remains unchanged at `9078f36`; this continuation changed only documentation and private save-loader research artifacts. No v104/full-loader candidate was created.
- External research was deliberately cross-checked against retail binary behavior. Historical FoMT RAM documentation identifies WRAM `0x020025E0` as current weather, `0x020025E4` as tomorrow's forecast, and `0x020025E8..EB` as year/day/hour/minute. With the GameState base implied by the same map, these are GameState `+0x08`, `+0x0C`, and `+0x10..+0x13`.
- These names are now independently **binary-proven** in our ROM. `func_08010F54` performs `[state+0x08] = [state+0x0C]` at daily rollover, generates a new 0..4 weather value into `+0x0C`, then passes `[state+0x08]` as the `int weather` argument to `Farm::DayUpdate(int weather, GameDate const &)`.
- The old local `/mnt/data/Github/fomt-doc-call238/GameData.txt` independently describes a GameData subobject beginning at +0x08 with its game datetime at inner +0x08. Combined with current binary proof, the early 12-byte region is best modeled semantically as current weather (inner +0), tomorrow forecast (+4), then the four-byte packed calendar (+8).
- New-game sister `func_08010358` strongly confirms that grouping: it separately constructs a four-byte Year 1 / Spring 2 / 6:00 calendar temp, then writes zero to GameState+0x08, zero to +0x0C, and copies the calendar word to +0x10.
- Since `WriteSaveSlotRecord` writes the entire 0x34F4-byte GameState payload byte-for-byte, these runtime fields are also direct save fields. Relative to a slot record (after its four-byte size word): current weather starts at +0x000C, forecast +0x0010, packed calendar +0x0014.
- Public research repo HM-Studio was cloned to `/mnt/data/Github/hm-studio-research` (HEAD `9f6039a`), but its save-editor implementation is effectively empty and supplies no layout evidence.
- Public FOMT Studio was cloned to `/mnt/data/Github/fomt-studio-research` (HEAD `21fa005`). Its `Banco_de_Datos/Gestor_Saves.py` assumes SRAM offset = WRAM address - 0x02000000, which conflicts with our binary-proven retail record format (0x28 SRAM header, 0x3FEC slot stride, size word, 0x34F4 payload, checksum). Treat that save module as unreliable for this decomp.
- Research-backed Weather frontend microprobes were run before any full loader candidate:
  - `weather-zero-bridge-probe.cc`: `unsigned zero=0; Weather weather=(Weather)zero` makes the long-lived zero address-taken/stack-resident. Informative but wrong family.
  - `weather-source-bridge-probe.cc`: `Weather=SUNNY; unsigned zero=weather` with explicit `fill_n(...,zero)` also spills the long-lived zero because the const-reference argument requires an address.
  - `weather-source-literal-fill-probe.cc`: correcting the fill to literal `0` causes Weather and old zero to collapse into one quantity; no useful split.
  - `weather-fields-literal-probe.cc`: direct typed `WEATHER_SUNNY` writes create a separate weather-zero family, but first CSE then uses that family for the dead first-fill const-reference scalar, reproducing the known v96 ownership defect.
- Therefore simple enum spelling is **closed**. The new semantics are valuable, but the winning source relation must be structural rather than merely changing raw u32 stores to `Weather` assignments.
- The v83 quantitative target remains authoritative: old/source zero pseudo27 = 6 refs / live198 (~606 priority), shared -125 mask = 3 refs / live58 (~517). A five-ref old-zero quantity at similar lifetime would fall to ~505 and should naturally yield mask r8 / zero r9.
- **Exact next action:** reconstruct/microprobe a small weather/calendar subobject initializer or inline constructor matching the binary-proven layout `{current_weather, forecast, packed_calendar}`. Do not retry simple Weather locals/literals, v96 scalar-literal zero, arrays/aggregates, signed zero, wide-zero, fixed registers, padding/volatile, or compiler-family hunting. Gate any v104 test on a microprobe that produces the retail-like low-zero two weather stores while keeping year/later semantic zero/first-fill ownership on the old source-zero family and lowering its allocation priority below the -125 mask.

## Source/frontend continuation checkpoint - v103 and five-ref allocation target

- Production remains unchanged at `9078f36`; no retail source, assembly, linker, or tracked compatibility compiler input changed. New work is confined to private save-loader research artifacts.
- The four configuration values forwarded by `func_080D6C58` / hidden constructor `08010268` into sister initializer `func_08010358` are now semantically bounded from named constructor use: config `+4` is the Farm name string, `+0x14` is the Farmer/player name string, byte `+0x24` is the packed birthday `GameDate`, and `+0x28` is the Dog name string.
- Sister `func_08010358`'s `sp+8..+0xB` temporary is a 4-byte packed start calendar: year byte = 1, `GameDate` = Spring day index 1 (Spring 2), and `GameTime` = 6:00. The strange r4/r6 inputs are preserved unused bitfield bits from read-modify-write lowering, not hidden arguments.
- Immediately after completing that packed `GameTime` RMW, r6 becomes free and retail materializes `movs r6,#0`; that zero survives the Farm/Farmer/Dog/helper calls and later clears the three string bytes. This supports the second/string zero being a compiler-hoisted constant born after a real temporary-object phase, not necessarily an explicit source `string_zero` local.
- Re-centering the loader evidence: mature v75 already creates retail's r5 zero at the Location boundary and uses it for the three string clears. The unsolved defect is that v75 also uses r5 for `state_21cc+4` and the dead first-fill scalar, while retail uses the older r9 zero for those two sites.
- Historical v83 under the private distinct-zero oracle remains the clean semantic ownership model: pseudo27 owns both initial word clears, header byte, `state_21cc+4`, and the dead first-fill scalar; pseudo78 owns the three string clears. Its only critical local defect is allocation: pseudo27 -> r8 and shared `-125` mask pseudo43 -> r9.
- The exact local-allocation formula is now pinned from this compiler's `local-alloc.c`: priority is proportional to `floor_log2(refs) * refs / live_length`. For v83 pseudo27, 6 refs / 198 gives about **606**; mask43, 3 refs / 58 gives about **517**. If pseudo27 had **5 refs at roughly the same lifetime**, its priority would be about **505**, naturally placing mask43 first in r8 and old zero next in r9. No user-variable bonus is involved.
- The six pseudo27 references are identifiable: its defining set, two initial 32-bit word stores, the header byte, `state_21cc+4`, and the dead first-fill scalar. Therefore the source/frontend target is precise: make exactly one of the two initial word clears cease to count as a pseudo27 reference while preserving the later semantic ownership and avoiding a competing zero equivalence class.
- Early-header frontend microprobes were tested before a full loader candidate. Plain two-word struct zero and direct u64 zero materialize two distinct low zero registers. A local `u32[2] = {0,0}` reuses one low zero for both stores, but the bridge probe under the distinct-zero oracle creates a separate compiler-zero pseudo and first CSE uses that compiler zero for the later `fill_n` const-reference slot. This reproduces the v96 defect, so the array/aggregate route is closed.
- **v103** changes only v83's old-zero declaration from `unsigned int zero = 0` to `int zero = 0`. Result under the same private distinct-zero environment is **0x2E0 / 409**. Early allocation remains old zero r8 / mask r9, and the dead first-fill scalar becomes a fresh literal-zero stack store rather than the old zero. Signedness is closed.
- A derived 64-bit form (`unsigned long long wide_zero = zero`) was tested only as a microprobe for five-ref accounting. The tracked production compiler itself ICEs on this source, so it cannot be a viable original source form and is closed.
- **Exact next action:** do not add compiler rules and do not create another loader candidate blindly. First map the semantic/use evidence for the two leading GameState words at `+0x08/+0x0C` to determine what real source object or relationship could make one clear non-pseudo27-derived. Then use a microprobe to require all three gates before a v104/full-loader test: (1) one low zero produces both retail-like word stores, (2) old source zero remains the owner of header byte, later semantic store, and first-fill scalar, and (3) local allocation reports pseudo27 at five refs or an equivalent priority below mask43 without creating another zero family. Do not retry scalar literal v96, early arrays/aggregates, signed zero, wide zero, explicit string-zero locals, aliases/copies, fixed registers, padding/volatile, or compiler-family hunting.

## Source/frontend continuation checkpoint - v101/v102 closed; sister constructor context identified

- Production remains unchanged at `9078f36`; no retail source, assembly, linker, or tracked compiler input changed in this continuation. All new files are private save-loader research artifacts.
- Reproduced the v96 private-oracle environment exactly before testing anything new: the 13 tracked compatibility behaviors plus private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` still give **0x2E8 / 597** for `candidate-v96.cc`. This confirms the comparison environment has not drifted.
- Retail loader assembly itself already shows the desired visible early-zero sequence: `movs r0,#0; mov sb,r0; str r0,[state+8]; str r0,[header+4]; mov low,sb; strb ...`. The v96 private oracle emits the same visible prologue, so reproducing that assembly sequence alone does not identify the missing frontend relationship.
- **v101** tested one narrowly justified source relationship: declare `zero` without an initializer and initialize it inside the first header-word store, `header_word = (zero = 0)`. This was intended to model one zero expression feeding both the short compiler value and long-lived source variable. Result: private oracle **0x2E8 / 597**, production tracked compiler **0x2E4 / 495**. Both are byte-family identical to v96. Assignment-chain spelling is therefore **CLOSED**.
- **v102** retested only the recovered typed `Location` boundary on top of the current v96 frontier, because retail creates the later r5 zero exactly inside the `0x1CCC` Location block. It uses `Location *`, `map = MAP_NONE`, `x = 0`, `y = 0`, then literal-zero string clears. Production tracked compiler result: exact size **0x2E4 / 496**. This does not naturally preserve the retail zero split and is **CLOSED**. Do not reopen v47/v64/v65 typed/placement Location forms from this result.
- Sister initializer `func_08010358` remains the stronger source oracle. It creates old zero r5 early, then creates a second zero r6 while constructing a packed local header/date-time object at `sp+8`; that r6 survives across Farm/Farmer/Dog/helper calls and later clears the three string bytes. Old r5 still owns `state_21cc+4` and the dead first-fill stack scalar, while the fill loop itself creates immediate zero.
- The sister call context is now bounded. `func_080D6C58` allocates the 0x34F4 GameState and calls `func_08010358`, forwarding configuration fields from its input object: +4, +0x14, byte +0x24, and +0x28. The containing heap object installs vtable `vtable_unk_080E5BF8`; its two virtual methods resolve to `func_0801004C` and deleting/destruction path `func_08010158` in `asm/game_scene.s`. This is a game-scene/new-game construction path, not an isolated string-clear helper.
- **Exact next action:** do not create v103 yet. Recover the semantic roles/types of the four configuration inputs passed by `func_080D6C58` into `func_08010358`, especially the values that form the packed `sp+8` header/date-time local immediately around the sister's second-zero birth. Determine what real source object/member/local could naturally create that independent zero. Only then test one source-shape candidate. Do not retry explicit early `string_zero`, assignment chains, typed/placement Location, compiler-family hunting, new CSE/allocator exceptions, fake USEs, fixed registers, or UID/address rules.

## Research checkpoint - hidden post-flow/copy bridge closed

- Production remains unchanged at `9078f36`. This continuation was research-only apart from one private causal compile; no production source, asm, linker, or tracked compatibility compiler input changed.
- Nintendo's archived `src_patch021206.zip` was inspected directly. Its `combine.c`, `flow.c`, `local-alloc.c`, and `regmove.c` are byte-for-byte identical to the preserved May-2000 ARM/Cygnus sources already studied. There is no hidden Nintendo patch in those passes that can explain the loader zero bridge.
- The October-2003 Nintendo THUMB compiler was not rerun. The Call238 ledger already proves that exact vendor binary and the coherent May-2000 compiler are codegen-equivalent on the hard compiler candidates; broad compiler-version hunting remains closed.
- Camelot GCC 2.96 regmove was inspected as additional historical context. Its REG_EQUAL-aware paths handle remote constants and `src = const; src += n`, while its replacement machinery follows explicit copy relationships. It has no generic same-constant pseudo substitution that could rewrite zero33 to zero27.
- GCC 2.8.1 predates the later regmove pass. Its extra `get_last_value` equivalence behavior is confined to field-assignment recognition and does not provide an ordinary memory-store source bridge.
- Plain v96 RTL confirms the two zero pseudos are independently defined: source user zero27 is `const_int 0`; compiler zero33 is separately `const_int 0` with REG_EQUAL 0. They are not connected by an explicit copy before flow.
- The proposed early-copy mechanism `zero33 <- zero27` is now closed for the known compiler family. Existing v96 CSE trace at uid39 under `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` shows only literal zero: `src=0`, `src_const=0`, no `src_eqv`, no `src_related`, and no hash-table equivalent. There is no stock tie-breaker that could choose zero27 there.
- The reason is explicit in the private diagnostic: `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` marks the source-level single-set SImode user zero's source volatile to CSE, deliberately keeping it out of ordinary equivalence lookup. This is how the diagnostic preserves the old-zero/string-zero identity split.
- One narrow causal control was run with the same v96 source and the same 13 compatibility rules but with only `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` omitted. The first attempt ICE'd solely because the trace-only ZERO_TRIAL hook dereferenced a null `src` after stock CSE had already canonicalized it; no compiler behavior conclusion was taken from that failed trace.
- The safe rerun with only ZERO_SET_DETAIL completed: **expected 0x2E4, actual 0x2E4, 495 differing linked bytes**, evidence `proof-v96-stockzero-detail/`, execution `sh_mutw8taa_72633c1c`.
- That control proves stock CSE does not preserve a useful compiler-zero/user-zero copy bridge. Instead it collapses the zero families globally. Final assembly has one zero family in r8: both initial word stores use it, `header[8]` uses r8, `state_21cc+4` uses r8, all three string clears reuse r8, and the first-fill `[sp+4]` scalar also uses r8. The shared -125 mask therefore takes r9. This is the already-known wrong allocation family.
- Therefore the successful **2 refs / live198** flow-live state remains a causal oracle, not a recovered historical mechanism. Preserved compiler history does not support either a hidden Nintendo post-flow pass or an older early-CSE copy behavior that naturally creates it.
- Strongest next direction is original source/frontend shape, not another compiler-family permutation. Specifically, research source forms that could naturally make retail's old full-width zero and later byte/string zero distinct while still letting the first-fill scalar consume the old zero without increasing its pre-allocation priority. Use sister initializers and recovered type/API boundaries as evidence first. Do not add another allocator/CSE exception, fake USE, forced register, or UID/address rule.

## Research checkpoint - 2-ref/live198 pipeline explained, original transform still unproven

- Research-only turn requested by the user. No new source candidate, compiler behavior experiment, rebuild, or production mutation was performed in this research pass.
- The successful private flow-lifetime probe is now understood much more precisely. In `proof-v96-flow-live-da`, flow reports compiler-zero pseudo33 as **3 refs / live99 / 7 calls**. Before allocation, `.lreg` reports **2 refs / live198 / 7 calls**.
- The 3 -> 2 reference transition is a real historical compiler mechanism, not an artifact of the diagnostic. Immediately before register class/local allocation, this Cygnus compiler calls `recompute_reg_usage()`. That routine explicitly clears and rebuilds only `REG_N_SETS` and `REG_N_REFS` from physical instruction patterns/call usage and explicitly does **not** recompute `REG_LIVE_LENGTH`. Thus a liveness effect that is no longer a physical RTL use can survive while its reference count disappears.
- Historical provenance is strong: `recompute_reg_usage` was added to the Cygnus/GCC line in June 1998 and exists in EGCS 1.1.2, GCC 2.95.3, the May-2000 ARM/Cygnus source, and the recovered FoMT compiler family.
- `local-alloc.c::update_equiv_regs` then explains **99 -> 198** exactly. When a register has a `REG_EQUIV`, it executes `REG_LIVE_LENGTH(regno) *= 2`. This behavior is present in GCC 2.81, EGCS 1.1.2, GCC 2.95.3, May-2000 ARM/Cygnus, and the recovered compiler. Call238's water work already independently proved this doubling mechanism in real FoMT compiler analysis.
- The user-supplied GCC 3.x `PROP_EQUAL_NOTES` lead was checked. Upstream GCC added `PROP_EQUAL_NOTES` in January 2002 and could mark registers inside `REG_EQUAL/REG_EQUIV` expressions as uses. However normal final allocation propagation omits that flag, and the preserved Nintendo/Cygnus `flow.c` sources do not contain `PROP_EQUAL_NOTES` at all. It is useful historical precedent for metadata-driven liveness, but **not evidence of FoMT's mechanism**.
- Cygnus live-range splitting was also checked and is closed for this target. The built private compiler uses `arm/telf.h`, which explicitly sets `PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG`. At `-O2`, `flag_live_range` is enabled by default only for DBX targets, so it is off here. The empty `.range` dump is only a dump artifact.
- A stronger pipeline hypothesis was identified: flow could first see the late first-fill store as `[sp+4] <- compiler-zero33`, creating the 3-ref/live99 state and death point; a later post-flow transformation could then rewrite that physical store source to old-zero27; `recompute_reg_usage` would naturally recount only two physical reg33 refs while preserving live99; `REG_EQUIV` would then double it to live198. This sequence exactly reproduces the useful accounting shape without adding a fake RTL USE.
- The actual post-flow pass order is flow -> combine -> regmove -> optional scheduler/LRS -> usage recount -> regclass/local allocation. There is no post-flow CSE before allocation.
- Ordinary current/May-2000 combine is **plausible in accounting terms but not yet the proven transform**. Its own source explicitly states that combine does not update `reg_live_length` and can leave `reg_n_refs` stale when a register disappears, which fits the required bookkeeping followed by `recompute_reg_usage`. However plain v96's uid341 remains `[sp+4] <- reg33` through flow, combine, regmove and local allocation; current combine does not perform the desired rewrite. Its note-distribution code also normally relocates/deletes a `REG_DEAD` when the corresponding use disappears.
- Historical combine research found one notable precedent: GCC 2.81's `rtx_equal_for_field_assignment_p` recursively compared `get_last_value` of distinct registers; EGCS 1.1.2 and later removed that behavior because it could import a register that was already dead. This proves older combine code did sometimes treat equal-valued register identities more aggressively, but that exact helper is field-assignment specific and does **not** directly explain uid341's simple memory store.
- Regmove has only narrow REG_EQUAL handling and no evidence yet of substituting unrelated same-zero pseudos. Scheduler does not provide a credible value-identity rewrite. These are currently weak candidates.
- Reload-only explanations were checked against the existing loader ledger before any new work. Earlier v90/v85 reload tracing already localized separate zero/rematerialization behavior, and the v96 frontier was explicitly moved back to first-CSE/lifetime identity. Do not repeat broad reload experiments without a new structural reason.
- Most important caution: the **2 refs / live198** state is now proven to be a sufficient compiler state that yields the clean 0x2E8/596 improvement. It is **not yet proven to be the original Nintendo compiler's internal state**. A different historical mechanism, including late reload equivalence, could theoretically produce the same final store with different pre-allocation bookkeeping.
- Strongest next research direction, before any experiment: compare the older GCC 2.81/early-Cygnus combine and regmove history for transformations of ordinary SET sources, not field assignments, especially changes involving `get_last_value`, equivalent constants, and death-note redistribution. Also search preserved Nintendo patch archives for any combine/reload local patches absent from the May-2000 source. Only if a historically supported structural mechanism emerges should a new private diagnostic be written.

## Checkpoint - no-extra-instruction zero lifetime gives new best 0x2E8 / 596

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compatibility compiler input changed.
- The previous diagnostic RTL `USE` was fully explained. Its extra instruction lengthens pseudo115 from 32 to 33 live instructions, which flips global allocation priority from `...115, 138...` to `...138, 115...`. Because 115 and 138 conflict, their hard registers swap: plain has 115 -> r2 and 138 -> r3, while the fake-USE build has 115 -> r3 and 138 -> r2.
- That single allocator-order swap explains the two retail-wrong optimizations in the `0x2E0 / 408` fake-USE build. Reload keeps the earlier 0x1C70 temporary in callee-saved r4 and synthesizes 0x1CCC as `r4 += 92`, deleting retail's 0x1CCC literal. Reload also keeps the first low copy of r8 live through the later byte store and deletes retail's second high-to-low copy. The fake USE is therefore closed as a solution and remains diagnostic-only.
- A new private diagnostic was added only in `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1`: `AGBCC_KEEP_REWRITTEN_ZERO_FLOW_LIVE=1`. CSE still discovers the rewritten first-fill store and its non-uservar compiler-zero peer structurally, but instead of inserting RTL it passes those two RTL pointers to flow. Flow marks compiler-zero live at the existing store without adding another instruction. No UID/address check is used.
- This no-extra-instruction diagnostic produces the new best result: **expected 0x2E4, actual 0x2E8, 596 differing linked bytes**. Evidence: `proof-v96-flow-live/` and `proof-v96-flow-live-da/`. Executions: `sh_mutpe9g2_0ce9cb94` and `sh_mutpf7cz_39b0514d`. Diagnostic compiler rebuild: `sh_mutpdx78_6b5907fb`.
- Final assembly comparison against plain v96 is exceptionally clean: the flow-live build changes exactly one instruction island. Plain v96 has `str r5, [sp,#4]`; flow-live has `mov r0,r9; str r0,[sp,#4]`. This is the desired retail semantic family. The early header remains the retail-correct direct `str r0,[r2,#4]`; the 0x1CCC literal remains in the literal pool; and the later r8 byte-pointer sequence still rematerializes r8 for the store instead of over-reusing the first low copy.
- The verified allocator profile is now:
  - old-zero pseudo27: **5 refs / live200 / 7 calls**
  - compiler-zero pseudo33: **2 refs / live198 / 7 calls**
  - shared -125 mask pseudo44 remains in the established r8 family
  - pseudo115: **4 refs / live32**
  - allocation order is restored to plain v96: `... 115 138 ...`
  - hard-register dispositions are restored to plain v96: 115 -> r2, 138 -> r3
- This proves the missing behavior is not “emit another use.” The useful state is more specific: compiler-zero33 needs its long live range preserved to the first-fill store **without adding an RTL instruction and without adding a normal reference count**, while the physical store source remains old-zero27 and carries constant-zero value knowledge.
- Exact next action: do not normalize the private flow hook. Trace how a real compiler could create the proven **2-ref / live198** compiler-zero state. Inspect `cse_process_notes` plus `local-alloc.c:update_equiv_regs` and the REG_EQUAL/REG_EQUIV path to determine whether an older/different compiler preserved an equivalence-driven live range without a counted pattern use. If current code cannot express that path, search historical GCC deltas around equivalence-note and flow lifetime handling before writing another diagnostic. Do not add source aliases, fake USEs, forced registers, UID/address rules, or production compiler changes.

## Checkpoint - compiler-zero lifetime causally proven with diagnostic USE

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compiler input changed.
- The narrow `REG_EQUAL 0` store note was confirmed to affect only the structurally rewritten first-fill store, yet its final binary is byte-identical to the earlier broad memory-zero bookkeeping probe: **0x2E8 / 598**. The unrelated broad matches were not the source of the extra mismatch.
- Final assembly comparison against plain v96 isolates exactly two changed islands. The narrow note fixes the desired later first-fill scalar from `str r5,[sp,#4]` to a move from old-zero r9 followed by `str [sp,#4]`, but it also regresses the early second header word from retail's direct `str r0,[r2,#4]` to `mov r1,r9; str r1,[r2,#4]`.
- Retail assembly proves the required split: the two initial 32-bit header stores use compiler zero r0; the following header byte uses old-zero sb/r9. Much later both `state_21cc+4` and the first-fill stack scalar use sb/r9, while the byte-fill loop starts from a fresh immediate zero.
- Pass dumps localize the early regression to lifetime/allocation, not CSE value choice. Plain and narrow builds are identical at header insns 39/40/44 through CSE2. In plain v96 compiler-zero pseudo33 is **3 uses / 99 insns / 7 calls**; in the narrow-note build it is **2 uses / 2 insns**. Old-zero pseudo27 moves from **4 uses / 178 insns / 7 calls** to **5 uses / 200 insns / 7 calls**.
- The missing third pseudo33 use in the narrow build is exactly the first-fill store. Plain CSE2 has uid341 storing pseudo33; narrow uid341 physically stores user zero27 with `REG_EQUAL 0`. This explains why pseudo33 dies near the header and global allocation no longer reuses r0 for the second header word.
- A private `REG_EQUAL pseudo33` experiment is closed. The rewrite correctly found non-uservar SImode compiler-zero reg33 structurally, but the next CSE pass canonicalizes the note to `REG_EQUAL 0` via `cse_process_notes`, so flow still sees pseudo33 as only 2 uses / 2 insns. Result remains **0x2E8 / 598**. Evidence: `proof-v96-eqv-reg-note/` and `proof-v96-eqv-reg-note-da/`.
- Flow inspection proves arbitrary REG_NOTES do not contribute ordinary register liveness; liveness is computed from instruction patterns and call usage. Therefore there is no obvious existing note kind that can preserve pseudo33 lifetime without changing semantics.
- One deliberately diagnostic-only RTL USE test was added under `AGBCC_KEEP_REWRITTEN_ZERO_EQV_USE=1`: at the exact structural rewrite it inserts a zero-cost `USE` of the existing compiler-zero pseudo and keeps `REG_EQUAL 0` on the physical user-zero store. This is a proof tool only, not a candidate compatibility rule.
- That diagnostic produces **0x2E0 / 408**, the lowest differing-byte count seen so far but the wrong function size/family. Crucially, it proves the lifetime hypothesis: early header assembly returns to retail-correct `str r0,[r2,#4]`, old zero remains r9, mask remains r8, and the later first-fill scalar is sourced from r9 while CSE2 still folds the subsequent stack reload to literal zero.
- Saved evidence: `proof-v96-narrow-note/`, `proof-v96-narrow-note-da/`, `proof-v96-eqv-reg-note/`, `proof-v96-eqv-reg-note-da/`, and `proof-v96-use-diagnostic/`. Relevant executions: `sh_mutofaq5_aa6ba8d5`, `sh_mutoh9cw_1a9f7b56`, `sh_mutonc6d_de7f4112`, `sh_mutoo1fi_3c6770ee`, `sh_mutotkmm_fb6d46e7`.
- Exact next action: run the diagnostic USE variant once with `-da`, compare its flow/lreg/greg/reload data against plain v96 and narrow-note v96, and identify exactly which lifetime/allocation change removes four bytes and yields 0x2E0. The goal is to learn the missing compiler behavior, not to retain the fake USE. Do not create a new source candidate, force registers, key on UIDs/addresses, or touch production.

## Checkpoint - hybrid store/register zero semantics proven

- Production remains unchanged at `9078f36`; no production source, asm, linker, or tracked compiler input changed.
- The CSE2 load difference is now proven directly. Plain v96 at uid979 has `src_const = CONST_INT 0`, hash-entry cost 0, and trials literal `0`. Store-only v96 has no `src_const`, hash-entry cost 1, and trials source user zero27. This is why the store-only probe adds a second zero27 use and falls into the bad `0x2E0 / 411` allocation family.
- A temporary trace ICE was diagnosed with gdb, not guessed: by the trial loop local `src` can legitimately be nulled after matching the hash class. The safe trace now uses preserved `sets[i].src`. No production behavior was involved.
- Added private diagnostic `AGBCC_RECORD_DEFINED_ZERO_STORE_CONST=1`. After normal source processing it may place an SImode memory destination into the constant-zero equivalence class when its physical source is a single-set user variable whose defining SET/REG_EQUAL proves zero. It does **not** merge the source register itself into the zero class or rewrite the physical store.
- Combined with the existing store-only rewrite, this proves the desired hybrid mechanism: the physical first-fill store stays `zero27`, while CSE2 uid979 again sees `src_const = 0` and trials literal `0`.
- Result is **0x2E8 / 598**, not exact. This escapes the bad 0x2E0/411 family but is one mismatch count worse than plain v96's 0x2E8/597. The broad diagnostic also retags unrelated structurally matching stores (trace hits include uid44, uid303, uid341, uid732, uid829; source registers include 27 and 222), so the broad rule is rejected as a final compatibility rule.
- Saved evidence: `proof-v96-cse2mem-plain4/`, `proof-v96-cse2mem-store2/`, and `proof-v96-storeconst/`. Relevant executions include `sh_mutny67o_0ea24131`, `sh_mutnye0x_32b53f2c`, and `sh_muto1czs_311c8947`.
- Strongest next experiment: remove/disable the broad `AGBCC_RECORD_DEFINED_ZERO_STORE_CONST` behavior and instead attach constant-zero equivalence metadata only at the exact structural event where `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF` rewrites the immediately-following first-fill store from the fresh zero temp to the proven recent user zero. A narrowly attached `REG_EQUAL 0` (or equivalent CSE metadata) should survive into CSE2, preserve the physical register store, and make only that later reload fold to literal zero. First verify the store note survives the addressof/flow path and affects only the rewritten store. Do not key on UID, address, pseudo number, hard register, or function identity.
- Before changing that mechanism, compare `proof-v96-storeconst` against plain v96 at the first-fill assembly and, if needed, one `-da` run to confirm r9/r8 allocation stayed in the v96 family. Do not create a new source candidate yet.

## Checkpoint - v96 store-only zero rewrite / CSE2 frontier

- Production remains unchanged at `9078f36`. No production source, asm, linker, or tracked compiler input changed.
- The private recent-zero scan now runs to the existing call/jump/label boundary instead of the old arbitrary 12-real-insn cap. The target prior store is reached at scan step 14 after first-CSE deletions.
- That prior store is exactly source pseudo27, SImode, user variable, single-set, quantity-valid, but has no `qty_const` under the distinct-zero diagnostic. Added private helper `single_set_uservar_defined_zero_p` to prove zero from the register's defining SET or `REG_EQUAL 0` note.
- Reusing zero27 at the fresh temp SET gives **0x2E0 / 411** and zero27 **6 refs / live 210 / 7 calls**, flipping old zero to r8 and mask44 to r9.
- Rewriting only the immediately following SImode stack store also gives **0x2E0 / 411**. First CSE has only the desired extra `[sp+4] <- zero27` occurrence, but CSE2 later folds the stack reload to zero27 instead of literal zero, adding the second use and causing the same allocation flip.
- Plain v96 CSE2 folds that same stack reload to literal `0`. Retail therefore needs the hybrid behavior: physical first-fill scalar store from old-zero r9, later reload/fill value still folded to constant zero.
- Saved evidence: `proof-v96-bbscan/`, `proof-v96-definedzero-da/`, and `proof-v96-storeonly-da/`.
- Exact next action: add trace-only CSE2 logging for a non-uservar SImode destination loading from MEM when `src_const == 0`, print its full trial/equivalence class, and compare plain v96 vs store-only. Determine why store-only chooses zero27 while plain v96 chooses literal zero. Only then test a private structural constant-preference rule. No source candidate, register forcing, UID targeting, or production mutation.

## Checkpoint - v96 first-CSE source split isolated

- Production remains unchanged at `9078f36`; no production source, asm, linker, or tracked compiler input changed.
- Archived v83 pass evidence is now the authoritative comparator for the old behavior. Historical v83 is `0x2E8 / 598`; the current private diagnostic tree has drifted and now compiles v83 as `0x2E0 / 409`, so that current v83 result is diagnostic-tree drift, not a new source frontier.
- The decisive source difference is one line. Historical v83 uses source `zero` for both initial 32-bit header clears, so no separate compiler SImode zero pseudo exists there. v96 changes only the first header clear to literal `0`, creating compiler temp pseudo33 very early.
- Historical v83 expansion creates a fresh first-fill zero temp (pseudo133) and first CSE deletes it, rewriting the dead `[sp+4]` store directly to source old-zero pseudo27.
- Current v96 expansion creates the analogous fresh first-fill zero temp (pseudo134). First CSE merges it into the earlier compiler-zero quantity created by pseudo33; `canon_reg` then rewrites the `[sp+4]` store to pseudo33. Direct trace: fresh pseudo134 joins the zero quantity whose canonical first register is 33.
- Existing private diagnostic `AGBCC_REUSE_RECENT_FULLWIDTH_ZERO_CONSTREF=1` still leaves v96 byte-identical at `0x2E8 / 597`. Entry tracing proves the rule does enter for the first-fill zero, but its bounded backward scan does not reach a qualifying prior SImode source-zero store on the pre-CSE stream.
- Private trace-only hooks added in `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1/g++/cse.c`: `AGBCC_TRACE_ZERO_SET_DETAIL`, `AGBCC_TRACE_ZERO_CANON_STORE`, and `AGBCC_TRACE_RECENT_FULLWIDTH_ZERO_CONSTREF`. Private compiler rebuilds passed.
- Saved evidence: `proof-v96-da-current/`, `proof-v96-cse-detail/`, `proof-v96-canon-store/`, and `proof-v96-recentzero-enter/`.
- Exact next action: instrument the recent-zero backward scan step by step to measure the exact pre-CSE distance or barrier to the prior `state_21cc+4 = zero27` store. Then test only a structural recognition/search change justified by that trace. Do not widen the scan or alter `qty_const` semantics blindly, force registers, or touch production.

## Save-loader checkpoint - v96 source midpoint / first-fill CSE frontier

- Production is unchanged at `9078f36`.
- v96/v97: **0x2E8 / 597**, byte-identical. One initial word store is literal zero, the other uses source zero.
- Solved naturally in v96: old source zero pseudo27 r9 (4 refs/live178/7 calls), shared -125 mask pseudo44 r8 (3 refs/live58/2 calls), header byte bridge from r9, and `state_21cc+4` from r9.
- Remaining zero mismatch: first-fill dead const-reference scalar `[sp+4]` uses r5/temp33 instead of old r9; loop itself correctly uses immediate zero and three string clears remain separate r5.
- Both v83/v96 expand a fresh zero temp at this scalar. CSE is the divergence: v83 -> pseudo27; v96 -> temp33. v96 trace class is `C0,R33`; v83 has no ordinary zero hash class at the point.
- v98 direct source-zero fill: 0x2DC/566, rejected spill/lifetime regression. v99/v100 const copy: identical 0x2E0/411, dead scalar correct but pseudo27 becomes 6 refs/live208 and takes r8, mask falls r9. Closed.
- Source-narrow-only on v96: 0x2E4/495 but wrong old/string merge r8 and mask r9. Both flags reproduce v96.
- Private trace hooks: `AGBCC_TRACE_EQUIV_MODE`, `AGBCC_TRACE_ZERO_EQV_HEAD`, `AGBCC_TRACE_ZERO_TRIAL_CLASS`. Private recent-fullwidth diagnostic is byte-identical/no-effect.
- Next: trace the first-CSE fresh fill-zero trial state in v83 vs v96 and identify the exact non-hash path selecting pseudo27 in v83. No production mutation.

## Save-loader checkpoint - v90 zero-family bridge frontier

- Production remains `9078f36`; all new work is private diagnosis.
- v83 semantic oracle: old source zero owns `state_21cc+4` and dead first-fill scalar; separate string zero owns three byte clears. Allocation is wrong: old zero r8, shared `-125` mask r9.
- v90 source probe makes the first two word stores literal zero and naturally produces an early compiler zero in r9 plus mask r8, but that r9 zero is compiler temp pseudo33, not source pseudo27.
- v90 pseudo33 = 4 refs/live198/7 calls, allocated r9; source pseudo27 = 3 refs/live178/7 calls, unallocated. Pseudo33 owns two initial word stores and dead `[sp+4]`; pseudo27 owns header byte plus `state_21cc+4`.
- Pseudo27's QI header use survives through local allocation. Reload replaces it with a fresh low literal zero because pseudo27 is unallocated and constant-equivalent. Later `state_21cc+4` uses r5, so v90 is causal only.
- Closed this turn: v89 named mask 0x2E0/409; v91/v93 SI aliases 0x2E0/409; v92 QI alias 0x2E8/598; v94 redundant multi-set zero 0x2E8/598; v95 full literal-site merge 0x2E8/598. All alias/merge forms perturb allocation back toward old-zero r8 / mask r9.
- Both zero diagnostics on v90 are byte-identical to v90, ruling out CSE for the late bridge.
- Exact next action: instrument reload/find-equivalent logic at v90 header-byte and `state_21cc+4` uses to see whether live pseudo33/r9 is discoverable as the same zero before constant rematerialization. If yes, test only a private structural preference for the live allocated equivalent. No target identity checks or production changes.

## Loader reload/allocation checkpoint - v88 and v83 pivot

- Production remains `9078f36`; production compiler/source untouched.
- Private reload tracing proves v85's Dog r4 is a reload spill-pool side effect. Same source diagnostic OFF selects r3 for `0x1C70`; blunt distinct-zero diagnostic changes the function-wide spill pool from r3 to r2 and reload then selects r4 by round-robin order.
- First spill-pool divergence is uid967. Pseudo267 remains globally r9 in both; reload builds `sp+12` via r3 normally versus r2 diagnostically.
- Cause: blunt zero preservation inserts fresh first-fill zero pseudo131, extending pseudo112 live length 32 -> 33. Since pseudo112 conflicts with pseudo135, allocator order flips from 112-before-135 to 135-before-112, swapping r2/r3 and ultimately changing reload's spill pool.
- Added private diagnostic `AGBCC_PRESERVE_SOURCE_NARROW_ZERO=1`, modeled after narrow-QI compatibility behavior while retaining SImode equivalence. v88 = **0x2E4 / 309**. Exact size is restored by an extra `0x21D4` literal, not by recovering `0x1CCC`; QI stores still fold to literal zero and dead `[sp+4]` uses r5. Diagnostic only.
- **Natural semantic pivot:** v83 already proves the complete retail zero relationship: old zero pseudo27 -> `state_21cc+4` and dead `[sp+4]`; separate string-zero pseudo78 -> all three byte clears. v83 allocates old zero r8 and the `-125` date-mask temporary r9; retail needs those two roles reversed.
- Exact next action: stay on v83, identify the `-125` date-mask pseudo and its allocation priority/preferences/conflicts versus pseudo27, then seek a natural source-order/type spelling that yields old zero r9 and date-mask r8. No fixed-register forcing, padding, volatile, broad allocator rule, or further v85-specific compiler exceptions.

## Loader first-CSE diagnostic checkpoint - v81-v86

- Production remains unchanged at `9078f36`; retail SHA1/progress and the tracked 13-rule compiler are unchanged.
- Normal `candidate-v75.cc` remains the production-toolchain best at **0x2E4 / 220** with the closed post-pool tail exact.
- Retail's zero relationship is now pass-level proven: old full-width zero in r9 owns header initialization, `state_21cc+4`, and the dead first-fill stack scalar; a separate later byte/string zero owns the three clears in r5; the fill loop itself uses immediate zero.
- v81 and v82 are byte-identical to v80 at 0x2E4 / 446 and are closed.
- RTL/CSE proves first CSE collapses distinct early `zero` and later `string_zero` identities. Private diagnostic tree `/mnt/data/Github/agbcc-fomt-loader-zero-diag-v1` preserves promoted byte-zero identity under opt-in `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1`; production compiler is untouched.
- v83 0x2E8 / 598 proves the distinct split but assigns old zero r8/string zero r5; v84 scalar header spelling regresses to 0x2E8 / 621.
- Unchanged v75 under the diagnostic is 0x2DC / 485. **v85**, v75 plus only `state_21cc+4 = zero`, reaches **0x2E0 / 408** and correctly gives that field r9 while the three string clears remain r5. It is the strongest private causal oracle, not a production candidate. v86 direct old-zero fill argument regresses to 0x2D8 / 593.
- The retail/v75/v85 comparison is complete: **v85's exact four-byte deficit is the missing `0x1CCC` literal word**. Normal v75 has both `0x1CCC` and `0x21F0`; unchanged v75 under the diagnostic loses both; v85 restores `0x21F0` only.
- Cause is pass-level proven. The private rule changes allocation so Dog offset `0x1C70` survives in callee-saved r4, then `r4 + 0x5C` becomes `0x1CCC`. Retail instead independently materializes `0x1C70 -> r1`, `0x1CA0 -> r2`, `0x1CCC -> r3`. Sister `func_08010358` independently preserves separate `0x1C70` and `0x1CCC` literals across the same constructor/helper pattern.
- v87 adds only an ordinary named Dog destination pointer on v85 and is **binary-identical to v85, 0x2E0 / 408**. Close it.
- Exact next action: keep v75 production authority and v85 causal oracle. Read-only trace the reload/global-allocation scratch choice for the one-use `0x1C70` Dog-call offset. Any compiler probe must remain diagnostic-only and use a structural one-use constant-derived call-argument discriminator, with no function/offset/pseudo/UID/hard-register identity. Do not force registers, add padding/volatile, retry v87, or promote the current private rule.

## AUTHORITATIVE CURRENT SNAPSHOT — factory mapped; legacy loader reconstruction active

Date: 2026-10-04

## Active investigation checkpoint — factory mapped; legacy loader reconstruction active

- Production retail branch `ches-dev` remains at **`9078f368c02d861f7cd71685e1f9dd1d95c7c384`**, pushed to `ches/ches-dev`; no production source changed during this research turn. Retail ROM authority remains SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Landed lifecycle source remains exact: `579c16c` GameObject entity lookup and `9078f36` teardown. Source progress remains **61,132 / 940,036 = 6.5032%**.
- Factory mapping is complete. `selector-map-v4.json` SHA256 `3db29284c66aadbeb4357410777fc14aa839cc6ae1ecc63d5c38cd99cd079eef`; CSV SHA256 `c4e61956556cb636a81ed566f448e76c0fe0f8699595934e72a5df04437feb5a`. All **94 selectors / 58 unique targets** are classified.
- Corrected factory boundary: assembler symbol `sub_0801B464` is a false semantic split inside the epilogue. Coherent factory region is **`0801A8E0..0801B497`, 0xBB8 = 3,000 bytes**; next observed prologue is `0801B498`.
- Success join `0801B462` copies returned `AEntity *` to r5. Tail `0801B464` consumes the live factory frame: non-null r5 is installed at `GameObject+8+selector*4`, entity virtual +0x10 is called, then the frame unwinds; abort paths enter with r5 == 0 and only unwind. Never model `sub_0801B464` as a normal standalone helper.
- Selectors **1..34 are exactly character IDs 1..34**: each fixed factory persistent pointer is `GameState+0x1CD4 + documented social offset`, all allocate 0x48, and each calls its resident-specific constructor. Selector **35 is Child** (resolver `080A0A04`, 0x4C, constructor `08036E2C`). Selectors **36..42 are Staid/Nappy/Bold/Chef/Aqua/Hoggy/Timid** (0x44, shared `08033928`, variant 0..6).
- Remaining v4 families: 43 occupied special, 44 horse, 45 unique, 46..53 chickens, 54..69 cows/sheep from Barn, 70..73 global-record family, 74 special, 75 article-ID-53 route, 76..83 eggs, 84 direct factory, 85..92 helper-driven families, 93 unique. **Selector 43 is occupied.**
- Do not restart table discovery. Full factory C++ is deferred until remaining family callees/types can be named without invented certainty.
- Active persistence frontier: `func_08011650` spans **`08011650..08011933`, 0x2E4 / 740 bytes**. Both callers allocate 0x34F4 bytes and effectively pass `(GameState *state, save_context, slot_offset, u32 *error_out)`. It always returns `state`; status is `*error_out`.
- Loader first builds fallback/default state, then reads stored size, requires 0x34F4, reads the entire payload, reads checksum, validates `func_08011588`, and performs no successful-load migration/fixup.
- `func_080006E4(save_context,destination,offset,size)` is the four-argument SRAM read proxy. Error classes, ORed with `gUnk_03000400`: `0x10000` generic/size/checksum, `0x20000` payload read, `0x30000` checksum read.
- Loader checkpoint: `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md`.
- Loader experiments now extend through **v86**. **`candidate-v75.cc` remains the production-toolchain authority at exact 0x2E4 / 220 differing linked bytes**, SHA-256 `eef1f00a61b235c303bd2997e91860c225d8be49328c7bd7d0e8fbfac3c6e3c3`. Its post-pool executable path remains exact.
- First-CSE diagnosis proves the retail two-zero model: an older full-width zero in r9 owns header initialization, `state_21cc+4`, and the dead first-fill stack scalar; a distinct later byte/string zero owns the three string clears in r5; the fill loop itself uses immediate zero.
- v81/v82 are byte-identical to v80 and closed. v83/v84 establish useful causal facts but regress. Unchanged v75 under the private diagnostic is 0x2DC / 485. **v85** reaches 0x2E0 / 408 and correctly gives `state_21cc+4` r9 while preserving the three r5 string clears; **v86** regresses to 0x2D8 / 593 and is closed.
- The private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO` rule remains diagnostic only. Production source, asm, linker, and tracked 13-rule compiler inputs are unchanged.
- Exact next action: perform a **read-only retail/v75/v85 size, call-boundary, and literal-pool comparison** to locate v85's exact four-byte deficit and identify the diagnostic rule's out-of-band codegen effect. Do not create another source/compiler variant until that cause is localized; do not promote the private rule or reopen v81/v82/v84/v86.

## Documentation audit checkpoint — October 4, 2026

- Re-read the authored project documentation before resuming decomp work: top-level project guides, all `docs/*.md`, both canonical `tools/ches` continuation files, and the small vendored libsix readme. Historical chronology is preserved where explicitly marked historical/superseded.
- Corrected stale live-state claims to production HEAD `9078f36`, progress 61,132 / 940,036 = 6.5032%, current 13-rule compiler patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`, completed GameObject lookup/teardown, complete 94-selector / 58-target factory mapping, and active loader `func_08011650`.
- Updated stable character/progress/repository/custom-character/SpriteAnimator docs plus current roadmap/compiler dashboards. Old resource/NPC/metadata snapshots that remain are explicitly historical milestones rather than current next actions.
- Local Markdown link audit reports 0 broken relative links. No gameplay/source/asm/linker/compiler files were changed by this documentation audit.
- Final audit verification passed: `git diff --check` is clean, the focused live-state markers point to `9078f36` / 61,132 / 6.5032%, local Markdown link audit has 0 broken relative links, and no source/asm/include/linker/compiler path changed. Follow-up reconciliation relabeled stale October 2/3 current/next headings as historical and aligned the live loader bullets with v81-v86. Documentation audit is complete. Exact next action is the read-only retail/v75/v85 four-byte-deficit comparison above. Do not redo the documentation read or factory/lookup discovery.

## Loader continuation checkpoint — v64-v70

- Production remains unchanged at `9078f36`; all work is private checkpoint research. **v56 remains the verified whole-function best at exact 0x2E4 / 226**, and its save/read tail `08011825..08011933` remains fully exact.
- v64 placement `Location(MAP_NONE,0,0)` is **0x2E8 / 604** and emits a non-retail null guard. v65 inline 3-arg constructor-body helper is **0x2EC / 594** and creates an extra r8 zero. Constructor avenue closed.
- v66 only `field_04 = hard-r9 zero` on v56 is **0x2F0 / 609**. Explicit late source use of the hard r9 zero is wrong.
- Sister `func_08010358` proves two long-lived zero identities are created much earlier than +21CC: one survives to field_04/dead fill temp, a separate one survives to the three string clears. v67 early explicit 32-bit string_zero is **0x2EC / 630**, so that source spelling is not original.
- v68 explicit second-fill zero is **0x2E0 / 516** globally, but locally recovers the exact desired fill roles: r5=sp+8, r4=state+2C48, r8=state+2C4A.
- v69 = v68 + explicit string_zero is **0x2E8 / 340**. It is not a baseline, but is the strongest local allocation diagnostic: r5 handles the three string clears then becomes sp+8 exactly like retail, with r4/r8 pointer roles correct. It locally improves +21CC/fills/2C/record regions. Wrong piece: field_04 and [sp+4] also use r5 instead of the older r9 zero. Its total is +4 bytes, which shifts/breaks the previously exact tail.
- v70 ordinary first zero on v69 is **0x2E8 / 597**; reject.
- No local branch/history/upstream update contains a solved loader/sister source. `origin/main` remote and local are both `b8471ae065744869f64283473ed68372f82321c9`.
- Exact next action: keep v56 authoritative and v69 diagnostic-only. Read-only locate v69's exact +4-byte excess by comparing instruction counts and literal pools against retail/v56, including call-boundary census and first alignment shift. Only after identifying whether the extra unit is an instruction or literal should another candidate be created. Goal: preserve v69's r5->sp+8 and r4/r8 roles while removing exactly that unit. No compiler changes and do not touch v56's exact tail.

## Loader continuation checkpoint — v57-v63

- Production remains unchanged at `9078f36`; all work is private checkpoint research. **v56 remains best: exact 0x2E4 / 226**, and save/read tail `08011825..08011933` is fully exact/closed.
- Retail/sister alignment proves three zero identities: r9-backed integer zero for field_04/dead first-fill temp, a separate zero across the three string clears, and immediate zero inside the first fill. Retail then reuses r5 for the second-fill stack-value pointer.
- v57 **0x2E4 / 256** locally fixes Location pointer/MAP_NONE/mask register family but not mask-load order or r5 zero. v58 **0x2E4 / 455** gets load order with too much register pressure. v59 **0x2E4 / 397** synthesizes -1024 instead of literal-load. Reject all as baselines.
- v60 **0x2E4 / 299** is key local evidence: explicit string_zero plus v57 emits retail-like r5=0 and improves +21CC/strings from 53 to 37 differing bytes, but r5 then incorrectly owns field_04/[sp+4] and poisons fills/2c/tail. v61 hard-r9 field_04 is **0x2E8 / 507**; reject.
- v62 `'\0'` literals and v63 `char *` string lvalues are both **0x2E4 / 226**, effectively same as v56. String type spelling does not create the separate zero pseudo.
- `--trace` allocator diagnostic on v56 produced an empty log even with `AGBCC_TRACE_ALLOC=1`; no useful trace is available. Do not pursue compiler-tooling changes.
- `0x080947BC..0x080949xx` confirms +21CC is raw-ish serialized storage, not a hidden copy-constructor object.
- New strong evidence: `include/actor.hh` defines real inline `Location(u32 map,u32 x,u32 y) : map(map), x(x), y(y)`. Retail's mysterious r5=0 appears exactly where the two zero constructor args could become live. This constructor-semantic hypothesis is distinct from v47's rejected independent field assignments.
- Exact next action: from candidate-v56.cc, test one in-place/direct-construction spelling equivalent to `Location(MAP_NONE, 0, 0)` at GameState+0x1CCC using the existing recovered constructor (or one tiny inline 3-arg helper only if placement construction is unavailable). Make no other change. Compare immediately and inspect 080116DE..08011760. Keep only if it naturally explains the r5 zero while preserving retail Location masks and does not poison later allocation. Otherwise return to v56.

## Loader continuation checkpoint — v48-v56

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v48 r1-header diagnostic **0x2EC / 655**, v49 scalar header date **0x2E4 / 435**, v50 scoped typed calendar **0x2E8 / 330**, v51 single typed header **0x2EC / 526**, v52 direct typed calendar casts **0x2E8 / 330**, and v53 natural zero allocation **0x2E8 / 594** are closed matching paths.
- v47 was not locally closer than v43 in the Location block (56/56 differing bytes versus 55/56), so do not pursue the previously proposed Location constructor/temporary. Keep only the proven semantic fact that +0x1CCC is `Location`.
- v54 **0x2E4 / 228** fixes checksum-read setup by computing a declared `checksum_offset` before zeroing `stored_checksum`; this makes the four instructions at 0x080118D8..DF match retail ordering. Its signed -2017 mask still zero-extends through a u16 lvalue.
- v55 explicit int time-mask local gives **0x2E4 / 229** and is not the baseline.
- **v56 is current verified best: 0x2E4 / 226.** It is v54 plus an `i16 *` lvalue for the `&= -2017` GameTime mask, yielding retail `0xFFFFF81F` without extra register pressure.
- **The save/read tail 0x08011825..0x08011933 is now completely exact: 0 differing bytes. Do not touch it again.**
- Remaining mismatch is entirely in the default initializer. The densest known region is +0x21CC/strings (53/54 bytes on the same layout family), followed by Location and earlier register-coloring bands.
- Exact next action: start from `candidate-v56.cc`. Read-only align retail/v56 over `08011712..0801178C` and compare with sister initializer `func_08010358` at its +21CC/strings/fills sequence. Recover a new source-lifetime fact before mutating. Specifically preserve the evidence that retail distinguishes the r9-backed zero used for field +4/dead stack scalar, a separate string zero, and immediate zero inside the first fill. Do not retry explicit string_zero, hard-r9 forcing, fill-by-reference, flat State21CC, typed calendar, Location constructor, or compiler changes.

## Loader continuation checkpoint — v38-v47

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v38 **0x2E8 / 359**, v39 **0x2EC / 608**, v40 **0x2E4 / 246**, v41 **0x2E8 / 334**, v42 **0x2E4 / 490** are closed matching spellings.
- **v43 is current verified best: 0x2E4 / 236.** Its critical change is making the first parameter `u8 * bytes` directly and removing the state->bytes alias. This recovers the retail prologue exactly through state capture/save_context spill ordering.
- v44 **0x2E8 / 330** rejects typed calendar on v43. v45 **0x2E0 / 563** rejects moving 2C48/2C4A declarations after the second fill. v46 **0x2E8 / 355** rejects explicit string_zero on v43.
- `include/actor.hh` proves GameState+0x1CCC is the real packed `Location` (`map:10`, `x:16`, `y:16`), with MAP_NONE=0x234. v47 uses direct Location field assignments and gives **0x2E4 / 237**: semantically correct and exact-size, but one byte worse than v43, so type evidence is retained but direct assignment spelling is not promoted.
- Exact next action: resume from candidate-v43.cc. Read-only compare retail/v43/v47 over 080116DE..08011714. If v47 is locally closer, test exactly one Location constructor/temporary spelling using the existing `Location(u32,u32,u32)` semantics and no other source changes. Otherwise keep v43 raw Location masks and move to the next first divergence. No compiler work.

## Loader continuation checkpoint — v31-v38

- Production remains unchanged at `9078f36`; all loader work remains private checkpoint research.
- v31 is byte-identical to v30. v32 **0x2D4 / 558** proves signed `-16` is the correct `+0x3494` loop mask source. v33 **0x2E0 / 558** is a size improvement but rejects using the dead `[sp+4]` zero as first-fill value; retail never reads it.
- Current project `BitArray` is not the `+21D4/+21DC` container: its exact Furniture ctor emits 32-bit stores, while these GameState fields initialize bytewise and have bit/8 byte consumers.
- v35 **0x2D4 / 556** proves a distinct `payload_size` copy after the first read: it recovers retail's long-lived r4 size value. v34 is compile-invalid because its declaration crosses goto targets.
- v36 **0x2E0 / 526** proves branch-local pointers to `gUnk_03000400`; this recovers the separate global-address loads in each error branch. Its only size deficit was the missing `0x1CCC` literal.
- v37 computes `farmer = bytes + 0x1BD8` before the local GameDate bitfield writes. Result **0x2E4 / 240**, exact retail size and current verified baseline. This restores retail's Farmer argument evaluation order and the standalone `0x1CCC` literal.
- v37 retail comparison shows a distinct mid-function zero lifetime: retail sets r5=0 at `080116F2` after Dog construction and reuses it for the three string-slot clears at +21E0/+21F0/+2200. This likely explains a large remaining register-allocation band.
- `candidate-v38.cc` has been created from v37 to test exactly that: declare `u8 string_zero`, assign it zero immediately after the first +1CCC u16 write, and use it for the three string clears. **v38 is unverified because the 50-call checkpoint fired during creation.**
- Exact next action: compare `candidate-v38.cc` immediately over `08011650..08011934`. Inspect `080116E8..08011744`. Keep it only if it naturally emits retail-like `movs r5,#0` around `080116F2`, retains r5 for the three string clears, and preserves exact 0x2E4 size. Otherwise resume from v37. No compiler change.

## Loader continuation checkpoint — v23-v30

- Production remains unchanged at `9078f36`; all work is private checkpoint research.
- v23 **0x2D0 / 511** is the best raw byte-difference result, but its 0x1C frame is structurally wrong because the early r9 zero remains live too long.
- v24 **0x2CC / 557** is the current structural baseline: exact 0x18 frame and correct natural reuse of r9 as the `sp+0x0C` pointer after the early zero lifetime ends.
- v25 **0x2D4 / 568** and v26 **0x2CC / 560** prove explicit second-zero/fill locals do not recover retail's destination/count-before-pointer scheduling. v27 **0x2D8 / 652** rejects passing the early hard-register zero by reference. v28 is byte-identical to v24.
- v29 **0x2D0 / 554** with an int temporary recovers signed negative-mask codegen at GameState+0x2C4A but over-reuses -9 to derive -17.
- Consumer audit proves +0x2C4A bits 3..7 are five independent one-bit fields. v30 **0x2D0 / 562** with a scratch bitfield struct reproduces retail's entire signed mask chain exactly. Its only local mismatch is pointer caching: v30 keeps the pointer in r3, while retail uses r0 as the initial pointer/value and reloads `r8` into r1 before the final store.
- `+0x21CC` is a proven 0x44-byte cluster: u32/u32, 8-byte bit storage, 4-byte bit storage, three 16-byte string slots; next field +0x2210. +21D4/+21DC have direct bit-index consumers.
- Call-boundary census localizes remaining size deficits to a few regions rather than the whole initializer; preserve that measurement and do not return to broad syntax permutations.
- Exact next action: start from `candidate-v30.cc`, keep `State2C4AFlags`, remove the cached `flags` local, and perform all five bitfield assignments through direct non-cached `reinterpret_cast<State2C4AFlags *>(state_2c4a)` expressions. Compare immediately. Target the retail `mov r0,r8 ... mov r1,r8; strb` pointer reload around the now-exact mask chain. No compiler change or duplicate-base/early-zero rollback.

## Loader continuation checkpoint — v17-v22

- Production remains unchanged at `9078f36`; all v17-v22 work is private checkpoint research.
- v17 **0x2D4 / 632**; v18 **0x2D8 / 626**; v19 **0x2D4 / 652** (reject int-temp); v20 **0x2DC / 605** with real `GameDate` bitfields; v21 **0x2D4 / 659** (reject whole-header/single-base hybrid); v22 **0x2C8 / 557** with a shared `+0x21CC` pointer.
- Game-state copy code proves the `+0x21CC` contiguous cluster: u32 +0, u32 +4, 8 bytes +8, 4 bytes +0x10, then 16-byte strings at +0x14/+0x24/+0x34; next field is +0x44 / GameState+0x2210.
- v20 proves typed `GameDate` assignments are meaningful source evidence: they naturally reuse the same -4/-125 masks for the header and Farmer local date. v22 proves the `+0x21CC` shared-base shape is meaningful: it recovers `[ptr+4]` and `ptr+0x10` addressing and improves byte agreement despite being too short.
- Exact next action: start from `candidate-v22.cc`. Hoist only pointer locals for `bytes + 0x2C48` and `bytes + 0x2C4A` to just before the second `fill_n_inl(state_21cc + 0x10, 4, 0)`. Reuse those pointers for the existing 0x2C48/0x2C4A operations after `func_080114F8` and `func_0809A8AC`; leave `bytes + 0x2C1C` where it is. Compare immediately. This targets retail's five early pointer-setup instructions and r4/r8 lifetimes. No compiler change, duplicate base, or broader layout experiment.

## Loader continuation checkpoint — v11-v16 bounded

- Production `ches-dev` is unchanged at `9078f36`; no source/asm/linker/compiler contribution path changed in this turn. All new work is private under `tools/ches/checkpoints/save-loader-08011650-2026-10-04/`.
- Retail disassembly proves `func_08011650` uses a **0x18-byte stack frame**, captures the destination base in **r7**, keeps that r7 base through initialization/read/checksum/return, and has no v6-style `[sp+0x18]` duplicate base spill.
- v11 implemented the prior non-overlap hypothesis exactly: all late payload/checksum/return uses switch from `state` to `bytes`. Result **0x2D4 / 606**. It removes the spill and gets the single-base model right, but loses unrelated codegen pressure. Do not restore the duplicate spill merely to recover size.
- v12 zero-after-header: **0x2D0 / 641**. v13 base+header-before-hard-bindings: **0x2D8 / 638** and best diagnostic instruction-sequence similarity among v6/v11-v14, but header is too early in r5. v14 header-from-state is byte-identical to v11, proving that early extra state use canonicalizes away. v15 base-before-hard-bindings/header-after: **0x2D0 / 638**, close prologue shape but save_context still spills before r7 capture and header uses r2. v16 fixed-r7 diagnostic: **0x2D4 / 613**, rejected; forcing r7 does not solve scheduling and must not be promoted.
- `compare-function.py --trace` generated empty allocation logs with the current tracked compiler even with `AGBCC_TRACE_ALLOC=1`; do not rely on that trace path unless a deliberate diagnostic compiler with the hook is prepared.
- Exact next action: start from `candidate-v15.cc`. Move only `clear_date_bits` (`-125`, r8) declaration/initialization to immediately **after** `header[9] &= clear_low_two`. Retail `08011674..08011686` loads header[9], initializes/applies -4, then initializes -125 into r3/r8 and applies it. Compare immediately. Do not change the compiler, restore v6's duplicate spill, or repeat fixed-r7.

## Active scope — October 4, 2026

The user explicitly narrowed this work to making future custom NPCs possible
through retail decompilation, typed data, recovered interfaces and documentation.
Recover the necessary identity, entity/factory/lifecycle, scheduling,
interaction, asset/provider and persistence boundaries while preserving the
byte-identical retail ROM. Custom NPC creation and new gameplay, registry,
asset or save-extension behavior are deferred. Proposed implementation notes
below are reference material; completing their prerequisites does not start
implementation automatically. This overrides the earlier prototype plan.


## Superseded pre-lifecycle snapshot (historical)

### Exact data milestone: character metadata

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

### Last executable-code unit: NPC support (565529c)

- Retail branch `ches-dev`; last executable contribution `565529c3e521db9eaaf75e0a75253ce9d68044de`.
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
  Custom NPC implementation is deferred. The 43-entry retail metadata is now
  exact typed source; factory/lookup,
  loader and asset-authoring boundaries remain open.

Contribution saved as `565529c3e521db9eaaf75e0a75253ce9d68044de` (`565529c decompile character location, schedules and Lillia entity`), committed, pushed to `ches/ches-dev` and independently remote-verified. Index empty.

### Historical next continuation (completed and superseded)

1. Read the final metadata proof/save record in
   `tools/ches/checkpoints/character-enablement-2026-10-04/`; this 43-record data
   unit and the previous five functions are complete. Do not repeat their
   matching/builds. Scope is retail support/interface recovery; custom NPCs
   and new registry/save/asset behavior remain deferred.
2. Audit raw indexed lookup `0801FD00`, every caller and the owner/return-type
   layout before native source. Then recover factory `0801A8E0` ownership,
   setup/teardown loops, interaction routing and legacy loader `08011650`.
   Preserve separate ID domains and the fixed social/save layouts; selector 43
   is occupied. Choose coherent five-function units where feasible.
3. Recover original asset/provider/display/script formats and verify unchanged
   round trips as retail support evidence. Document remaining capacity/bounds
   and engine consumers, without creating a new character or save extension.
4. Original name strings remain a bounded incbin pool; recover exact typed
   strings when their alignment/aliases/consumers are audited. Metadata is
   already source, so widening it is not the next task.
5. Preserve private README/docs, prior checkpoints/worktrees and deferred
   allocator/compiler evidence. Completing prerequisites does not start a
   custom-game implementation automatically.

## October 4, 2026 milestone

All five first candidates matched with existing types and natural C++. The
conditional ActorLocation initializer reproduced both schedule paths directly.
Moving the base declaration and suppressing already-owned vtables preserved
all original base code; combined proof is6/6. Three explicit source insertions
and six neighboring linker boundaries pass. Fresh isolated install and both
forced builds passed without codegen changes. Detailed candidates and the one
corrected private offset-generator regex are indexed in the checkpoint.

## Archived research handoff — superseded for current task

# Ches Session Status — FOMT decomp

## HISTORICAL SNAPSHOT — custom-character pivot (superseded by the October 4 snapshot above)

Research and documentation requested by the user are complete. No character
implementation has started. Planning assumption: one added ordinary NPC with
original cast and save compatibility; replacement NPCs and farmer customization
remain alternative scopes. No answer to the optional category question was
received, so this is an explicit research assumption.

- Retail branch `ches-dev`, HEAD `0514b05ec4a1dbfab37f49a377e27163923d8429`;
  source **59,944 / 940,036 = 6.3768%**. Last exact full-ROM build remains intact,
  SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; no new source bytes claimed.
- Custom-game branch/source remains HEAD `60eaccafa2c92056ee56283ea4ee8f5d6c59377c`
  in `/mnt/data/Github/gba/fomt-custom-game-worktree`. The character/save/plan
  docs are shared there and its expansion progress rows aligned, without
  merging any source or build changes.
- Stable facts: [CHARACTERS.md](../../docs/CHARACTERS.md); proposed implementation
  stages: [CUSTOM_CHARACTERS.md](../../docs/CUSTOM_CHARACTERS.md); persistence:
  [SAVE_FORMAT.md](../../docs/SAVE_FORMAT.md). Dashboard/roadmap/map/notes/playbook
  and contribution-facing progress are aligned with this pivot.
- Character metadata is 43 entries at 08104258, now decoded in evidence and
  correctly documented as name pointer + birthday bytes + padding. Source data
  remains `.incbin`; the header is a typed view. Fixed social block is 0x478
  bytes at GameState+1CD4, separate from an added-NPC state design.
- **Corrected inherited research:** 0803D7E4 makes **31 unconditional schedule
  applications plus conditional child = 32 total**, for IDs1..29,33,34,35.
  AEntity+30 creates an effect; it does not construct the NPC. GameObject+30 is
  map height, so 0802CDCC is not the NPC factory. Call233 is annotated/corrected.
- True factory: `func_0801A8E0`, indexed pointer storage at owner+8, jump table
  0801A924. Case1 at 0801AEE4 allocates Lillia's **0x48-byte entity**, passes
  GameState+1D44, calls 08035AFC. Entity vtable080E7198+30 -> 08035B38 creates
  its distinct **0x8C-byte effect**. Getter at0801FD00 is unchecked; selector43
  is already occupied. Preserve character/entity/resource/script ID domains.
- Native display-bank0852D984 has **184 animation selections**; verified pool
  counts184,184,1037,11586,52,0,184. Complete expression mapping and new-asset
  import/encode/relocation workflow are still open.
- Retail leaves **0xAF0 / 2,800 bytes per save slot** unused. No extension
  serializer, registry, loader, migration or combined save transaction exists.
  Legacy loader08011650 still needs recovery/lifecycle validation.
- Evidence: `tools/ches/checkpoints/character-expansion-2026-10-03/`, including
  `audit_evidence.py`, decoded roster/registration/factory/source JSON, exact
  disassembly, display-bank metadata, script994 extract, baseline and code/build
  preservation manifests. No editor installation, source change, toolchain
  experiment, commit, push, PR or external message occurred in this pivot.

The previous allocator five and its compiler frontiers are **deferred**; all
saved candidates, exact contributions, old worktrees and private README remain.
The next support batch is a proposal; none of its functions is newly matched.

## Custom-character research milestone — October 3, 2026

Reused Call220/Call233 evidence and checked it against the current ROM/source.
Corrected stale birthday metadata docs, schedule count and entity/effect factory
claims. Decoded all43 roster entries, verified the genuine Lillia constructor
route and the occupied entity selector43, and mapped a184-entry display bank.
Mary decompiled script994 successfully into the private checkpoint. No import,
script insertion, extension serializer or added-NPC gameplay was demonstrated.
Stable facts and design proposals are separated, and the old allocator plan is
deferred rather than discarded. Final preservation/link/diff checks are recorded
in this checkpoint's verification JSON; docs-only work needs no code rebuild.

## Archived retail allocator snapshot before the character pivot

All current/next statements below are chronological evidence. The snapshot and
continuation above own current work; do not resume the allocator merely because
an older section calls it immediate or next.

- Repo `/mnt/data/Github/gba/fomt`, retail branch `ches-dev`. Contribution save: `0514b05ec4a1dbfab37f49a377e27163923d8429` (`0514b05 decompile resource subtree ranges and release`), committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.
- Both isolated and production plain `make -B -j4 compare` builds exit0 and reproduce all8,388,608 retail bytes; SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Isolated compiler was freshly built by the tracked installer.
- Source **59,944 / 940,036 = 6.3768%**; assembly **880,092 = 93.6232%**. Five-function subtree unit adds436 linked bytes:434 body bytes plus2 ordinary alignment bytes.
- New exact functions: order-8 full fill `080D6ECC`32/0, full clear `080D6F3C`30/0; order-9 range fill `080D7118`148/0, range clear `080D734C`152/0; order-8 release `080D7678`72/0. All15 previous resource functions stay exact:20 recovered functions share `src/resource_handle.cc`.
- Compiler unchanged: tracked `tools/install_agbcp.sh`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c`,13 structural flags; patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`. Compatibility reconstruction, not recovered historical Nintendo compiler. No diagnostic, new rule or source forcing promoted.
- Evidence: `tools/ches/checkpoints/resource-subtrees-080D7094-2026-10-03/`: `candidate-combined-v3.cc`, `production-candidate-v3.cc`, `combined-all-v3/results.json`20/20 exact, `isolated-proof-v3.json`, `production-proof-v3.json`, successful fresh-install/forced-build logs, `verification-commands-v3.json`, `integration-plan-v3.json`, `verify_batch_v3.py`. All46 checked addresses/aliases/neighbors and14 source-section seams pass.
- Four contribution paths: `src/resource_handle.cc`, `asm/code_linkonce.s`, `fomt.lds`, `docs/RESOURCE_HANDLES.md`. Stable architecture covers the full/partial subtree geometry, release dispatch, flags and exact seams. Raw copy/query/helper islands, root allocation/reservation, and both mismatching order-8 partial functions retain assembly positions.
- Detached `/mnt/data/Github/gba/fomt-resource-subtree-integration` is exact. Old worktrees/checkpoints, custom-game and private README remain intact; README SHA256 `7933c9e5448719a24198b6e6e11efbaab3f597a24e8784eea324cdaf67207754`.
- Next coherent five: order-9 full fill `080D6EEC` and clear `080D6F5C`, order-7 full fill `080D6EAC` and clear `080D6F1C`, and order-7 release `080D7634`. Use the exact order-8 helpers and release as source anchors. These next five are still assembly; no new match is claimed. `next-batch-selection-v3.json` records body/alignment bounds and expected196-byte linked gain if exact.
- Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.
This archived snapshot describes the pre-character-pivot allocator continuation.

## Resource subtree V3 milestone — October 3, 2026

V1 reused exact order9 fill and derived four adjacent methods: three exact,
order8 ranges missing one copy. V2 explicit mutable right-length copy failed
at the measured CSE/flow boundary. Both candidates, five-target results and
all RTL dumps/slices are retained. Final V3 rotates those two unresolved
partial functions to their full fill/clear dependencies; all20 shared methods
are exact. Fresh tracked isolated install and both forced full-ROM builds
pass46 addresses,14 sections and436-byte gain. Four contribution paths and stable architecture are saved. Contribution save: `0514b05ec4a1dbfab37f49a377e27163923d8429` (`0514b05 decompile resource subtree ranges and release`), committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.

Next five close full reset/release dependencies; the preserved partial-range,
root allocation and reservation frontiers need new causal/ABI evidence.
No compiler, custom-game, private README, PR or external-message mutation.


## Previous resource construction/acquisition and allocator investigation snapshot

# Ches Session Status — FOMT decomp

## HISTORICAL SNAPSHOT (superseded by the October 4 snapshot above)

**Historical allocator batch:** private `tools/ches/checkpoints/resource-allocator-08007A28-2026-10-03/`. Final five: root FillRange156/0, ClearRange156/0, Free74/0, child Free080D76C0 74/0, pool initializer080D770C 32/0. Combined V17 verifies all15 old/new bodies /0. Production candidate V16 and isolated integration plan saved; new detached fomt-resource-allocator-integration has planned edits and fresh tracked install running. Allocation126/10 unaffected by all 13 rule ablations, reservation300/211 aggregate hypothesis unproven: both deferred, retained private. Order9 Fill080D7118 V15 148/0 saved for next batch. Production unchanged c0fcbba /59,012 bytes; full-ROM integration/progress proof pending.

- Repo `/mnt/data/Github/gba/fomt`, retail branch `ches-dev`. Local/remote HEAD `c0fcbba4ede4971e00bb13d2535a496b1b93c7dd` (`c0fcbba decompile resource construction and acquisition`). The exact seven-path unit is committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.
- Production ROM is byte-identical across all 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Isolated and production fresh pinned installs and plain `make -B -j4 compare` both exit 0.
- Source **59,012 / 940,036 = 6.2776%**; assembly **881,024 = 93.7224%**. This new five-function unit adds 728 linked source bytes.
- New exact methods: constructor `08007874` 0x15C, acquisition `08007B54` 0xD2, reference query `08007E24` 0x66, root fill `08007EA8` 0x20, root clear `08007EC8` 0x1E, all /0. Acquisition/query/clear trailing alignment is separately covered by the full ROM. All five earlier resource methods remain exact; ten recovered methods share `src/resource_handle.cc` and `include/resource_handle.hh`.
- Compiler authority: tracked `tools/install_agbcp.sh`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c`, thirteen structural rules, patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`. New rules prefer pointer metadata only after allocation priorities tie and retry the standard jump threader after reload while honoring flag_thread_jumps. No trace, diagnostic or target-identity selector is promoted. This remains a compatibility reconstruction, not the recovered historical Nintendo compiler.
- Evidence: `tools/ches/checkpoints/resource-handles-08007874-2026-10-03/` contains `candidate-full-v19.cc`, `package-v20-provenance.json`, `continuation-v18/targets-clean-v20/results-corrected.json` (21/21 checks), `continuation-v18/corpus-clean-v20/results.json` (54/54 unchanged), `isolated-proof-v20.json`, `production-proof-v20.json`, fresh-install/forced-build/progress logs, `contribution-paths-v20.json`, and `verify_batch_v20.py`. All 25 symbols/aliases/neighbors and five source section seams pass.
- Dedicated stable architecture is updated in `docs/RESOURCE_HANDLES.md`. Manager generation +0x922 and client first word remain uninitialized by construction; their observed boundary is preserved. Occupancy/generation validation and pool-exhaustion rollback are readable source.
- Both old private diagnostic v18 and clean v20 compiler trees are preserved. New detached integration `/mnt/data/Github/gba/fomt-resource-v20-integration` is exact; previous integration worktrees are preserved. Prior production compiler backup: `production-compiler-before-v20/`.
- Preserve private README/AGENTS/docs/research; README SHA256 remains `7933c9e5448719a24198b6e6e11efbaab3f597a24e8784eea324cdaf67207754`. No custom-game changes, PR, notification or external message.
- Next coherent five-function investigation: root range fill `08007EE8`, range clear `08007F84`, allocation `08008020`, release `080080A0`, then reserved-interval replacement `08007A28`. Trace the order-9 subtree helpers `080D7118/080D734C/080D7568/080D76C0` and pool initializer `080D770C` before final naming or source. The existing typed owner and exact acquisition/release methods are the source-shape anchors. These five remain assembly; no candidate or match is claimed. Preserve raw copy/query/helper islands. The remaining-assembly score omits recovered source callers; completing these dependencies is justified by the acquisition API's original 32 unique callers, not their now-small numeric score. Saved selection `next-batch-selection-v20.json`; refreshed ranking `tools/ches/checkpoints/decomp-leverage-2026-10-03-resource-v20.md`.

This snapshot supersedes all older current/next statements below.


## Superseded entity snapshot and initial resource status — October 3, 2026

# Ches Session Status — FOMT decomp

## HISTORICAL SNAPSHOT (superseded by the October 4 snapshot above)

- Retail branch at that checkpoint: `ches-dev`, HEAD `9a6a26fc50ec4dde8536fa982ba84c2a6c59e2a0` (`9a6a26f decompile entity effect lifecycle`); the verified contribution is committed, pushed, and remote-verified.
- Current source: **57,712 / 940,036 = 6.1393%**; assembly 882,324 = 93.8607%.
- Plain production rebuild after fresh tracked compiler install passes complete 8,388,608-byte retail equality and SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- All five UnknownEntityThing methods and its typed vtable are integrated and exact. Core constructors/update/renderer share `src/entity_effect.cc`; destruction and table have separate minimal source units. Shared 0x8C layout is in `include/entity_effect.hh` and stable architecture in `docs/ENTITY_EFFECTS.md`.
- Eleven structural compiler rules are enabled through the tracked installer. New rule `AGBCC_PRESERVE_INTEGRATED_NARROW_ZERO` preserves a byte zero from wider multi-set source-variable equivalence quantities across both CSE passes. Patch SHA256 `5d6c6a891453f5939749499bfb5ca0db3f6f5a1bffd4a881809bf546e6e511ec`.
- Clean rebuild proof: all 11 target checks PASS, 54 modules unchanged, five canaries included, combined batch exact, isolated and production full ROM exact. Saved production proof: `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/production-proof-v27.json`.
- All 56 pre-existing authored documents have been read through EOF; new stable architecture and all current-state docs are reconciled.
- Private README/AGENTS/docs/research and all worktrees are preserved. No custom-game or unrelated project source changes.
- Active resource batch: five exact methods `080079E8/7C28/7CD8/7D4C/7DB8` and corrected effect constructor forwarding ABI. Detached integration is prepared and its fresh pinned compiler install passes; full-ROM proof pending. Production remains unchanged. Constructor/acquire probes are preserved at 0x15C/5 and true body0xD2/1. Read current handoff/checkpoint; entity CSE and renderer investigations are closed.

This archived snapshot and the older continuation sections below are historical evidence.


## Standing project charter — September 23, 2026

- Read root `AGENTS.md` first. It is the durable no-context charter; `START_HERE.md` is the concise current-state entry point.
- Maintain two connected but strictly separated tracks: byte-perfect retail reconstruction on `ches-dev`, and the most requested quality-of-life improvements and recurring complaint fixes in the custom-game worktree/branch. Never mix custom behavior into retail-matching commits.
- When an investigation passes through a system, understand and decompile its coherent code/data boundary rather than stopping at a superficial patch. Use semantic game-domain names only when supported by assembly, data flow, callers, layouts, and gameplay evidence; otherwise keep conservative address-derived names and record the hypothesis.
- Respect the original authors and maintainers by preserving their style, naming conventions, organization, attribution, licenses, toolchain, and review expectations. Keep AI branding and personal rewrites out of contribution files. Standing user authorization now permits automatic save/commit/push of a coherent `ches-dev` retail reconstruction unit only after both exactness gates pass: target bytes are 100% retail-exact and the integrated/full-ROM build is 100% retail-exact through a saved/reproducible build path. Partial research, private docs, custom-game work, pull requests, and publication still require separate authorization.
- Preserve the intentional private worktree and keep research/checkpoints outside contribution commits. Verify exact ROM equality and review explicit staged paths before every retail contribution.

## Historical adjacent-effect production checkpoint - October 2, 2026

- `src/code_080A480C.cc` now source-links four consecutive retail routines: `func_080A480C`, `func_080A4944`, `func_080A49A0`, and `func_080A4A00`.
- `func_080A4944` matched **0x5C / 0** only after using a running values pointer rather than `values[i]`; production integration `sh_muq2l7f4_fea2e6d7` passed `fomt.gba: OK`.
- Constructor pair candidate `tools/ches/checkpoints/call238/next-080A49A0-pair-v1.cc` matched `func_080A49A0` **0x60 / 0** (`sh_muq2p867_334ae0d5`) and `func_080A4A00` **0x4C / 0** (`sh_muq2pfmv_f97b489c`) with no compiler changes.
- Controlled constructor-pair integration `sh_muq2tbfh_fabd01b0` passed full retail ROM. Production integration `sh_muq2uam9_aa65ca5f` also passed `fomt.gba: OK`.
- Explicit current SHA1 `sh_muq2ur9o_a4ba18f6`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- The remaining `asm/code_809E804.s` section is now `.text.after_func_080A4A00` and begins at local label `.L080A4A4C`; next named function is `func_080A4A94` at `0x080A4A94`.
- Current linked-code progress `sh_muq2upe0_825e5615`: **53,920 / 940,036 bytes in src = 5.7360%**; **886,116 bytes = 94.2640%** remain in asm.
- Compatibility compiler package v4 is now the validated exact compiler path for this source-converted branch. Fresh package build `sh_muq5r3xp_0f22f076` cloned pinned agbcc base `1caa6becde5e4676b59c31c74d68f45ced79557c`, verified/applied `generalized-compiler-candidate-v4.patch` SHA-256 `c72cc9c9b7b1cf71d2c602e08fee188e484645a39fc8c50013b96437cb0db04c`, and built `/mnt/data/Github/agbcc-fomt-compat-package-call238-v4` successfully.
- `next-080A4A4C-v4.cc` is **0x48 / 0** under package v4. The eighth structural behavior, `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS`, defers `prepare_call_address` only for non-decl `CONST_INT` call targets with register parameters. No FoMT address, symbol, pseudo ID, UID, or hard-register identity is encoded.
- Fresh-package validator `sh_muq5u5tf_811df27f` passed completely: terrain exact, water exact, all three lifecycle functions exact, `func_080A480C` exact, `0x080A4A4C` exact, all five focused canaries exact, saved 54-module corpus **54/54 changed 0 / total diff 0**, and source-converted full ROM `fomt.gba: OK`.
- The exact October-2003 Nintendo/Cygnus compiler still gives v4 source 0x48 / 8, so the eighth behavior remains documented as a compatibility reconstruction, not recovered Nintendo compiler fact.
- Gate 1 and compiler reproducibility/regression validation are satisfied. Do not commit/push yet because the new 0x48 source is not integrated into the retail link. Exact next action: controlled isolated source/asm/linker integration of `0x080A4A4C..0x080A4A93`, then identical production integration, explicit SHA1/progress proof, full affected-doc update, and automatic retail commit/push only if the integrated ROM remains exact.

## Current Call238 save - October 1, 2026

- Call238 remains private compiler research only. Contribution HEAD is still `ddf029670bc4b153d5caad9e1dded31f8fde0790` (`ddf0296`), branch `ches-dev` ahead 21 and not pushed. Production source, shared headers, canonical compiler, linker layout, and contribution history remain unchanged. Both hard functions remain retail assembly in production.
- Reusable decompilation workflow is now centralized at `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`; `AGENTS.md` and `START_HERE.md` route decomp work through it and state the source-level end goal explicitly.
- Clean isolated reconstruction tree: `/mnt/data/Github/agbcc-fomt-reconstruct-call238`, cloned from clean `/mnt/data/Github/agbcc-fomt-reference`; both use base `1caa6becde5e4676b59c31c74d68f45ced79557c`. Only `g++/cse.c`, `g++/combine.c`, `g++/flow.c`, and `g++/toplev.c` are intentionally modified.
- The current candidate has five generalized behaviors only: `AGBCC_PRESERVE_USERVAR_COPIES`, `AGBCC_RESTORE_COMBINE_COPY_REFS`, `AGBCC_PRESERVE_LITERAL_POOL_COPY`, `AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD`, and `AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE`.
- Terrain generalization: CSE preserves a source-variable -> source-variable copy when the next real SET overwrites the same destination; combine keeps the narrower immediate-self-update shape; eliminated uservar-copy weighted references are restored before allocation. The old `-8` hooks and temporary phase aliases/traces are absent.
- Water ancestry generalization: preserve the first register copy after a symbolic literal-pool load. This prevents premature CSE copy reversal and lets ordinary CSE form the retail stable -> moving -> common base dependency chain. The old pseudo-ID hooks `AGBCC_CSE_KEEP_FIRST_78` and `AGBCC_CSE_CHAIN_WATER` are absent.
- Water load-placement generalization: after CSE2, recognize a halfword load feeding a same-amount ASHIFT/LSHIFTRT extraction pair and hoist the first subsequent SImode symbolic literal-address load immediately after the halfword load. No FoMT symbol, hard-coded shift amount, UID, pseudo ID, function name, or address is used. The old `AGBCC_CSE_REORDER_WATER_TABLE` hook is absent.
- Final safety-hardened validation is complete: terrain **164/0**, water **168/0**, all five focused canaries exact, `tools/ches/checkpoints/call238/full-flow-regression/hardened3_results.tsv` = **54/54 / total diff 0**, and forced full-ROM candidate build `sh_mup4pun0_a281e666` passes retail SHA1: `fomt.gba: OK`. Canonical production restore `sh_mup4rumi_6b27ec0f` also passes `fomt.gba: OK`.
- Canonical production artifacts were restored afterward with `sh_mup48muv_08be8374`; normal `make -B -j4 compare` also ends at `fomt.gba: OK`. Production source/compiler remain unchanged and both hard functions remain retail assembly.
- Closed failures remain useful evidence: blanket uservar-copy preservation broke `code_0800BC58`; literal self-reference in the CSE follow-up source was too narrow; broad self-modified-SET liveness broke `code_0800BC58`; targeted terrain `-8`, water pseudo-ID, UID, and table-symbol hooks are superseded.
- Compatibility compiler packaging and source conversion are complete. Package files live at `tools/ches/checkpoints/call238/compat-compiler/`, with built tree `/mnt/data/Github/agbcc-fomt-compat-package-call238`. `src/water_region.cc` and `src/terrain.cc` now replace the former retail assembly bodies at `0x080A45A8` and `0x080AC5D0`; `asm/code_809E804.s` is split accordingly and `fomt.lds` places both source objects at the original slots. Package validator `sh_mupd8rm1_79d8c362` passes terrain 164/0, water 168/0, five canaries, saved 54/54 regression, and full-ROM SHA1. Plain canonical `make compare` fails after these source conversions because the two functions require the compatibility compiler; final working `fomt.gba` was restored with the wrapper and is exact. Exact next action: choose long-term compiler integration policy, then return to the next normal decompilation target.
- Unified candidate = all seven switches above. Verified final regression table `tools/ches/checkpoints/call238/full-flow-regression/structural_reorder_combined_results.tsv` contains **54/54 exact C++ modules, total diff 0**. This includes `src/code_0800BC58.cc` and the mutable-r0 canaries.
- Exact water roles remain result=`r8`, x=`r5`, y=`r3`, index=`r4`, map=`r7`, stable=`r6`, moving=`r2`, offset=`r1`, common=`ip`. Existing packed Location storage remains `u16 map:10; i16 x:16; i16 y:16`; do not change shared storage from private diagnostics.
- Scratch compiler containing the final switches is `/mnt/data/Github/agbcc-fomt-trace-call238/g++/cc1plus`. It is not the canonical production compiler. Historical compilers already tested/bounded remain recovered agbcc, coherent May-2000 `arm-000512`, real Oct-2003 Nintendo THUMB, May-2000 C frontend, stock GCC 2.7.2.3, EGCS 1.1.2, GCC 2.95.3, and GCC 2.96.
- Exact next work is no longer “find the missing three terrain bytes.” Instead: reconstruct the final isolated compiler modifications from a clean tree, determine which of the seven switch behaviors have a coherent/historical general explanation, remove pseudo/function-specific diagnostics where possible while preserving terrain 164/0, water 168/0, and 54/54 exact regression, then run wider/full-ROM validation. Only after that should a separate FoMT-specific compiler package or production source conversion be proposed.
- Mandatory anti-rediscovery registry: `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`. Chronology/evidence: newest tail of `tools/ches/checkpoints/call238/checkpoint.md`. Do not repeat Call236/Call237 source-family or compiler-version searches without new evidence.

## Current Call237 save — September 27, 2026

- Live contribution HEAD is `ddf029670bc4b153d5caad9e1dded31f8fde0790` (`ddf0296 decompile time period classifier`), branch `ches-dev...ches/ches-dev [ahead 21]`. Call237 created no contribution commit and changed no production source.
- Terrain `func_080AC5D0` remains at the 164-byte / 3-linked-byte staged best. Call237 closed loop-invariant terrain loads, relative-row identities, member-function ABI, and remaining local-top scalar-width ideas; none improved the plateau.
- Water `func_080A45A8`: the preferred structurally credible baseline is now `region, x, y, index, map`, 172 bytes / 103 differing linked bytes. It matches retail's early index-before-map initialization order but still rotates x/y/index/map/table state into the wrong hard registers.
- New Call237 evidence improves the water diagnostic to 172 / 102 when the packed Location `y` value is represented or returned as a 32-bit signed type. This moves x into retail's correct `r5`. The effect is specific to y representation; x and map field/getter base types do not cause it. Do **not** change shared `include/actor.hh` from this diagnostic alone.
- Call237 also closed coordinate staging, loop-control spellings, 32-bit index/map aliases, index-expression casts, direct inlined coordinate getters, and manual split record-pointer forms. Retail's dual moving-pointer/byte-offset loop remains an optimizer artifact of ordinary indexed global-array access.
- Exact next step: compare the 102 candidate's allocator dump against the 103 baseline, identify the priority change that places x in `r5`, and cross-check Location field/getter representation against already-matching functions before considering any shared header correction. Then target y=`r3`, index=`r4`, map=`r7`, table base=`r6`, offset=`r1`, moving pointer=`r2`, alias=`ip`.
- Durable checkpoint: `tools/ches/checkpoints/call237/checkpoint.md`. Production remains retail assembly for both hard targets.

## Current Call236 continuation — September 27, 2026

- Contribution HEAD is now `ddf0296 decompile time period classifier`, following exact adjacent commits `3552f9a` (GetMapData) and `aa59a0a` (time schedule lookup). This continuation created none of those commits. `make -j4 compare` was rerun at `ddf0296` and passes with `fomt.gba: OK`.
- Production remains unchanged by the current continuation. All new work is private Call236 research under `tools/ches/` and scratch output.
- Terrain `func_080AC5D0` remains at the 164-byte / 3-linked-byte staged best. Additional copy, alias, signature, type-bridge, algebraic, and inline-helper families did not improve it.
- Water `func_080A45A8`: natural remains 172 / 107; predeclared index gives 172 / 103; existing `rxbiym` remains the lowest raw diagnostic at exact nominal size 168 / 85 but has wrong operation/register structure. Signature, nested-bounds, map-form, loop-local record, preindex alias-subset, and explicit dual-pointer crosses found no exact source.
- Strongest new water evidence: short alias-subset candidates can reach `x=r5`, `y=r3`, `index=r4`, and offset `r1` together, or can independently reach `map=r7`, proving the scalar allocation is reachable. The remaining blocker is preserving retail's stable table base `r6` + `ip` alias + moving `r2` + byte offset `r1` without strength reduction.
- Full details and rejected families are appended to `tools/ches/checkpoints/call236/checkpoint.md`.

## Active Call236 — September 23, 2026

`IsFootprintOnWaterSurface` / `func_080AC5D0` remains the active target. Production is unchanged at contribution HEAD `98eaff2`; no new commit or staged contribution exists. Call236 tested focused expression, alias, helper, signature, qualifier, declaration-order, aggregate-parameter, and loop-lifetime variants without improving the inherited three-linked-byte mismatch. RTL dumps prove the core tradeoff: the natural expression creates retail's `r0` temporary but allocates terrain/top as `r3`/`r4`, while staged shifting allocates top/terrain as retail `r3`/`r4` but computes in place. A redundant outer loop guard produces an exact prefix but moves the loop-row copy after its comparison, leaving six differing linked bytes. Ordinary namespace inline helpers, const/return-type signature changes, all 24 bound-declaration orders, grouped declarations, mutating-top loops, distinct signed/unsigned row types, ABI-compatible coordinate wrappers, dominated duplicate checks, shared-exit forms, terrain aliases, top wrappers, and split top-use copies did not combine the two desired allocation properties. Compiling without `-g` is code-identical. All later bytes of the staged candidate remain exact.

Durable details, rejected variants, and the exact continuation constraints are in `tools/ches/checkpoints/call236/checkpoint.md`. This active section supersedes the Call235 next-action paragraph below while preserving its completed contribution record.

### Focused compiler probes — September 24, 2026

Self-contained exact-flag probes reproduced the 164-byte terrain baselines and rejected simple mask, split-shift, relative-row, explicit-row, and guarded-loop variants; none solved the three-byte mismatch. Water probes reproduced the 172-byte natural result and rejected in-loop map extraction, mixed pointer/index, and combined-initializer forms. The available retail water disassembly shows 166 code-and-literal-pool bytes in total, including an eight-byte pool; the nominal final two bytes of the 168-byte range remain unspecified and must not be claimed as verified. No repository source or compiler file changed. Full results and artifact paths: `tools/ches/checkpoints/call236/gpt-5.6-sol-matching-handoff.md`.

### Focused allocator follow-up — September 25, 2026

Direct comparison of the natural and staged GCC RTL/allocation dumps reconfirmed the exact priority boundary and verified from `global.c` that allocno ordering is solely the reference/live-length formula, with allocno number only breaking exact ties. Nineteen sequenced row/top relation forms and fifteen algebraic/Boolean early-guard forms produced no exact candidate: nearly all canonicalized to the natural ten-byte mismatch, one reproduced the known six-byte guarded result, and explicit Boolean/delta forms grew substantially. Mary and non-private source searches found no independent reconstruction. Production, HEAD, staging, and the preserved private worktree remain unchanged. Full findings are in the Call236 checkpoint.

### September 26 continuation

Terrain remains at the inherited 164-byte, three-linked-byte best. New identity-mutation, self-reassignment, repeated-expression/CSE, scalar-type, and algebraic-equivalence searches produced no exact candidate and closed those source-shape families. The three-byte issue remains specifically the conflict between retaining a separate short-lived `y - 8` pseudo and giving long-lived `top` enough allocation priority to take retail `r3`.

The water classifier now has a more precise allocation model. In the retail-shaped `region, x, y, index, map` source order, result/location/moving-record-pointer are already correct at `r8/r2/r2`, while the shared/stable table bases, byte offset, map ID, index, y, and x are rotated into the wrong hard registers. A credible source form that moves the table group to shared base `ip`, stable base `r6`, moving pointer `r2`, and byte offset `r1` should allow the remaining priorities to cascade toward retail `map=r7, x=r5, index=r4, y=r3`. Broad coordinate/type/qualifier/condition/declaration-shape searches are now closed. A left-field alias proves table-base lifetimes are a real lever; crossing it with declaration order produced a diagnostic 168-byte candidate with 85 differing linked bytes, the lowest water mismatch count so far, but its operation/register structure is not credible enough to integrate. Production and contribution files remain unchanged. Full scripts, RTL mapping, rejected directions, and exact continuation constraints are in the Call236 checkpoint.

## Current handoff — September 22, 2026 (session wrapped at user request)

**Authoritative resume entry:** root `AGENTS.md`, then `START_HERE.md` and `tools/ches/NEXT_AGENT_HANDOFF.md`. Latest checkpoint: `tools/ches/checkpoints/call236/checkpoint.md`. This section supersedes the historical stop points and HEAD values below.

- Branch `ches-dev`; current HEAD `98eaff21295c74591b1d9f242e25f38683ef9489`.
- Session started at `d4ef6ba` with private README/docs/tools work and an untracked `src/game_object_discard.cc`. That source has been preserved, finished, integrated, and committed.
- `3a5e0ee decompile discarded item handler`: `func_0801EE00`, 0x0801EE00..0x0801F14B, all 844 bytes exact. No fixed-register locals, padding, volatile, inline assembly, or compiler modifications. A shared inline effect factory fixes constructor-argument scheduling; cleanup uses the repository SmartPtr.
- `98eaff2 reconstruct terrain layout and water region data`: shared `TerrainInfo` and `TerrainMapView`, public water-region interface, and eight exact 24-byte rectangle records at 0x0810563C..0x081056FB. The following 12 bytes remain untouched assembly data. Classifier and terrain predicate remain retail assembly.
- Final `make -j4 compare` passed with exit 0. SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; ROM size 8,388,608 bytes. `make progress`, staged diff review, and `git diff --check` passed. See Call235 `final-build.log` and `verification.log` (the latter was captured before creating 98eaff2).
- Matching code coverage: **52,536 / 940,036 bytes (5.5887%)**; assembly 887,500 bytes. The 192-byte data contribution is not code coverage.
- Final index empty. Only preserved private work remains: `M README.md`, untracked `AGENTS.md`, `START_HERE.md`, `docs/DECOMP_NOTES.md`, `docs/REPO_MAP.md`, `tools/ches/`. No push.
- Custom-game worktree `/mnt/data/Github/gba/fomt-custom-game-worktree` is clean at `60eacca`. Its old throwing restriction was reverted. No custom-game merge, new behavioral guard, or emulator test this session.
- Important behavioral constraint: `func_0802F0EC` clears the held item BEFORE GameObject callback +0x158 / `func_0801EE00`. Any later custom-game rejection belongs before clearing, around `ClassifyHeldItemAction`; an early return from the discard handler alone can lose an item.
- Unresolved: `IsFootprintOnWaterSurface` / `func_080AC5D0` is 164 bytes with 3 differing register-selection bytes after an exhaustive Call236 allocator/lifetime search. `GetWaterRegion` / `func_080A45A8` natural source remains 172 bytes with 107 differences; the retail-shaped `rxyim` declaration order is 172 bytes / 103 differences, and the lowest raw diagnostic is now an exact-size 168-byte left-alias/order candidate with 85 differences. That 85-difference candidate has the wrong operation/register structure and must not be integrated. Both functions remain retail assembly. See the Call236 checkpoint; do not adopt semantically broken fixed-register or over-optimized alias trials.
- Exact next target: continue `func_080AC5D0` only from the recorded allocator constraints, not broad syntax guessing. The bounded secondary target is `func_080A45A8`, now narrowed to lifetime/loop structure rather than declaration order; adjacent `GetMapData` at 0x080A4698 is an optional dependency. The separate actor boundary remains `func_0809C600`.
- Legacy mandatory checkpoint remains Call240. Batch numbers describe coherent investigations/contributions, not individual tool calls. Save findings and update this current handoff after each coherent verified unit and before context compaction or stopping; keep private research outside contribution commits.
- Original untracked source: `tools/ches/checkpoints/call234/discard.initial.cc`. All earlier `/mnt/data/game_object_discard.*` experiments remain untouched.
- Recovered preceding wrapper thread: `01a0bd0f-03c8-7311-947e-b00c984550a1`; rollout `/mnt/data/Ches/codex-bridge-home/sessions/2026/09/20/rollout-2026-09-20T12-24-33-01a0bd0f-03c8-7311-947e-b00c984550a1.jsonl`. No bridge services were changed.

## Stop point
Active on September 18, 2026. Character-name lookup is committed as `54a7d2c decompile character name lookup`, preserving the original address and exposing the fixed 0..42 range plus dynamic child-name exception. `make progress` now reports 49,304 matching C/C++ bytes (5.2449%). Private research files remain unstaged. Current expansion target is making the underlying fixed name-table/data boundary editable without guessing the unresolved metadata word.

## Repository invariants
- Repo: `/mnt/data/Github/gba/fomt`
- Branch: `ches-dev...ches/ches-dev`
- HEAD: `54a7d2c` (`decompile character name lookup`)
- ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
- Call180 wrap-up: `make compare`, `sha1sum -c fomt.sha1`, JSON parsing, and `git diff --check` passed after the input source integration.
- Staged contribution index remains **EMPTY**.
- Existing private work remains unstaged:
  - `M README.md`
  - `?? START_HERE.md`
  - `?? docs/`
  - `?? tools/ches/`

## Latest contributions
- `54a7d2c decompile character name lookup`: matching `GetCharacterName`, fixed character-ID bounds, dynamic child-name path, and focused expansion documentation.
- `7c0f731 add decompilation progress target`: `make progress` and `docs/PROGRESS.md` track exact linked-code coverage plus expansion milestones.
- `2ebe870 decompile save slot offset helper`: matching `GetSaveSlotOffset`, public save geometry constants, and documentation for the proven 0xAF0-byte per-slot extension tail.
- `1adbd71 decompile key input helpers`: seven matching input helpers and their public interface.

Do not stage all of docs/ or tools/ches/. The existing README, START_HERE, DECOMP_NOTES, REPO_MAP, and research tools remain private. No push was performed.

## Top-priority research standard

### Reviewer-respect standard

User instruction, September 18, 2026: assume maintainers and experienced decompilation contributors may be strongly skeptical of AI-assisted or “vibe-coded” work. Interpret the goal as avoiding aggravation and earning trust through the work itself.

- Make every public contribution small, conventional, reviewable, and supported by exact ROM/assembly/control-flow evidence.
- Match repository style and terminology. Do not flood the fork with generated scaffolding, speculative renames, verbose commentary, or unrelated cleanup.
- Separate proven behavior from hypotheses. Do not present descriptive names as recovered original developer names.
- Explain unusual matching constructs and modding-facing constants so a manual reviewer can reproduce the reasoning.
- Run byte-perfect comparison, SHA1 verification, and staged-diff review for each contribution. Keep scratch logs and private research out of commits.
- Credit and preserve existing project work; do not imply prior manual discoveries were produced in this session.
- Public commit messages and documentation should discuss the technical change and evidence, without promotional AI language. Do not misrepresent authorship or evade any disclosure requirement if one applies.
- Prefer fewer high-value expansion-enabling commits over a large volume of low-impact decompilation.

User priority, clarified September 17, 2026: prioritize expansion-enabling work that attracts content creators: adding characters, scenes/events, maps, dialogue, sounds/music, and graphics. Choose matching decompilation, editable data, documented extension points, and tools that remove concrete obstacles to those additions. Generic cleanup, input helpers, and isolated naming work are lower priority unless needed for a specific expansion feature. Preserve the byte-perfect baseline and keep optional new content/behavior separate from matching reconstruction.

The bounded input-helper contribution already implemented should be finalized without expanding its scope: seven helpers at 0x0800912C..0x080091A3 now compile from `src/key_input.cc`, with `include/key_input.hh` and linker placement preserving all original addresses. `make compare` and SHA1 checks passed. The bounded key-input contribution is committed locally. Next choose a bounded character/scene expansion prerequisite by tracing existing script, actor, and resource interfaces; report actual extension limits rather than claiming new-content support prematurely.

User instruction, September 17, 2026: minimize guessing by cross-checking gameplay interpretations against existing online documentation of Harvest Moon: Friends of Mineral Town.

- Before promoting a gameplay-semantic name or publishing a mechanics explanation, consult relevant documented behavior for the original GBA game. Check title, platform, region/version where relevant; distinguish More Friends of Mineral Town and the Story of Seasons remake.
- Prefer original manuals and other primary evidence when available; use established specialist guides and community research as additional evidence. Record the source URL, the specific supporting claim, and relevant version details in the research notes.
- Keep assembly/ROM facts, externally documented gameplay, and interpretation explicitly separate. A matching ROM proves binary preservation; it does not prove a semantic interpretation. A gameplay guide does not establish an internal pointer or structure layout.
- Use documented mechanics to guide narrow investigations. Require exact code/data-flow evidence for internal claims, and investigate disagreements rather than forcing a match or silently choosing the expected explanation.
- If documentation is unavailable, ambiguous, or conflicting, retain conservative names and mark the interpretation unresolved. Never claim a source was checked without actually consulting it.
- Call170's fishing input provenance is proven from code. On September 17, 2026, the original FOMT fishing guide at https://fogu.com/hm4/farm/fishing.htm independently corroborated B-button charging/casting and bite-response reeling. See `tools/ches/checkpoints/call170/online-crosscheck.md`; the guide does not prove internal layouts or TerrainInfo semantics.

## Current research target
Completed: fishing-state `[r4+4] & 2` in `func_0802F0EC` reads the B-button new-press halfword of a stack input record. It is not `TerrainInfo::bit1`.

Established chain:
1. Fishing case30 r4 equals the **first word loaded through the second argument passed to `func_08017C30`**, not that argument address itself.
2. `vtable_unk_080E5EC4` is the GameObject base interface:
   - +0x08 `func_080179CC`
   - +0x0C `func_08017C30`
   - +0x10 `func_080182C8`
3. `func_080175B4` constructs the 0x10CC-byte GameObject and initializes that base interface.
4. `func_0801FB7C` allocates the object, calls `func_080175B4`, and returns/stores it.
5. Call150 proved exactly **three direct factory call sites**:
   - two in `sub_080D8178` (factory mode r3=0 and r3=1)
   - one in `func_08014AF8` (r3=0)
6. In `func_08014AF8`, the new GameObject is installed at **owner + 0xA8** (`r5+0xA8`), where owner is the scene implementation at handle+4.
7. Handle vtable `0x080E5E64 +0x0C` reaches `func_08012028`, which passes that same owner to `sub_080D8178`. This is its run path, not an unrelated owner.
8. In that run frame, S+0x564 stores owner+0xA8; S+0x10 is the key-input record. At `0x080DAB0C`, GameObject slot+0x0C receives r1=S+0x4C0, with `[S+0x4C0]=S+0x10`.
9. `func_08017C30` copies that first word into its entity-update wrapper. `func_08024CD0` forwards it as fishing r4.
10. `func_08009268 -> func_08009190 -> func_08009158 -> func_0800912C` polls KEYINPUT and computes record+4 as current keys AND NOT previous keys. Bit1 is B.

## Exact next move
Call183 begins the expansion-focused pass: map character identity tables, NPC/actor construction, schedule records, script/dialogue loading, and hard-coded capacities. Select the smallest exact prerequisite that makes adding a new character or scene materially easier; keep matching reconstruction separate from optional expansion behavior.

## Terrain bit1 status
Exact:
- normal collision blocks descriptor bit0 OR bit1;
- alternate collision ignores bit1 and blocks only bit0;
- thrown Ball special path tests bit1;
- bit1 geometry/content strongly corresponds to water-surface cells.
Resolved negatively:
- fishing `[r4+4]&2` is a newly pressed B-button test, not a descriptor test. Water/special-surface semantics retain strong independent support, but this fishing check supplies no direct terrain proof.

## Durable evidence
- `tools/ches/checkpoints/call180/contribution-status.md`
- `tools/ches/checkpoints/call180/verification.log`
- `docs/KEY_INPUT.md`
- `tools/ches/checkpoints/call170/online-crosscheck.md`
- `tools/ches/map_warp_map.json`
- `tools/ches/checkpoints/call170/fishing-input-proof.md`
- `tools/ches/checkpoints/call150/`
- retained Call149 full output copied to `tools/ches/checkpoints/call150/call149-factory-owner-full.log`

## Existing contribution commits
Latest contribution is the local `decompile key input helpers` commit created after Call181 review; fishing provenance itself remains research-only.
## Call190 checkpoint
- Call189 executed but failed before extraction because the retained Call188 log did not match the assumed line-oriented section-header format; no repository mutation occurred.
- Call190 mandatory checkpoint passed: `make compare`, ROM SHA1, and empty staged index verified.
- Next executed call: Call191. Use the Call190 byte/text fingerprint of the retained Call188 log before attempting extraction; do not repeat the failed `grep '^=== '` assumption.

## Call192 character-ID split
- Call191 proved character-facing loops/accessors use IDs 0..0x2A (43 slots), while only 32 unique dedicated NPC allocator wrappers were found.
- Call192 decodes the 43 8-byte `gUnk_08104258` character records and the exact `func_080A0030` persistent-object mapping to separate logical character IDs from concrete entity allocator classes.
- Next executed call: Call193. Next mandatory checkpoint: Call200.

## Call193 character-ID reconstruction
- Narrowed Call192's truncated output rather than rerunning it.
- `func_080A0030` subtracts 1 before its 42-entry jump table: external character IDs 1..42 map to persistent character objects; ID 0 follows the default/special path.
- `func_0809FE3C` accepts display-name IDs 0..42; ID 35 (`0x23`) has a special dynamic-name path, while the table still contains a blank placeholder there.
- Call193 reconstructs the exact ID/name/metadata/persistent-offset table and inspects the special helper(s). Next executed call: Call194. Next mandatory checkpoint: Call200.

## Call194 special character + runtime factory trace
- Call193 established IDs 1..34 as mostly 0x14-byte Npc records with 0x18-byte Bachelorette gaps, IDs 36..42 as 0x24-byte HarvestSprite records, and ID35 as a conditional special object selected by `func_080A0384`.
- Call194 traces the special ID35 object's constructor/accessors and correlates persistent character offsets against the 32 concrete ANpcEntity allocator wrappers.
- Keep logical character IDs, persistent-object types, and runtime entity allocator classes distinct unless the wrapper evidence explicitly connects them.
- Next executed call: Call195. Next mandatory checkpoint: Call200.

## Call195 ID35 and factory-caller narrowing
- Call194 host-size check confirmed `sizeof(Npc)=0x14`, `sizeof(Bachelorette)=0x18`, `sizeof(HarvestSprite)=0x24`, exactly matching Call193 persistent-record deltas.
- The special ID35 object is an Npc-derived named object: its helper family constructs an Npc base, stores a <=12-character name at +0x14, and carries extra state through at least +0x26. Identity remains evidence-driven pending constructor/caller/string correlation.
- Call194's allocator census is corrected to 35 ANpcEntity-related wrapper candidates. They do not directly embed GameState persistent-character offsets, so Call195 moves to their callers.
- Next executed call: Call196. Next mandatory checkpoint: Call200.

## Call196 ID35 proof narrowing
- Call195 produced ~1.9 MB and was truncated in live delivery; Call196 narrows the saved result instead of rerunning it.
- Working hypothesis entering Call196: character ID35 is the player's child, because it is the sole dynamic-name character, stored as a special Npc-derived object at GameState+4 with a <=12-byte custom name and age/state-like extra fields. This must be promoted to fact only if constructor/caller/event/string evidence closes it.
- Runtime entity mapping remains separate from persistent-object identity; Call196 searches specifically for consumers of the GameState+4 object and ID 0x23.
- Next executed call: Call197. Next mandatory checkpoint: Call200.

## Call197 ID35 identity/runtime mapping
- Call196 was transport-noisy because retained text contained NUL bytes; no evidence was discarded, but Call197 avoids depending on grep over that log.
- Call197 directly inspects the ROM string at `gUnk_08104108`, the full special persistent-object helper family, all callers of the persistent character lookup APIs, and creation paths that can connect GameState+4 to a runtime ANpcEntity.
- Promote ID35 to a semantic name only on direct string/event/lifecycle evidence. Keep persistent identity and runtime allocator identity separate if the latter remains unresolved.
- Next executed call: Call198. Next mandatory checkpoint: Call200.

## Call198 direct ID35-child bridge extraction
- Call197 independently established explicit retail dialogue for a male player child: childbirth naming, fatherhood, walking/growth, and son's birthday text.
- Call198 extracts the previously truncated ID35 special-object constructor/name/caller evidence and searches exact child-event text references for a direct bridge to the dynamic-name object.
- Do not conflate the general crop/field constant 0x23 with character ID35; only character lookup/name APIs count for this mapping.
- Next executed call: Call199. Next mandatory checkpoint: Call200.

## Call199 ID35 semantic proof pass
- Call198 proves the special persistent object participates in a dedicated runtime entity path: `func_08036E70` obtains it via `func_080A0384`, tests its extra state, allocates a 0x8C-byte runtime entity, and constructs that entity through `func_080324BC`.
- `func_0809FE3C` proves character display-name ID35 returns this special object's +0x14 dynamic string. `func_0809EB20` is the direct entered-text writer for the same string.
- Call199 resolves the default string, the object reconstruction/name-entry callers, and the dedicated runtime factory path before deciding whether ID35 can be promoted to the player's son/child as an exact semantic identity.
- Next executed call: Call200 mandatory checkpoint.

## Call200 checkpoint — expansion pass / character ID35
- Checkpoint after executed Calls191-200. Staged index remained empty throughout research calls unless explicitly stated otherwise; Call200 revalidates exactness below.
- Character display-name IDs are bounded to 0..42 in `func_0809FE3C`; ID35 (`0x23`) is the sole special dynamic-name slot. IDs 1..34 primarily map to fixed Npc/Bachelorette storage, while IDs 36..42 map to HarvestSprite records.
- ID35 persistent storage is conditional: `func_080A0384` / `func_080A0A04` return object-at-container+4 only when the owning packed flag is set. The object is Npc-derived, has its dynamic name at +0x14 (max 12 characters), extra state at +0x24/+0x25/+0x26, and participates in daily updates.
- Correction from Call199: `gUnk_08104108` is an empty-string anchor (byte 0 is NUL), not a printable default name. `func_0809EA6C` therefore initializes this special object's name empty before later name entry.
- `func_0809FE3C(container,35)` returns special-object +0x14; `func_0809EB20` writes user-entered text to exactly that name buffer. Generic naming handler `func_080A3CF4` uses mode/case 4 for this special object; modes 0..3 name horse/cow/sheep/chicken, and mode 5 names the farmer.
- The same special object has a dedicated runtime-entity route in `code_entities_08034CEC.s`: presence is tested with `func_080A0384`; extra state influences behavior/variant; a 0x8C-byte object is allocated and passed through `func_080324BC`.
- Retail dialogue independently and repeatedly establishes that the player's post-marriage child is male in this version: birth scenes ask to name him / call him a son, later scenes discuss him walking/growing, and birthday dialogue calls him the player's son.
- Semantic promotion rule: label ID35 as the player's son/child only when Call200's mode-4 setup trace directly ties childbirth name-entry to `func_080A3CF4` case 4. If that final bridge remains unresolved, retain the narrower exact label `dynamic-name special Npc (strong child/son hypothesis)`.
- Expansion implication already proven: adding a new ordinary character is not just appending a name. Retail lookup/factory/storage paths contain hard-coded character-ID ranges and a special-case slot 35; expansion work must either extend those ranges/storage/factory dispatches or introduce a separate extension registry.
- Next executed call: Call201. Next mandatory checkpoint: Call210.

## Call211 ID35 child/runtime investigation
- Call210 proved the social block copied by `func_080D60B0` is structurally fixed from social+0x000 through social+0x477 (GameState +0x1CD4..+0x214B), including all 41 packed resident records and trailing state.
- CharacterNamePointers contains exactly 43 8-byte entries for IDs 0..42; the following 12 bytes are the unrelated `bad_alloc` string.
- ID35 is the only character-name special case: `func_0809FE3C` returns the mutable +0x14 name of the conditional object returned from social base by `func_080A0A04`; the naming UI writes that same buffer through `func_0809EB20`.
- Call211 traces that naming UI/event and special schedule/runtime path to decide whether ID35 can be promoted from strong child hypothesis to proven player son/child identity.
- Next executed call: Call212. Next mandatory checkpoint: Call220.

## Call212 semantic closure target
- Runtime bridge is now direct: the conditional special social object controls insertion of schedule `gUnk_080F29C0`, whose dedicated entity constructor is `func_08036E2C`; its update method `func_08036E70` reads the special social object through `func_080A0384` and the +0x25/+0x26 lifecycle fields.
- The generic naming handler `func_080A3CF4` uses case 4 exclusively for the special object (`func_080A0A04` -> `func_0809EB20`), alongside horse/cow/sheep/chicken and farmer-name cases.
- Call212 decodes the case-4 UI resources and mutation callers to establish the retail semantic identity from code/data rather than dialogue inference.
- Next executed call: Call213. Next mandatory checkpoint: Call220.

## Call213 retained Call212 extraction
- Call212 output was truncated in transport but retained intact at its execution log; Call213 extracts only the decisive early sections without rerunning Call212.
- Evidence target: identify naming-handler case 4 resource semantics and correlate its special-object mutation/lifecycle with the child-birth/name event path.
- Runtime identity bridge remains direct regardless of label: ID35 dynamic name -> conditional special social object -> `gUnk_080F29C0` -> `func_08036E2C` dedicated `ANpcEntity` -> `func_08036E70` lifecycle update.
- Next executed call: Call214. Next mandatory checkpoint: Call220.

## Call213 semantic closure: character ID35 is the player's child
- This is now proven directly from code/data, not dialogue inference.
- `func_080A3CF4` is the generic naming handler with modes 0..5. Its UI labels are exactly: mode0 `Horse's`, mode1 `Cow's`, mode2 `Sheep's`, mode3 `Chicken's`, mode4 `Child's`, mode5 `Your`.
- Mode4 resolves the conditional special object at GameState social base `+0x1CD4` via `func_080A0A04`, then writes the entered name to that object's mutable `+0x14` buffer via `func_0809EB20`.
- Character-name ID35 resolves that same special object's `+0x14` name; its conditional existence also gates schedule `gUnk_080F29C0` and dedicated runtime entity `func_08036E2C`, whose update path `func_08036E70` reads that same object and lifecycle fields.
- Therefore external/display character ID35 is the player's child. Retail dialogue further establishes the child is the player's son in this version.

## Call214 save/roster expansion boundary investigation
- With ID35 semantically closed as the player's child, the remaining question for true NPC addition is persistence rather than schedule representation.
- Call210 already established a structurally fixed social block from social+0x000 through +0x477 (GameState +0x1CD4..+0x214B), containing the conditional child object, fixed resident records, Harvest Sprites, and trailing social state.
- Call214 traces the exact save/load copy path and slot geometry to determine whether adding a new persistent resident requires widening the retail save record or can use unused save-tail space via an extension path.
- Next executed call: Call215. Next mandatory checkpoint: Call220.

## Call215 retained Call214 extraction
- Call214 executed successfully but its 5 MB stdout was transport-truncated; the full execution log is retained and Call215 extracts only the save/social evidence without rerunning the broad investigation.
- ID35 remains proven as the player's child.
- Evidence target is now exact: identify the fixed retail social serialization extent, the save-slot writer/reader geometry, and whether the established 0xAF0 unused slot tail is genuinely untouched and therefore suitable for a backwards-compatible extension record.
- Next executed call: Call216. Next mandatory checkpoint: Call220.

## Call216 save-tail proof target
- Call215 directly exposed the GameState copy boundary: social data begins at +0x1CD4, is copied by `func_080D60B0`, and the very next subsystem starts at +0x214C. Therefore the retail social block is exactly 0x478 bytes.
- Call216 determines whether save-slot bytes 0x34FC..0x3FEB are truly outside all retail write/read/checksum paths, rather than merely outside the reconstructed GameState payload.
- If confirmed, a mod can preserve the retail 0x478 social layout and persist added residents in an extension record in the unused per-slot tail, avoiding a destructive widening of legacy social structures/save offsets.
- Next executed call: Call217. Next mandatory checkpoint: Call220.

## Call217 save-record layout closure target
- Call216 proved the top-level serialized GameState copier only touches fields through the final structure beginning at +0x34DC; its caller allocates exactly 0x34F4 bytes for the serialized object.
- Each retail save slot starts at `0x28 + slot*0x3FEC`.
- Call217 traces `func_08011650` and the SRAM proxy primitives to establish whether the on-SRAM record is an 8-byte metadata/checksum header plus the 0x34F4 payload (occupied prefix 0x34FC), and whether checksum/read/write operations stop there.
- Only after that is proven should bytes 0x34FC..0x3FEB be documented as a safe retail-unused extension tail.
- Next executed call: Call218. Next mandatory checkpoint: Call220.

## Call218 exhaustive slot-tail audit
- Call217 proved the retail per-slot record format itself: 4-byte payload length at +0x0000, 0x34F4-byte serialized GameState payload at +0x0004, and 4-byte additive checksum at +0x34F8. The checksum is computed only over the 0x34F4 payload. The record therefore ends exactly at +0x34FC.
- Call218 audits every direct caller of the slot-base resolver `func_080003DC` and both low-level record helpers to determine whether any separate retail code path uses bytes +0x34FC..+0x3FEB.
- If no such path exists, the 0xAF0-byte range is not merely padding by arithmetic; it is proven retail-unused per-slot storage suitable for a mod extension record, while leaving the legacy payload and checksum untouched.
- Next executed call: Call219. Next mandatory checkpoint: Call220.

## Call219 save-tail audit closed
- Exhaustive static census found exactly 8 high-level SRAM writes, 9 high-level SRAM reads, 3 slot-base resolver callers, and 4 low-level SRAM-library call-graph branches.
- Header accesses stay within SRAM `0x0000..0x0027`; retail slot record accesses end at relative `0x34FB`. No source path accesses slot-relative `0x34FC..0x3FEB`.
- The 0xAF0-byte per-slot tail is therefore proven retail-unused and is suitable for a separately versioned mod extension record while preserving the legacy payload and checksum.
- Evidence: `tools/ches/checkpoints/call220/save-tail-audit.md`.

## Call220 mandatory checkpoint
- `make compare`, ROM SHA1, JSON parsing, and `git diff --check` passed. Staged index is empty.
- Branch `ches-dev`, HEAD `1adbd71 decompile key input helpers`. Only expected private research files are unstaged.
- Next executed call: Call221. Next mandatory checkpoint: Call230.
- Expansion-focused next step: turn the proven save geometry into a small matching, commit-ready save-format interface/documentation or decompile the smallest save helper that exposes slot bases and record boundaries. This directly supports persistent added characters without widening retail GameState.

## Call229 character-name contribution closed
- `54a7d2c decompile character name lookup` replaces `func_0809FE3C` with matching C++ at the original address and preserves `func_0809FE74` at 0x0809FE74.
- Public constants expose the retail ID range 0..42 and child ID35. Invalid IDs return the empty string; ID35 returns the persistent child's mutable name; all other valid IDs use the fixed 43-entry table.
- `make compare`, ROM SHA1, and staged-diff checks passed before commit. Matching source coverage increased to 49,304 bytes (5.2449%).

## Call230 mandatory checkpoint
- Exact build and SHA1 remain passing at HEAD `54a7d2c`; staged index is empty and only expected private research files remain unstaged.
- The old 0x164-byte `gUnk_08104258` incbin contains a 0x158-byte table followed by the unrelated 12-byte `bad_alloc` string.
- Next executed call: Call231. Next mandatory checkpoint: Call240.
- Next expansion target: trace `func_0809FE74` to resolve the table's two used metadata bytes before changing the data representation or publishing semantic field names.

## Call231 character-birthday metadata resolved
- `func_0809FE74` is a character-birthday lookup. Table byte +0x04 stores a one-based season/day birthday; the function converts it to the zero-based `GameDate` representation returned to callers.
- Table byte +0x05 stores an alternate birthday. It is consulted only for Popuri, Mary, Karen, Elli, Ann, and the Harvest Goddess, and replaces the normal birthday when it collides with the player's chosen birthday.
- Character ID35 delegates to the persistent child object's dynamic birthday helper. Invalid IDs return Spring 15 in the zero-based `GameDate` encoding.
- The remaining bytes +0x06..+0x07 are alignment padding: every retail entry has zero there, no ROM code references those offsets, and the only table users read the name pointer or birthday bytes.
- The table is now represented as `CharacterInfo[43]` with `CharacterBirthday` fields, and its old 0x164-byte incbin is split into the exact 0x158-byte table plus the unrelated 12-byte `bad_alloc` string. The rebuilt table region is byte-identical.
- `GetCharacterBirthday` now matches the retail 0x1BC-byte function exactly and replaces `func_0809FE74` at 0x0809FE74; the old assembly implementation has been removed.
- `make compare`, ROM SHA1, and `git diff --check` pass. Matching source coverage is now 49,748 / 940,036 code bytes (5.2921%).
- Commit `09aa483 decompile character birthday lookup` saves the matching contribution; unrelated workspace changes remain unstaged.
- Call231 is complete. Next executed call: Call232. Next mandatory checkpoint: Call240.

## Call232 character-to-social-record resolver
- `func_080A0030` is now exact-matching C++ as `GetCharacterNpc`. It maps external character IDs 1..42 to their fixed `Npc`-derived records in the 0x478-byte social-state block.
- Invalid IDs and ID0 return null. Character ID35 uses the conditional child-record helper, returning social+0x04 only when the child-present flag is set.
- The explicit offset map exposes the retail roster's heterogeneous record sizes: ordinary `Npc`, `Bachelorette`, Harvest Sprite, and conditional child records are packed at fixed offsets rather than stored in a uniform array.
- The original 0x1C8-byte assembly implementation has been removed. `make compare`, ROM SHA1, and `git diff --check` pass.
- Matching source coverage is now 50,204 / 940,036 code bytes (5.3406%).
- Commit `3c2bbc4 decompile character npc lookup` saves Call232 with only its three focused files.
- Call232 is complete. Next executed call: Call233. Next mandatory checkpoint: Call240.
- The prior instruction to decompile adjacent subset resolvers is superseded. Continue only with proven resident-extension choke points.

## Call233 resident-extension choke points and save writer
- Character lookup consumers remain hard-coded around retail IDs: name access reaches UI/script paths through `func_080126E4`, `func_080A2940`, `func_0805FF14`, `sub_08065B14`, and `func_08093364`; birthday access reaches native script/UI paths through `func_0803F8DC` and `func_08045638`; social-record access reaches the generic location helper `func_080A03B8` and the explicit ID1..42 friendship scan in `func_080A0518`.
- Schedule initialization is centralized but unrolled. **Corrected October 3:** `func_08010F54` calls `func_0803D7E4`, which applies 31 fixed descriptors plus the conditional child through `func_0803D688` (32 total). The original Call233 count was wrong; its prior text is preserved in the character-expansion checkpoint.
- **Corrected October 3:** the actual NPC entity factory is `func_0801A8E0`; `AEntity` vtable+0x30 allocates its render/effect object. Child vtable080E6918+0x30 ->08036F0C allocates a0x8C-byte effect. The `GameObject` +0x30 call in0802CDCC is map height, not entity construction. See the current character docs and correction checkpoint.
- Save/load has a clean compatibility seam: `func_08003F9C` calls the legacy writer, while `func_080040A0` and `func_080041DC` call the legacy loader. The writer touches only record-relative 0x0000..0x34FB; the proven 0xAF0-byte tail remains separate.
- Small exact contribution implemented: `func_08011588`, the 0x34FC size getter at 0x080115A8, and `func_080115B0` are now exact C++ as `CalculateSaveChecksum`, `GetSaveSlotRecordSize`, and `WriteSaveSlotRecord`. This exposes the legacy record-writing boundary without changing retail behavior or proposing a public extension layout.
- `make compare`, ROM SHA1, `git diff --check`, and `make progress` pass. Matching source coverage is 50,404 / 940,036 code bytes (5.3619%). Staged index remains empty.
- Contribution files for Call233 are only `asm/game_state.s`, `fomt.lds`, `include/save_format.hh`, and `src/save_format.cc`; Call232 was saved separately with its three previously identified files.
- Commit `cadc36a decompile save record writer` saves Call233 with only those four files. Call232 is saved separately as `3c2bbc4`.
- Branch is ahead 7 at HEAD `cadc36a`; only the pre-existing private README and untracked research files remain outside commits.
- Evidence: `tools/ches/checkpoints/call233/resident-extension-choke-points.md`.
- Next executed call: Call234. Next mandatory checkpoint: Call240.


## September 26 Call236 continuation

Production remains unchanged at contribution HEAD `98eaff2`; no contribution commit or staged change was created.

Terrain remains plateaued at the inherited 164-byte / three-linked-byte best candidate. New bounded sweeps of identity mutations, self-reassignment, coordinate signature widths, plain register storage, result-copy chains, and surrounding local types found no improvement. These families are now closed unless new RTL evidence specifically reopens them.

Water-region research produced a new private best linked-byte count. A left-field-only table alias combined with declaration order `region, x, y, index, map` builds to the nominal 168-byte range with 92 differing linked bytes, improving the prior 93/107-count candidates. It is not structurally close enough to integrate: retail still requires `x=r5, y=r3, index=r4, map=r7` plus the dual `r6/ip` table bases, moving `r2` record pointer, and `r1` byte offset. More aggressive field-alias masks can reproduce three of the four scalar registers but collapse the loop to 148-152 bytes, proving the allocator relationship while rejecting those source shapes.

New private search scripts are under `tools/ches/checkpoints/call236/`; scratch artifacts for the declaration-order cross searches are under `/mnt/data/Ches/tmp/`. No production source was changed.

Next useful water work should preserve the exact dual pointer/offset loop structure and vary only the source relation that determines scalar allocation. Do not return to broad declaration/type permutations already closed here.


## September 26 continuation correction

This supersedes the immediately preceding continuation note where it conflicts with the current repository state.

Actual contribution HEAD before this continuation was already `3552f9a decompile map data lookup`; that exact `GetMapData` contribution predates this continuation. No additional production contribution or commit was made during this continuation.

The previously recorded `rxbiym` water diagnostic remains the private raw mismatch leader at 168 bytes / 85 differing linked bytes. The new 168-byte / 92-difference `rxyim` left-alias/order result is supporting allocator evidence, not a new best. Terrain remains at the inherited three-linked-byte plateau.

Current next step: preserve the natural retail-shaped dual table-base / moving-record-pointer / byte-offset loop and target the table-base pseudo lifetime/allocation that must rotate the scalar registers into retail's x=r5, y=r3, index=r4, map=r7 assignment.


## September 26 exact contribution: time schedule lookup

Current contribution HEAD is now `aa59a0a decompile time schedule lookup`.

`func_080A4650` at `0x080A4650..0x080A4697` is now exact C++ in `src/code_080A4650.cc`. The 72-byte retail function indexes the 4x4 pointer table at `gUnk_08105708` by season and a six-hour time period, computes minute-of-day from hour/minute, and scans 4-byte `{u16 minute, u8 value, pad}` threshold records until `0xFFFF`. Parameter provenance is proven from the two game-state callers, `func_0800E324`, `func_0801A8C0`, and the packed `GameTime` layout.

The exact old-GCC source requires a cached threshold plus a non-const u16 sentinel and an explicit back-edge. Structured while/for forms loop-rotate and differ by 33 bytes. Production naming remains address-based because the returned 30-to-0 schedule value strongly resembles outdoor/light level but its final downstream semantics are not yet fully proven.

Post-commit verification: full retail compare passed; ROM SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; progress is 52,628 / 940,036 code bytes = 5.5985%; branch is ahead 20. Private working files remain unstaged.

Next useful direction: continue coherent adjacent `0x080A46xx` subsystem reconstruction or return to the allocator-sensitive water/terrain functions only when new evidence gives a causal source hypothesis.

### October 1 independent reproduction gate

- Fresh package-reproduction tree `/mnt/data/Github/agbcc-fomt-compat-repro-call238` was cloned from untouched base `1caa6becde5e4676b59c31c74d68f45ced79557c` and patched only with the saved 281-line candidate patch.
- Independent configure/build `sh_mup4z96y_3fdc5688` succeeded.
- Fresh-built validation: terrain 164/0, water 168/0, five canaries exact, `freshpatch_results.tsv` 54/54 exact / total diff 0, full-ROM `sh_mup527m9_c28ea72e` = `fomt.gba: OK`.
- Canonical restore `sh_mup52mrs_b3fbc717` = `fomt.gba: OK`.
- Reproducibility is CLOSED. Adoption plan: `tools/ches/checkpoints/call238/COMPATIBILITY_COMPILER_ADOPTION.md`. Next is package-local wrapper/validation, then readable C++ conversion of the two hard asm functions one at a time under explicit compatibility-compiler opt-in.
- Current linked-code progress after the two hard source conversions: **52,992 / 940,036 bytes in src = 5.6372%**, with **887,044 bytes = 94.3628%** still linked from asm. Before the 332-byte terrain+water conversion this metric was approximately 5.6019%, so Call238 moved the code metric by +0.0353 percentage points while also removing a compiler blocker that affected otherwise-correct source.
- Reusable acceleration tool added: `tools/ches/compare-function.py`. It preprocesses a one-function C++ candidate, compiles through the compatibility wrapper by default, assembles/links it at arbitrary retail start/end addresses using current symbols, and emits linked-byte mismatch plus disassembly diff/allocator artifacts. Validation against the known terrain candidate produced 164/0 in ~0.3s.
- Next ordinary decomp target is `func_080A46AC` (0x080A46AC..0x080A473F, 148 bytes), the first function in a coherent polymorphic class block after GetMapData. A neutral candidate at `tools/ches/checkpoints/call238/next-080A46AC.cc` now reproduces the exact 0x94-byte size but still differs by 96 linked bytes. Evidence establishes a provider pointer at +0x00, an 8-byte helper/handle subobject at +0x04, u16 at +0x0C, count at +0x10, up to 16 result bytes at +0x14, and vptr at +0x24. Remaining gap is codegen/source-structure, not gross semantics/layout; avoid random syntax scans.


## October 1, 2026 - post-Call238 ordinary decomp continuation

- Linked-code progress remains **52,992 / 940,036 src bytes = 5.6372%** after terrain+water source conversion.
- Reusable matcher upgraded: `tools/ches/compare-function.py` now supports `--symbol` to isolate one method from multi-method C++ scratch sources and repeatable `--defsym NAME=EXPR` for retail vtable/helper aliases. Backward compatibility validated with terrain **164/0**. Multi-method constructor isolation also validated.
- Next class cluster begins at `func_080A46AC` after GetMapData. Recovered layout is strongly evidenced: provider pointer +0x00; 8-byte helper subobject +0x04; u16 +0x0C; count +0x10; up to 16 byte values +0x14; polymorphic vptr +0x24.
- The realistic polymorphic constructor candidate is `tools/ches/checkpoints/call238/next-080A46AC-poly-natural.cc`. With `__vt_7UnkPoly=vtable_unk_080E82D8`, its selected constructor is exact size **0x94** and matches retail through 0x080A46D7. The remaining mismatch begins at retail's single extra `adds r1, r0, #0` before storing the helper value; canonical agbcc and the compatibility wrapper behave identically here, so this is not a compatibility-package regression. A forced r1 no-op constraint disturbed allocation elsewhere and was rejected.
- Stronger class-model proof: `tools/ches/checkpoints/call238/next-080A46AC-class2.cc` models the helper as a base subobject plus value and models the outer type as a normal polymorphic C++ class. Link aliases used for research: `__13UnkHandleBase=func_08007874`, `_._13UnkHandleBase=func_080079E8`, `__vt_7UnkPoly=vtable_unk_080E82D8`.
- The outer deleting destructor at retail `func_080A47B4` is now **EXACT 0x58 / 0 linked-byte differences** from that class model. Proof artifact: `tools/ches/function-match-artifacts/next-080A47B4-dtor6.mismatch.txt`; tracked run `sh_mupeidr5_1cfdab6c`. Exact source sequencing uses a pointer iterator, loads provider then vtable then byte, calls provider vfunc +0x4C, increments pointer/index, destroys helper, calls helper-base destructor with in-charge flag 2, then optional outer delete.
- Exact next action: resolve the constructor's one-copy codegen gap without target-specific assembly, then model/test alternate constructor `func_080A4740` (0x74 bytes) which shares the same helper construction pattern. Once both constructors plus exact destructor are source-matching, integrate the coherent class lifecycle block into production source and full-ROM validate with the compatibility wrapper. Do not integrate the scratch class before constructor matching is solved.


## October 1, 2026 - constructor local-alloc research checkpoint

- The two constructor source models are now independently validated as structurally correct apart from the same missing post-call hard-register copy:
  - `func_080A46AC`: natural polymorphic C++ candidate remains exact size 0x94; first divergence is retail `adds r1, r0, #0` after `func_08007B54`.
  - `func_080A4740`: natural alternate constructor is 0x70 vs retail 0x74; its four-byte deficit is the same missing two-byte `r0 -> r1` copy plus the resulting final alignment pad. All substantive constructor sequencing otherwise matches.
  - `func_080A47B4` destructor remains exact 0x58/0 from the realistic class model.
- RTL proof for the main constructor: the call result is initially a distinct local pseudo. Flow says register/pseudo 29 is used 2 times across 2 insns, set once. It survives CSE/combine/flow/regmove; local allocation later assigns it to r0, deleting the copy. Trace: `[lalloc] pseudo 29 -> r0 (qty 3, births 30, deaths 32, n_calls_crossed 0)`.
- `local-alloc.c` evidence: hard-register copy suggestions deliberately favor eliminating moves. Trace of the hard->pseudo path identifies the target as `ureg=0 sreg=29 save=1 refs=2 deaths=1`; the same path also sees other ordinary hard->pseudo copies, so no function/pseudo/register-specific rule is acceptable.
- Source-shape experiments are closed: named local, tiny wrapper value type, inline helper constructor, and natural constructor initializer all compile identically. Forced r1/no-op asm creates the copy but perturbs other allocation and is rejected.
- Research-only allocator experiments in isolated tree `/mnt/data/Github/agbcc-fomt-reconstruct-call238` now additionally modify `g++/local-alloc.c`. Production/package compiler is unchanged.
- `AGBCC_NO_CALL_RESULT_COPY_SUGG` experiment: suppressing the immediate hard-register copy suggestion had no effect; both constructors remain at their previous mismatches. Conclusion: normal local allocation independently still chooses r0.
- `AGBCC_EXTEND_CALL_RESULT_LIFETIME` experiment infrastructure is present and compiled. Quantities born from an immediate CALL_INSN hard->pseudo copy are tagged with `qty_call_result_copy`; current implementation extends allocation death from `qty_death` to `qty_death + 2`. This also had no effect on either constructor.
- Crucial boundary finding: `find_free_reg` computes used hard regs with `for (ins = born_index; ins < dead_index; ins++)`. Therefore original target lifetime birth=30/death=32 extended to death=34 still EXCLUDES index 34, exactly where the immediately following hard-register reuse can begin. The +2 test did not actually overlap that next boundary.
- Exact next experiment: change only the switch-gated call-result allocation death so it spans through the next boundary, minimum `MIN(insn_number * 2 + 1, qty_death[q] + 3)` (or an evidence-equivalent half-step). Rebuild isolated cc1plus and retest the two constructors first. If both become exact, immediately verify exact destructor and run canaries/54-module/full-ROM regressions before considering this a sixth compatibility behavior. If +3 still does not affect allocation, inspect `regs_live_at[32..35]` / hard r0 birth marking rather than guessing source.
- Temporary trace hook `AGBCC_TRACE_CALL_RESULT_SUGG` and no-suggestion hook remain in isolated `local-alloc.c`; they are research diagnostics, not package features. Current isolated cc1plus includes the +2 lifetime experiment. No production FoMT source was changed this turn and no commit/push occurred.

## October 1, 2026 - exact constructor allocator rule and pre-integration validation

- func_080A46AC is EXACT 0x94 / 0 linked-byte differences from natural C++ source tools/ches/checkpoints/call238/next-080A46AC-poly-natural.cc using the isolated reconstructed compiler.
- func_080A4740 is EXACT 0x74 / 0 from tools/ches/checkpoints/call238/next-080A4740-one-local.cc. Key source detail: a natural local u32 one = 1 carried across memset reproduces retail's r4 constant lifetime.
- func_080A47B4 remains EXACT 0x58 / 0 from tools/ches/checkpoints/call238/next-080A46AC-class2.cc.
- Final research-only allocator behavior lives in /mnt/data/Github/agbcc-fomt-reconstruct-call238/g++/local-alloc.c behind AGBCC_EXTEND_CALL_RESULT_LIFETIME=1.
- Structural discriminator: hard-register to pseudo copy immediately after CALL_INSN; call/copy/immediate consuming store all have RTX_INTEGRATED_P; pseudo is SImode with REG_N_REFS == 2 and REG_N_DEATHS == 1; next non-note insn is a single SImode MEM store whose source is exactly that pseudo; allocation death is extended to MIN(insn_number * 2 + 1, qty_death + 3).
- Why +3: find_free_reg scans born_index <= ins < dead_index, so +2 stopped before the next hard-register boundary and had no effect.
- Broader rule regressed src/script_engine by 1333 .text bytes. Requiring the integrated/inlined sequence restored script_engine exactly while keeping both constructors exact.
- Final validation under the narrowed rule: destructor 0x58/0; terrain 0xA4/0; water 0xA8/0; all five focused canaries exact; 54 saved modules changed 0 total_diff 0; forced full-ROM rebuild passed SHA1 with fomt.gba: OK.
- Important executions: constructor + script_engine targeted proof sh_mupfu6y3_bb3d5a02; final 54-module regression sh_mupfunsr_5ea0358c; forced full-ROM pre-integration PASS sh_mupfvcfw_32d657be.
- Final compiler env: AGBCC_PRESERVE_USERVAR_COPIES=1, AGBCC_RESTORE_COMBINE_COPY_REFS=1, AGBCC_PRESERVE_LITERAL_POOL_COPY=1, AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD=1, AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE=1, AGBCC_EXTEND_CALL_RESULT_LIFETIME=1.
- Production/package compiler files remain unchanged. Current build outputs were produced with the isolated compiler, but tools/agbcc/bin/agbcp was not replaced.
- Production integration boundary: linker order is src/code_080A4650.o(.text), src/map_data.o(.text), asm/code_809E804.o(.text.after_get_map_data). Retail lifecycle block occupies 0x080A46AC..0x080A480B at the beginning of .text.after_get_map_data; next asm function is func_080A480C.
- Exact next action: create an upstream-style source unit at this linker slot (likely src/code_080A46AC.cc) containing the coherent provider/helper/outer class plus both exact constructors and exact destructor; insert its object after map_data in fomt.lds; remove only func_080A46AC, func_080A4740, and func_080A47B4 assembly while leaving .text.after_get_map_data immediately before func_080A480C; build with isolated compiler + six switches and require full-ROM SHA1 exact; if integration passes, package/generalize the sixth allocator behavior into the compatibility compiler and rerun validate.sh.
- No production source/asm/linker mutation for this class block has happened yet. No commit/push occurred.

## October 1, 2026 - lifecycle production integration + six-rule package complete

- Production source integration is complete for the coherent lifecycle block `0x080A46AC..0x080A480B`.
- New source: `src/code_080A46AC.cc`, containing readable C++ for `func_080A46AC` (0x94), `func_080A4740` (0x74), and `func_080A47B4` (0x58). The three retail assembly bodies were removed from `asm/code_809E804.s`; `.text.after_get_map_data` now begins at `func_080A480C`.
- C++ ABI integration uses normal old-GCC destructor ABI plus linker aliases. `#pragma interface` suppresses duplicate local vtable emission. `fomt.lds` aliases `__vt_7UnkPoly`, `__13UnkHandleBase`, `_._13UnkHandleBase`, and `func_080A47B4`, and places `src/code_080A46AC.o(.text)` after `src/map_data.o(.text)` at the exact retail slot.
- Production integration full-ROM proof with cleaned isolated six-rule compiler: `sh_mupgd3fb_ec5bfeb0` -> `fomt.gba: OK`.
- Final compatibility patch regenerated at `tools/ches/checkpoints/call238/generalized-compiler-candidate.patch`: 400 lines, SHA-256 `9fbaaf6a4947a45d7ac90ba763b850bd95de81499d1f4c2e1d73db2a7ff12ac3`.
- Compatibility package upgraded to six behaviors. Fresh build directory: `/mnt/data/Github/agbcc-fomt-compat-package-call238-v2`. Fresh clean-base build `sh_mupgfpis_dc629328` succeeded.
- Final package validation `sh_mupggswl_4692cc57`: terrain 0xA4/0; water 0xA8/0; lifecycle main 0x94/0; lifecycle alt 0x74/0; lifecycle destructor 0x58/0; five focused canaries exact; saved regression corpus 54/54 changed 0 / total diff 0; full source-converted ROM `fomt.gba: OK`; validator reports compatibility compiler PASS and full-ROM PASS.
- Current linked-code progress: **53,344 / 940,036 bytes in source = 5.6747%**, with **886,692 bytes = 94.3253%** still linked from assembly. This lifecycle block added 352 exact source bytes, moving progress from 5.6372% to 5.6747%.
- Concise anti-rediscovery ledger created at `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`. Read it before reopening compiler/version/source-shape families; detailed history remains in `EXPERIMENT_INDEX.md`, registry, checkpoint, and compiler research notes.
- Reusable decompilation skill was expanded with the generalized lessons from this investigation: stop syntax roulette once RTL converges, inspect allocator interval semantics, validate realistic multi-method C++ units, handle old C++ destructor/vtable ABI carefully, treat linker placement and generated sections as part of matching, require full linked binary/hash beyond `.text` corpora, and maintain a concise failure ledger.
- Exact next decompilation action after bookkeeping: continue the same coherent class/subsystem at retail `func_080A480C`, using the recovered object layout, six-rule compatibility wrapper, and `tools/ches/compare-function.py` rather than restarting compiler research.
- No commit or push performed.


## October 1, 2026 - lifecycle integration complete

- `src/code_080A46AC.cc` now replaces retail `func_080A46AC`, `func_080A4740`, and `func_080A47B4`.
- The production lifecycle translation unit is exactly 0x160 bytes of .text and uses `#pragma interface` to suppress a duplicate weak vtable while retaining the retail vtable in `asm/vtables.s`.
- `fomt.lds` provides the required old-GCC C++ ABI aliases and inserts `src/code_080A46AC.o(.text)` after `src/map_data.o(.text)` and before the remaining `.text.after_get_map_data` assembly.
- The assembly bodies for 0x080A46AC..0x080A480B were removed; `func_080A480C` remains the next assembly function.
- Fresh six-rule compatibility package v2 built from the pinned clean base at `/mnt/data/Github/agbcc-fomt-compat-package-call238-v2`.
- Fresh package validation `sh_mupkuyqn_64244b58`: terrain exact; water exact; lifecycle main/alt/destructor exact; five focused canaries exact; saved 54-module corpus 54/54 total_diff 0; full retail ROM SHA1 exact.
- Current linked-code progress: **53,344 / 940,036 bytes in src = 5.6747%**; **886,692 bytes = 94.3253%** remain in asm.
- Comprehensive anti-rediscovery ledger: `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`. Read it before reopening compiler/version/source-shape experiments from Call238.
- Generic reusable lessons were also distilled into `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`.


## October 1, 2026 - func_080A480C graphics-transfer queue checkpoint

Target:
- retail range `0x080A480C..0x080A4944`, size `0x138` / 312 bytes;
- next assembly function after the completed lifecycle block;
- high-leverage routine used broadly by entity/game-state setup.

Recovered semantics:
- arguments are `(effect/base object, graphics-transfer queue, graphics blob)`;
- graphics blob is effectively `{data, u16 size}`; zero/null yields early return;
- `func_08007D4C(&handle, handle.value)` resolves a resource/VRAM slot and genuinely consumes the second argument in r1;
- destination is `0x06010000 + (slot << 5)`;
- `func_08008F0C` is constructor-like for a 16-byte graphics/DMA transfer descriptor `{mode, source, destination, control}`;
- the descriptor is appended to a vector-like queue with old SGI/libstdc++ reallocation logic.

Historical source evidence:
- recovered 2001-era libstdc++ `vector::_M_fill_insert` structure matches retail almost verbatim:
  `old_size + max(old_size,n)`, allocate, uninitialized_copy(begin,position), uninitialized_fill_n, uninitialized_copy(position,end), destroy old, deallocate old, update start/finish/end_of_storage.
- call is effectively insert-at-end with `n = 1`.
- historical `__normal_iterator` is a one-pointer wrapper; old library has normal-iterator-specific copy dispatch/unwrapping.
- queue retail offsets are start +0, finish +4, unused/unknown +8, end_of_storage +0x0C; do not force canonical std::vector object layout until +8 is explained.

Scratch candidates, all non-production under `tools/ches/checkpoints/call238/`:
- v1 `next-080A480C.cc`: 0x128, 266 differing bytes; direct hand-coded append.
- v2: 0x130, 262 diffs; added old-STL max-by-reference/source scaffolding.
- v3: volatile `new_begin` spill; 0x13C; rejected semantic hack.
- v4: 0x134; recovered exact 28-byte frame/spill shape but worsened allocation.
- v5: 0x128, best earlier raw mismatch 222; saved old_end only in reallocation branch.
- v6: literal vector-like class/FillInsert abstraction; 0x164, 313 diffs; too much unsimplified helper scaffolding.
- v7: **best structural base**; 0x134, 242 diffs; exact 28-byte frame, old_size at sp+0x10, n=1 at sp+0x14, new_start spill at sp+0x18, close SGI-STL structure.
- v8: same core algorithm with proven polymorphic class shape / pragma interface; 0x134, 250 diffs; class model alone does not solve allocation.
- v9: free-function explicit-self ABI; 0x134, 250 diffs; free vs member ABI not the missing piece.
- v10: one-word normal-iterator wrappers preserved directly; 0x140, 261 diffs; over-preserved wrapper comparisons emitted xor/neg/or machinery absent from retail.
- v11: aggressively unwrap iterator wrappers to raw pointers inside copy/fill; 0x130, 251 diffs; over-optimized, so retail preserves some iterator/template identity.
- v12: modeled GraphicsTransfer as explicit non-POD C++ class with constructor `func_08008F0C`, user-defined copy ctor, placement-new construct path; 0x13C, 253 diffs. Rejected as-is: explicit copy-constructor model preserves too much code.

Structural comparison:
- retail has 150 Thumb instructions;
- v7 has 149 instructions;
- therefore the high-level algorithm is effectively solved; remaining gap is roughly one instruction plus old-GCC lifetime/register/template-dispatch effects, not missing game logic.
- v7 retail/candidate both use 28-byte stack frame; remaining differences are mainly entry register allocation, zero-allocation branch shape, iterator/copy helper identity, and late pointer bookkeeping.

Important closed paths:
- do not retry volatile spill;
- do not retry member-vs-free ABI as sole fix;
- do not retry naive iterator wrapper or fully unwrapped iterator wrapper;
- do not assume explicit user-defined copy constructor is the historical answer;
- broad disk search for old vector headers was cancelled as too slow; exact historical 2001 libstdc++ source has already been recovered externally and is better evidence.

Exact next action:
1. Use the recovered 2001 libstdc++ type-trait/copy dispatch to determine the precise `GraphicsTransfer` trait path without forcing a user-defined copy constructor.
2. Compare historical `uninitialized_copy` / `copy` / `_Construct` specializations against retail's per-element null-check + four-word copy loop.
3. Build v13 as a hybrid: preserve historical iterator variable identity only where old libstdc++ does, but use the actual normal-iterator dispatch/unwrapping layer rather than v10's wrapper comparisons or v11's eager manual unwrapping.
4. Keep v7 as the baseline to beat: 0x134 / 242 diffs and 149 vs retail 150 instructions.
5. Do not mutate production source for `func_080A480C` until an exact or clearly justified matching candidate is obtained.

No production source/linker/asm mutation occurred for func_080A480C in this turn.

## October 1, 2026 - func_080A480C v20 / global-allocation checkpoint

Major new findings:
- v16 was traced through GCC RTL/global allocation instead of continuing syntax permutations.
- reg 23 = queue parameter, user-var pointer, 12 refs / live length 133, crosses 5 calls.
- reg 25 = graphics data pointer, user-var pointer, 3 refs / live length 18, crosses 1 call.
- Neither reg 23 nor reg 25 is assigned by local-alloc; both survive into global allocation.
- Final v16 global register dispositions: queue reg23 -> hard r6; data reg25 -> hard r5.
- Global allocation order in the relevant tail includes 74, 66, 55, 23, 26, 44, 22, 25.
- Pseudo 66 is allocated to hard r5 before queue 23 and conflicts with queue 23. Data 25 does not overlap pseudo 66, so data can later reuse r5.
- RTL identifies pseudo 66 as the malloc result inside scratch AllocateTransfers(); it lives across the null-check/OOM call and then feeds new_begin.
- Retail instead calls func_080D3BC0(bytes) on malloc failure and continues using that function's r0 return value.
- asm/code_linkonce.s confirms func_080D3BC0 is an OOM allocation retry routine that returns the successfully allocated pointer in r0.
- The previous scratch declaration EC void func_080D3BC0(u32); was wrong and directly caused pseudo66/r5 pressure.

New best candidate:
- tools/ches/checkpoints/call238/next-080A480C-v20.cc
- based on v16, but declares func_080D3BC0 as returning GraphicsTransfer * and assigns its return on malloc failure.
- matcher execution: sh_muppqacz_da8f595f
- retail size: 0x138
- v20 size: 0x134
- linked-byte differences: 141 (best so far; v16 was 189).
- artifacts: tools/ches/function-match-artifacts/next-080A480C-v20.diff, .mismatch.txt, .alloc.log

Closed paths this turn:
- v17 pointer vs reference parameters: identical to v16 (0x134 / 189).
- v18 explicit named queue local: identical to v16 (0x134 / 189).
- v19 declaration-order swap: slightly worse (0x134 / 192).
- v14 literal full historical _M_fill_insert through current bundled helpers: 0x1E4; too much generic code survives.
- v15 specialized reallocation using bundled STL helpers: 0x140 / 211, but non-POD uninitialized_copy remains out-of-line unlike retail.
- FoMT-era bundled STL uses raw-pointer vector iterators; later __normal_iterator v10/v11 experiments are wrong-library-generation paths.

Compiler evidence:
- tools/ches/checkpoints/call238/080A480C-v16-dumps/ contains flow/regmove/lreg/greg and other -da dumps.
- v16.i.greg dispositions prove queue r6 / data r5.
- v16.i.flow around insns 184-198 proves pseudo66 is malloc result and explains the r5 conflict.

Exact next action:
1. Inspect next-080A480C-v20.diff around entry and allocation/reallocation.
2. Determine whether the corrected OOM signature moved queue toward retail r5 or which new pseudo now occupies r5 before queue.
3. If queue remains r6, generate -da dumps for v20 and repeat the same targeted global-allocation mapping.
4. Continue fixing source/signature/lifetime facts exposed by allocator evidence; do not resume broad syntax permutations or hard-register hints.
5. Keep production source/linker/asm untouched for func_080A480C until exact or clearly justified matching source is achieved.

No production mutation, commit, or push occurred for this target.

## October 1, 2026 - func_080A480C v20 reload/global-allocation trace checkpoint

Best candidate remains v20:
- `tools/ches/checkpoints/call238/next-080A480C-v20.cc`
- retail size 0x138; v20 size 0x134; 141 differing linked bytes.
- v20 already fixed the earlier queue/data swap: final queue is retail r5 and graphics data is retail r6.

New allocator/reload evidence:
- Fresh six-rule `-da` dumps saved under `tools/ches/checkpoints/call238/080A480C-v20-dumps/`.
- Separate trace-only compiler copy created at `/mnt/data/Github/agbcc-fomt-globaltrace-call238` from the current reconstruction tree. Only that copy's `g++/global.c` was instrumented for logging; allocation behavior was not changed. Production FoMT and `/mnt/data/Github/agbcc-fomt-reconstruct-call238` were not modified by this trace.
- Trace log: `tools/ches/checkpoints/call238/080A480C-v20-globaltrace.log`.
- Trace compiler build: `sh_muprkz1o_fa5c3f03`; traced v20 compile: `sh_muprl93u_b359f0b4`.
- Key result: the final v20 rotation is created during reload, not initial global allocation.
- Initial global allocation gives:
  - pseudo 44 (`old_end`) -> r6
  - pseudo 35 (`&transfer` / value reference) -> r7
  - pseudo 63 (`new_begin`) -> r8
  - pseudo 94 (allocation byte count / end-storage byte offset) -> r9.
- Reload later retries pseudos 35 and 44 after r6/r7 are commandeered:
  - pseudo 35 moves to r10/sl
  - pseudo 44 has no register left and spills to stack.
- Final v20 therefore becomes: transfer->sl, old_end->stack, new_begin->r8, bytes->r9.
- Retail wants: transfer->r9, old_end->sl, new_begin->stack, bytes->r8.
- r8/r9/sl are all ordinary callee-saved Thumb registers in this backend; no REG_ALLOC_ORDER override exists. This is pressure/lifetime/reload behavior, not ABI or fixed-register behavior.
- Global priority formula confirmed in `global.c`: approximately `(floor_log2(refs) * refs) / live_length`. v20 allocates pseudo63 before pseudo94, allowing new_begin to take r8 before bytes can.

Focused source experiments this turn:
- v21: kept `position` and `count` as formal helper parameters to mimic `_M_fill_insert` provenance. Result 0x134 / 252 diffs (`sh_muprfyfo_16cd8f4b`). REJECTED: much worse; retail specialization had already collapsed those identities more aggressively.
- v22: restored historical explicit `new_end = new_begin` before `uninitialized_copy`. Result identical to v20, 0x134 / 141 (`sh_muprn8te_37f10161`). CLOSED: optimized away completely.
- v23: modeled the historical layered allocation chain `simple_alloc<T,malloc_alloc>::allocate(count)` -> `malloc_alloc::allocate(bytes)` -> OOM retry. Result 0x12C / 148 (`sh_muprr63g_3be6ac06`). REJECTED as current source model: over-optimizes/shrinks by 8 bytes; v20 remains structurally closer.

Historical STL evidence added:
- Downloaded matching SGI/STL 3.30 `stl_alloc.h` to `tools/ches/checkpoints/call238/stl_alloc.h.reference` (`sh_muprpa80_f546c008`).
- Exact malloc allocator body is `result = malloc(n); if (!result) result = _S_oom_malloc(n); return result;`, confirming the corrected v20 OOM-return semantics.
- `simple_alloc<T,Alloc>::allocate(n)` is `n == 0 ? 0 : Alloc::allocate(n * sizeof(T))`.
- Bundled `stl_config.h` does not define `__STL_STATIC_TEMPLATE_MEMBER_BUG`, so `__USE_MALLOC` is not globally forced by that flag. Retail's direct malloc path is therefore likely allocator-type/container-specific rather than a global STL setting.

Adjacent-function/layout checks:
- `func_080A4944` is not a queue/container method; it walks 32-byte graphics chunks and performs a virtual dispatch.
- `func_080A49A0` is a constructor-like lifecycle routine and likewise does not expose the queue's +8 word.
- The queue layout mystery remains: start +0, finish +4, unknown/unused +8, end_of_storage +0x0C.

Closed/rejected operational note:
- Broad local allocator-source search `sh_mupro6ro_8e1aa7fa` timed out after 30s with no useful result; do not repeat it. The exact historical allocator header is now saved locally.

Exact next action:
1. Keep v20 as the baseline. Do not continue syntax/declaration-order roulette.
2. Trace the actual queue pointer provenance through every `func_080A480C` caller: follow the r1 argument back to construction/destruction/storage and identify the meaning of queue +8 and the real allocator/container type.
3. Use that object/container evidence to decide why retail gives byte-size r8 and spills new_begin, instead of forcing a spill or hard-register hint.
4. For any new source model, regenerate/compare with `tools/ches/compare-function.py`; if allocation changes, use the saved global-trace method to inspect pseudos 35/44/63/94 rather than guessing.
5. Do not modify production source/linker/asm for func_080A480C until exact or clearly justified matching source is achieved.

No commit or push occurred for this target in this turn.

## October 1, 2026 - func_080A480C v25 exact-size / 91-diff checkpoint

Major breakthrough this turn:
- v23 was recognized as the correct register-allocation/lifetime base even though it was previously rejected on total size: it already has retail's four key homes exactly:
  - transfer temporary/value address -> r9
  - old_end / insertion position -> sl
  - allocation byte count -> r8
  - new_begin -> stack [sp,#0x18].
- Precise instruction comparison showed v23 was only 5 Thumb instructions plus 2 bytes alignment shorter than retail (0x12C vs 0x138). The missing code clustered in allocator-result/new-start identity, fill-cursor identity, and final pointer bookkeeping.

New best candidate:
- `tools/ches/checkpoints/call238/next-080A480C-v25.cc`
- v25 changes only the non-POD fill helper's else-path to preserve the historical local cursor/remaining identities instead of mutating the incoming iterator/count directly.
- Result: **retail 0x138, candidate 0x138, 91 differing linked bytes**.
- compare execution: `sh_mupurh1m_7c6dc205`.
- artifacts:
  - `tools/ches/function-match-artifacts/next-080A480C-v25.diff`
  - `tools/ches/function-match-artifacts/next-080A480C-v25.mismatch.txt`
  - `tools/ches/function-match-artifacts/next-080A480C-v25.s`.
- Everything before target offset 0x9E is exact. Remaining mismatches are localized to two islands:
  - roughly 0x9E..0xDB: allocator return -> new_begin plus first-copy/fill setup;
  - roughly 0xFE..0x123: fill return -> destroy/free and final pointer bookkeeping.
- The core fill loop between those islands now matches structurally, and total function size is exact.

Container-layout evidence recovered from the retail ROM:
- `func_080ACC10` contains another inline insertion/reallocation of the same 16-byte transfer descriptor type. It uses start +0, finish +4, skips +8, and end_of_storage +0x0C, with the same malloc -> func_080D3BC0 -> copy/fill/free/update pattern.
- `func_08075B00` contains an independent vector-like subobject for 0x40-byte elements at object +0x18: start +0x18, finish +0x1C, skipped slot +0x20, end_of_storage +0x24. It uses the same malloc/OOM allocation pattern.
- Therefore the skipped middle word is systematic across element types/subsystems, not a one-off mistake in func_080A480C.
- Public SGI STL 3.30 layouts saved in `stl_vector.h.reference` do not match this physical order: legacy SGI vector is 12-byte start/finish/end, while the standard-allocator base puts allocator before the pointers.
- The strongest current interpretation is a Nintendo/vendor-modified vector base with allocator state/padding between finish and end_of_storage. The checked-in `tools/libagbc++` lacks the vendor vector header, so this remains ROM-supported inference rather than direct header proof.
- False positives closed: `func_080A4A94` is a larger gameplay-object constructor (not vector init); `func_08008980` builds polymorphic hardware objects/vtable slots (not the transfer vector).

Focused candidates this turn:
- v24: model +8 as an allocator object member and route allocation through it. 0x134 / 141, bit-identical to v20. Layout model plausible, but member alone does not alter codegen. CLOSED as a matching lever.
- v25: historical local fill cursor/remaining identities on top of v23. **0x138 / 91**, new best.
- v26: replace only custom fill with actual bundled `std::uninitialized_fill_n`. 0x114 / 277 (`sh_muputc3l_a7588e80`). HARD REJECT: checked-in type-trait path collapses far more than retail; do not retry current bundled helper for this transfer type.
- v27: flatten the fill body into the caller while keeping local cursor semantics. 0x134 / 143 (`sh_mupuuaao_fce1e317`). REJECT: loses the useful helper-return lifetime/size behavior.
- v28: cache `old_begin` explicitly across destroy/free. 0x134 / 103 (`sh_mupuv90t_77679080`). REJECT: shrinks and is worse than v25.
- v29: stage explicit `new_end_of_storage = new_begin + new_count` before field stores. 0x138 / 108 (`sh_mupuvv5m_d19aab38`). REJECT: exact size but worse than v25.
- v30: explicit caller intermediate `allocated = AllocateTransfers(...); new_begin = allocated;`. 0x138 / 91 (`sh_mupuwei5_7ea20336`), bit-identical to v25. CLOSED: ordinary source variable is fully coalesced.
- v31: make outer allocation wrapper a non-static `GraphicsTransferVector::Allocate()` member (historical `_M_allocate` analogue) while retaining v25 allocator layering/fill behavior. 0x138 / 91 (`sh_mupuyf1f_8a7d45aa`), bit-identical to v25. CLOSED as a sole explanation: member boundary alone is also coalesced.

Important retail-oracle observation from func_080ACC10:
- Its vector reallocation has the systematic chain allocator return r0 -> temporary r4 -> stored/long-lived new_start (sb there).
- func_080A480C retail similarly has r0 -> r4 -> spilled new_begin.
- This strongly suggests a real vendor-vector/compiler pseudo boundary between allocator return and caller `__new_start`; simple named intermediates and a member `_M_allocate` wrapper do not reproduce it under the current source/compiler model.

Exact next action:
1. Keep **v25** as the baseline; do not resume broad source-syntax permutations.
2. Generate full `-da` pass dumps for v25 under the six-rule compiler.
3. Map the pseudos for allocator return, `new_begin`, fill-helper return/cursor, `new_end`, old begin/destroy cursor, and final end_of_storage expression.
4. Identify the exact pass (CSE/combine/regmove/local/global/reload) where the three retail-style copy identities are collapsed in v25:
   - allocator return r0 -> temporary/new_start copy at 0x48AA;
   - fill branch/cursor returning directly to r4 instead of v25's common r0 -> r4 copy;
   - final compute-end/load-new_begin scheduling around 0x4926..0x4930.
5. Compare that pass behavior against the independent retail oracle `func_080ACC10` and historical `_M_fill_insert`/allocator helper source. Prefer recovering a general/source-faithful identity rule over adding hard-register hints or volatile/register hacks.
6. Only after evidence identifies the missing lifetime boundary should another source or isolated-compiler experiment be made.
7. Production source/linker/asm for func_080A480C remains untouched until exact or clearly justified matching source is achieved.

No commit or push occurred for this target in this turn.

## October 2, 2026 - func_080A480C pass-level CSE checkpoint

Best candidate remains:
- `tools/ches/checkpoints/call238/next-080A480C-v25.cc`
- exact size **0x138**
- **91 differing linked bytes**
- everything before target offset 0x9E remains exact.

This turn moved from source-shape guessing to full optimizer/pass evidence.

### Full v25 RTL/pass corpus

Created:
- `tools/ches/checkpoints/call238/rtl-v25-sixrule/`
- compile execution `sh_mupvqfql_ad3baf73`
- six-rule wrapper used, with exact compare flags plus `-da`.

Old cc1plus emitted pass dumps beside the preprocessed input:
- `tools/ches/function-match-artifacts/next-080A480C-v25.i.rtl`
- `.jump`
- `.cse`
- `.addressof`
- `.gcse`
- `.loop`
- `.cse2`
- `.flow`
- `.combine`
- `.regmove`
- `.lreg`
- `.greg`
- `.jump2`
- `.mach`.

### Proven pre-optimization pseudo identities

Allocator chain in initial RTL:
- 190: malloc call result -> pseudo65
- 191: pseudo65 -> user result66
- fallback func_080D3BC0 writes user result66
- 201: result66 -> pseudo67
- zero path writes pseudo67 = 0
- **214: pseudo67 -> pseudo68**
- **222: pseudo68 -> new_begin69**

Copy/fill:
- 285: copy cursor73 -> new_end77
- 294: new_end77 -> temp78
- 296: temp78 -> fill result/parameter79
- 339: count80 -> remaining84
- 341: fill result79 -> current85
- 389: current85 -> fill result79
- 394: fill result79 -> new_end77

Destroy/final:
- 403/405 old-begin/destroy cursor identities
- 433/437 old-begin/free reload identities
- 442 begin store
- 444 end store
- 446 new_count -> temp94
- 447 temp94 << 4 -> shifted95
- 448 new_begin69 + shifted95 -> capacity pointer96
- 449 end_of_storage store.

Therefore the needed identities exist in front-end RTL; remaining mismatches are optimizer/coalescer behavior, not missing source variables.

### Pass-level conclusions

CSE immediately removes/bypasses several helper identities:
- 191 is normally folded into the call-result destination.
- 214 disappears and 222 becomes `new_begin69 = pseudo67`.
- 294 disappears and 296 becomes `fill79 = new_end77`.
- 341 bypasses fill79 and becomes `current85 = new_end77`.
- 405/437/446 are also simplified.

Flow later deletes the now-unused fill-input copy and more old-buffer reload identities.

Global allocation proves the allocator handoff:
- reg66 preference: hard r0
- reg67 preference: hard r0
- reg69: no surviving hard-reg preference after pruning, crosses one call
- greg explicitly reports **`Register 69 now on stack.`**
- insn222 becomes direct `str r0,[sp,#0x18]`.
Thus retail's `mov r4,r0; str r4,[sp,#0x18]` is not an allocation of long-lived reg69 to r4. It requires an intermediate short-lived identity before spilled new_begin.

Global preference analysis:
- `expand_preferences()` runs before pruning.
- reg69 crosses a call, so call-used r0 is pruned by `prune_preferences()`.
- This further supports the short-lived-intermediate model.

### Important correction about CSE mechanism

Initial hypothesis was that RTL insn214 was deleted by cse.c's special “cheapest pseudo-copy reversal” block near line 7773.

That hypothesis is now **disproved**.

An already-built research compiler at:
- `/mnt/data/Github/agbcc-fomt-trace-call238/g++/cc1plus`

contains dormant:
- `AGBCC_CSE_KEEP_PSEUDO_COPY=1`

which disables that entire special reversal block.

Probe:
- baseline trace compiler: v25 = 0x138 / 91
- with `AGBCC_CSE_KEEP_PSEUDO_COPY=1`: v25 = 0x138 / 91
- execution: `sh_mupw8bb1_b17405d3`

Pass dumps for the switched probe:
- `tools/ches/checkpoints/call238/rtl-v25-keepcopy-probe/`
- compile execution `sh_mupw8p75_2bccd66a`

Exact comparison of pass dumps shows the switch only preserves the earlier call-result chain:
- baseline CSE: 190 writes user result66 directly; 191 gone
- keepcopy CSE: 190 writes pseudo65; 191 preserves pseudo65 -> user result66

**Insn214 still disappears in both builds.**
Final code is unchanged.

Therefore:
- insn214 is removed by another CSE/value-equivalence substitution path, NOT the special pseudo-copy reversal block.
- next turn must locate that exact CSE mechanism instead of modifying the already-disproved block.

### Historical compiler probe

Existing GCC 2.95.3 CSE research tree:
- `/mnt/data/Github/agbcc-fomt-cse2953-call238/g++/cc1plus`
- already built; no rebuild performed.

Its CSE transform adds historical guard:
- do not apply cheapest-copy reversal when insn has `REG_RETVAL`.

v25 RTL/jump dumps contain no visible `REG_RETVAL` on critical allocator/fill copies.

Probe with existing cse2953 binary:
- `next-080A480C-v25-cse2953` = **0x138 / 91**
- execution `sh_mupw7mm3_fdefb2ba`
- identical to v25.

Thus the GCC 2.95.3 REG_RETVAL safeguard does not solve this target.

### Source candidates closed this turn

v32:
- named user locals inside both allocator wrapper layers, specifically to try to activate existing `AGBCC_PRESERVE_USERVAR_COPIES`.
- result **0x138 / 91**, identical to v25.
- execution `sh_mupw20hp_4d5b1176`.
- Conclusion: inline integration converts the critical helper-return bridge back into compiler-generated non-user pseudos; named wrapper locals do not survive as the required boundary.

v33:
- manually reconstructed historical false-type hierarchy around the literal SGI `__uninitialized_fill_n_aux` loop:
  `current=first; for (; count>0; --count,++current) construct(...); return current`,
  with two inline return wrappers.
- result **0x114 / 277**
- execution `sh_mupw3qu9_191ecbe8`.
- HARD REJECT. This is the same collapsed family as using bundled std::uninitialized_fill_n.
- Conclusion: current compiler does not regenerate retail's count==1 split from the literal historical loop.

v34:
- kept v25's proven explicit count==1 split but restored two historical inline return-wrapper layers around it.
- result **0x138 / 91**, identical to v25.
- execution `sh_mupw4ghe_41fe02e7`.
- Conclusion: return wrapper layers are fully coalesced and do not change the fill-return hard-register path.

No more source hierarchy/syntax permutations should be tried without new pass evidence.

### v29 final-tail component remains useful

Previous v29 overall score was 0x138 / 108, but targeted inspection this turn confirmed its explicit:
`new_end_of_storage = new_begin + new_count`
staging produces the retail final reload/store order:
1. load spilled new_begin
2. add capacity bytes
3. reload spilled new_begin
4. store begin
5. store end
6. store end_of_storage.

Its tail is shifted only because the fill-return copy is still wrong.
Keep v29-style capacity staging as a likely final component once the fill return identity is corrected.

### Compiler rebuild constraint

No compiler was rebuilt this turn.
Only already-built alternate research binaries were used as probes, honoring the existing no-rebuild constraint.
Production compiler/package/default build were untouched.

### Exact next action

1. Keep v25 as baseline.
2. Compare `.jump` -> `.cse` specifically around RTL insn214 and trace CSE's equivalence-class/hash substitution logic that removes `68=67`.
3. Determine the precise CSE routine/path responsible (likely ordinary expression/register equivalence substitution or dead-copy rewriting, not the special block near 7773).
4. Use the already-built trace compiler's existing trace hooks if they can expose that path; do not rebuild yet.
5. Do the same for fill identities 294/296/341 to determine whether allocator and fill are removed by the same ordinary CSE mechanism.
6. Only after the responsible routine is proven should a generalized compiler-rule proposal be written. Do not modify/rebuild compiler merely to guess.
7. Once fill return is corrected, combine with v29-style capacity staging and re-evaluate final tail.
8. Production func_080A480C assembly/source/linker remains untouched until exact or clearly justified matching source is achieved.

No commit or push occurred.

## October 2, 2026 - func_080A480C integrated-return bridge checkpoint

Best source remains:
- `tools/ches/checkpoints/call238/next-080A480C-v25.cc`
- exact size **0x138**
- **91 differing linked bytes**
- production func_080A480C remains assembly; no source/linker integration yet.

This turn resolved the allocator bridge much further using pass dumps and live GDB against the existing six-rule cc1plus. No compiler rebuild was performed.

### Exact ordinary-CSE mechanism

The first-pass collapse is now proven, not inferred.

`cse_insn()` canonicalizes SET sources via `canon_reg(src, insn)`.
`canon_reg()` explicitly replaces a pseudo with `qty_first_reg[reg_qty[regno]]`, documented as the "oldest" equivalent register.

Consequences in v25:
- allocator: 222 changes from `new_begin69 = pseudo68` to `new_begin69 = pseudo67`;
- fill entry: 296 changes from `fill79 = temp78` to `fill79 = new_end77`;
- fill cursor: 341 changes from `current85 = fill79` to `current85 = new_end77`.

After consumers are redirected, `delete_trivially_dead_insns()` removes the now-unused producer copies.

Thus allocator and fill identities are both ordinary equivalence-class canonicalization followed by dead-set cleanup.

### make_regs_eqv / CUID evidence

Live GDB against:
`/mnt/data/Github/agbcc-fomt-compat-package-call238-v2/g++/cc1plus`

Executions:
- `sh_mupwk5br_28ebfe99`
- `sh_mupwl5cu_41489d2f`
- structural flags `sh_mupwqlfo_095eff12`

Allocator:
- merge new=68 old=67
- current canonical first=67
- CSE block CUID 128..142
- reg68 CUID 128..131
- reg67 CUID 120..128
- reg68 is integrated, compiler-generated, one set.
Conclusion: reg68 is genuinely block-local. This is NOT a strict->=/off-by-one lifetime bug.

Fill:
- reg77 CUID 166..258 and is canonical
- reg78 CUID 169..170
- reg79 CUID 170..228
- reg85 CUID 197..224
- reg79/85 are integrated user-variable pseudos; reg78 is compiler-generated.
Conclusion: 77 legitimately wins the current lifetime policy because it lives longer than the fill helper pseudos. This is also not a boundary arithmetic bug.

All checked local historical CSE variants, including the GCC-2.95.3-derived tree, use the same `make_regs_eqv` longer-than-current-block rule.

### Inliner evidence

`integrate.c` shows non-void inline expansion may create a fresh `inline_target = gen_reg_rtx(...)` when the caller does not supply a convenient register target. Copied inline insns are marked `RTX_INTEGRATED_P=1`.

This matches the short compiler-generated wrapper/result pseudos seen around the allocator/fill helper nesting.

Existing sixth compatibility behavior already uses `RTX_INTEGRATED_P` as a structural discriminator, so an integrated-boundary rule is historically/architecturally plausible; do not use function addresses or pseudo numbers in any final rule.

### Retail oracle func_080ACC10

Exact reallocation island extracted from `asm/code_809E804.s` around func_080ACC10.

It is the same 16-byte vector pattern and preserves the same identity boundaries systematically:

Allocator:
```
bl malloc
mov sl, r4
...
bl func_080D3BC0
...
adds r4, r0, #0
mov sb, r4
```
=> allocator return chain is **r0 -> r4 -> sb**.

Copy result:
- copy cursor runs in r3
- convergence does `adds r4, r3, #0`.

Fill:
- count==1 path updates r4 directly;
- general path cursor is r2 then converges with `adds r4, r2, #0`;
- both paths converge directly in r4, with no common r0 intermediate.

Final:
```
mov r0, sl
add r0, sb
mov r5, sb
str r5, [r6]
str r4, [r6,#4]
str r0, [r6,#0xc]
```
=> long-lived new_start also passes **sb -> r5 -> field store**.

This independently confirms the missing identities are systematic vector/compiler behavior, not accidental register allocation unique to 080A480C.

### In-memory CSE probe

A GDB compile suppressed both:
1. initial `canon_reg(68 -> 67)` at insn 222;
2. same-value hash/equivalence substitution for insn 222.

Artifact:
- `next-080A480C-v25-preserve222`
- execution `sh_mupwt4hr_f6b7f39f`
- still 0x138 / 91.

Pass corpus:
- `tools/ches/checkpoints/call238/rtl-v25-preserve222-probe/`
- execution `sh_mupwtj8w_b1f0f923`

Result:
- 214/222 survive CSE, addressof, GCSE, loop, CSE2, flow.
- combine then deletes 214 and rewrites 222 back to `69=67`.

Therefore a CSE-only preservation rule is insufficient.

### Combine topology

Existing `AGBCC_PRESERVE_USERVAR_COPIES` combine hook does not cover allocator bridge 68 because 68 is compiler-generated, not a user variable.

Live topology trace execution:
- `sh_mupwv2sy_ac99f40d`

When CSE preserves the chain, combine attempts involving the boundary are:
- i1=-1, i2=214, i3=222
- i1=-1, i2=222, i3=235
- recursive/three-insn attempt can involve i1=214, i2=222, i3=235.

Rejecting only the first attempt is insufficient.

A full in-memory rejection of all try_combine attempts involving UID 214/222:
- artifact `next-080A480C-v25-preserve-alloc-full`
- execution `sh_mupwvpyz_a8ecdcb5`
- final code still 0x138 / 91.

Full pass corpus:
- `tools/ches/checkpoints/call238/rtl-v25-preserve-alloc-full-probe/`
- execution `sh_mupww5jo_d139f337`

With both CSE and all relevant combine attempts suppressed:
- 214/222 survive through combine;
- survive regmove;
- survive local-allocation dump (`.lreg`);
- disappear only by `.greg`.

### Decisive local-allocation result

From the fully-preserved probe:
- reg67: 3 uses / 6 insns, LO_REGS
- **reg68: 2 uses / 2 insns in block 14, one set, LO_REGS**
- reg69: long-lived user var, crosses one call.

Local allocation explicitly reports:
```
;; Register 68 in 0.
```

So even when CSE and combine are forced to preserve the bridge, local allocation assigns pseudo68 to **r0**. Global/reload then sees an r0->r0 move, deletes insn214, and writes r0 directly to spilled new_begin69.

This is the third independent collapse layer and explains why CSE/combine-only experiments cannot reproduce retail's r0->r4->spill.

The existing sixth compatibility behavior extends the lifetime of certain immediate integrated call-result copies to prevent exactly this kind of hard-register coalescing. Reg68 is structurally different: it is an **integrated inline-return bridge**, not an immediate CALL_INSN result.

### Exact next action

1. Keep v25 and the fully-preserved GDB probe as baselines.
2. Trace local allocation for reg68's quantity:
   - quantity number;
   - birth/death indices;
   - copy suggestions / ordinary suggestions;
   - which hard regs are live across the interval;
   - whether r0 comes from a copy suggestion or ordinary first-free choice.
3. Use GDB only (no rebuild yet) to test the minimum structural perturbations:
   - suppress only reg68's r0 copy suggestion, and/or
   - extend only the integrated return-bridge lifetime enough to overlap the next r0 use.
4. Determine whether either makes reg68 naturally choose retail r4 while leaving the rest of v25 unchanged.
5. Only if that works, derive a generalized predicate for an integrated inline-return bridge. Do not key on UID/pseudo/function/address.
6. Then apply the same evidence process to fill boundary pseudos 78/79/85.
7. Keep v29-style explicit capacity staging as the known likely final-tail source component once allocator/fill identities are correct.
8. Do not rebuild/package a seventh compiler behavior until the GDB-only probe proves both target behavior and a narrow structural discriminator.
9. Production func_080A480C source/asm/linker remains untouched.

No compiler rebuilt. No commit or push.


## October 2, 2026 - func_080A480C three-island composition checkpoint

This turn moved func_080A480C from the v25 0x138 / 91-byte frontier to a near/exact diagnostic composition without rebuilding the compiler or touching production assembly/linker integration.

### Allocator bridge
- Exact local-allocation trace proved pseudo68 has q0 birth=4 death=6, refs=2, no copy suggestion, no ordinary suggestion, and only r7/sp live for the whole block. r0 is chosen only because the old Thumb target scans hard registers numerically. Lifetime extension and suggestion-removal theories are CLOSED.
- Active compiler target is telf.h -> thumb.h; unlike arm.h it has no REG_ALLOC_ORDER.
- Forcing pseudo68 out of local allocation did not help because global allocation records `68 preferences: 0`.
- GDB-only diagnostic preservation through CSE/combine plus excluding r0-r3 for q68 makes it choose r4. Artifact `next-080A480C-v25-force68-r4` improved 91 -> 85 differences and matched retail instruction-for-instruction through allocator + first-copy island.

### Fill return
- v25 RTL showed caller new_end77, common helper return79, general cursor85. Retail has no common 79 hop: both branches return directly into new_end/r4.
- Disabling AGBCC_PRESERVE_USERVAR_COPIES changed nothing; that existing rule is not the cause.
- v35 changes only the scratch helper to branch-local returns: count==1 returns result+1 directly, general path returns current directly. Normal v35 is 0x132/143 because allocator bridge is still absent, but its fill control flow is the retail shape.
- v35 plus allocator-r4 diagnostic gives 0x134 / 29 differences and is exact from 0x080A4890 through free at 0x080A4922.

### Final capacity-store tail
- Reused v29 evidence: staging `new_end_of_storage = new_begin + new_count` before the three field stores emits the exact retail tail ordering.
- v36 = v35 branch-local fill + v29 staged capacity tail. Normal v36 is 0x134/140 because allocator bridge is absent.
- v36 plus allocator-r4 diagnostic gives full-window 0x138 with only three differing byte positions: 0x100, 0x102, 0x104. Everything else, including final two alignment zero bytes, is exact. Artifact: `next-080A480C-v36-force68-r4`.

### Destroy loop final three instructions
- v36 RTL loads mutable destroy cursor91 from begin, then flow preserves original begin as 98=91. Global allocation gives cursor91->r0, saved begin98->r1. This produces the correct hard-register ownership but wrong copy direction (`ldr r0,[begin]; mov r1,r0`).
- v38 makes the source identity explicit: load old_end90, old_begin91, then destroy_cursor92=old_begin91. Its RTL is the desired copy direction. Normal global allocation gives old_end90->r2, old_begin91->r0, cursor92->r1; retail needs only 91/92 swapped.
- v38 global data: `91 preferences: 0`; 91 and 92 conflict with each other and the same surrounding set.
- Final GDB-only diagnostic swaps reg_renumber[91]/[92] after global allocation while retaining the allocator-r4 diagnostic. Swap hook fired: False.
- Final diagnostic result: **expected=0x138 actual=0x134 differing=40 positions=0x1c,0x58,0x102,0x104,0x106,0x10b,0x10c,0x111,0x112,0x114,0x115,0x116,0x117,0x118,0x119,0x11a,0x11b,0x11c,0x11d,0x11e,0x11f,0x120,0x122,0x124,0x125,0x126,0x127,0x128,0x129,0x12a,0x12c,0x12e,0x12f,0x130,0x132,0x133**.
- Artifact: `tools/ches/function-match-artifacts/next-080A480C-v38-full-diagnostic.*`.

### Source candidates created
- v35: v25 + branch-local fill returns.
- v36: v35 + staged new_end_of_storage before field stores.
- v37: v36 + explicit old_end/old_begin passed through DestroyTransfers; rejected as sole solution.
- v38: v36 + explicit old_end/old_begin/destroy_cursor loop; provides correct RTL copy direction, but current allocator assigns old_begin/cursor hard regs opposite retail.

### Exact next action
1. Treat v36/v38 as the new source frontier; v25 is historical baseline only.
2. Do NOT rebuild/package another compatibility compiler behavior yet. First derive generalized structural rules for the two remaining allocation fingerprints demonstrated by GDB: (a) integrated allocator-return bridge choosing r4 rather than r0; (b) explicit old-begin -> destroy-cursor copy assigning saved original/cursor to r1/r0 rather than r0/r1.
3. Validate any proposed generalized allocator rule against the 54-module saved corpus and all existing exact canaries before package adoption. No UID, pseudo-number, function-name, or address-specific rule is acceptable.
4. If the final diagnostic above is exact, this proves source semantics/layout and all remaining mismatch is compiler allocation policy, not source logic. If nonzero, inspect only the listed remaining positions.
5. Production func_080A480C remains assembly until a generalized compiler behavior or source-only exact path is justified and full-ROM validation passes.

No compiler rebuild. No production func_080A480C integration. No commit or push.


## October 2, 2026 - func_080A480C source-faithful exact frontier

This turn resolved the remaining destroy/free island and produced a source-faithful exact-code frontier for `func_080A480C` without any global-register swap or production integration.

### Decisive exact proof
- New source candidate: `tools/ches/checkpoints/call238/next-080A480C-v40.cc`.
- v40 is v36 plus only a historical-style destroy wrapper hierarchy:
  `DestroyTransfers -> DestroyTransfersAux -> DestroyTransfer`, where the element destroy is empty and the aux helper performs the pointer loop.
- With the already-understood allocator-return bridge research diagnostics plus the generalized call-sensitive local-allocation probe, v40 is **0x138 / 0 linked-byte differences** across retail `0x080A480C..0x080A4944`.
- Exact artifact: `tools/ches/function-match-artifacts/next-080A480C-v40-bridge-probe.*`.
- Exact execution: `sh_mupywk47_d3e15262`.
- Exact destroy sequence emitted:
  `ldr r2,[queue+4]; ldr r1,[queue]; mov r0,r1; ... mov r0,r1; bl free`, matching retail byte-for-byte.

### Important correction: no generic destroy/global-allocation rule is needed
- Retail oracle `func_080ACC10` independently uses the opposite/direct pattern:
  `old_end->r2, old_begin->r0, destroy cursor->r1, free(old_begin already in r0)`.
- Therefore broad changes to global register preference/order would be wrong.
- v38 pre-reload hard-register swapping remains a useful exact diagnostic proof only, not a candidate final compiler rule.
- v40 demonstrates that `080A480C`'s retail difference comes from the historical inline destroy helper structure, not a special global allocator behavior.

### CSE2 investigation closed as a sole fix
- Before second CSE, v36 already had a separate `98 = [queue->begin]` reload.
- CSE2 substitutes an equivalent register in the ordinary v36 shape.
- GDB-only preservation of that reload through CSE2 (`next-080A480C-v36-natural-exact-probe`, execution `sh_mupyr7pd_2e200b23`) did not solve the target: **0x138 / 4 differences**.
- Pass dumps saved at `tools/ches/checkpoints/call238/rtl-v36-preserve-reload-probe/` confirm the MEM reload survives CSE2/flow/combine/local allocation under that probe, but later allocation/reload still does not reproduce retail ownership.
- Thus a generic "preserve this MEM reload" CSE rule is not justified.

### Deallocation-wrapper experiment
- v39 added only historical-style `DeallocateTransfers(pointer,size)` on top of v36.
- Result: **bit-identical to v36**, normal 0x134 / 140; execution `sh_mupyuvbt_cd1b61d8`.
- `_M_deallocate` wrapper flattening is CLOSED as the missing lever.

### Destroy-wrapper experiment
- v40 added only the historical-style destroy wrapper layers on top of v36.
- Normal compiler result changes exactly the relevant destroy island (normal v40 0x134 / 141; execution `sh_mupyw00r_c2e64e91`).
- With the allocator bridge proof enabled, v40 becomes exact 0x138 / 0.
- This is now the preferred source frontier over v36/v38.

### Allocator-return bridge generalized mechanism
- Pseudo68 local quantity has no hard-register suggestion and normally picks r0 because the Thumb backend scans numerically.
- Marking the quantity call-sensitive (`qty_n_calls_crossed=1`) **before `find_free_reg`** makes stock allocator machinery exclude call-used r0-r3 and naturally select r4.
- v36 call-sensitive bridge proof: `next-080A480C-v36-bridge-call-sensitive2`, execution `sh_mupye5zm_24efb9ec`, **0x138 / 3**.
- This is much stronger than forcing `first_used |= 0xf`: the allocator itself chooses r4 via existing call-clobber semantics.

### Exact remaining compiler-reconstruction task
v40 still uses GDB-only target-specific preservation diagnostics around the integrated allocator-return bridge:
- suppress the CSE canonical collapse around research pseudos/UIDs 68/67 and insn 222;
- prevent CSE from replacing the preserved bridge source;
- reject the specific combine collapses involving research UIDs 214/222;
- then treat that preserved integrated bridge quantity as call-sensitive before local allocation.

The next task is **not** more source permutation. It is to replace those UID/pseudo-specific bridge diagnostics with one or more structural, general compiler rules based on integrated inline-return boundaries (`RTX_INTEGRATED_P`, call-result provenance, copy chains, and existing sixth-rule behavior). No function address, pseudo number, UID, or hard-register number is acceptable in a final rule.

After a structural candidate is derived:
1. test v40 target exactness;
2. validate all existing exact hard-target canaries;
3. run saved 54-module corpus and require 54/54 unchanged unless explicitly explained;
4. only then rebuild/package a compatibility compiler candidate;
5. only after full-ROM SHA1 validation consider replacing production `func_080A480C` assembly with readable C++.

No compiler rebuild this turn. No production `func_080A480C` integration. No commit or push.

## Current 080A4A4C production integration - October 2, 2026

- Fresh compatibility compiler v4 is validated and reproducible from pinned agbcc base commit `1caa6becde5e4676b59c31c74d68f45ced79557c`; package build `sh_muq5r3xp_0f22f076` and validator `sh_muq5u5tf_811df27f` both passed.
- `src/code_080A4A4C.cc` now replaces retail bytes `0x080A4A4C..0x080A4A93` using the conservative address-derived wrapper source from `next-080A4A4C-v4.cc`.
- Controlled detached-worktree integration `sh_muq5yhqg_65343efc` passed `fomt.gba: OK`; production integration `sh_muq5z150_6378962b` also passed `fomt.gba: OK`.
- Explicit production SHA1 `sh_muq5zlhi_42ae6647`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Current linked-code progress `sh_muq5zna0_460b489f`: **53,992 / 940,036 bytes in src = 5.7436%**; **886,044 bytes = 94.2564%** remain in asm.
- Assembly now resumes in `.text.after_func_080A4A4C` at `func_080A4A94`. Active next decomp is `func_080A4A94`.

## Three-decomp batch complete - October 2, 2026

- Batch requested by user: finish three adjacent retail decomps before the next user update.
- #1 unnamed wrapper `0x080A4A4C..0x080A4A93`: exact and production-integrated through `src/code_080A4A4C.cc`; production proof `sh_muq5z150_6378962b`.
- #2 `func_080A4A94`: v5 source reached **0xD8 / 0** in `sh_muq6bft4_996b89d9`. The key source-shape discovery was to model each 4-byte RGB-like member with an inline `Clear()` helper, producing retail `strb [base]`, `[base,#1]`, `[base,#2]`, then `base += 4`.
- #3 `func_080A4B6C`: first destructor candidate appended to the exact constructor source reached **0x80 / 0** in `sh_muq6c2df_0e7e2402`.
- Combined production source: `src/code_080A4A94.cc`, containing the 0xD8 constructor and 0x80 destructor, total map size **0x158** at `0x080A4A94`.
- Controlled detached integration worktree `/mnt/data/Github/gba/fomt-call238-4A94-B6C-integration`; full-ROM proof `sh_muq6d6f3_2a25251b`: `fomt.gba: OK`.
- Production integration `sh_muq6doxq_a99dba2d`: `fomt.gba: OK`; explicit SHA1 `sh_muq6ef99_6dd7c7c5`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Current progress `sh_muq6ehe0_60f017ea`: **54,336 / 940,036 = 5.7802% source**, **885,700 = 94.2198% asm**.
- Linker/asm seam now resumes as `.text.after_func_080A4B6C` at `func_080A4BEC`.
- Do not commit/push this source-converted unit yet. Although local/full-ROM exactness is proven, the exact compiler v4 path is still private under `tools/ches/`; `AGENTS.md` requires a clean/fresh-checkout reproducible contribution-safe toolchain path before automatic commit/push.
- Post-batch package validator `sh_muq6kb29_45c1eb06` passed the complete ladder: new constructor/destructor targets exact, all prior hard targets exact, five canaries exact, 54/54 corpus unchanged with total diff 0, and full source-converted ROM exact.
- Exact next target when work resumes: `func_080A4BEC`.

## Current batch decomp 1 - func_080A4BEC integrated

- `func_080A4BEC` retail extent: `0x080A4BEC..0x080A4F4F`, size **0x364**.
- Final source candidate: `tools/ches/checkpoints/call238/next-080A4BEC-v4.cc`; exact proof `sh_muq7kmni_63c0c960` = **0x364 / 0**.
- Key shape: pass the 0xC-byte animation descriptor base into the inline state advance helper and compare `++timer` against `descriptor->duration`. Passing `&duration` produced the correct code size but shifted every descriptor literal by +8.
- Controlled integration `sh_muq7m0rm_c1c8aadc`: `fomt.gba: OK`.
- Production integration `sh_muq7mmj2_62639172`: `fomt.gba: OK`; SHA1 `sh_muq7n5kr_c4b3ff8b` = `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Progress `sh_muq7n7ao_407b41da`: **55,204 / 940,036 = 5.8725% source**.
- Current batch continues to decomp #2: adjacent `func_080A4F50`.

## Forced mid-batch checkpoint after func_080A4BEC

- Current 3-decomp batch has **1 completed/integrated decomp**: `func_080A4BEC` (0x364 / 0, production/full-ROM exact).
- Progress is **55,204 / 940,036 = 5.8725% source**; SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Large adjacent `func_080A4F50` was bounded at 0x720 and partially reconstructed conceptually, but intentionally not forced as the quick second win because it contains several dirty-update subsystems plus a 66-state renderer switch. Keep its analysis; do not claim it decompiled.
- Batch decomp #2 active candidate is now `func_080A5670` (0x6C), a separate helper/type with three source/destination pairs at +0x0C and a halfword source stride at +0x24.
- `next-080A5670-v1.cc`: 0x60 / 100.
- `next-080A5670-v2.cc`: `sh_muq7sot1_dfd2eed2` = **0x68 / 65**, but structurally almost exact. Adding a local `u32 volatile * dma = &REG_DMA3SAD` correctly causes retail high-register usage: r8=this, r9=source_step, sl=DMA3 register pointer, and correct literal order.
- Remaining v2 size difference is effectively one missing 2-byte `adds r5, r0, #0` after loading/testing the source pointer. Retail loads pair source into r0, tests r0, then copies r0->r5. v2 lets GCC load it directly into r5. That one instruction also creates the retail 2-byte alignment pad before the literal pool, explaining total 0x68 vs 0x6C.
- Exact next probe: preserve the v2 DMA pointer shape and express source retrieval through a tiny inline pair getter (or another source-level temporary shape) to encourage return/value materialization in r0 before assignment to the long-lived source variable r5. Do not touch the compiler.
- After 5670 is exact, decomp #3 candidate target is `func_080A56DC` (0x84); its full assembly and call references have already been bounded.

## October 2, 2026 - three-decomp batch COMPLETE (4BEC, 5670, 56DC)

Batch status: **3/3 complete and production-integrated**.

1. `func_080A4BEC`, `0x080A4BEC..0x080A4F4F`, 0x364 bytes.
   - Final candidate: `tools/ches/checkpoints/call238/next-080A4BEC-v4.cc`.
   - Exact proof: `sh_muq7kmni_63c0c960` = **0x364 / 0**.
   - Controlled integration: `sh_muq7m0rm_c1c8aadc` PASS.
   - Production integration: `sh_muq7mmj2_62639172` PASS.

2. `func_080A5670`, `0x080A5670..0x080A56DB`, 0x6C bytes.
   - Final candidate: `tools/ches/checkpoints/call238/next-080A5670-v3.cc`.
   - Exact proof: `sh_muq830z4_d1ff571c` = **0x6C / 0**.
   - Key source shape: test `pairs[i].source` directly, then declare the long-lived `source` inside the branch. Combined with a typed local `&REG_DMA3SAD`, this reproduces retail r0-to-r5 lifetime, high-register allocation, padding, and literal placement naturally.
   - Controlled integration: `sh_muq83yxk_9e2b0e32` PASS.
   - Production integration: `sh_muq84ir8_1746b3d8` PASS.

3. `func_080A56DC`, `0x080A56DC..0x080A575F`, 0x84 bytes.
   - Final candidate: `tools/ches/checkpoints/call238/next-080A56DC-v2.cc`.
   - Exact proof: `sh_muq88yko_8de9dc89` = **0x84 / 0**.
   - Important discovery: the packed 10-bit map + signed 16-bit x/y record is the already-existing project `Location` type from `include/actor.hh`. Using `Location::GetMap/GetX/GetY` reproduced the retail decode exactly and removed speculative duplicate layout code.
   - Controlled integration: `sh_muq89pja_0ac2b531` PASS.
   - Production integration: `sh_muq8alx6_4ed82803` PASS.

Current production verification:
- SHA1 `sh_muq8b5zl_928f5dd8`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Progress `sh_muq8b7lt_c8a6c7c1`: **55,444 / 940,036 = 5.8981% source**, **884,592 = 94.1019% asm**.
- Branch remains `ches-dev`, contribution HEAD `ddf0296`, ahead 21.

Commit/push gate remains intentionally CLOSED even though the new retail units pass target and integrated SHA gates: the source-converted branch still depends on private compatibility compiler v4 under `tools/ches/`. `AGENTS.md` and `START_HERE.md` require a clean/fresh-checkout contribution-safe reproducible toolchain path before automatic commit/push. Do not stage private compiler research to bypass this requirement.

Next batch:
- Primary target: `func_080A5760`, `0x080A5760..0x080A58EB`, size 0x18C.
- The earlier `func_080A4F50` 0x720 renderer/upload routine remains deferred, not abandoned; its partial reconstruction evidence is preserved.

## October 2, 2026 - compiler reproducibility gate CLOSED

The remaining commit/push blocker is resolved.

Contribution-safe toolchain inputs now exist in the retail repo:
- `tools/agbcp_fomt_compat.patch`: sanitized v4 compatibility patch, SHA-256 `840fb3d194908bd445d5d38fc07172be0e9cc5b0d4e553de76b62826fb83377e`; no Call238/Ches/private research identifiers.
- `tools/install_agbcp.sh`: pins public `https://github.com/notyourav/agbcc.git` commit `1caa6becde5e4676b59c31c74d68f45ced79557c`, verifies the commit, applies the tracked patch, builds/installs the toolchain, renames the real C++ compiler to `agbcp.bin`, and installs a wrapper at the existing `tools/agbcc/bin/agbcp` path that enables the eight validated structural compatibility behaviors.
- `INSTALL.md`: documents this normal fresh-checkout setup path.

Fresh reproducibility proof used detached worktree:
`/mnt/data/Github/gba/fomt-contrib-repro-test`

Only intended contribution files plus the local baserom prerequisite were copied into that worktree. No `tools/ches/` or private handoff/research files were used.

Proof:
- fresh public clone + pinned checkout + patch + complete compiler install: `sh_muq8ub7e_d7121409` PASS, exit 0;
- plain `make -B -j4 compare`, with NO `CC1PLUS=` override: `sh_muq8xx1u_33bf1f63` PASS, `fomt.gba: OK`;
- SHA1 `sh_muq8yefu_1a0bdc0f`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`;
- ROM size `sh_muq8yhp1_e153ccff`: 8,388,608 bytes;
- progress `sh_muq8yfzf_bf6ec95e`: 55,444 / 940,036 = 5.8981% source.

The clean/fresh-checkout reproducibility gate required by `AGENTS.md` is therefore satisfied.

Exact next action, without redoing any compiler work:
1. review intended contribution diff only;
2. scan intended contribution files for private markers;
3. run `git diff --check`;
4. stage ONLY explicit contribution paths;
5. inspect cached diff/stat/check;
6. commit using project-style message;
7. push current `ches-dev` branch under standing exact-retail authorization;
8. verify remote/upstream status;
9. remove `/mnt/data/Github/gba/fomt-contrib-repro-test`.

Private files must remain unstaged: `README.md`, `AGENTS.md`, `START_HERE.md`, `docs/DECOMP_NOTES.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/REPO_MAP.md`, and `tools/ches/`.

## October 2, 2026 - contribution pushed; new 5760/58EC/5960 batch in progress

Contribution/reproducibility closure:
- contribution-safe retail unit committed as `67320ad decompile graphics and terrain support routines`;
- remote `ches/ches-dev` push succeeded; `git ls-remote` verified exact tip `67320ad57b866b17bc8d4fdf82422f517175b093`;
- previous clean repro worktree `/mnt/data/Github/gba/fomt-contrib-repro-test` was removed after verification;
- only intended private/local files remain dirty in the main tree;
- tracked `.gitattributes` contains the narrow rule `tools/agbcp_fomt_compat.patch -whitespace` so Git does not flag legacy GCC whitespace embedded inside the raw patch file. Cached contribution diff passed `git diff --cached --check` before commit.

Current requested batch: **0/3 production-complete**, targets selected as one coherent renderer/camera family:
1. `func_080A5760`, `0x080A5760..0x080A58EB`, 0x18C;
2. `func_080A58EC`, `0x080A58EC..0x080A595F`, 0x74;
3. `func_080A5960`, `0x080A5960..0x080A59BB`, 0x5C.

Established semantics:
- `5760` obtains/stores the map id through vtable slot +0x18, loads `MapData`, expands terrain-map indices into the full 0xF200-byte word buffer or zero-fills it, calls vtable slot +0x20, forwards to `func_080A5D14` and `func_080A5DFC`, then resets the renderer dirty/color state.
- `58EC` computes a viewport origin around target x/y using current 16.16 x/y, biases 120/80, and clamps to map pixel extents minus 240x160.
- `5960` obtains that viewport origin, compares it with the current signed high halves at +0x0A/+0x0E, updates +0x08/+0x0C in 16.16 form when changed, and sets dirty byte +0x29.

First source candidates:
- `tools/ches/checkpoints/call238/next-080A5760-v1.cc`
- `tools/ches/checkpoints/call238/next-080A58EC-v1.cc`
- `tools/ches/checkpoints/call238/next-080A5960-v1.cc`
Matcher execution `sh_muq9bb8n_4c7414f3`:
- 5760 v1: expected 0x18C, actual 0x180, 301 linked-byte differences;
- 58EC v1: expected 0x74, actual 0x70, 101 differences;
- 5960 v1: expected 0x5C, actual 0x54, 82 differences.

Important ABI discovery:
The register signature of `func_080A58EC` is naturally explained by an old-C++ member function returning a 4-byte `ViewportOrigin` struct by value: hidden return pointer in r0, `this` in r1, x in r2, y in r3. This also explains retail `5960` allocating 8 stack bytes, receiving the return object at sp, and copying the 4-byte object to sp+4 before comparisons.

Second candidates using that ABI:
- `next-080A58EC-v2.cc`
- `next-080A5960-v2.cc`
Matcher execution `sh_muq9etht_990fe653`:
- 58EC v2: expected 0x74, actual 0x7C, 83 differences;
- 5960 v2: expected **0x5C, actual 0x5C**, 52 differences.

Interpretation:
- return-by-value/member ABI is strongly supported, especially by 5960 reaching exact retail size and naturally producing the two-local stack pattern;
- `58EC` still needs source-lifetime/return-object shaping to remove 8 bytes and match retail register allocation;
- do not start a compiler experiment. This remains a source-shape problem.

Exact next action:
1. inspect `call238-080A58EC-v2.diff` and `call238-080A5960-v2.diff`;
2. refine the return-object construction/lifetimes so 58EC itself reaches 0x74 while preserving the now-correct 5960 ABI/size;
3. once 58EC/5960 are exact, return to 5760 using the established named renderer fields (rather than the v1 generic dirty array) to reproduce retail pointer/setup lifetimes;
4. target-first exact proof for all three, then controlled integration, full-ROM SHA1, progress, docs, automatic commit/push as one coherent retail batch.

The deferred 0x720 `func_080A4F50` remains preserved and is not part of this batch.

Standing batch-size rule: 5 completed retail functions per user-facing batch when feasible. Keep canonical docs current as exact functions land; only pause earlier for a genuine blocker or the mandatory Ches safety checkpoint.

## October 2, 2026 - five-function batch quick exact wins

Batch policy is now 5 completed retail functions per user-facing batch when feasible.

Source-exact, pending controlled production integration:
- `func_080A5A9C`, 0x080A5A9C..0x080A5AAF, **0x14 / 0** on first candidate `tools/ches/checkpoints/call238/next-080A5A9C-v1.cc`; proof `sh_muq9lz9j_d94612ba`. Semantics: returns whether renderer movement countdown at +0x8C is zero.
- `func_080A5EA0`, 0x080A5EA0..0x080A5EB7, **0x18 / 0** on first candidate `tools/ches/checkpoints/call238/next-080A5EA0-v1.cc`; same proof execution. Semantics: unpack current map packed image directly to VRAM 0x06000000.

These are exact target proofs but do not count as production-complete until assembly/linker integration and full-ROM SHA1 verification. Continue seeking three more exact helpers, then integrate the coherent set with all required docs and standing exact-retail commit/push.

## October 2, 2026 - five-function batch source-exact; isolated integration rebuild active

Standing user rule: 5 completed retail functions per user-facing batch when feasible; canonical docs must stay current as work lands.

Current five source-exact targets:
1. `func_080A5A9C`, 0x14 / 0
2. `func_080A5EA0`, 0x18 / 0
3. `func_080A601C`, 0x08 / 0
4. `func_080A6420`, 0x1C / 0
5. `func_080A6640`, 0x20 / 0

Final contribution source files already exist in main working tree:
- `src/code_080A5A9C.cc`
- `src/code_080A5EA0.cc`
- `src/code_080A601C.cc`
- `src/code_080A6420.cc`
- `src/code_080A6640.cc`

Final per-target proof execution:
`sh_muq9sh82_6e6dd10f`
All five final files independently matched retail with differing linked bytes = 0.

Important source-shape discoveries:
- `func_080A6420` returns the result of `func_0803A8A4(self->unk_00, 1, 0, 0, 0)`; using a void wrapper produced the wrong epilogue. Final v2 is 0x1C / 0.
- `func_080A6640` uses two tiny 4-byte C++ state objects at +0xB4 and +0xB8 whose inline `Clear()` writes only their first two bytes. Old agbcc gives this helper class size/alignment 4; adding manual 2-byte padding incorrectly moved the second object to +0xBC. Final v4 is 0x20 / 0.
- Earlier hard camera work remains preserved: `58EC` v2 strongly supports a small struct return ABI; `5960` v2 has exact 0x5C size but 52 differing bytes. Do not discard that research, but it is not part of this completed source-exact five-function set.

Isolated integration worktree:
`/mnt/data/Github/gba/fomt-fivebatch-integration`

The first isolated full-ROM attempt used a copied generated `tools/agbcc` and failed SHA1. Investigation showed every symbol from `func_080A4A94` onward was 4 bytes early, including pre-existing `5670/56DC/5760`, proving the new five seams were not the cause. The copied generated compiler state was stale relative to the contribution-safe fresh installer.

The worktree has now been switched to the correct reproducibility path:
`rm -rf tools/agbcc; ./tools/install_agbcp.sh; make -B -j4 compare`

Active background execution:
`sh_muq9x6ko_0e985f65`
Status at mandatory checkpoint: RUNNING, compiler rebuild still in progress. DO NOT rerun this command. Monitor this exact execution ID first on resume.

Exact next action:
1. monitor `sh_muq9x6ko_0e985f65` to completion;
2. if the isolated ROM is exact, apply the already-proven five seam edits from the temp worktree to production `asm/code_809E804.s` and `fomt.lds`;
3. run production plain `make -B -j4 compare`, explicit SHA1, `make progress`, and map address checks;
4. update all relevant canonical docs;
5. under standing exact-retail authorization, stage only contribution-safe source/asm/linker files, `git diff --cached --check`, commit in project style, push `ches-dev`, verify remote;
6. remove the integration worktree after successful production verification.

## October 2, 2026 - five-function renderer helper batch production exact

The requested five-function batch is now **5/5 production-complete and full-ROM exact**.

Integrated source:
- `func_080A5A9C` -> `src/code_080A5A9C.cc`, 0x14 bytes;
- `func_080A5EA0` -> `src/code_080A5EA0.cc`, 0x18 bytes;
- `func_080A601C` -> `src/code_080A601C.cc`, 0x08 bytes;
- `func_080A6420` -> `src/code_080A6420.cc`, 0x1C bytes;
- `func_080A6640` -> `src/code_080A6640.cc`, 0x20 bytes.

Final per-target proof:
`sh_muq9sh82_6e6dd10f`: all five final source files have exact expected size and differing linked bytes = 0.

Isolated integration proof:
- worktree: `/mnt/data/Github/gba/fomt-fivebatch-integration`;
- clean tracked installer + full-ROM compare execution: `sh_muq9x6ko_0e985f65`, exit 0;
- explicit isolated SHA1: `sh_muqa1ak1_e57cb52c` -> `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

Production proof after copying only the proven asm/linker seams and using the fresh generated compiler:
- plain `make -B -j4 compare`: `sh_muqa1q64_096afc16` -> `fomt.gba: OK`;
- explicit SHA1: `sh_muqa22dd_2db35aba` -> exact retail SHA1;
- progress: `sh_muqa23wb_8a3cf5a1` -> 55,556 / 940,036 = **5.9100% source**, 884,480 bytes asm = 94.0900%;
- the +112 source bytes exactly equal 0x14 + 0x18 + 0x08 + 0x1C + 0x20;
- map/symbol verification `sh_muqa25pj_df778d01` confirms all five functions and their following boundaries at exact retail addresses.

Important integration lesson:
The first temp full-ROM attempt failed because it copied a stale generated `tools/agbcc` directory. Already-proven functions from `func_080A4A94` onward linked four bytes early, proving the new seams were not at fault. Rebuilding via tracked `tools/install_agbcp.sh` removed the shift and produced the exact ROM. For future full-ROM integration worktrees, do not copy arbitrary generated compiler directories; install from the pinned tracked path or copy only from a freshly proven install.

Standing batch rule remains 5 completed retail functions per user-facing batch when feasible. Harder preserved targets `func_080A5760`, `func_080A58EC`, and `func_080A5960` remain valuable follow-up work, but throughput-oriented selection of small/medium helpers is allowed when a hard target stalls, provided evidence is preserved and the project stays byte-perfect.

## October 2, 2026 - five-function batch committed and pushed

Retail batch commit:
`c2cfa8f decompile renderer helper routines`

Remote verification:
`c2cfa8fda20046d03370a4002e3c2830eab43f47 refs/heads/ches-dev`

The temporary integration worktree was removed after successful production verification and push. Main branch is synchronized with `ches/ches-dev`; only private/local documentation and research files remain dirty/untracked.

Current production progress remains 55,556 / 940,036 = 5.9100% source with exact retail SHA1.

## October 2, 2026 - zero-context documentation architecture overhaul

The documentation was reorganized so a fresh no-context model no longer has to infer current truth from chronological appendices.

Changes:
- `START_HERE.md` was rewritten as the authoritative live dashboard.
- `tools/ches/NEXT_AGENT_HANDOFF.md` was rewritten to contain only current next work, exact candidate paths/results, preserved hard targets, and ordered execution steps.
- New `docs/DECOMP_PLAYBOOK.md` owns the durable FoMT-specific process, definition of done, do/don't rules, exact validation ladder, target-selection strategy, proven source-shape lessons, toolchain rules, documentation contract, and commit/push discipline.
- `tools/ches/SESSION_STATUS.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/DECOMP_NOTES.md`, `docs/REPO_MAP.md`, `EXPERIMENT_INDEX.md`, and `FAILURES_AND_CLOSED_PATHS.md` now expose or route through authoritative current-state sections so old chronology cannot masquerade as the next task.
- `AGENTS.md` now defines documentation ownership/read order and requires zero-context recoverability as part of completion.
- Reusable generic lessons were added to `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`, including existing-type reuse, lifetime/source-shape matching, pointer provenance, tiny inline object modeling, wrapper return contracts, small-struct return ABI, generated toolchain provenance, subsystem batching, and decision-state documentation.
- Documentation integrity script passed: live docs agree on HEAD `c2cfa8f`, exact SHA1, 5.9100% progress, compiler authority, and current candidate files/results.

Standing rule: documenting only progress is insufficient. Preserve process, failed approaches, why they failed, proven facts, inferences, anti-patterns, validation evidence, and exact next action.

## October 2, 2026 - global leverage analysis and roadmap pivot

User requested that target selection be redesigned as if starting the decomp as the main author: recover foundations that make later work faster, not merely the next address.

A repository-wide unresolved-call analysis was performed over remaining assembly definitions/calls and linked symbol sizes.

New private tooling:
- `tools/ches/analyze_decomp_leverage.py`: reproducible fan-out/leverage analyzer.
- `tools/ches/checkpoints/decomp-leverage-2026-10-02.md`: raw top-100 snapshot.
- `docs/DECOMP_PRIORITY_MAP.md`: human-classified architectural roadmap.

Evidence executions:
- broad raw fan-out exploration: `sh_muqc5zpw_6db2e8e0`
- size-normalized scored ranking: `sh_muqc6z9w_1a28b9c7`
- exact SpriteAnimator cluster metrics: `sh_muqc9w5f_1aaebd5c`
- reproducible analyzer markdown snapshot: `sh_muqcaodc_06cf9bb4`

Important conclusion:
Raw call count alone is not the roadmap. The highest raw entries include generic allocation, audio, and low-level wrappers. Manual classification now prioritizes shared typed abstractions that expose layouts/APIs across multiple systems.

Immediate leverage-first target is the `SpriteAnimator` core because:
- the existing 0x14-byte type is already present in `include/unknown_types.hh`;
- readable `src/entity_actor.cc` already calls `func_0805E860(SpriteAnimator *, u32)`;
- `0805E824`: 56 unique callers / 159 calls / size 0x2C;
- `0805E860`: 75 unique callers / 179 calls / size 0x34;
- `0805E8F0`: 49 unique callers / 119 calls / 10 modules;
- the five adjacent methods form one coherent API and should reveal the object's real fields.

New roadmap phases:
1. SpriteAnimator core.
2. Central manager/accessor owner behind 080088B8..08008940.
3. DMA/transfer descriptor infrastructure around 08008E64/08008EB8/08008F0C.
4. Common intrusive-list/container/allocator infrastructure such as 080098AC and 080D3BC0.
5. Resume preserved renderer hard targets with stronger shared types.

The previous renderer candidates are preserved, not superseded as evidence. This pivot changes only priority, not their candidate files/results.

## October 2, 2026 - SpriteAnimator leverage-first batch matching checkpoint

The newly adopted leverage-first roadmap immediately produced shared-type progress.

Documentation/strategy work completed before matching:
- `docs/DECOMP_PRIORITY_MAP.md` created with raw fan-out evidence plus human architectural classification.
- `tools/ches/analyze_decomp_leverage.py` created; dated raw snapshot saved at `tools/ches/checkpoints/decomp-leverage-2026-10-02.md`.
- `START_HERE.md`, `NEXT_AGENT_HANDOFF.md`, `AGENTS.md`, `DECOMP_PLAYBOOK.md`, `SESSION_STATUS.md`, `DECOMP_NOTES.md`, and `REPO_MAP.md` now route no-context agents through leverage-first target selection.
- documentation integrity proof `sh_muqckyro_4f6d86b5`: PASS.
- generic decomp skill received the leverage-ranking rule.

SpriteAnimator scratch candidates:
- v1 established the natural provider/descriptor model. 5E860 matched **0x34 / 0 on the first attempt**; 5E824 was exact-size/37 diff because the third parameter was typed i16 and got prematurely truncated; 5E850 compiled as a constructor and incorrectly preserved/returned this.
- v2 corrected real API facts: 5E824 takes register-sized step then stores i16; 5E850 is a void Init/provider+animation wrapper. Body proofs `sh_muqcp9rs_4e676493`: 5E824 **0x2A / 0**, 5E850 **0x0E / 0**; their address windows include 2-byte alignment padding. 5E860 remains **0x34 / 0**.
- v3 added WillFinish/Update semantics: 5E894 0x5A / 59; 5E8F0 0xAE / 104.
- v4 explicit descriptor-base lifetime did not close them: 5E894 0x5A / 56; 5E8F0 0xA8 / 116.
- v5 inline guarded Count after frame-pointer evaluation was a regression: 5E894 0x5E / 62; 5E8F0 0xBA / 170.
- v6 changes evaluation order: Count before Begin in 5E894, Begin/current-frame before Count in 5E8F0. Proof `sh_muqcvhw9_56eda46b`: first three exact; 5E894 **exact size 0x5C with only 6 differing bytes**; 5E8F0 0xB4 / 159.

Current best state:
- 5E824 exact.
- 5E850 exact.
- 5E860 exact.
- 5E894 v6 near-exact, 6 differing bytes.
- 5E8F0 v3 remains best mismatch-count base, 104 differing bytes.

No production files have been changed for SpriteAnimator yet. Next: close the six-byte 5E894 diff, then return to v3 5E8F0 and apply only source-shape facts proven by retail.

## October 2, 2026 - SpriteAnimator 4/5 exact checkpoint

Current batch is now **4/5 byte-perfect**.

Exact chosen source base: `tools/ches/checkpoints/sprite-animator-v9c.cc`.
Reverification `sh_muqd6nlx_c40fdcc3`:
- 5E824 = 0x2A / 0 body
- 5E850 = 0x0E / 0 body
- 5E860 = 0x34 / 0
- 5E894 = 0x5C / 0

5E894 closed from v6 6 differences -> v8 2 differences -> v9c 0 by preserving the proven Count helper lifetime and expressing the duration access through a local frame pointer.

Only 5E8F0 remains. Original v3 is 0xAE / 104. New object-level descriptor-indexing v15a/v15b is 0xB2 / 98, the best mismatch count so far, and reproduces retail descriptor provenance more closely. Remaining dominant issue is a cyclic hard-register ownership mismatch: retail descriptor/count=r5, frames=r6, result=r7; v15 result=r5, descriptor/count=r6, frames=r7.

Closed this turn: standalone u32 index; explicit descriptor pointers; narrow result widths; Count-only transplant; Begin/Count ordering; declaration-only pseudo-order attempts; top-level reference aliases. Independent current upstream and older not-alons/hmfomt contain no completed source for this routine.

Exact next experiment: semantic inline helper that consumes/clears the +0x12 changed flag and returns initial result bits 0/2, tested first on v3 and v15a. Goal is to alter source-level inline-return/pseudo lifetime naturally, not force hard registers.

## October 2, 2026 - SpriteAnimator allocator-proof checkpoint

Batch remains 4/5 exact. New decisive evidence maps v3 allocator pseudos and proves the r5/r6/r7 cycle is real but incomplete. A proof-only pre-reload cycle improves v3 104 -> 98 diffs, while the same idea on v15 regresses. The adjacent exact func_0805E894 source pattern produced v26b, the first natural exact-size 0xAC Update candidate, but its lifetime graph is still wrong: result=r5, step=r7, index=r1, and one extra value spills to r10/sl. Next work is RTL/lifetime reduction on v26b, not broad syntax search.

## October 2, 2026 - SpriteAnimator v28 allocator-order checkpoint

Batch remains 4/5 exact. v27a proved Count-after-result shortens the count lifetime, removes the sl spill, and restores step to ip. v28a explicitly preserves count-zero and frames-copy identities through RTL/CSE/combine/flow; normal allocation gives index=r2 and frames=r6 exactly, with only result/step/count/constant4 cycling.

The v28 preference trace shows no hard-register preferences for the remaining roles. A proof-only count priority boost was insufficient. A proof-only relative allocation order count -> frames -> result recovered the complete retail hard-register contract, including result=r7, step=ip, count=r5, frames=r6, index=r2, and constant4=r8, but the function remained 0xA4/111 because v28 lacks the independent descriptor-base lifetime used by retail.

v15 naturally emits the descriptor base, frame-pointer copy, zero count temp, conditional count load, and final count copy. v29a/b attempted to keep that identity model while widening index/count, but both were 0xAE/161. Next: trace v29b RTL semantic pseudos and apply proof-only retail ordering before designing any general rule.

## October 2, 2026 - SpriteAnimator v31b near-exact checkpoint

Batch remains 4/5 exact; no production SpriteAnimator integration yet.

New best candidate: tools/ches/checkpoints/sprite-animator-v31b.cc.
- normal compatibility-v4 compare: 0xAA functional body / 25 differing linked bytes
- proof-only allocation order final-count -> frames -> result: 0xAA / 10
- proof recovers retail result=r7, count=r5, frames=r6 while this=r4, step=ip, timer=r3, index=r2, previous-sprite=r9, constant4=r8 were already correct
- only proof mismatch islands: 0x0805E936..938 count-zero vs frames-copy order, and 0x0805E976..978 equivalent timer branch orientation

Critical size fact: retail Update functional code ends at bx r1 at 0x0805E998. 0x0805E99A is 0x0000 (movs r0,r0) padding before the next function at 0x0805E99C. Therefore 0xAA is the correct functional body size; do not invent logic to fill the 0xAC comparison window.

v32a explicit count=0; frames=Begin(); if(frames) count=frame_count regressed to 0xA8/126 and is closed. Resume from v31b and isolate middle-end instruction ordering plus timer branch orientation.

## October 2, 2026 - SpriteAnimator v34b six-byte frontier

Batch remains 4/5 exact; no production SpriteAnimator integration yet.

New canonical candidate: `tools/ches/checkpoints/sprite-animator-v34b.cc`.
- compatibility-v4 normal compare: **0xAA functional body / 6 differing linked bytes**
- 2 counted differences are the known 0x0000 padding halfword at 0x0805E99A
- sole functional mismatch is retail `movs r0,#0; adds r6,r1,#0` vs candidate `adds r6,r1,#0; movs r0,#0` at 0x0805E936..939
- v34b naturally recovers retail result=r7, count=r5, frames=r6, this=r4, step=ip, timer=r3, index=r2, previous sprite=r9, constant4=r8 and exact loop CFG without proof allocation hooks

Closed this run:
- v34c Count-before-Begin: 0xAA/28
- v35a Count helper local-order tweak: 0xAA/28
- v36a manual zero/count setup: 0xA8/128
- v36b frames + conditional Count setup: 0xAE/131
- v37a hoisted frames before previous sprite: 0xA8/106

Compiler evidence:
- disabling schedule-insns or schedule-insns2 leaves 0xAA/6; forcing scheduling is unsupported for Thumb
- removing uservar-copy or combine-copy-ref switches leaves 0xAA/6
- bare patched v4 with all eight compatibility env switches unset leaves 0xAA/6
- v34b RTL emits persistent frames copy p45 before Count zero p52 from initial RTL through CSE/CSE2; only notes lie between them and p45 is first consumed after p52
- proof-only scratch CSE env rule AGBCC_HOIST_ZERO_BEFORE_DEFERRED_USER_COPY built successfully but did not fire; .cse/.cse2 remained unchanged

Resume by instrumenting the structural matcher guard-by-guard, not by broad source search.

## October 2, 2026 - SpriteAnimator 5/5 exact proof and generalized compiler rule

The leverage-first SpriteAnimator batch is now **5/5 byte-perfect in isolated proof** from one coherent source file:
- `func_0805E824`: 0x2A / 0
- `func_0805E850`: 0x0E / 0
- `func_0805E860`: 0x34 / 0
- `func_0805E894`: 0x5C / 0
- `func_0805E8F0`: true 0xAA body / 0
- source: `tools/ches/checkpoints/sprite-animator-v34b.cc`
- all-five proof execution: `sh_muqi3y3p_baf45410`

Compiler breakthrough:
- the failed CSE matcher was at the wrong stage; Count address/load temporaries were still real until `delete_trivially_dead_insns`
- a post-dead motion makes v34b exact by moving the zero initialization ahead of the deferred frames pointer copy
- the safe generalized discriminator is pointer-ness: require the deferred copy destination to have `REGNO_POINTER_FLAG`
- this excludes false-positive `src/farm` loop-control copies while retaining Sprite's frame-array pointer copy
- clean proof tree: `/mnt/data/Github/agbcc-fomt-compat-package-call238-v4-postdeadproof`

Validation:
- clean copied-v4 baseline 480C exact / Sprite 6 diffs: `sh_muqhx3rk_b66c5268`
- clean post-dead A/B 480C exact + Sprite exact: `sh_muqhy0vs_e4d7d669`
- pointer-guard Sprite exact and farm no longer triggers: `sh_muqi1vv1_f2acb9e7`
- saved 54-module corpus: **54/54 changed 0 / total diff 0**, `sh_muqi264x_d0b14c02`
- full hard-target + canary + corpus + source-converted ROM validator: PASS, `fomt.gba: OK`, `sh_muqi2jdy_c96633ee`

No production SpriteAnimator integration yet. The standing auto-commit/push gate is intentionally not satisfied yet because the ninth compiler behavior exists only in the isolated proof tree, not a fresh reproducible package. Next: package successor to compatibility-v4, fresh-build/validate, then isolated integration/full-ROM proof, architecture doc, production seam, docs, commit/push.

## October 2, 2026 - compatibility-v5 package gate CLOSED

Private compatibility-v5 is now reproducibly built and fully validated twice from the pinned base. Patch SHA-256 is `52967111d94167e27d7d61ed6036470e340b131458d4c9b9ed02ad5b55e1d420`; package is `tools/ches/checkpoints/call238/compat-compiler-v5/`. Full validations `sh_muqjwtre_48b20def` and `sh_muqk18n0_42cefaf1` both pass SpriteAnimator 5/5, established hard targets, five canaries, 54/54 corpus with total diff 0, and full ROM `fomt.gba: OK`. Independent package build `sh_muqjy1a8_b5de0034` also passed. The two fresh compiler binaries are not byte-identical, so binary identity is not the reproducibility gate. Tracked production compiler authority remains the existing contribution-safe installer/patch until the ninth rule is deliberately promoted. No SpriteAnimator production integration or commit/push yet. Exact next action is detached-worktree SpriteAnimator integration using private v5, followed by tracked compiler promotion and fresh-checkout validation.

## October 2, 2026 - SpriteAnimator detached integration exact

The isolated integration phase is complete. In detached worktree `/mnt/data/Github/gba/fomt-sprite-integration-call238`, all five SpriteAnimator methods are readable source, the placeholder type is replaced by the proven 0x14-byte layout, two readable entity callers use the typed method, and the linker seam preserves `func_0805E99C` at its retail address. Private-v5 full-ROM builds pass both before and after caller cleanup.

The ninth compiler rule has also been promoted into the tracked contribution-safe compiler inputs in that detached worktree without importing private `call238_*` naming. Tracked patch SHA-256 is `1c40c992bb6cad109a3fcecd0fb9cc09c072343e6f624679706d0d99d5426c73`; tracked installer SHA-256 is `6a1a8de9ae69940cf62fc8405eb8a90d3e08b317ab47d7a4a75576e4c128b2eb`. Fresh tracked install `sh_muqktwa4_1035a60c` succeeds, and plain `make -B -j4 compare` `sh_muqkxriz_ed73fb00` passes with `fomt.gba: OK` and no private compiler override.

Detached-worktree gotcha: ignored/local `baserom.gba` and installed `tools/agbcc` are not inherited by Git worktrees. Missing them can cause unrelated missing-ROM failures and modern devkitARM header errors. Provide baserom explicitly and install the tracked compiler inside the proof worktree before interpreting build failures.

Production `ches-dev` has not yet been changed by this integration. Exact next action is production promotion plus full verification, then contribution-only commit/push under the standing exact-retail rule.
## October 2, 2026 - hardware context accessor batch COMPLETE and pushed

The leverage-first central-owner target is complete.

Architecture recovered:
- the former "manager" cluster is shared GBA hardware infrastructure;
- `Hardware` is an 8-byte owner with a pointer to a 0x4B0 `HardwareContext`;
- proven context offsets: input/repeat +0x000, DMA transfer queue +0x024, display-register shadow +0x034, OAM shadow +0x08C, scheduler handle +0x490, VBlank callback list +0x494;
- `080087C8` registers persistent and one-shot hardware callbacks, then `08008AF0 -> 08000568(1) -> IntrWait(1,1)` proves the update boundary is VBlank.

Five source-integrated exact accessors:
- `080088DC` `Hardware::GetContext` = 0x04 / 0
- `08008910` `Hardware::GetTransferQueue` = 0x08 / 0
- `08008918` `Hardware::GetDisplayRegisters` = 0x08 / 0
- `08008920` `Hardware::GetOam` = 0x08 / 0
- `08008940` `Hardware::GetVBlankCallbacks` = 0x0C / 0

Validation/process evidence:
- isolated target proof: `sh_muqm8hqh_bbd31966`, 5/5 exact;
- detached integration worktree: `/mnt/data/Github/gba/fomt-hardware-integration-call239` from base `5d95827`;
- attempted detached `tools/install_agbcp.sh` execution `sh_muqmkbaq_20b9cf85` was SIGTERM'd only because Ches hit its 120-second execution ceiling while GCC was still building; no detached `tools/agbcc` tree was left behind;
- recovery deliberately did not rerun the uncertain interrupted installer. The detached worktree instead symlinked its missing ignored `tools/agbcc` to the already-proven production tracked toolchain. Wrapper SHA256 `21a9b9dde6d4e9018c369f13ffc787e2a96b8f488d817d9774170dbb5083cc04`; `agbcp.bin` SHA256 `f0c930a3c8d53a061ad7c6920c4284711618bf2be421977c143d7ca93f1b9ceb`;
- first detached full build `sh_muqmr7ly_fb6256f2` failed before link because old GCC rejects separate out-of-class member declarations used only to attach `SECTION(...)` attributes;
- fix: move `SECTION(...)` attributes onto declarations inside `struct Hardware` and remove the redundant out-of-class declarations. Function bodies remained unchanged;
- detached plain `make -B -j4 compare`: `sh_muqms4ou_3126a4e0` PASS, `fomt.gba: OK`;
- detached explicit verification `sh_muqmsuie_9e22b18f`: size 8,388,608, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`, all five retail symbol addresses preserved, `git diff --check` PASS;
- exact four-file source/asm/linker candidate promoted byte-for-byte to production after confirming HEAD `5d95827` and clean contribution paths;
- production plain `make -B -j4 compare`: `sh_muqmtbwk_15ccb128` PASS;
- production progress/ROM/symbol/diff proof `sh_muqmvrh4_2c3fa83b`: 55,972 / 940,036 source bytes = 5.9542%, 884,064 asm bytes = 94.0458%, retail SHA1 preserved, all five addresses preserved, diff hygiene PASS.

Contribution:
- tracked public doc `docs/HARDWARE.md` added;
- commit `408d497 decompile hardware context accessors` (`408d497089ec9fc2daa32f85d394d7c8545343d8`);
- pushed to `ches/ches-dev`; `git ls-remote` independently matched the same full hash in `sh_muqmwxvp_e6f40ea0`;
- contribution contains exactly `asm/hardware.s`, `docs/HARDWARE.md`, `fomt.lds`, `include/hardware.hh`, `src/hardware_context.cc`;
- private README/AGENTS/START_HERE/DECOMP docs/tools/ches remained unstaged.

Next leverage-first target:
Reconstruct the DMA/transfer descriptor infrastructure around `func_08008F0C`, `func_08008E64`, and `func_08008EB8`. Start from the now-proven 16-byte queue element at `HardwareContext +0x24` and DMA3 execution path through `func_08008FE4`. Preserve neighboring raw duplicate hardware accessors and generic intrusive-list code until their own coherent interfaces are ready.

## Detached integration exact - 50-call checkpoint

Detached worktree:
`/mnt/data/Github/gba/fomt-dma-integration-call240`

Base:
`408d497089ec9fc2daa32f85d394d7c8545343d8`

Integrated candidate files:
- `include/hardware_transfer.hh`
- `src/hardware_transfer.cc`
- `asm/hardware.s`
- `fomt.lds`
- `src/code_080A480C.cc` now uses the shared `GraphicsTransfer` / `GraphicsTransferVector` type and constructor rather than a duplicate private layout

Only two assembly seams are required:
- after the first four source functions, preserving raw `08008FB8..08008FE3`;
- after source `08008FE4`, preserving raw `0800901C..`.

First detached build `sh_muqnqfzy_93998b9b` failed only because the out-of-class executor needed `GraphicsTransfer::MODE_FILL`; no byte mismatch was reached. After that one qualification fix:
- full detached compare `sh_muqnqy44_562909bf`: PASS
- shared-caller cleanup full compare `sh_muqnszlx_89b41510`: PASS
- explicit proof `sh_muqntlsn_1b736f03`: PASS
- ROM size 8,388,608
- SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
- progress 56,368 / 940,036 = 5.9964% source
- symbols remain exactly 08008E64 / 08008EB8 / 08008F0C / 08008F60 / 08008FE4; following named `08009094` remains at its retail address
- raw `08008FB8..08008FE3` bytes remain intact
- `git diff --check` passes

Production is intentionally still untouched at this checkpoint.

EXACT NEXT ACTION:
Review the detached contribution diff and stable public documentation impact, then promote the exact detached contribution to production `ches-dev`. Run plain production `make -B -j4 compare`, explicit SHA1/size/progress/symbol/raw-boundary/diff checks, update final docs, stage only contribution-facing files, and under the standing exact-retail rule commit/push only if production remains byte-identical.


## October 3, 2026 - forced 50-call checkpoint during full documentation read

This checkpoint is newer than the October 2 renderer handoff above where it conflicts.

The user required a complete read of the repository's authored documentation before further decomp/compiler work. Technical experimentation is paused until that read reaches EOF.

- Saved authored-doc stream execution: `sh_murlr8n0_04430c43`
- Total stream: 1,129,004 bytes
- Read continuously through byte offset 1,065,000
- Exact next action: resume `shell_output` for that execution at offset 1065000 and continue in 25,000-byte pages until `eof:true`. Do not resume compiler mutation before EOF.
- Plain private `num_actuals > 2` rule made renderer v92 exact: `sh_murlf9zh_aab2c077` = 0x270 / 0.
- Immediate lifecycle retest: `sh_murlft1c_c379cf1e` = 0x94 / 0.
- Full validator `sh_murlg3ll_3f635a71` passed hard targets/canaries but failed saved corpus at 52/54 exact, total diff 132: `src__farmer_entity_item_action` 8 bytes and `src__game_object_discard` 124 bytes. Full-ROM stage did not run. Therefore arity-only >2 is REJECTED / not promotable.
- First-argument `ADDR_EXPR` refinement was too narrow: `sh_murllu6q_b3e30b7f` returned v92 to 0x270 / 8.
- Trace evidence: target getter arg0 is `parm_decl`; farmer callback is `var_decl`; discard callbacks are `var_decl` and `nop_expr`. Renderer parameter belongs to the currently compiled inline helper.
- Current private compiler source is transient/unvalidated. Verified disk state at checkpoint has `num_actuals > 2 && TREE_CODE(args[0].tree_value) == PARM_DECL` in both multi-indirect prepare-call predicates.
- Production FoMT source/asm/linker and tracked compiler patch remain untouched at HEAD `77b459045ec0500b82b185ece77ab1c4dccaecc5`.
- After documentation EOF, search anti-rediscovery docs specifically for indirect-call / inline / parameter-provenance compiler experiments before another behavior change. Prefer structural inline/integrated provenance or a real call-role property over source spelling alone.
- Any next behavior candidate must prove v92 0x270/0, lifecycle 0x94/0, both newly exposed corpus modules exact, then the complete hard-target/canary/54-module/full-ROM ladder before clean-package reconstruction.

No commit or push occurred.

## Preserved entity-effect snapshot before final promotion (superseded)

## HISTORICAL SNAPSHOT (superseded by the October 4 snapshot at the top)

This section records the then-current entity-effect state. It is chronological history, not current truth; the October 4 snapshot at the top and the newest handoff own the live state.

- Branch: `ches-dev`
- HEAD: `daab719 decompile entity effect renderer`
- Remote: `ches/ches-dev` verified at `daab719c1324ac0d17e727f5c96b784d021655f3`
- Retail SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`
- Current exact progress: **57,192 / 940,036 = 6.0840% source**, 882,844 bytes = 93.9160% assembly
- Current five-function `UnknownEntityThing` batch: four functions are exact and one remains unresolved.
- Constructor `080324BC`: **0xA4 / 0 exact**, source authority `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/candidate-ctor1-v8-unified-initializer.cc`, SHA-256 `2cd54c43494fd988028491553c501b11027126fd2fb3ebe7a6f6d0bcdfaefe9c`.
- Constructor `08032560`: **0xAC / 0 exact**, source authority `candidate-ctor2-v6-both-helper.cc`, SHA-256 `bfd1ecba314f53e3a8a7db117277cbb20973c857cf9cf17651ec9f6e1cdd97c6`.
- Deleting destructor `080DC8F8`: **0x34 / 0 exact**, source authority `candidate-dtor-v1.cc`.
- Renderer `08032690`: **0x270 / 0 exact**, integrated in production as `src/code_entity_08032690.cc`, source SHA-256 `41cc940a4bdb5cd4476de919f6d81e43fed20c0c805fb25f525b0ce828259101`.
- Renderer isolated proof: corrected plain compare `sh_murqiv60_def0d0e6` exited 0 with `fomt.gba: OK`; seam proof `sh_murqjqll_61c2d661` confirmed `func_08032690` at `0x08032690`, `func_08032900` at `0x08032900`, and exact renderer-region SHA-256 `0925803ca6e8fa3c055d67c10348233f540431e5ddb983019e9619f9031d3930`.
- Production renderer proof: plain compare `sh_murqmxt5_97f7b3e4` exited 0 with `fomt.gba: OK`; seam proof `sh_murqneqt_1fa32ae6` confirmed the same exact 0x270 region and symbol boundaries.
- The isolated worktree initially lacked ignored `baserom.gba`; first compare `sh_murqi9tj_36529faf` failed only for missing baseline input. A symlink to the canonical production baseline was added after verifying SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Do not treat that first build failure as a renderer/compiler regression.
- Tracked compatibility compiler behavior is committed with the renderer because the renderer requires the tenth structural rule `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`. Tracked patch SHA-256 remains `8f75608013b1fee6e20a11fbe7bac26d1e65b92747402415e5f0c9caf628579b`.
- Commit `daab719` contains exactly five contribution files: `asm/code_entities_080320DC.s`, `fomt.lds`, `src/code_entity_08032690.cc`, `tools/agbcp_fomt_compat.patch`, and `tools/install_agbcp.sh`. Private research and unrelated pre-existing dirty files were excluded.
- Post-commit `make progress` `sh_murqsjxf_9839b759` reports **57,192 / 940,036 = 6.0840% source**, **882,844 asm**, and `fomt.gba: OK`.
- Push `sh_murqso90_f9a8266e` succeeded: `77b4590..daab719 ches-dev -> ches-dev`. Remote ref was explicitly verified equal to HEAD.
- `UnknownEntityThing::vfunc_0C` at `0803260C` is the only remaining function in this five-function batch. Credible typed v12/v13/v16 frontier remains **0x82 vs retail 0x84 / 42 linked differing bytes**.
- Do not reopen renderer compiler hunting, the rejected `>1`, plain `>2`, `ADDR_EXPR`, `PARM_DECL`, or root-depth switch families unless new causal evidence appears. Their failure history is already documented.
- User-required repository documentation read remains complete: all 51 human-maintained documents were read through EOF. This top snapshot and the newest handoff own current truth.
- Latest `vfunc_0C` diagnosis localized the 2-byte gap to first CSE: an independent QImode constant-zero reset store is rewritten to a low-part SUBREG of the wider SImode zero already held for `clear_mode`. That removes retail's independent `movs r0, #0` and changes allocator reference counts, explaining both the 0x82 size and downstream register rotation.
- A fresh private diagnostic compiler was built at `/mnt/data/Github/agbcc-fomt-vfunc0c-cse-diag-v1` from pinned base plus the current tracked patch. Build `sh_murr1duy_adaa2c14` finished exit 0.
- Private experiment `AGBCC_CSE_AVOID_USERVAR_NARROW_CONST_REUSE` skipped wider-mode CONST_INT reuse only when the candidate wider register satisfied `REG_USERVAR_P`. Target compare `sh_murr52r0_e7098259` produced **no change: 0x82 / 42 diffs**. This rule is REJECTED as an ineffective discriminator and must not be promoted.
- Exact next action: inspect/trace the CSE wider-mode CONST_INT same-value chain for the reset-store decision to determine which register metadata actually distinguishes the reused `clear_mode` value. Confirm whether `REG_USERVAR_P` is false there or whether another equivalent register entry is selected. Do not try more source spellings. Keep the next compiler experiment diagnostic-only until a structural predicate is evidenced.

- October 3 Codex onboarding is complete: all 56 authored documents read through EOF, with frozen manifest and state under `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/documentation-read-2026-10-03/`.
- New v18 trace explains the ineffective user-register filter: wider zero temporaries 64/73/84 remain equivalent to canonical user variable 57 (`clear_mode`, two sets). Selecting one of those temporaries still canonicalizes to 57. Trace build is private `g++/cc1plus`; target remains 0x82 / 42, byte-identical to v17.
- The trace-only baseline corpus is unchanged: 54/54 modules, total diff 0, 818 zero-reuse events. None has the target's integrated QI-zero / multi-set canonical user-variable quantity shape. Saved artifacts are in `cse-zero-corpus-v18/` within the entity checkpoint.
- Private v19 quantity-level wider-mode filter fires and preserves a separate zero through first CSE, GCSE, and loop. Second CSE canonicalizes the byte-store SUBREG back to `clear_mode`; flow deletes the separate zero. Target remains 0x82 / 42. Exact next action: extend the same structural quantity exclusion to canonicalization and equivalent-source choices, then target proof before broader validation. No production change or broader validation of this ineffective probe.
- Private v20 extends that guard to narrow SUBREG canonicalization and equivalent-source trials. **Unchanged v13 source now matches vfunc_0C at 0x84 / 0.** Artifacts `entity-base-vfunc0c-v20-quantity-canon.*`, provenance `v20-invocation.json`. This supersedes the older 0x82 frontier and next-action bullets above. All five batch functions now have exact source candidates; only the renderer is integrated. Next: validate existing hard targets/canaries, corpus, and full ROM, package a clean pinned compiler, then prove typed batch integration before promotion/commit/push.

If any older “current”, “next”, “gate”, or “HEAD” statement below disagrees with this snapshot, this snapshot wins.
