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
  76180 / 940036 bytes (8.1039%)
  863856 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    33664 graphics bytes
    10560 palette bytes
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  151910 / 7717440 bytes (1.9684%)
  final ROM padding is excluded from this denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The code inventory currently reports **2,243 linked assembly functions**, **862,312 bytes** covered by inferred function ranges, **1,544 unattributed assembly bytes**, and **17 explicitly parked functions**. The unattributed increase is structural: exact E0AC/E174..E1A4 boundaries exposed previously hidden code at E118..E174 and E1B4..E2D4.

## What the metrics mean

The project keeps separate dimensions rather than combining unlike work into one inflated percentage:

1. **Code reconstruction** counts linked executable source replacing retail assembly.
2. **Data/assets reconstruction** counts non-code ROM bytes regenerated from editable typed data or asset sources.
3. **Overall meaningful-ROM reconstruction** combines reconstructed code and data/assets against linked ROM content before final padding.

Understanding or documenting an opaque `.incbin` does not count as asset/data reconstruction. Editable project-side source must regenerate the retail bytes exactly.

## Recent exact milestones

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

The exact resource-owner set is integrated. Constructors and B128 remain assembly; AB30 is parked at 316/217 versus 328, B128 at 382/2. Fishing records recover the 472-byte block with 276 exact source bytes, and the mine-floor cluster owns 872 linked source bytes around the adjacent 0x628-byte persistent object. E0AC and the four progress-flag getters are exact. The exposed E118..E174 (0x5C) and E1B4..E2D4 (0x120) islands are behavior-recovered but parked after bounded source-shape attempts. The following GameState+0x3480 block is now a typed 0x14-byte CursedToolState with exact typed initializer; next assess +0x3494..+0x34C4. D8E8 and DA00 remain parked compiler/source-shape frontiers. The legacy loader remains parked pending new source-boundary evidence.

`func_0803A180`, `func_0803A394`, `func_08039F90`, `func_08039E98`, and the other generator-marked parked functions should not be reopened without genuinely new structural evidence.

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


Latest recovered GroundPickupState: +0x34C8..+0x34D7, 56 availability
bits and fifteen packed three-bit durability fields. Four exact functions
add 1,032 linked bytes. A1EA8 is parked. See docs/GROUND_PICKUP_STATE.md.
The +0x34D8 mask and +0x34DC actor state are already source-owned. Active throughput target: coherent repeated-small-function families; keep C6BC parked.
