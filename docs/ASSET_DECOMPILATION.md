# Asset and data decompilation progress

Date: 2026-10-06

## Asset/data role in the throughput pipeline

Asset recovery is not a standalone percentage hunt, and it is no longer the
primary target-selection queue. A non-code resource should still be promoted to
editable source only when enough runtime/type evidence exists to explain its
format, ownership, and use.

Use a hybrid workflow:
- bulk-catalog recognizable structure when cheap, including pointer tables,
  fixed-stride records, palettes, tile banks, script tables, and resource
  headers;
- let TU/cluster decompilation and consumer analysis assign semantics and
  ownership;
- add editable rebuild support only when the format is understood well enough to
  regenerate the retail bytes exactly.

The packed item/UI sprite bank `gUnk_086678A0` remains a successful example:

- the 347 Tool/Food/Article icons remain valid recovered assets because their
  ownership and renderer path are proven;
- ownership is **416 / 493 animations: 405 / 450 simple and 11 / 43
  multi-frame**, leaving **45 simple and 32 multi-frame** unowned;
- completed families include Wrapped Present (352), Basket (53), eight cooking
  utensils, Money Bag (106), 18 overnight forage/map variants, Water Splash
  (425 / 0x1A9), six Fish Kings, five menu-special presentation icons, and Dog
  Ball 21..48;
- all 22 explicit provider-constructor sites and the documented common
  packed-consumer lanes are already accounted for;
- `func_080CE184` and `func_0800F258` are closed false leads;
- the remaining 77 IDs are now a **parked open list**, not the main
  decompilation frontier. Preserve existing family evidence for 173..180,
  413..420, 54..57, 160/161, and the other documented IDs, but resolve them as
  their owning TUs/scenes/events/tables are reconstructed instead of hunting
  them individually;
- runtime/type recovery continues to agree with the recovered
  AbstractSprite/DefinedSprite/SpriteAnimationData/SpriteFrameData/
  SpriteAnimator model.

Detailed packed-bank evidence remains in
`tools/ches/checkpoints/ui-packed-sprite-2026-10-05/README.md`.

This policy keeps asset progress useful without allowing it to displace higher-
throughput code/type recovery.

FoMT now tracks executable-code reconstruction and non-code asset/data
reconstruction separately.

## Why this exists

The historical `make progress` percentage counted only linked executable code.
That remains useful, but it did not move when the project recovered item tables,
shop catalogs, palettes, PNGs, packed graphics banks, save formats, or other
non-code resources.

Do not replace the code percentage with an inflated catch-all number. Keep the
dimensions separate and also report a conservative overall linked-ROM metric.

## Current metrics

`make progress` currently reports:

