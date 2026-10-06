# Character identity, state, and lifecycle

This page describes the original US FoMT architecture recovered from source,
assembly, and the matching ROM. The proposed custom-character workflow is in
[CUSTOM_CHARACTERS.md](CUSTOM_CHARACTERS.md). An editable character registry or
save extension has not been implemented.

## Recovered identity interface

[character_info.hh](../include/character_info.hh) and
[character_info.cc](../src/character_info.cc), together with
[character_location.cc](../src/character_location.cc), expose four matching helpers.
Their original assembly symbols remain aliases.

| Helper | Retail range | Behavior |
| --- | --- | --- |
| `GetCharacterName` / `func_0809FE3C` | 0x0809FE3C..0x0809FE73 | Table name, special child name, or empty string |
| `GetCharacterBirthday` / `func_0809FE74` | 0x0809FE74..0x080A002F | Packed birthday, six collision alternatives, or child date |
| `GetCharacterNpc` / `func_080A0030` | 0x080A0030..0x080A01F7 | Pointer to a persistent social record, or null |
| `GetCharacterLocation` / `func_080A03B8` | 0x080A03B8..0x080A041B | Persistent location, or map 2 / (0,0) / facing 0 |

The name/birthday domain is **0..42 inclusive**, with 43 table records.
`gCharacterInfo` and `gUnk_08104258` identify the same ROM table at 0x08104258.
The complete 0x158-byte table is an editable C++ initializer in
[data_character_info.cc](../src/data_character_info.cc), exposed as
`gCharacterInfo[CHARACTER_COUNT]` by the shared header. Its 43 entries preserve
all original name pointers, packed birthdays, zero padding and index meanings.
The legacy `gUnk_08104258` name remains a linker alias. Name strings remain in
the original bounded pool in [data_080F9EB8.s](../asm/data/data_080F9EB8.s);
this table recovery does not relocate or replace them.

| Entry offset | Size | Meaning |
| --- | ---: | --- |
| +0x00 | 4 | Name pointer |
| +0x04 | 1 | Ordinary birthday: season in bits 0..1, one-based day in bits 2..6 |
| +0x05 | 1 | Alternate birthday in the same encoding |
| +0x06 | 2 | Padding; zero in all 43 retail entries |

The second word is therefore partly decoded, rather than wholly unknown.
`GameDate.day` is zero-based: the helper subtracts one from the stored day and
applies the retail modulo behavior when it exceeds 29. Keep that unsigned
behavior when matching, including zero-filled entries.

For IDs 3, 12, 19, 21, 25, and 31, the alternate birthday is selected when the
ordinary birthday matches the supplied player date. ID 35 reads the mutable
child name/date from the social-state child object at +0x004. ID 0 follows the
ordinary table path and has an empty name. An ID greater than 42 returns an
empty name and a birthday with Spring/encoded day 15 (calendar day 16).
`GetCharacterNpc` returns null for ID 0 or an out-of-range ID; for ID 35 its
child resolver can also return null when the child is absent.
A separate retail resolver at `func_080A0878` accepts only IDs 3, 12, 19, 21, 25, and 31 and returns the corresponding `Bachelorette *` records at social offsets 0x098, 0x154, 0x1E4, 0x210, 0x264, and 0x2E4; every other ID returns null. This fixed six-entry boundary is an explicit expansion point for romance-candidate support.

## Retail roster and persistent offsets

Offsets below are relative to the social block at **GameState+0x1CD4**.
Stored birthdays are ROM metadata, shown with one-based days; this table does
not independently establish every character's canonical birthday. In
particular, the repeated Spring 19 values for special residents must not be
interpreted as proof of a gameplay birthday. `Lu` is the literal retail table
label. Child values are dynamic despite its zero-filled table entry.

