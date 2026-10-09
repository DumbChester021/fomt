# FoMT Repository Map

## Active scope - October 6, 2026

The active retail goal is **throughput-first whole-game decompilation**. Preserve
the byte-identical US ROM on public branch `main`, keep custom behavior
separate, and use the already-recovered shared infrastructure to unlock large
coherent portions of the remaining assembly.

The normal work unit is an inferred original translation unit or coherent
structural/type/similarity cluster. Target selection comes from the unified
function/TU inventory, similarity and class/data ownership maps, and a ranked
queue that balances bytes, downstream leverage, type readiness, coherence, and
known compiler difficulty.

Save-loader exact matching and the documented compiler-sensitive islands remain
parked unless new evidence raises their leverage. Runtime savestate/watchpoint
work is preserved as seed infrastructure for scripted coverage/indirect-call
collection, not as the primary target queue. Custom behavior belongs only in
the separate custom-game worktree.

This is a practical map of the current reconstruction, not a claim that every
subsystem is fully understood.

## Current reconstruction snapshot - October 9, 2026

Authoritative live state is in `START_HERE.md`.

- Active public retail branch: **`main`**. The former `Live-temp` series is retired; `ches-dev` remains historical.
- Code reconstruction: **81,428 / 940,036 = 8.6622%**; **858,608 assembly bytes** remain.
- Remaining linked asm functions: **2,133**; inferred ranges cover **855,912 / 858,608 = 99.6861%**, with **2,696 unattributed bytes** and **17 explicitly parked functions**.
- Data/assets: **75,334 / 6,777,404 = 1.1115%**.
- Overall meaningful-ROM reconstruction: **157,158 / 7,717,440 = 2.0364%**.
- Contiguous tail free space: **671,168 bytes = 655.44 KiB**.
- Retail SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; full compare remains **`fomt.gba: OK`**.
- Authoritative compiler path is the tracked `tools/install_agbcp.sh` plus `tools/agbcp_fomt_compat.patch`, SHA-256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.
- Hardware, intrusive callback-list, DMA/transfer, entity-effect, resource-handle, SpriteAnimator/provider, NPC/social, item/economy, and GameObject lookup/teardown boundaries provide the current shared type foundation.
- All 35 resident constructors are source-owned. IDs 1..34 also have source-owned +0x30 factories; Child +0x30 remains assembly.
- The neutral location-bound actor hierarchy and thrown Ball family are bounded at documented scopes.
- The adjacent Entity38740 controller/strategy neighborhood now owns numerous exact helpers, including nearest-entity selection, region testing, strategy selectors, mode-4 setup, table/mask helpers, the `UnknownEntityThing` factory, and the exact `39F50` destructor.
- `func_08039E98` is behavior-complete and exact-size in scratch at 0xB8 / 109 but parked on register allocation.
- The Entity398A4/Entity38740 neighborhood now includes exact `398A4/399C0`, `39A60`, `3A144`, `3A320/334`, `3A350`, `3A798`, and the seven-function helper tail `3A804..3A8A0`. `39E98`, `39F90`, `3A180`, and `3A394` are behavior-complete/bounded parked codegen islands. The 652-byte logical map resolver is now exact source in `src/map_resource.cc`, with the shared interface in `include/map_data.hh`. Four resource-owner methods are now integrated in `src/resource_owner_cached.cc` and `src/resource_owner_variable.cc`, with shared `include/resource_owners.hh`, adding 680 linked bytes after both full-ROM gates. Constructors and sibling B128 remain assembly. `docs/RESOURCE_OWNERS.md` records recovered provider, descriptor and owner layouts; the handoff records remaining constructor/update mismatches.
- The packed bank remains **416 / 493 semantically owned animations**, with the remaining 77 IDs as a parked by-product lane.

The scene lifetime layer is exact in `include/scene_owners.hh` and `src/scene_owners.cc`: 18 natural constructors, 25 natural destructors and 22 Run entries / 3,236 linked bytes. Constructors allocate audited controllers and transfer continuations. Seven constructors, controller implementations, concrete screen identities and three complex Runs remain incomplete. Stable evidence is in `docs/SCENES.md`.

The prior 39-member single-owned-polymorphic cleanup family remains exact in `src/owned_polymorphic_dtors.cc`, with stable evidence in `docs/POLYMORPHIC_OWNERS.md`.

Recent readable source in this region includes:
- `include/entity_unk_08037008.hh` / `src/entity_unk_08037008.cc`;
- `include/entity_ball.hh` / `src/entity_ball.cc`;
- `src/entity_unk_08038740.cc`.

Shared entity effects are readable in `include/entity_effect.hh`,
`src/entity_effect.cc`, `src/entity_effect_dtor.cc`, and
`src/entity_effect_vtable.cc`.

Shared resource handles are readable in `include/resource_handle.hh`,
`src/resource_handle.cc`, and `docs/RESOURCE_HANDLES.md`.

Full workflow and do/don't rules are in `docs/DECOMP_PLAYBOOK.md`.
Custom-game/QoL/custom-character work remains separate from retail
reconstruction.

## Active custom-character support

