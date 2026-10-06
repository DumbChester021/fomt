# Custom-game expansion enablement roadmap

## Active pivot — October 5, 2026

The immediate project goal is to make the separate custom-game branch capable
of safely adding content **without blocking on save-loader exact matching**.
Retail reconstruction remains byte-exact on `ches-dev`; custom behavior remains
in the separate custom-game worktree.

Save/persistence is a later lane. `func_08011650` and all associated compiler
research are preserved, not discarded.

## Readiness by system

| System | What is already strong | Main non-save blocker |
| --- | --- | --- |
| NPC identity/social | 43-entry metadata, `Npc`/`Bachelorette` state, location/schedule helpers, exact broad NPC and fixed bachelorette resolvers, and native social-call routing | Future extensible resolver policy for added IDs plus asset/runtime registration |
| NPC runtime | Base NPC entity layout, Lillia path, lookup/teardown, complete 94-selector factory map | Registration/creation extension point and remaining concrete families only as needed |
| Bachelorettes | `Bachelorette` state/love/event methods, fixed six-candidate resolvers, calls 134..136 love routing, and `func_08045584` are readable/exact | Seventh-candidate resolver policy, remaining event consumers, spouse/rival/wedding/UI paths, and assets |
| Items/tools | `Tool`/`Food`/`Article`/`Product` tables, inventory helpers, exact GameObject paths and MoneyState, typed shops, exact packed animation-provider parsing, and **347 editable Tool/Food/Article PNG icons wired into the matching build** | New unique item art requires extending saturated `gUnk_086678A0` namespaces (493 animations / 500 sprite descriptors / 532 frames); editing/reusing retail icon slots works now. Product-count growth remains persistence-sensitive |
| Crops/field | `Field`, `FieldPlot`, weather data and many field methods are source | Crop-state naming, planting/growth/harvest/tool semantics and product links |
| Dialogue/events | Script engine source exists; Mary covers most vanilla bytecode | Native trigger/call registration, fixed event tables/consumers and reliable insertion path |
| Graphics/assets | SpriteAnimator/effect/resource infrastructure is known; item icons now have a byte-exact PNG export/import/build path with shared-resource validation | Trace each unowned asset family to its runtime owner/consumer, decompile/type that boundary, then add only the authoring support required by the proven family; animation 352 + the UI sprite path is first |
| Maps | Terrain/map groundwork exists | Editable resource structures and safe insertion/registration workflow |
| Save/persistence | Writer/checksum/slot geometry and 0xAF0 unused tail are proven; loader semantics bounded | **Paused** until runtime expansion needs persistent custom state |

## Active priority order

### 1. Code-coupled asset authoring and reconstruction

Retail work now advances asset/data recovery together with the runtime code that
owns and interprets those resources. Most of the ROM is outside the executable
code metric, but anonymous extraction is not useful enough for the custom-game
goal. Trace the owner/consumer, recover the relevant types/loaders/renderers, and
only then promote the corresponding resource to editable, byte-exact source.
Track this in `docs/ASSET_DECOMPILATION.md` and `make progress`; copied or
semantically unowned opaque blobs do not count.

The packed bank now has **416 semantically owned animations: 405 / 450
simple and 11 / 43 multi-frame**. **45 simple and 32 multi-frame animations
remain unowned.** Completed non-core families are Wrapped Present (352), Basket
(53), the eight `gCookingUtensilIconIds` assets, Money Bag (106), 18 overnight
forage/map variants, Water Splash (425 / 0x1A9), six Fish Kings, five
menu-special presentation icons, and Dog Ball 21..48. Dog Ball contributes 28
animations / 53 frames, including 10 multi-frame animations.

The common packed-consumer lanes for the remaining multi-frame set and all 22
explicit `gUnk_086678A0` provider-constructor sites are now accounted for.
`func_080CE184` is only grid/slot arithmetic, while `func_0800F258` is typed
`GetHeldArticle`; both are closed false co-occurrence leads. Continue
resource-family-first provenance on coherent unowned clusters 173..180,
413..420, 54..57, and 160/161, and do not promote them until runtime/table
semantics prove ownership. This code-coupled workflow directly benefits the
custom-game branch because each recovered family provides both editable assets
and the source-level runtime boundary needed to use them safely.