```text
Code reconstruction
  71612 / 940036 bytes (7.6180%)
  868424 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    Semantically owned packed-sprite graphics and palettes:
    44224 bytes (33664 graphics + 10560 palette)
  396 additional source-owned .rom_header bytes count only toward overall

Overall meaningful-ROM reconstruction
  147342 / 7717440 bytes (1.9092%)
  final ROM padding is excluded from this reconstruction denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The matching retail SHA1 remains
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## Counting rules

A byte counts as reconstructed only when the retail byte is produced from an
editable project-side representation.

Examples that count:

- C/C++/assembly source-owned readonly data and vtables;
- mixed source-owned support regions such as `.rom_header` count toward overall
  reconstruction but are kept out of the data/assets percentage;
- editable PNG pixels/palettes which are converted back to GBA asset bytes;
- future map, tileset, sound, script, font, palette, or animation source formats
  once the normal build regenerates the retail bytes from those formats.

Examples that do **not** count:

- an `.incbin "baserom.gba"` even when its address and purpose are known;
- documentation-only semantic recovery;
- copied binary blobs with no editable source representation;
- bytes merely extracted to another `.bin` file and fed back unchanged;
- final ROM padding.

This conservative rule prevents progress from being gamed by moving opaque bytes
between files.

## Implementation

The progress implementation is:

- `tools/scripts/calcprogress.py`
- `tools/progress_manifest.json`

The manifest records exceptions where a linked `src/` object still embeds raw
retail bytes and declares generated asset families whose owned byte spans can be
verified.

The original `tools/scripts/calcrom.pl` remains available as the historical
code-only calculator, but `make progress` uses the multi-axis tracker.

## Current editable asset coverage

### Item/UI packed bank

Bank: `gUnk_086678A0`
ROM offset: `0x086678A0`
bank span: `0x30080` bytes

Semantically owned packed-bank coverage:

- 81 Tool icons
- 171 Food icons
- 95 Article icons
- Wrapped Present (352)
- Basket (53)
- 8 cooking utensil icons
- Money Bag (106)
- 18 overnight forage/map variants
- Water Splash (425 / 0x1A9), first owned multi-frame animation
- 6 Fish Kings: Jp. Huchen 252, Monkfish 249, Catfish 254, Carp 253, Coelacanth 250, Squid 251
- 5 menu-special presentation icons: Water 461, Box Lunch 401, Milk 290, Spaghetti 422, Snow-cone 247
- 28 Dog Ball visual animations: IDs 21..48, including 10 multi-frame animations
- **416 semantically owned animations total**

The build currently owns **44,224 unique retail bytes** from these editable
packed-sprite sources:

- 33,664 graphics bytes
- 10,560 palette bytes

The Fish King family is proven by `func_080713B8` and exact `func_0809CE30`: collection indices `0x35..0x3A` map to packed IDs 252, 249, 254, 253, 250, 251. Retail string table `gUnk_08103A18` names them Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, Squid. The family adds **800 unique bytes** (768 graphics + 32 palette).

The menu-special presentation family is proven by `func_0807EF90` / `func_08081BBC` and their 28-byte records. When the record flag is set, the code bypasses Food icon/description lookup and uses the record's direct packed animation ID plus custom retail text. The five unique IDs are Water 461, Box Lunch 401, Milk 290, Spaghetti 422, and Snow-cone 247, adding **544 unique bytes** (384 graphics + 160 palette).

The Dog Ball visual family is proven by selector `0x4B` and adult-dog play/fetch callers. `func_08038398` writes the Ball entity's packed animation field `+0x28` as a four-facing block derived from dog animation ID: default 21..24, `0x33C -> 25..28`, `0x340 -> 29..32`, `0x344 -> 33..36`, `0x348 -> 37..40`, `0x34C -> 41..44`, `0x375 -> 45..48`. `func_0803853C` passes `+0x28` as `resource_id` through the GameObject vfunc `+0x64` packed provider. These 28 animations contain 53 frames, including 10 multi-frame animations, and add **1,024 unique graphics bytes** with no new palette bytes.

Shared ROM spans count only once. The overnight family contributes **544 unique
palette bytes**. Water Splash contributes **384 unique graphics bytes**; its
palette was already owned/shared.

Across the complete bank:

- 493 animations
- 500 sprite descriptors
- 532 animation frames
- 450 animations are simple one-frame/one-part/one-palette
- 43 animations are multi-frame
- **405 / 450 simple animations are semantically owned**
- **11 / 43 multi-frame animations are semantically owned**
- **45 simple and 32 multi-frame animations remain unowned**

Water Splash is code-proven by exact `src/game_object_discard.cc`, where
`EFFECT_WATER_SPLASH = 0x1A9` is constructed after
`IsFootprintOnWaterSurface`. Its 5-frame animation begins at frame 457;
four nonblank frames use sprite descriptors 425..428 and the final frame 429
is blank timing. Frames 2 and 3 use two OAM parts. The generic
`packed-animation-v1` exporter/importer regenerates all graphics bytes exactly
and the 416-entry manifest rebuilds the full 196,736-byte bank byte-for-byte.

The remaining 45 simple animations still account for up to **2,976 additional
unique editable bytes**: 2,592 graphics bytes and 384 palette bytes. The 32
unowned multi-frame animations are now technically authorable when their
runtime semantics are proven. Neither group is an anonymous export queue.
Promote a family only after its runtime owner/consumer is traced far enough to
support semantic assignment.

## Asset/data priority under the whole-game queue

The project still advances code and non-code reconstruction together, but asset
work now follows the ranked TU/cluster pipeline instead of defining it.

Recommended order:

1. **Preserve completed units and parked compiler-sensitive frontiers.**
   Do not reopen already-bounded hard functions or closed provider searches
   without new structural evidence.
2. **Bulk-catalog cheap structure.** Scan obvious pointer tables, fixed-stride
   arrays, palettes, tiles, script tables, M4A tables, and resource headers so
   the function/TU database can reference them even before semantics are final.
3. **Use code consumers to assign meaning.** As high-ranked TUs/clusters are
   decompiled, type the tables/assets they index and identify format, bounds,
   ownership, and lifetime from those consumers.
4. **Promote editable sources only after ownership/format is proven.** Keep the
   packed-bank rule: no anonymous export backlog. The remaining 77 animations
   can be resolved naturally when their owning systems are reconstructed.
5. **Prioritize high-modding-value families when scores are otherwise close.**
   Maps/collision, event scripts/text, character/schedule data, items/shops,
   portraits/UI, then other graphics and sound are good tie-breakers because
   they expose reusable authoring boundaries.
6. **Recover sound/music as a coherent self-contained subsystem.** Trace
   song/voicegroup/sample ownership through the M4A runtime tables before moving
   baserom-backed payloads to editable source.
7. **Keep counting conservative.** Raw extracted `.bin` copies, opaque incbins,
   and documentation-only semantic recovery do not increase the asset/data
   metric.

Do not choose a blob merely because it is large. The goal is high-throughput,
honest reconstruction with useful editable assets and strong source-level
ownership.

## ROM free space

The current 8 MiB retail ROM has:

- used through linker payload: `0x75C240` = 7,717,440 bytes
- contiguous tail free space: `0x0A3DC0` = 671,168 bytes = 655.44 KiB
- free percentage: 8.0009%

This is only the final contiguous padding region. Internal holes are not included
unless they are separately proven safe.

For custom-game growth this tail is valuable, but retail matching must continue
to reproduce the padded retail ROM exactly.
