# FoMT Repository Map

## Active scope — October 5, 2026

The active goal is now **non-save custom-game expansion enablement through retail
decompilation**. Preserve the byte-identical US retail ROM on `ches-dev`, but
prioritize the runtime/data boundaries that let the separate custom-game branch
add or extend NPCs, bachelorettes, items, tools, crops, dialogue/events,
inventory/shops, and their assets.

The legacy save loader `func_08011650` is **paused, not abandoned**. Its
behavior, experiments, failures, and exact continuation are preserved under
`tools/ches/checkpoints/save-loader-08011650-2026-10-04/`. Do not resume that
compiler-sensitive exact-match puzzle unless the user explicitly asks, or a
later expansion feature requires a missing persistence fact.

Use a throughput-first decomp strategy: prefer coherent clusters and
high-leverage small/medium functions, recover semantics/types/callers first,
and rotate away from compiler archaeology once a function's remaining problem
is source-spelling/allocation exactness rather than missing game behavior.
Custom behavior still belongs only in the separate custom-game worktree.


This is a practical map of the current reconstruction, not a claim that every subsystem is fully understood.

## Current reconstruction snapshot - October 6, 2026

Authoritative live state is in `START_HERE.md`; this section keeps the repository map aligned with it.

- Production `ches-dev` remains at `9078f368c02d861f7cd71685e1f9dd1d95c7c384` (`9078f36 decompile game object entity teardown`); the active exact working branch is `Live-temp`. The current asset/decomp worktree is exact but not yet committed.
- Current code reconstruction is **64,536 / 940,036 = 6.8653%** with **875,500 assembly bytes = 93.1347%**.
- Current data/assets reconstruction is **75,334 / 6,777,404 = 1.1115%**; overall meaningful-ROM reconstruction is **140,266 / 7,717,440 = 1.8175%**.
- Current contiguous tail free space is **671,168 bytes = 655.44 KiB = 8.0009%** of the 8 MiB ROM. `make progress` reports all four metrics plus `fomt.gba: OK`.
- Retail SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Authoritative compiler path is the tracked `tools/install_agbcp.sh` + `tools/agbcp_fomt_compat.patch` SHA-256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.
- Hardware, intrusive callback-list, DMA/transfer, entity-effect, and resource-handle ownership remain readable in their existing shared source/docs.
- Sprite animation remains readable in `include/sprite_animator.hh`, `src/sprite_animator.cc`, and `docs/SPRITE_ANIMATOR.md`; packed-bank parsing remains readable in `include/sprite_animation_provider.hh` / `src/sprite_animation_provider.cc`.
- The packed bank has **416 semantically owned animations: 405 / 450 simple and 11 / 43 multi-frame**. Completed exact families include Water Splash 425 / 0x1A9, six Fish Kings, five menu-special presentation icons, and Dog Ball 21..48. **45 simple and 32 multi-frame animations remain intentionally unowned.** The direct runtime census is now exhaustive: all 22 explicit `gUnk_086678A0` provider-constructor sites are accounted for, and the common renderer/provider APIs own only completed families. `func_080CE184` is only grid/slot arithmetic and `func_0800F258` is typed `GetHeldArticle`; both are closed false co-occurrence leads. The active frontier is resource-family provenance, led by alias block 173..180, contiguous block 413..420, shared-palette group 54..57, and shared-frame pair 160/161.
- Recent 0x080Axxxx source conversions include:
  - `src/code_080A46AC.cc`
  - `src/code_080A480C.cc`
  - `src/code_080A4A4C.cc`
  - `src/code_080A4A94.cc`
  - `src/code_080A5670.cc`
  - `src/code_080A56DC.cc`
  - `src/code_080A5A9C.cc`
  - `src/code_080A5EA0.cc`
  - `src/code_080A601C.cc`
  - `src/code_080A6420.cc`
  - `src/code_080A6640.cc`