| ID | Retail name / identity | Social offset | Stored birthday |
| ---: | --- | --- | --- |
| 0 | Empty-name entry | None | Zero-filled |
| 1 | Lillia | 0x70 | Spring 19 |
| 2 | Rick | 0x84 | Fall 27 |
| 3 | Popuri | 0x98 | Summer 3 |
| 4 | Barley | 0xb0 | Spring 17 |
| 5 | May | 0xc4 | Winter 26 |
| 6 | Saibara | 0xd8 | Spring 11 |
| 7 | Gray | 0xf0 | Winter 6 |
| 8 | Duke | 0x104 | Winter 15 |
| 9 | Manna | 0x118 | Fall 11 |
| 10 | Basil | 0x12c | Summer 11 |
| 11 | Anna | 0x140 | Fall 23 |
| 12 | Mary | 0x154 | Winter 20 |
| 13 | Thomas | 0x16c | Summer 25 |
| 14 | Harris | 0x180 | Summer 4 |
| 15 | Ellen | 0x194 | Winter 13 |
| 16 | Stu | 0x1a8 | Fall 5 |
| 17 | Jeff | 0x1bc | Winter 29 |
| 18 | Sasha | 0x1d0 | Spring 30 |
| 19 | Karen | 0x1e4 | Fall 15 |
| 20 | Doctor | 0x1fc | Fall 19 |
| 21 | Elli | 0x210 | Spring 16 |
| 22 | Carter | 0x228 | Fall 20 |
| 23 | Cliff | 0x23c | Summer 6 |
| 24 | Doug | 0x250 | Winter 11 |
| 25 | Ann | 0x264 | Summer 17 |
| 26 | Kai | 0x27c | Summer 22 |
| 27 | Gotz | 0x290 | Fall 2 |
| 28 | Zack | 0x2a8 | Summer 29 |
| 29 | Won | 0x2bc | Winter 19 |
| 30 | Gourmet | 0x2d0 | Spring 19 |
| 31 | H. Goddess | 0x2e4 | Spring 8 |
| 32 | Kappa | 0x2fc | Spring 19 |
| 33 | Lou | 0x310 | Spring 19 |
| 34 | Lu | 0x328 | Spring 19 |
| 35 | Child (dynamic name) | 0x4 | Dynamic |
| 36 | Staid | 0x33c | Spring 15 |
| 37 | Nappy | 0x360 | Winter 22 |
| 38 | Bold | 0x384 | Spring 4 |
| 39 | Chef | 0x3a8 | Fall 14 |
| 40 | Aqua | 0x3cc | Spring 26 |
| 41 | Hoggy | 0x3f0 | Fall 10 |
| 42 | Timid | 0x414 | Summer 16 |

The fixed social block spans **0x478 bytes**, ending at GameState+0x214B;
the next subsystem starts at +0x214C. It contains heterogeneous records and
other social state. It is not a flat `Npc[43]` array, and gaps are not proven
free extension space. Preserve these offsets and the 0x34F4-byte retail
[save payload](SAVE_FORMAT.md).

[Npc](../include/npc.hh) is 0x14 bytes and stores an 8-byte `ActorLocation`,
8-bit friendship, five-bit days-since-spoken, conversation/gift/met flags,
three five-bit schedule/path/point cursors, a ten-bit cursor field, and
16-bit fields at +0x10 and +0x12 (animation). Its constructor starts friendship
at 50 and animation at `NO_ANIM` (0xFFFF). `AddFriendship` clamps to 0..255;
not every setter performs that clamp. Daily update resets conversation/gift
flags and applies the existing decay rules.

[Bachelorette](../include/bachelorette.hh) extends that record to 0x18 bytes
with love and event progress. [HarvestSprite](../include/harvest_sprite.hh)
is 0x24 bytes with task/minigame state. Child storage has additional special
state. None is a vacant ordinary-NPC slot.

## Daily scheduling

[schedule_info.hh](../include/schedule_info.hh) defines the selector,
schedule arrays, timed entries, paths, and two path-point formats. Times are
minutes relative to 6 AM. Maps occupy ten bits in the location/path formats;
facing and path-point representation have their own fields. Persistent
schedule/path/point cursors occupy five bits each, so a wider metadata count
alone does not make indices greater than 31 safe. `func_0803D688` indexes the
selected schedule without checking `num_schedules`; selectors must return a
valid index into their own descriptor.

The matching helpers in [character_schedule.cc](../src/character_schedule.cc)
retain their original callable aliases:

- `ApplyNpcSchedule` / `func_0803D688` selects a descriptor's schedule, sets the initial location
  (or `MAP_NONE` for an unusable selection), and resets the persistent cursors.
- `InitializeCharacterSchedules` / `func_0803D7E4` applies **31 unconditional pairs**, for IDs 1..29, 33, and
  34, followed by **one conditional child pair** for ID 35. There are 32
  applications in total. This count is unrelated to the number of identities
  or concrete runtime entity classes.
- `func_08010F54` in [game_state.s](../asm/game_state.s) invokes registration
  during day update after the existing social-state update.

