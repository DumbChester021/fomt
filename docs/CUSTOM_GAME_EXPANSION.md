# Custom-game expansion enablement roadmap

## Current override — October 10, 2026

The user has paused **all custom-game expansion** until the retail save structure, GameState initialization and entire save/load lifecycle are understood and decompiled in exact, human-readable C++. The full SRAM header is now source-owned (seven new functions/472 bytes), but this does **not** make custom persistence ready. This document retains future expansion research; the current work is in [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md) and [START_HERE.md](../START_HERE.md).

## Earlier pivot — October 6, 2026 (superseded)

At that time, the retail project had pivoted to **throughput-first whole-game decompilation**.
The custom-game goal is unchanged: make future added content safe and source-
level, but do not let one expansion lane dictate the retail work queue when a
higher-leverage TU/type cluster can unlock more of the game.

Retail reconstruction remains byte-exact on `main`; custom behavior remains
in the separate custom-game worktree. Save/persistence stays a later lane and
`func_08011650` research remains preserved.

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
| Save/persistence | Writer/checksum/slot geometry, exact source-owned SRAM header, and 0xAF0 unused tail per slot | **Active retail work:** full GameState loader, typed persistent objects, SRAM I/O, save/load menu and erase/copy/retry; custom persistence deferred |

## Historical expansion priority order (deferred)

### 1. Exploit the whole-game decompilation queue

Custom-game readiness now benefits from the same ranked TU/cluster pipeline as
the retail project. Recover high-leverage classes, globals, dispatchers, tables,
and coherent translation units first when they unlock many later systems.

The function/TU database, similarity clustering, vtable/class map, data ownership
map, and later runtime coverage should reveal extension points faster than
manually chasing one resource ID at a time.

### 2. Keep asset authoring code-coupled, but not queue-defining

Retail asset/data recovery still requires enough runtime/type evidence to know
format and ownership. Anonymous extraction does not count. However, the 77
remaining unowned packed animations are now parked as an open list and should
resolve naturally while their scenes, events, minigames, tables, and owning TUs
are reconstructed.

The packed bank remains **416 / 493 semantically owned animations: 405 / 450
simple and 11 / 43 multi-frame**. All 22 explicit provider-constructor sites and
the common packed-consumer lanes are already accounted for. Preserve that
closed evidence rather than restarting the same searches.

Bulk structural extraction is still useful for recognizable pointer tables,
fixed-stride records, palettes, tile banks, scripts, maps, and sound tables.
Consumers establish semantics; editable byte-exact rebuilds establish asset
progress.

### 3. Item and tool extension boundary

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

### 4. Character follow-through

Character interaction routing is now sufficiently mapped to stop blocking the
broader pivot. Remaining character work is asset/provider round trips, runtime
registration/factory extension, and the explicit policy for a seventh romance
candidate across spouse/rival/wedding/event/UI consumers. Do not reopen the
giant dispatcher or the parked five-byte `func_080455D8` mismatch without a
new structural reason.

### 5. Crops and field behavior

Turn opaque `FieldPlot` state into gameplay concepts. Prioritize seed/article use, till/water/tool effects, planting/growth state, harvest output, crop death/weather, and product/item conversion.

### 6. Dialogue, events and non-item assets

Use Mary for bytecode, but recover the native side that makes bytecode reachable:
trigger/event registration, native callable/script dispatch, fixed event-table
consumers, portrait/display-animation selection, and character/map asset-provider
registration/bounds. The Tool/Food/Article icon bank is no longer an unknown
asset boundary: its 347 named item icons already round-trip through PNG source.

### 7. Runtime custom-character prototype

Once interaction + assets + registration are understood, return to the mapped entity factory only for the concrete pieces needed to instantiate one extra ordinary NPC, then a bachelorette. Keep character IDs, entity selectors, display IDs, script IDs and schedule cursors as separate domains.

Persistence is deliberately not part of this prototype. A non-persistent or deterministically initialized runtime prototype is acceptable for proving the non-save architecture. Save support returns only after the runtime path works.

## Throughput rule

A hard retail function may remain assembly after its behavior and interfaces are
understood. If exact matching stalls on compiler allocation/source spelling and
no new semantic fact is being learned, preserve the best candidate/evidence and
continue the rest of the coherent TU/cluster. Production source remains exact-
only; understood-but-nonmatching work is tracked privately. Re-rank after major
shared types or units are recovered.

The retail ROM SHA1 remains the final authority for every promoted retail contribution.