- `src/water_region.cc` and `src/terrain.cc` contain exact compiler-sensitive source conversions backed by the tracked compatibility toolchain.
- Shared entity effects are readable in `include/entity_effect.hh`, `src/entity_effect.cc`, `src/entity_effect_dtor.cc`, and `src/entity_effect_vtable.cc`; existing actor callers and graphics helpers use the shared layout.
- Shared resource handles are readable in `include/resource_handle.hh`, `src/resource_handle.cc`, and `docs/RESOURCE_HANDLES.md`; effect callers share the corrected lookup ABI. Twenty functions are exact, including construction/acquisition, queries, root/order8 full resets, root/order9 partial ranges, release through order8 and entry initialization. Thirteen saved compiler behaviors reproduce the complete ROM.
- Full workflow and do/don't rules are in `docs/DECOMP_PLAYBOOK.md`.
- Custom-game/QoL/custom-character work remains separate from retail reconstruction.

## Active custom-character support

The initial research is complete, and its five-function retail support unit is
now exact: shared NPC class declarations, character location, schedule
application/daily initialization, and Lillia entity/effect creation. Files are
`include/entity_npc.hh`, `src/character_location.cc`,
`src/character_schedule.cc` and `src/entity_lillia.cc`. Stable architecture is
in `docs/CHARACTERS.md`; design/stages in `docs/CUSTOM_CHARACTERS.md`.

`src/data_character_info.cc` contains the exact 43-entry readonly table; its
344 data bytes preserve aliases/name pointers and add 0 executable bytes.
`src/game_object_entity_lookup.cc` owns both native indexed entity lookups and
`GameObject::vfunc_3C` teardown. `src/character_info.cc` owns the early social
resolver block `080A01F8..080A03B7`; `src/character_social.cc` owns the later
`080A06B0..080A0A1B` resolver/social block; and `src/heart_event_days.cc` owns
exact `func_08045584`. The complete `func_0801A8E0` factory remains mapped as
94 selectors / 58 unique targets, but its large body stays assembly until
unresolved families can be typed honestly.

The first item/tool expansion lane is also substantially recovered:
`src/game_object_article_interaction.cc` owns the exact runtime `+0xE4/+0xE8`
Article mutation/classification pair, `src/money.cc` owns the exact MoneyState
constructor/credit/debit core, and `src/data_shop_catalog.cc` /
`src/shop_catalog.cc` own the typed item-shop catalog boundary. The packed
sprite provider is readable in `src/sprite_animation_provider.cc`.

All **347 retail Tool/Food/Article icons**, Wrapped Present (352), Basket (53),
and eight code-owned cooking assets are now editable indexed PNG build inputs
under `assets/item_icons/`. `tools/packed_sprite_bank.py` rebuilds the
0x30080-byte bank exactly. The cooking UI owns `gCookingUtensilIconIds`, mapping
Knife=265, Frying Pan=204, Pot=346, Mixer=64, Whisk=472, Rolling Pin=313,
Oven=327, and Seasoning Set=400. `func_08092A70` remains parked at `0x260 / 3`.
The active continuation is to trace the remaining seasoning-selection state
before moving to the next table-driven packed-bank consumer. Product-count growth remains
deferred because `ShippingBin::product_stats[NUM_PRODUCTS]` is embedded in
persistent state.

Legacy loader `func_08011650` remains paused. Crop/field semantics,
dialogue/event registration, and character portrait/display assets remain later
non-save frontiers. The custom-game branch stays separate, and original IDs/save
layouts plus occupied entity selector 43 remain constraints.

## Documentation map