`ApplyNpcSchedule` calls the selector with the supplied context and uses the
first timed entry's path. A null schedule array, selected schedule, entry array
or path, or a zero entry count, selects `MAP_NONE` at (0,0), facing 0. Otherwise
the path supplies starting map, signed x/y and facing. After `Npc::SetLocation`,
the selected index is stored with five-bit truncation; the other two five-bit
cursors and the ten-bit field are reset to zero. Selection indexes the array
before truncation. No descriptor-count validation is added. Daily initialization
uses the fixed social offsets above and its original conditional-child helper
at 0x080A0A04.

[data_schedules.cc](../src/data_schedules.cc) contains one experimental
schedule definition (`ScheduleInfo_Unk_080F1A80`, used by Rick), not the full
roster. [dump_schedule.py](../tools/scripts/dump_schedule.py) exports ROM
schedules to JSON; [schedule_to_c.py](../tools/scripts/schedule_to_c.py)
generates definitions. Signed coordinates and exact round-trip fidelity must
be checked before treating these tools as an authoring pipeline.

## Runtime entities and render objects

Persistent `Npc`, runtime `ANpcEntity`, and `UnknownEntityThing` are distinct
objects. [entity_npc.hh](../include/entity_npc.hh) exposes the shared `ANpcEntity` declaration and `LilliaEntity`; [entity_resident_npcs.hh](../include/entity_resident_npcs.hh) declares all concrete resident classes through Lou and Child. [entity_resident_npcs.cc](../src/entity_resident_npcs.cc) owns all 35 resident constructors, virtual +0x30 effect factories for IDs 1..34, and Child's +0x3C override. Child +0x30 remains assembly. In [npc_entity.cc](../src/npc_entity.cc), `ANpcEntity` references its
persistent `Npc`; construction restores location/animation/cursors and
destruction writes them back. Some movement/schedule methods in this C++ unit
still contain naked assembly. A custom record must outlive its runtime entity.

The base and Lillia entities are both **0x48 bytes**; Lillia adds no storage.
The shared fields following the actor base are:

| Offset | Field / proven use |
| --- | --- |
| +0x30 | Persistent `Npc *` |
| +0x34 | Opaque context forwarded to schedule selection |
| +0x38 | Schedule descriptor pointer |
| +0x3C..+0x3E | Schedule, path and path-point indices |
| +0x3F | Byte state; detailed meaning remains unresolved |
| +0x40 | Restored ten-bit persistent field in a 16-bit runtime field |
| +0x42 | Default argument, overridden by nonzero `Npc::unk_10` |
| +0x44, +0x46 | Animation bases supplied during construction |

The actual entity creation route is `func_0801A8E0` in
[game_state.s](../asm/game_state.s). The coherent factory region is
`0x0801A8E0..0x0801B497` (0xBB8 / 3,000 bytes); the assembler label at
`0x0801B464` is inside its live epilogue rather than a standalone helper. The
factory accesses the indexed pointer array at owner+0x008+4*selector and uses
a 94-entry jump table for selectors 0..93. All 94 selectors are mapped to 58
unique construction targets. Selectors **1..34 are exactly character IDs
1..34**, selector 35 is the child, and selectors 36..42 are the seven Harvest
Sprites. **Entity selector 43 is already occupied.** Its surrounding
initialization still iterates 0..99.

The native indexed lookup and teardown boundary is now matching C++ in
[game_object_entity_lookup.cc](../src/game_object_entity_lookup.cc).
`GameObject::vfunc_40` and `GameObject::vfunc_44` return the indexed entity
slot, while `GameObject::vfunc_3C` deletes a present entity and clears that
slot. The lookup itself has no range check, so caller-specific bounds remain
important. Character IDs and entity selectors are related for the original
resident range but remain different domains. Increasing `CHARACTER_COUNT`
cannot resize or register runtime entity slots.

A fully traced ordinary example is Lillia:

| Step | Retail evidence |
| --- | --- |
| Select entity 1 | Factory jump table at 0x0801A924 points to 0x0801AEE4 |
| Allocate NPC entity | Branch allocates **0x48** bytes and passes persistent state at GameState+0x1D44 (= social+0x070) |
| Construct NPC | `LilliaEntity::LilliaEntity` / `func_08035AFC` calls `ANpcEntity` with schedule `gUnk_080F280C`, animation bases 0x25F/0x263, and default argument 0x3E2 |
| Install concrete vtable | `vtable_unk_080E7198` |
| Attach rendering | `AEntity::vfunc_10` calls entity virtual slot +0x30 only when the actor is on the current map |
| Allocate effect | `LilliaEntity::vfunc_30` / `func_08035B38` at slot +0x30 which allocates **0x8C** bytes and calls the recovered effect constructor at 0x080324BC |