The initial research is complete, and its five-function retail support unit is
now exact: shared NPC class declarations, character location, schedule
application/daily initialization, and Lillia entity/effect creation. Files are
`include/entity_npc.hh`, `include/entity_resident_npcs.hh`, `src/character_location.cc`, `src/character_schedule.cc`, `src/entity_lillia.cc`, and `src/entity_resident_npcs.cc`. All 35 resident constructors are now exact source; IDs 1..34 also have source-owned +0x30 factories, while Child +0x30 remains the lone resident factory in assembly. Stable architecture is in `docs/CHARACTERS.md`; design/stages in `docs/CUSTOM_CHARACTERS.md`.

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
That item/tool lane remains behind the whole-game throughput queue. The resource-owner exact set is complete. Fishing records are recovered in `include/fishing_records.hh` / `src/fishing_records.cc`, and the mine-floor cluster owns 872 exact linked bytes through exact E0AC plus the E174..E1B4 progress getters around the recovered 0x628-byte persistent type in `include/mine_floor.hh`. The exposed E118..E174 and E1B4..E2D4 islands are behavior-recovered but parked after bounded source-shape attempts. The adjacent GameState+0x3480 block is now a typed 0x14-byte `CursedToolState`; the +0x3494..+0x34C3 block is conservatively opaque; GroundPickupState at +0x34C8 is now exact source; the +0x34D8 mask and +0x34DC actor state are already source-owned; active scene work is constructors with additional inputs. D8E8 and DA00 remain parked source-shape/compiler frontiers; the compiler-sensitive loader remains parked. Product-count growth remains deferred because `ShippingBin::product_stats[NUM_PRODUCTS]` is embedded in persistent state.

Legacy loader `func_08011650` remains paused. Crop/field semantics,
dialogue/event registration, and character portrait/display assets remain later
non-save frontiers. The custom-game branch stays separate, and original IDs/save
layouts plus occupied entity selector 43 remain constraints.

## Documentation map

Tracked subsystem/domain references currently include:
- `docs/MAP_DATA.md`: logical/physical map namespaces, seasonal and building variants, mine-floor grouping and matching resolver interface.
- `docs/RESOURCE_OWNERS.md`: recovered rendering-provider contracts, frame descriptors, 0xA0/0x46C owner layouts and assembly/source integration boundaries.
- `docs/KEY_INPUT.md`: key-input record and matching input helper architecture.
- `docs/SAVE_FORMAT.md`: retail save-slot layout, checksum boundary, recovered persistent subobjects, and extension-space findings.
- `docs/MINE_FLOOR.md`: GameState+0x2E58 mine-floor persistent layout, packed tile fields, Jewel/progress flags, and exact integration boundary.
- `docs/CHARACTERS.md`: matching name/birthday/NPC interfaces, decoded roster, persistent offsets, schedules, entity/effect lifecycle, and fixed consumers.
- `docs/CUSTOM_CHARACTERS.md`: character-specific expansion stages, separate ID domains, asset/dialogue work, and first-NPC acceptance criteria.
- `docs/CUSTOM_GAME_EXPANSION.md`: custom-game readiness roadmap for characters, items/tools, crops, events/dialogue, assets and runtime registration; retail execution order comes from the throughput priority map.
- `docs/HARDWARE.md`: hardware owner/context layout, accessors, VBlank update path, and shared callback-list ownership.
- `docs/HARDWARE_TRANSFER.md`: transfer descriptor/vector layout, DMA copy/fill setup, and exact integration boundaries.
- `docs/INTRUSIVE_CALLBACK_LIST.md`: shared callback node/list layout, sentinel invariants, recovered operations, and exact linker boundaries.
- `docs/SPRITE_ANIMATOR.md`: proven SpriteAnimator layout/API plus the packed item-animation provider, bank geometry, and exact PNG item-asset round trip.
- `docs/ENTITY_EFFECTS.md`: shared entity/effect layout, constructors, update modes, render/graphics-refresh boundary, destructor flags, and typed virtual table.
- `docs/RESOURCE_HANDLES.md`: packed IDs, manager/entry layout, reference counts, generation validation, query sentinels, client lifetime, tree range/release algorithms and exact source boundaries.
- `docs/PROGRESS.md`: contribution-facing multi-axis reconstruction progress and current metrics.
- `docs/ASSET_DECOMPILATION.md`: authoritative asset/data counting rules, current asset byte ownership, free-space reporting, and code-coupled asset roadmap.
- `assets/item_icons/README.md`: editable retail item-icon asset workflow, exact bank rebuild commands, sharing rules, and current conversion boundary.

Project decompilation coordination documents include `START_HERE.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/DECOMP_NOTES.md`, `docs/FOMT_COMPILER_RESEARCH.md`, and `tools/ches/`.

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
src/entity_resident_npcs.cc
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
`include/resource_handle.hh` and `src/resource_handle.cc` expose the shared client/reference/query API. That resource-handle continuation was subsequently completed through the documented twenty-function scope; its allocator/CSE frontiers are deferred research, not current work. SpriteAnimator is also fully recovered and production-integrated. The save loader `func_08011650` is preserved but paused. The function/TU inventory, similarity clustering, and class-mapping pipeline are operational. In the Entity38740/Entity398A4 region, the exact source frontier now reaches `func_0803A8A0`; parked compiler islands remain excluded from ordinary queue work. Continuation begins at `0x0803A8A4`. Runtime savestate/watchpoint work remains future bulk coverage infrastructure rather than the primary queue.


Latest recovered GroundPickupState: +0x34C8..+0x34D7, 56 availability
bits and fifteen packed three-bit durability fields. Four exact functions
add 1,032 linked bytes. A1EA8 is parked. See docs/GROUND_PICKUP_STATE.md.
The +0x34D8 mask and +0x34DC actor state are already source-owned. Active subsystem target: scene constructors with additional inputs; keep C6BC parked.
