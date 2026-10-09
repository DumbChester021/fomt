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
  77740 / 940036 bytes (8.2699%)
  862296 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    33664 graphics bytes
    10560 palette bytes
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  153470 / 7717440 bytes (1.9886%)
  final ROM padding is excluded from this denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The code inventory currently reports **2,204 linked assembly functions**, **860,196 bytes** covered by inferred function ranges, **2,100 unattributed assembly bytes**, and **17 explicitly parked functions**. The unattributed total includes the previously exposed mine-floor islands plus 556 bytes of unnamed neighboring code at DB404..DB630. The latter were formerly swallowed by the inferred DB3DC range; only its true 40-byte aligned body is source-owned.

## What the metrics mean

The project keeps separate dimensions rather than combining unlike work into one inflated percentage:

1. **Code reconstruction** counts linked executable source replacing retail assembly.
2. **Data/assets reconstruction** counts non-code ROM bytes regenerated from editable typed data or asset sources.
3. **Overall meaningful-ROM reconstruction** combines reconstructed code and data/assets against linked ROM content before final padding.

Understanding or documenting an opaque `.incbin` does not count as asset/data reconstruction. Editable project-side source must regenerate the retail bytes exactly.

## Recent exact milestones

The newest unit is **39 owned-polymorphic destructor entries / 1,560 linked source bytes**. Typed prefix views recover nullable deletion and explicit destructor-mode forwarding without inventing complete class identities. All 39 retail bodies and original symbol addresses match; isolated and production forced full-ROM comparisons pass. See [POLYMORPHIC_OWNERS.md](POLYMORPHIC_OWNERS.md).


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

The single-owned-member destructor family is complete. Next audit the 25-member two-owned-member scene cleanup family beginning at func_080521BC. Its second owned object's vtable is at +4, so do not assume the same concrete type or layout as the recovered +0-vtable prefix.

The 20 scene-change helpers remain bounded but nonmatching at their aggregate/ownership lifetime seam. Resource-owner constructors/B128, mine-floor D8E8/DA00 and the exposed E118/E1B4 islands, the legacy loader, and the other documented parked functions remain closed until new structural evidence changes their leverage. NEXT_AGENT_HANDOFF.md owns the exact next action.

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