### 2. Item and tool extension boundary

The character/romance resolver pass is no longer the active blocker. Exact
worktree source now owns the early 0x1C0-byte social block, the later
0x36C-byte broad NPC/bachelorette/Harvest-Sprite resolver block, and
`func_08045584`. Social native calls 124..133 use the broad NPC resolver;
134..136 use the fixed six-bachelorette resolver. `func_080455D8` is
behavior-complete but parked at an exact-size five-byte setup-order mismatch.

The item data layer is already mature. Current retail counts are 81 tools,
171 foods, 95 articles, and 103 products, all using u8 runtime IDs with
substantial headroom before 255. Metadata/validity follows `data/item/*.def`
and `NUM_*` / `*_NONE`, so new tool/food/article IDs do not require widening
the basic item representation.

Products are the important exception:
`ShippingBin::product_stats[NUM_PRODUCTS]` is embedded in farm/game state, so
increasing the product count changes persistent layout. Keep new shippable
products out of the first non-save prototype.

The first item/tool runtime lane is now substantially source-recovered.
`FarmerEntity::ClassifyHeldItemAction()` still defines the held-item action
routing: new Article IDs default to throw; Stones, Branches, Lumber, and Golden
Lumber reach the GameObject article path, while Ball has its special path.
The paired GameObject virtuals are both exact source:
- runtime `+0xE8` / Thumb `0x0801D88C` classifies handled/blocked/unhandled;
- runtime `+0xE4` / Thumb `0x0801D7B0` applies the Article and refreshes
  neighbor-dependent field visuals.

The adjacent acquisition/economy lane is also usable: MoneyState
constructor/credit/debit are exact, six item shop catalogs are typed source,
five catalog-description helpers are exact, and filtered shop stock has a proven
40-index buffer. The remaining large purchase tables use a separate 20-byte
service-record shape rather than the 8-byte item-catalog format.

Most importantly for custom content, all **347 retail Tool/Food/Article icons**
are editable PNG build inputs under `assets/item_icons/`. They regenerate the
retail packed bank exactly. The bank is saturated at animation 492, frame 531 and
sprite descriptor 499, so a genuinely new unique icon must extend those
namespaces and the referenced graphics/palette pools. Reusing or editing an
existing retail icon slot already works.

### 3. Character follow-through

Character interaction routing is now sufficiently mapped to stop blocking the
broader pivot. Remaining character work is asset/provider round trips, runtime
registration/factory extension, and the explicit policy for a seventh romance
candidate across spouse/rival/wedding/event/UI consumers. Do not reopen the
giant dispatcher or the parked five-byte `func_080455D8` mismatch without a
new structural reason.

### 4. Crops and field behavior

Turn opaque `FieldPlot` state into gameplay concepts. Prioritize seed/article use, till/water/tool effects, planting/growth state, harvest output, crop death/weather, and product/item conversion.

### 5. Dialogue, events and non-item assets

Use Mary for bytecode, but recover the native side that makes bytecode reachable:
trigger/event registration, native callable/script dispatch, fixed event-table
consumers, portrait/display-animation selection, and character/map asset-provider
registration/bounds. The Tool/Food/Article icon bank is no longer an unknown
asset boundary: its 347 named item icons already round-trip through PNG source.

### 6. Runtime custom-character prototype

Once interaction + assets + registration are understood, return to the mapped entity factory only for the concrete pieces needed to instantiate one extra ordinary NPC, then a bachelorette. Keep character IDs, entity selectors, display IDs, script IDs and schedule cursors as separate domains.

Persistence is deliberately not part of this prototype. A non-persistent or deterministically initialized runtime prototype is acceptable for proving the non-save architecture. Save support returns only after the runtime path works.

## Throughput rule

A hard retail function may remain assembly after its behavior and interfaces are understood. If exact matching stalls on compiler allocation/source spelling and no new semantic fact is being learned, checkpoint it and move to another function in the same subsystem. Prefer several connected exact functions and typed data over weeks spent on one compiler-sensitive island.

The retail ROM SHA1 remains the final authority for every promoted retail contribution.
