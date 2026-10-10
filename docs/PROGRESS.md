# Decompilation and expansion progress

Run `make progress` for the live reconstruction totals, retail-ROM comparison, branch/commit information, and PRET-style free-space report.

## Current verified snapshot

Active public retail branch: **`main`**

Retail verification:

- `make -B -j4 compare` -> **`fomt.gba: OK`**
- ROM size: **8,388,608 bytes**
- SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**

Current reconstruction:

```text
Code reconstruction
  88924 / 940036 bytes (9.4596%)
  851112 bytes remain in asm

Data/assets reconstruction
  75554 / 6777404 bytes (1.1148%)
  31330 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    33664 graphics bytes
    10560 palette bytes
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  164874 / 7717440 bytes (2.1364%)
  final ROM padding is excluded from this denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The code inventory currently reports **1,983 linked assembly functions**, **848,140 bytes** covered by inferred function ranges, **2,972 unattributed assembly bytes**, and **27 explicitly parked functions**. The total includes prior exposed islands plus 596 bytes of unnamed neighbors revealed by six scene Run seams. Only their true 28-byte Run bodies are source-owned; the neighboring code remains unchanged assembly.

## What the metrics mean

The project keeps separate dimensions rather than combining unlike work into one inflated percentage:

1. **Code reconstruction** counts linked executable source replacing retail assembly.
2. **Data/assets reconstruction** counts non-code ROM bytes regenerated from editable typed data or asset sources.
3. **Overall meaningful-ROM reconstruction** combines reconstructed code and data/assets against linked ROM content before final padding.

Understanding or documenting an opaque `.incbin` does not count as asset/data reconstruction. Editable project-side source must regenerate the retail bytes exactly.

## Latest October 10 exact milestone

The new GameState menu callback/ incubation batch reconstructs **13 exact functions / 444 linked bytes**, across `0801468C..080146FC` (112), `08014C0C..08014C34` (40), `08014D5C..08014D9C` (64), `0801589C..08015920` (132), and `08015950..080159B0` (96). Every method individually matched its linked retail address; the grouped and forced full ROM comparisons passed (`sh_mv22yrzy_255645e2`). See [GAME_STATE_MENU_CALLBACKS.md](GAME_STATE_MENU_CALLBACKS.md).

## Previous action and record milestone

The new GameState/menu action and record batch adds **18 exact functions / 560 linked bytes** through four isolated source ranges: `08016BA4..08016CEC` (328), `08016D80..08016DB0` (48), `08016E7C..08016EC4` (72), and `08016EF0..08016F60` (112). Every routine independently matched the original retail range; the grouped and forced full ROM comparisons passed (`sh_mv22h75z_27840b97`). These routines reveal new direct virtual slots, child callback entries, status assignments and the `gUnk_0300040C + 0x36C` record layout. See [GAME_STATE_MENU_ACTIONS.md](GAME_STATE_MENU_ACTIONS.md).

## Previous GameState menu milestone

A coherent GameState/menu callback family adds **23 exact functions / 684 linked bytes**: five source islands 08014034..1412C (248), 14164..14198 (52), 14198..14264 (204), 14264..142B8 (84), and 142B8..14318 (96). Only 1412C remains unchanged assembly. All 23 separately matched and the forced full-ROM build passed `fomt.gba: OK`. Source is `src/game_state_menu_dispatch.cc`, with original positions preserved by linker/assembler seams. See [GAME_STATE_MENU_DISPATCH.md](GAME_STATE_MENU_DISPATCH.md).

## Preceding exact milestone

The newest four-batch menu/ownership throughput continuation integrated
**18 natural C++ methods / 632 linked bytes**, all proving zero linked-byte
differences and each followed by a forced full-ROM compare. The groups are
three owner destructors (156), four global-owner destructors (160), five
resource helpers (124), and six simple vtable destructors (192). New sources
include `src/menu_owner_dtors.cc`, `src/menu_global_owner_dtors.cc`,
`src/menu_resource_helpers.cc` and `src/menu_simple_dtors.cc`. The 64
original raw bytes following DE220 remain untouched and are now accounted
for in the 2,972-byte unattributed ASM subtotal. Latest full ROM SHA1 is
retail-exact. See `tools/ches/NEXT_AGENT_HANDOFF.md` for source/proof details.

## Earlier exact milestones (historical checkpoints)

The earlier continuation is **Menu provider/lifetime and range-cleanup family: 11 functions / 756 exact linked bytes**. `BuildAnimalNameText` at E14B8 is now exact source; four provider destructors, two compact name providers, the E1A48 check wrapper and E1A54 cleanup are exact; and the E1C18/E1D54 counted 16-byte range cleanups are exact. The final forced ROM gate preserves the retail SHA1. Source lives in `src/menu_glyph_cache_interfaces.cc`, `src/menu_name_providers.cc`, and `src/menu_range_cleanups.cc`. The next follow-up recovers E1DBC and E1DC8 as two additional exact menu provider wrappers (24 bytes), verified by a forced full ROM comparison and identical retail SHA1. E1C70 was analyzed successfully by focused REA/Ghidra but remains compiler/source-shape nonmatching (best v2 0xE8/164 differing linked bytes). That earlier E1DD4 target has since become exact C++.

An earlier batch is **Menu glyph cache: four functions / 308 exact linked
bytes**. DrawCacheGlyph, ResetCacheColumn, ClearGlyphCache and
GetCacheRowsDirty are exact source; the complete isolated and production ROM
gates pass. The inventory falls from 2,107 to 2,104 named linked assembly
functions because F058 was previously anonymous. At that checkpoint, unattributed bytes were
2,696 and data/assets were unchanged; the live subtotal is 2,972. F060 stays assembly at an exact-size
12-difference frontier. See [MENU_GLYPH_CACHE.md](MENU_GLYPH_CACHE.md).

The preceding batch is **Shared font lookup/decoder and canvas helpers: five
functions / 532 exact linked bytes**. The complete font block owns 488 bytes;
canvas copy and unaligned stubs own 44. Both forced ROM gates pass.
Four named entries leave the inventory; the copy was an anonymous successor.
All surviving ranges and unattributed bytes stay unchanged. Data/assets are
unchanged. See [MENU_TEXT.md](MENU_TEXT.md).

The preceding batch is **Menu drawing callbacks and text streams: 14 functions /
576 exact linked bytes**. Twelve callback methods own 360 bytes; two encoded
streams own 216. Allocation layouts, four existing vtables and glyph protocol
are recovered. Both forced full-ROM gates pass. Twelve named entries leave
the inventory; two formerly anonymous constructors shrink ED28/EDB4 to84/68.
Other ranges and unattributed bytes are unchanged.
See [MENU_TILEMAP.md](MENU_TILEMAP.md) and [MENU_TEXT.md](MENU_TEXT.md).

The preceding unit is **Packed sprite-provider count accessors: eight exact bytes**.
GetSpriteCount / 5E81C and GetAnimationCount / 5E820 return counts[1] and counts[0].
The combined matcher and both forced full-ROM gates pass. Only the inferred
frame-getter range shrinks 148 to 140; no named assembly entry leaves the inventory.
See [SPRITE_ANIMATOR.md](SPRITE_ANIMATOR.md).

The preceding unit is **Menu tilemap rectangle drawing: 100 linked bytes**, comprising a 98-byte body and two alignment bytes. The first natural candidate and both forced full-ROM comparisons match; every other assembly address/size pair is unchanged. See [MENU_TILEMAP.md](MENU_TILEMAP.md).

The preceding unit is **Livestock controller construction/cleanup: two natural functions / 188 linked bytes**. The controller now owns six exact functions / 548 linked bytes. Its extent, two FixedStr capacities and menu/animal record arrays are recovered; both forced full-ROM comparisons pass. See [LIVESTOCK_SHOP.md](LIVESTOCK_SHOP.md).

The preceding unit is **Livestock shop: four helpers / 360 linked code bytes and eleven catalog entries / 220 typed data bytes**. Animal hearts, purchased type, sale prices and pregnancy count are recovered. Complete blocks, relocated table pointers and both forced full-ROM comparisons pass. See [LIVESTOCK_SHOP.md](LIVESTOCK_SHOP.md).

The preceding unit is **Scenes: complex Run 881EC / 192 linked source bytes**. All 25 Runs are now source-owned; the scene lifetime layer totals 74 functions / 4,108 bytes. Fresh isolated and production full-ROM comparisons pass. See [SCENES.md](SCENES.md).

The earlier constructor unit is **Scenes: controller creation, 18 natural constructors / 876 linked source bytes**. Every audited controller allocation and continuation transfer matches; both expanded full-ROM builds and all 65 source-owned scene spans pass. See [SCENES.md](SCENES.md).

The preceding scene unit is **Scenes: cleanup and continuation transfer, 47 functions / 2,360 linked source bytes**. It recovers 25 natural derived destructors and 22 Run entries, preserving original vtable slots and exact retail addresses. Both forced full-ROM builds pass. See [SCENES.md](SCENES.md).

The earlier unit is **39 owned-polymorphic destructor entries / 1,560 linked source bytes**. Typed prefix views recover nullable deletion and explicit destructor-mode forwarding without inventing complete class identities. All 39 retail bodies and original symbol addresses match; isolated and production forced full-ROM comparisons pass. See [POLYMORPHIC_OWNERS.md](POLYMORPHIC_OWNERS.md).


The latest exact mine-floor unit now totals **872 linked source bytes**: CE8C (168), the **72-byte D8A0..D8E8 accessor block**, D9B4 (76), the exact **0x180-byte DF2C..E0AC helper block**, E0AC (0x6A body plus 2 linked alignment bytes), and the **0x40-byte E174..E1B4 progress-flag block**. The shared 0x628-byte persistent type lives in `include/mine_floor.hh`. Detached and production full-ROM comparisons pass. See [MINE_FLOOR.md](MINE_FLOOR.md).

The preceding exact unit is the eight-method fishing-record collection: **276 linked source bytes**, with a shared **472-byte persistent type**. Complete-block and both full-ROM comparisons pass. See [FISHING_RECORDS.md](FISHING_RECORDS.md).

The preceding exact unit comprises resource-owner methods AC78, ACD8, AE58 and
B0A8: **678 body bytes / 680 linked bytes including alignment**. Shared types
and both source files pass fresh isolated and production full-ROM builds,
eleven symbol checks and an inventory audit. See [RESOURCE_OWNERS.md](RESOURCE_OWNERS.md).

The preceding exact unit is `GetMapResourceId` / `func_0803A8A4`, the complete
**652-byte logical map resolver**. Shared declarations and the renderer caller
preserve its original symbol and ABI. Fresh isolated and production forced
full-ROM builds pass; stable architecture is in [MAP_DATA.md](MAP_DATA.md).

The preceding exact batch is the seven-function helper tail `0x0803A804..0x0803A8A4` in the Entity38740 neighborhood. It adds **160 retail source bytes** and uses the existing embedded `EntityEffect` / `SpriteAnimator` model:

- `func_0803A804`: get animator step;
- `func_0803A80C`: set animator step;
- `func_0803A814`: `WillFinish()`;
- `func_0803A820`: movement/timer predicate;
- `func_0803A840`: effect update wrapper;
- `func_0803A870`: animation-change/reset wrapper;
- `func_0803A8A0`: owner `GameObject *` getter.

Immediately preceding exact promotions include `func_0803A798`, `func_0803A350`, and the signed-Q8 trig pair `func_0803A320/334`.

## Current frontier

The scene cleanup and all 25 `Run()` entries are exact. Livestock construction/cleanup, helpers, catalog, menu text/canvas, glyph-cache/provider lifetime, resource-owner helpers and menu tree rotations/balancing are exact at their documented boundaries. The current priority is **high-yield ownership/type clusters**, not another isolated menu helper.

The 18-member 72-byte ownership-transfer family is promising but its DB394 scratch candidates do not match and v1 releases a moved result incorrectly. Recover the 16-byte smart-owner transfer and destructor/allocator contract before using that exemplar across siblings. Three 192-byte menu tree-insertion siblings (E2294/E27FC/E54F0) are an alternative after fresh allocation/lifetime evidence. E1C70, F060, D6EAC/D6EEC, scene constructor 92570, frame getter 5E790, resource-owner constructors/B128, mine-floor D8E8/DA00, and the whole save loader are parked at their recorded frontiers. The canonical live queue and proof links are in [NEXT_AGENT_HANDOFF.md](../tools/ches/NEXT_AGENT_HANDOFF.md).

## Asset status

The packed item/UI bank contains 493 animations:

- **416 semantically owned**
- **405 / 450 simple**
- **11 / 43 multi-frame**
- **77 unowned**

The remaining IDs are not a standalone percentage-hunting queue. They are resolved when their consuming scenes, events, tables, or entity systems are reconstructed.

See `docs/ASSET_DECOMPILATION.md`.

## Custom-game track

Intentional QoL/content work remains separate on the `custom-game` branch/worktree.

Retail `main` remains byte-exact. Product-count growth and custom persistence remain deferred because they affect serialized state layout.

## Free space

The reported **671,168 bytes** are the contiguous final tail after linked content in the 8 MiB retail image. Internal holes are not counted unless independently proven safe.


Earlier recovered GroundPickupState: +0x34C8..+0x34D7, 56 availability
bits and fifteen packed three-bit durability fields. Four exact functions
add 1,032 linked bytes. A1EA8 is parked. See docs/GROUND_PICKUP_STATE.md.
The +0x34D8 mask and +0x34DC actor state are already source-owned. Menu OAM factory 4EA94..4EB64, frame getter 5E790, offer builder 85640 and C6BC remain parked or unpromoted; none supersedes the current high-yield family queue in the live handoff.