Tracked subsystem/domain references currently include:
- `docs/KEY_INPUT.md`: key-input record and matching input helper architecture.
- `docs/SAVE_FORMAT.md`: retail save-slot layout, checksum boundary, and extension-space findings.
- `docs/CHARACTERS.md`: matching name/birthday/NPC interfaces, decoded roster, persistent offsets, schedules, entity/effect lifecycle, and fixed consumers.
- `docs/CUSTOM_CHARACTERS.md`: character-specific expansion stages, separate ID domains, asset/dialogue work, and first-NPC acceptance criteria.
- `docs/CUSTOM_GAME_EXPANSION.md`: active cross-system non-save expansion roadmap for characters, items/tools, crops, events/dialogue, assets and runtime registration.
- `docs/HARDWARE.md`: hardware owner/context layout, accessors, VBlank update path, and shared callback-list ownership.
- `docs/HARDWARE_TRANSFER.md`: transfer descriptor/vector layout, DMA copy/fill setup, and exact integration boundaries.
- `docs/INTRUSIVE_CALLBACK_LIST.md`: shared callback node/list layout, sentinel invariants, recovered operations, and exact linker boundaries.
- `docs/SPRITE_ANIMATOR.md`: proven SpriteAnimator layout/API plus the packed item-animation provider, bank geometry, and exact PNG item-asset round trip.
- `docs/ENTITY_EFFECTS.md`: shared entity/effect layout, constructors, update modes, render/graphics-refresh boundary, destructor flags, and typed virtual table.
- `docs/RESOURCE_HANDLES.md`: packed IDs, manager/entry layout, reference counts, generation validation, query sentinels, client lifetime, tree range/release algorithms and exact source boundaries.
- `docs/PROGRESS.md`: contribution-facing multi-axis reconstruction progress and current metrics.
- `docs/ASSET_DECOMPILATION.md`: authoritative asset/data counting rules, current asset byte ownership, free-space reporting, and code-coupled asset roadmap.
- `assets/item_icons/README.md`: editable retail item-icon asset workflow, exact bank rebuild commands, sharing rules, and current conversion boundary.

Private/local decomp coordination documents include `START_HERE.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/DECOMP_NOTES.md`, `docs/FOMT_COMPILER_RESEARCH.md`, and `tools/ches/`.

Continue the tracked subsystem-doc pattern when a shared type or domain becomes materially understood. These architecture pages should contain durable human-facing facts, while transient candidate/version/compiler research stays in private checkpoints.

The completed SpriteAnimator batch has a dedicated contribution-facing architecture document at `docs/SPRITE_ANIMATOR.md`. Future animation work should extend that stable page with proven architecture rather than mixing transient compiler/candidate history into it.

### Progress and asset tooling

- `tools/scripts/calcprogress.py`: multi-axis code/data-assets/overall-ROM/free-space tracker used by `make progress`.
- `tools/progress_manifest.json`: explicit baserom-backed exclusions and generated asset-family declarations for conservative byte ownership.
- `tools/packed_sprite_bank.py`: exact packed sprite-bank PNG export/import/rebuild tooling.
- `docs/ASSET_DECOMPILATION.md`: counting rules, current byte totals, free-space definition, and code-coupled asset roadmap.

## High-level architecture

```text
Boot / interrupts / low-level hardware
        |
Scenes and game-state management
        |
World/entity system
        |
Actors
 |      |       |
NPCs  animals  player/farmer
        |
Farm, field, buildings, inventory, items
        |
Event script engine
        |
FoMT event bytecode
```

Audio sits alongside much of this through the M4A engine.

## Current readable source modules

### Player and inventory

```text
src/farmer.cc
src/farmer_entity_item_action.cc
src/rucksack.cc
src/rucksack_item.cc
src/held_item.cc
src/item.cc
src/game_object_article_interaction.cc
src/money.cc
src/shop_catalog.cc
src/data_shop_catalog.cc
```

### Farm and buildings

```text
src/farm.cc
src/field.cc
src/farm_house.cc
src/shipping_bin.cc
src/tool_chest.cc
src/fridge.cc
src/shelf.cc
src/record_player.cc
src/coop.cc
src/barn.cc
```

### Entity/actor hierarchy

```text
src/entity.cc
src/entity_actor.cc
src/actor.cc
src/npc_entity.cc
src/entity_lillia.cc
src/game_object_entity_lookup.cc
src/npc.cc
```

### Animals and characters

```text
src/animal.cc
src/pet.cc
src/livestock.cc
src/barn_animal.cc
src/dog.cc
src/horse.cc
src/chicken.cc
src/cow.cc
src/sheep.cc
src/bachelorette.cc
src/harvest_sprite.cc
src/character_info.cc
src/data_character_info.cc
src/character_location.cc
```

### Schedules and scripts

```text
src/data_schedules.cc
src/character_schedule.cc
src/script_engine.cc
```

### Lower-level/runtime/audio

```text
src/hardware.cc
src/hardware_context.cc
src/hardware_transfer.cc
src/intrusive_callback_list.cc
src/resource_handle.cc
src/sprite_animation_provider.cc
src/sprite_animator.cc
src/scene.cc
src/new.cc
src/pure_virtual.c
src/m4a.c
src/m4a_1.s
src/crt0.s
src/sound_data.s
```