The Lillia constructor/effect factory are matching C++ in [entity_lillia.cc](../src/entity_lillia.cc). The same recovered class pattern was generalized across 32 additional residents in [entity_resident_npcs.cc](../src/entity_resident_npcs.cc): **64 methods / 3,296 bytes** are exact source, split into nine linker-interleaved source runs around seven character-specific helper blocks and Zack's local helper block. All original resident vtables remain in [vtables.s](../asm/vtables.s) and are exposed to C++ through linker aliases; legacy `func_08...` names are preserved as aliases too. The generated `tools/ches/NPC_ENTITY_CLASS_MAP.md` proves selector, character, schedule, vtable, +0x30 and +0x3C relationships for IDs 1..35. The map-dependent attachment remains readable in [entity.cc](../src/entity.cc).

**Entity virtual +0x30 creates an effect, not the NPC entity.**
`GameObject` virtual +0x30 has yet another meaning: map height, declared in
[unknown_types.hh](../include/unknown_types.hh). The call at this slot inside
`func_0802CDCC` belongs to movement/map bounds, not NPC creation. Do not use
slot numbers without identifying the receiver type.

## Other fixed consumers and open boundaries

`GetCharacterLocation` wraps persistent lookup and returns an `ActorLocation`
by value. Its null-record fallback is map 2, x=0, y=0, facing=0; it does not
create or register an NPC.

The social resolver boundary is now exact source. `src/character_info.cc` owns
the early fixed bachelorette/Harvest-Sprite/child resolver block at
`080A01F8..080A03B7`; `src/character_social.cc` owns the later broad NPC plus
fixed bachelorette/Harvest-Sprite resolver block at `080A06B0..080A0A1B`. The
six bachelorettes are still hard-coded, so a seventh candidate needs an
extensible resolver policy rather than only a new record.

Native social calls are also mapped: 124..133 use the broad NPC resolver for
friendship/talk/gift state, while 134..136 use the fixed bachelorette resolver
for love. `src/heart_event_days.cc` owns exact `func_08045584`;
`func_080455D8` is behavior-complete but parked at an exact-size five-byte
scheduling mismatch. `func_080A0518` still scans IDs 1..42 for friendship with
a hard-coded exclusion subset, and `func_080A041C` / `func_080A0490` remain
other explicit six-bachelorette consumers.

Dialogue still needs both script bytecode and an interaction/trigger route.
Graphics need compatible animation/frame providers, palettes, tile/OAM
resources, and display assets. Added-NPC registration, asset authoring, later
romance spouse/rival/wedding/UI logic, persistence, and runtime capacity remain
design or research work. See [CUSTOM_CHARACTERS.md](CUSTOM_CHARACTERS.md) for
the phased plan and acceptance criteria.

## Matching validation

The linker keeps the original identity/location and scheduling helpers at their retail positions, Lillia's pair at 0x08035AFC..0x08035B63, the original 64 resident methods through 0x08036DC3, and now Lou constructor/+0x30 plus Child constructor/+0x3C at their retail addresses through 0x08036F0B. All 35 resident constructors are source-owned; IDs 1..34 also have source-owned +0x30 factories, while Child +0x30 at 0x08036F0C remains assembly. The October 5 resolver splits preserve `080A01F8..080A03B7` and `080A06B0..080A0A1B`; `func_08045584` remains sourced at its retail address. Legacy callable names for promoted methods are linker aliases, so existing address-derived references remain valid.

Run `make compare` and `sha1sum -c fomt.sha1` after source/data/interface
changes. The current exact worktree reports **69,056 / 940,036 = 7.3461%**
source with the retail SHA1 unchanged. Documentation updates do not change the
ROM or count as new source reconstruction.

The readonly character table occupies exactly 0x08104258..0x081043AF. Its
following `bad_alloc` data starts at 0x081043B0, and the next named block stays
at 0x081043BC. The table uses its own minimal translation unit, between the
original assembly data sections, so unrelated constants cannot alter its size.
Layout and full-ROM checks preserve one-byte birthday fields, eight-byte
records, all 43 entries and the original identity-helper code. Recovering
344 data bytes does not increase the executable-code percentage or extend the
accepted identity range.
