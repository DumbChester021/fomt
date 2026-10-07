# Custom-character enablement roadmap and deferred design

## Active scope — October 6, 2026

The retail project now uses **throughput-first whole-game decompilation** rather
than making character expansion the primary queue. Preserve the byte-identical
US retail ROM on `main`; custom behavior remains only in the separate
custom-game worktree.

Character work still benefits directly from the new TU/cluster pipeline:
recover shared classes, dispatchers, globals, tables, and repeated entity/NPC
families when they rank highly, then reuse that understanding for future added
NPCs and romance candidates. Do not force the retail queue to stay inside the
character lane when another coherent unit has better total leverage.

The legacy save loader `func_08011650` remains paused with its research
preserved. Persistence returns when a concrete runtime feature needs stored
custom state.

This page owns the **character lane** of the broader custom-game roadmap. The
cross-system retail queue is in [DECOMP_PRIORITY_MAP.md](DECOMP_PRIORITY_MAP.md)
and [CUSTOM_GAME_EXPANSION.md](CUSTOM_GAME_EXPANSION.md). Earlier design notes
use one ordinary added NPC as a reference for dependencies and compatibility
requirements; they remain valid design evidence, not the immediate retail next
action.

[CHARACTERS.md](CHARACTERS.md) owns proven retail character architecture.
[SAVE_FORMAT.md](SAVE_FORMAT.md) owns the paused retail persistence boundary.

## What is ready, and what still needs work

| Area | Recovered evidence | Future implementation dependencies (deferred) |
| --- | --- | --- |
| Identity | Matching name, birthday, persistent-NPC and location lookups; 43-entry editable metadata table | Extension lookup design after caller and numeric-width audit |
| Social state | `Npc`, `Bachelorette`, and `HarvestSprite` fields; fixed offsets and daily flags | Mod-owned state allocation, daily registration, dialogue/gift routing |
| Schedules | Matching application and daily initialization; descriptor/path formats and one readable Rick schedule | Selector validation and schedule authoring round trip |
| Entity lifecycle | Shared NPC class interface, matching Lillia pair, native GameObject lookup/teardown, and complete 94-selector factory mapping | Recover only the remaining factory family types/source needed by an extension design, then define safe registration/allocation rules |
| Rendering | Shared retail animator/effect infrastructure and actor-facing refresh are recovered | A verified new asset/provider entry and resource-budget measurements |
| Dialogue | Mary can compile event bytecode; original scripts are available for inspection | Trigger registration, native callable routing, portrait selection, gift/event behavior |
| Persistence | Matching retail checksum/writer; 2,800 unused bytes per slot; loader semantics bounded and research preserved | **Paused** until the runtime/content expansion path needs persistent custom state |

Updating documentation or recovering a format improves expansion readiness but
does not increase matching source percentage or demonstrate gameplay support.
The two worktrees may have different source recovery levels; sharing these docs
alone does not merge the newer retail interfaces into the custom-game branch.

## Keep the ID domains separate

| Domain | Proven boundary | Consequence |
| --- | --- | --- |
| Character identity | Retail helpers accept 0..42; 0 is empty and 35 is the child | Preserve those meanings; a proposed character ID starting at 43 needs new routing |
| Entity selector | Factory uses a pointer array and a jump table for 0..93; initialization visits 0..99 | Selector 43 already belongs to an existing entity; allocate or bridge a separate namespace after the complete caller audit |
| Schedule/path/point cursor | Three five-bit persistent indices | Validate indices 0..31 even when metadata counts are wider |
| Animation | Persistent animation and frame IDs/counts are 16-bit; 0xFFFF is `NO_ANIM` | Validate widths, sentinel use, and the actor's animation-base plus facing |
| Dialogue/display animation | Current bank at 0x0852D984 supplies 184 selections | These indices are distinct from character IDs; expansion needs bank/provider and caller changes |
| Script | FoMT event table at 0x080F89D4 has non-null IDs 1..1328; entry 0 is null | Compiling bytecode does not register a trigger or extend the table/consumers |
| Map | Location/path map fields occupy ten bits; `MAP_NONE` is 0x234 | Use an existing valid map for the first prototype; sentinel values are not free IDs |
| Saved custom identity | No extension key format exists yet | Persist a stable key rather than the current definition-array position |

All widths and bounds above describe the current engine, not a promised NPC
capacity. RAM, live entities, tile/palette pools, OAM, script consumers, ROM
relocation, and the save budget need measurement for the chosen implementation.

## Deferred reference: proposed architecture

