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
  73872 / 940036 bytes (7.8584%)
  866164 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    33664 graphics bytes
    10560 palette bytes
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  149602 / 7717440 bytes (1.9385%)
  final ROM padding is excluded from this denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The code inventory currently reports **2,315 linked assembly functions**, **865,000 bytes** covered by inferred function ranges, **1,164 unattributed assembly bytes**, and **17 explicitly parked functions**.

## What the metrics mean

The project keeps separate dimensions rather than combining unlike work into one inflated percentage:

1. **Code reconstruction** counts linked executable source replacing retail assembly.
2. **Data/assets reconstruction** counts non-code ROM bytes regenerated from editable typed data or asset sources.
3. **Overall meaningful-ROM reconstruction** combines reconstructed code and data/assets against linked ROM content before final padding.

Understanding or documenting an opaque `.incbin` does not count as asset/data reconstruction. Editable project-side source must regenerate the retail bytes exactly.

## Recent exact milestones

The latest exact mine-floor unit now totals **316 source bytes**: initializer `func_0809CE8C` (168 bytes) plus the **72-byte D8A0..D8E8 accessor block**. The shared 0x628-byte persistent type now lives in `include/mine_floor.hh`. Scratch/block, isolated and production full-ROM comparisons pass. See [MINE_FLOOR.md](MINE_FLOOR.md).

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

The exact resource-owner set is integrated. Constructors and B128 remain assembly; AB30 is parked at 316/217 versus 328, B128 at 382/2. Fishing records recover the 472-byte block with 276 exact source bytes, and the mine-floor cluster now recovers the adjacent 0x628-byte persistent object with 240 exact source bytes. D9B4 is now exact source; D8E8 is behavior-complete but parked at its compiler-sensitive source-shape frontier. Next assess the adjacent DA00 mine-content handler as a separate high-leverage unit. The legacy loader remains parked pending new source-boundary evidence.

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
