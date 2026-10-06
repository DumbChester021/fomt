# Asset and data decompilation progress

Date: 2026-10-06

## Code-coupled asset policy

Asset recovery is not a standalone percentage hunt. A non-code resource should be
promoted to editable source together with enough runtime decompilation/type
recovery to explain who owns it and how the game interprets it.

The first application of this policy is the packed item/UI sprite bank
gUnk_086678A0:

- the 347 Tool/Food/Article icons remain valid recovered assets because their
  ownership and renderer path are already proven;
- ownership is now **416 / 493 animations: 405 / 450 simple and 11 / 43
  multi-frame**; **45 simple and 32 multi-frame animations remain unowned** and
  must **not** be exported as generic/unassigned PNGs in a blind batch;
- completed code-coupled families include Wrapped Present (352), Basket (53),
  eight cooking utensils, Money Bag (106), 18 overnight forage/map variants,
  Water Splash (425 / 0x1A9), six Fish Kings, five menu-special presentation
  icons, and Dog Ball 21..48;
- Water Splash proves generic multi-frame/multi-part authoring, while Dog Ball
  expands owned multi-frame coverage to 11 / 43;
- common packed-consumer lanes have been exhausted for the remaining multi-frame
  set, including direct `func_080A4A00`, `func_0805E824`, packed
  `SetAnimation`, `CB304/CC728/CBAF0`, `CAC7C/CAD18`, local packed-provider
- all 22 explicit `gUnk_086678A0` provider-constructor sites are now
  accounted for; `func_080CE184` is grid/slot arithmetic and
  `func_0800F258` is `GetHeldArticle`, so both are closed false leads;
- continue resource-family-first provenance, prioritizing 173..180, 413..420,
  54..57, and 160/161, and promote only after runtime/table ownership is proven;
- runtime/type recovery independently agrees with older MFoMT research:
  AbstractSprite, DefinedSprite, SpriteAnimationData, SpriteFrameData, and
  SpriteAnimator.

Current detailed checkpoint:
tools/ches/checkpoints/ui-packed-sprite-2026-10-05/README.md.

This policy governs the roadmap below. Work through non-item resources by
coherent code-owner/consumer subsystem and count editable bytes only after that
ownership and interpretation are understood.

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
  64536 / 940036 bytes (6.8653%)
  875500 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    Semantically owned packed-sprite graphics and palettes:
    44224 bytes (33664 graphics + 10560 palette)
  396 additional source-owned .rom_header bytes count only toward overall

Overall meaningful-ROM reconstruction
  140266 / 7717440 bytes (1.8175%)
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

## Code-coupled asset priority

The current retail-decomp priority deliberately advances code and non-code
resources together. Most of the ROM is non-code, but an asset counts as
meaningfully recovered only when the project also understands enough of the
runtime boundary to know what it is and how the game uses it.

Recommended order:

1. **Preserve completed units and parked compiler-sensitive frontiers.**
   Keep `func_08092A70` parked at exact size `0x260 / 3`; keep
   `func_080CAC7C` / `func_080CAD18` and `func_08092940` parked unless new
   structural evidence appears.
2. **Continue through the packed sprite bank by consumer subsystem.**
   The bank has 416 semantically owned animations, with **45 simple and 32
   multi-frame animations still unowned**. Completed state/effect families include
   cooking, Money Bag, overnight forage/map variants, Water Splash, Fish Kings,
   menu-special presentation icons, and Dog Ball. Common packed-consumer APIs
   (`func_080A4A00`, `func_0805E824`, packed `SetAnimation`,
   `CB304/CC728/CBAF0`, `CAC7C/CAD18`, local provider screens, and the retail
   multi-frame set. The explicit provider-constructor census is also complete:
   all 22 `gUnk_086678A0` constructor sites are accounted for.
   `func_080CE184` and `func_0800F258` are false co-occurrence leads.
   Continue resource-family-first provenance on 173..180, 413..420, 54..57,
   and 160/161, then trace each cluster to an authoritative runtime/table owner.
3. **Classify large graphics/palette/tileset banks with their code owners.**
   Use loaders, providers, renderers, and table consumers to establish format
   and ownership before promoting opaque ranges in `asm/data/data_0813B288.s`.
4. **Recover maps and tilesets with their runtime/resource boundaries.**
   Build editable representations only when extraction/rebuild are byte-exact
   and the consuming map/scene code is understood enough to define the format.
5. **Recover sound/music assets with the M4A runtime tables that own them.**
   Move proven songs/voicegroups/samples to editable exact sources while keeping
   the current baserom-backed `gSongTable` payload excluded until reconstructed.
6. **Recover fonts/UI/static graphics and palettes through their consumers.**
   Convert repeated palette/tile structures only after ownership/layout is
   established from code and data together.

Do not choose a blob merely because it is large. The goal is high-throughput,
honest reconstruction with useful editable assets, not percentage gaming.

## ROM free space

The current 8 MiB retail ROM has:

- used through linker payload: `0x75C240` = 7,717,440 bytes
- contiguous tail free space: `0x0A3DC0` = 671,168 bytes = 655.44 KiB
- free percentage: 8.0009%

This is only the final contiguous padding region. Internal holes are not included
unless they are separately proven safe.

For custom-game growth this tail is valuable, but retail matching must continue
to reproduce the padded retail ROM exactly.