Keep the retail 0x34F4-byte `GameState` and its fixed 0x478-byte social block.
Add custom definitions and state through an explicit extension boundary on the
custom-game track. Do not insert records into the packed retail block.

A definition should associate a stable character key with name/birthday,
appearance and animation data, a schedule selector, interaction scripts,
gift rules, and any custom event flags. Persistent state should carry explicit
serialized fields for friendship, daily interaction flags, location/cursors,
and the selected custom flags. Runtime entities reference live state, while
save records use keys and fields without RAM pointers.

Route original identities through their existing helpers and custom identities
through an extension lookup. Native entity/script lookup also needs a bridge;
a character ID alone cannot become an entity-array index. Registration must
cover daily updates, actor creation, map-dependent render attachment, unloading,
state synchronization, and load/new-game initialization. The choice between a
side registry and wider engine storage remains open until all array users and
ownership paths are mapped.

A versioned per-slot save extension is a candidate, with magic, bounded length,
integrity checking, migration, and a way to associate it with the corresponding
retail save. Reserve bookkeeping and other custom systems before calculating
record capacity. Defaults for legacy saves and a defined partial-write recovery
policy are required; no combined transaction is provided by the retail writer.

## Stage 1: recover the NPC support boundary in retail

The first coherent five-function unit is complete in the retail worktree:

| Function | Bounded range to next symbol | Why it helps |
| --- | --- | --- |
| `func_080A03B8` | 0x080A03B8..0x080A041B (0x64 bytes) | Resolve persistent character location and its fallback |
| `func_0803D688` | 0x0803D688..0x0803D7E3 (0x15C bytes) | Apply a schedule and initialize persistent cursors |
| `func_0803D7E4` | 0x0803D7E4..0x0803DA23 (0x240 bytes) | Expose the 31 fixed registrations plus conditional child |
| `func_08035AFC` | 0x08035AFC..0x08035B37 (0x3C bytes) | Recover a fully traced ordinary NPC constructor, Lillia |
| `func_08035B38` | 0x08035B38..0x08035B63 (0x2C bytes) | Recover that NPC's separate render/effect allocator |

All five are readable, byte-exact C++ under the tracked compiler. Both forced
full-ROM builds passed, including shared-class/vtable ownership and source
seams. They add 0x468 (1,128) linked source bytes. Existing `ANpcEntity` source
is unchanged. These interfaces are available on retail `main`; they have not been
merged into the older custom-game source. This recovery does not yet implement
an added NPC.

The 43 metadata entries are exact typed initializers in the retail
`src/data_character_info.cc` unit, preserving all 344 data bytes (committed and
pushed as `56f3434`). Subsequent `579c16c` and `9078f36` contributions recover
the native GameObject entity lookups and teardown. The exact October 5 worktree
adds the early 0x1C0-byte social resolver block to `src/character_info.cc`, the
later 0x36C-byte NPC/bachelorette/Harvest-Sprite resolver block to
`src/character_social.cc`, and `func_08045584` to `src/heart_event_days.cc`.
Current executable progress is **71,612 / 940,036 = 7.6180%** and the retail
ROM remains exact. The active public retail line is `main`; the former
`Live-temp` series has been folded into it, while `ches-dev` remains historical.

The complete `func_0801A8E0` factory has also been mapped without pretending
its unresolved families are semantically named: 94 selectors lead to 58 unique
construction targets; selectors 1..34 are the original resident character IDs,
35 is the child, 36..42 are Harvest Sprites, and 43 is occupied. The factory
body itself remains assembly. Legacy loader exact matching is paused. Native
interaction selection is now substantially mapped: social native calls 124..133
use the broad NPC resolver for friendship/talk/gift state, while 134..136 use
the fixed six-bachelorette resolver for love. `func_08045584` is exact source;
`func_080455D8` is behavior-complete but parked at an exact-size five-byte
compiler scheduling mismatch. Asset/provider round trips and extensible runtime
registration remain open. The unchecked entity getter and caller-specific
bounds still must be respected before assigning any new entity selector.

## Stage 2: recover existing asset/dialogue support and round trips

Trace one ordinary resident from identity to entity constructor, animation
provider, display bank, and interaction script. Lillia is the current reference:
social+0x070, entity selector 1, schedule `gUnk_080F280C`, and animation bases
0x25F/0x263. Its constructor also passes 0x3E2; Mary successfully decompiles
script 994 (0x3E2) into ordinary dialogue. That is supporting evidence, while
the native interaction/trigger route still needs verification.