## Partially understood source modules

These have address-based names because their role is still incomplete or uncertain:

```text
src/code_0800BC58.cc
src/code_0800E2E4.cc
src/code_080A46AC.cc
src/code_080A480C.cc
src/code_actor_0809BFE8.cc
src/code_entity_08020018.cc
```

These files are interesting reverse-engineering targets because some work has already been done, but naming/understanding is incomplete.

## Major remaining assembly areas

Approximate size by assembly source lines at the time this guide was written:

```text
asm/code_0803EE94.s        ~179k lines
asm/code_809E804.s         ~104k lines
asm/code_linkonce.s         ~35k lines
asm/code_entities.s         ~32k lines
asm/game_state.s            ~27k lines
asm/code_entities_08034CEC.s ~11k lines
asm/code_0803A8A4.s          ~9k lines
asm/new_game.s               ~7k lines
asm/intro_scene.s            ~5k lines
```

Line count is not a decompilation percentage. Assembly output is verbose, so one C++ function may correspond to many assembly lines.

Still, it makes clear that large parts of the native game remain to be reconstructed.

## The linker script as a map

`fomt.lds` lists modules in ROM order.

A simplified reading of the current order is:

```text
ROM header
main/startup
SRAM proxy / interrupts
scene systems
new game / intro
hardware
farm and field
buildings/storage
items/player/inventory
game scene/state
entity system
script engine
actors/animals/NPCs
large unknown code blocks
audio/runtime libraries
vtables
read-only data
IWRAM code
padding to 8 MiB
```

If you want to know roughly where a subsystem lives in the original ROM, `fomt.lds` is one of the best orientation tools.

## GBA addresses you will commonly see

```text
0x02000000  EWRAM
0x03000000  IWRAM
0x08000000  cartridge ROM start
```

FoMT's original ROM is 8 MiB, so its retail image occupies:

```text
0x08000000 through 0x087FFFFF
```

The linker declares a 32 MiB ROM address space, but the matching retail build pads to 8 MiB.

## Matching vs modding

For decomp work:

```text
change implementation
make compare
expect SHA1 to remain identical
```

For intentional mods:

```text
change behavior/data
build ROM
expect SHA1 to change
run/test in mGBA
```

Do not use a changed SHA1 as proof that a mod is broken. Once we intentionally modify the game, matching the retail SHA1 is no longer the goal for that mod build.

## Companion projects

```text
/mnt/data/Github/gba/FOMT-DOC
```

Older reverse-engineering notes about FoMT internals.

```text
/mnt/data/Github/gba/mary
```

FoMT/MFoMT event-script compiler and decompiler.

Mary currently handles most vanilla FoMT scripts and is our starting point for dialogue/cutscene work.

## October 2, 2026 - renderer helper source files

New exact retail source files in the 0x080Axxxx renderer block:
- `src/code_080A5A9C.cc`
- `src/code_080A5EA0.cc`
- `src/code_080A601C.cc`
- `src/code_080A6420.cc`
- `src/code_080A6640.cc`

Their assembly windows are removed from `asm/code_809E804.s` and bridged through dedicated linker subsections in `fomt.lds`.

## Leverage analysis navigation - October 2, 2026

Private roadmap/tooling:
- `docs/DECOMP_PRIORITY_MAP.md`: current high-leverage target tiers and phased roadmap.
- `tools/ches/analyze_decomp_leverage.py`: unresolved direct-call fan-out / approximate-size analyzer.
- `tools/ches/checkpoints/decomp-leverage-2026-10-02.md`: dated raw ranking snapshot.

Historical shared-type continuation at the October 2 checkpoint:
`include/resource_handle.hh` and `src/resource_handle.cc` expose the shared client/reference/query API. That resource-handle continuation was subsequently completed through the documented twenty-function scope; its allocator/CSE frontiers are deferred research, not current work. SpriteAnimator is also fully recovered and production-integrated. The save loader `func_08011650` is preserved but paused. The current continuation is the non-save item/tool interaction boundary after completing the character/social resolver pass; use `START_HERE.md`, `docs/CUSTOM_GAME_EXPANSION.md`, and `tools/ches/NEXT_AGENT_HANDOFF.md` for the exact active frontier.