The native display path provides a concrete asset lead:
`func_08050AD8` checks the selected index against `func_080ADD20`;
`func_080ADCA4` reads bank `gUnk_0852D984` through the sprite provider.
`func_0805E6CC` parses seven sequential pool headers. The current pool counts
are **184, 184, 1,037, 11,586, 52, 0, 184**, with the first six entry strides
**4, 16, 8, 32, 32, 8** bytes. The first count supplies the 184-selection
bound. These are verified US FoMT anchors; the complete portrait/expression
mapping and an editable importer are still open.

First round-trip an original asset and a small original script unchanged.
Document the future authoring requirements: palette/tile conversion, frame/OAM geometry,
facing animations, metadata indices/counts, any compression actually used,
provider references, and relocation of every affected pointer. The project's
`tools/scripts/decompress.py` handles a custom multi-stage codec; do not assume
all assets are standard GBA LZ77 or that every bank is compressed. The bank
metadata above is read directly from ROM. No encoder/import round trip was
validated during this research.

Prove the exact dialogue callable IDs and trigger configuration. FoMT Mary names
sometimes include MFoMT numeric suffixes: `Proc030` is FoMT procedure **0x02F**,
not 0x030. Community portrait byte patterns are leads until checked against the
actual VM/native path. A cosmetic replacement can test assets, but it does not
prove support for an additional NPC.

## Deferred reference: a future ordinary-NPC implementation

For a separately requested future implementation, the reference prototype
could use one existing map and a small deterministic schedule. It would need a distinct custom identity, its own persistent record and live
entity, a name/birthday, walking/facing art, one portrait/dialogue path, ordinary
friendship, and daily talk/gift flags. Add complex seasonal routines and story
systems after this complete path works.

| Check | Required result |
| --- | --- |
| Original cast | Existing IDs, conditional child, original schedules and interaction behavior remain correct |
| New identity | New record resolves independently; entity lookup does not overwrite an occupied selector |
| Map lifecycle | Enter/leave/re-enter restores one actor; unloading writes valid location/animation/cursors back without stale pointers |
| Day boundary | Correct schedule, talk/gift flag resets, friendship rules, and no duplicate registration |
| Interactions | Custom dialogue/portrait and friendship work; gift rejection happens before the held item is cleared or consumed |
| Legacy load | Original save loads with deterministic custom defaults |
| Custom persistence | State survives save/reload in both slots and slot overwrite; records follow stable keys after reordering |
| Save failures | Absent, corrupt, truncated, unsupported and stale extensions, plus partial writes, follow the documented fallback policy |
| Resource use | Measured entity/RAM/tile/palette/OAM usage fits the selected scene, including transitions |
| Reproducibility | Clean custom build and a recorded emulator/manual scenario; retail source changes separately pass exact comparison |

Adding a portrait or a table row alone does not satisfy this stage.

## Later character types and alternative scopes

New romance candidates need their own love/event state and changes to fixed
spouse, rival, wedding, birthday, festival, dialogue, and related UI logic.
The six-candidate lookup boundary is now exact source, and the script-facing
love calls plus one heart-event query are mapped. That makes the failure mode
concrete: adding a `Bachelorette` record alone still cannot integrate a seventh
candidate because every love/event path must resolve it through the fixed
resolver or a replacement policy. Treat the broader spouse/rival/wedding/UI
work as a later character unit after item/field/runtime-registration work.

Replacing an existing NPC can reuse its identity and persistence, but art,
portrait, dialogue, name, birthday, gifts and story references must be handled
consistently for the intended replacement. It does not require an extra roster
slot. Playable-farmer customization is a separate animation/action/UI task,
including facing, tools, held items and other action poses; it is not unlocked
by appending to `CharacterInfo`.

## Primary tool references

[Mary](https://github.com/StanHash/mary) supports US FoMT/MFoMT script compilation
and decompilation, outputting C fragments or a single binary script. Its README
reports structured decompilation for 1,296/1,328 FoMT scripts with exact
recompilation for supported scripts. Earlier full bytecode decoding of all
1,328 scripts is a separate result, not proof that structured decompilation or
trigger insertion is complete.

[HM-Studio](https://github.com/andrey-moura/HM-Studio) documents an editor with
partial FoMT support. [FOMT_Studio](https://github.com/Denisovich728/FOMT_Studio)
advertises script and graphics facilities. Neither was installed or validated
here as an end-to-end new-NPC solution. Use their primary source as research
leads and verify actual game/version support before adopting a workflow.

[StanHash's FOMT-DOC](https://github.com/StanHash/FOMT-DOC) contains useful
schedule, sprite and text-box notes, but those files explicitly label their
addresses **MFOMTU**. US FoMT addresses must come from this project's matching
ROM/source. Research links were checked on October 3, 2026.
