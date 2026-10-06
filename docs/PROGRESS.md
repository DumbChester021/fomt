# Decompilation and expansion progress

Run `make progress` for the current reconstruction totals, retail ROM check,
branch, commit, and PRET-style free-space report.

The project now keeps **three separate reconstruction metrics** instead of
forcing code, data and graphics into one misleading percentage:

1. **Code reconstruction** — the original executable-code metric from linked
   `.text` / linkonce text sections.
2. **Data/assets reconstruction** — ROM-resident bytes outside that code metric
   which are actually regenerated from typed source or editable asset sources.
3. **Overall meaningful-ROM reconstruction** — reconstructed code plus
   reconstructed data/assets divided by the linked ROM before final padding.

Merely understanding, naming, documenting, or copying an `.incbin` does **not**
increase the asset/data metric. Asset bytes count only when an editable source
such as PNG data actually regenerates those retail bytes.

HEAD remains `9078f36` (`decompile game object entity teardown`), following
`579c16c` (`decompile game object entity lookup`). The October 5
character/social, item/shop, provider and asset-pipeline work is exact but not
yet committed. Current worktree totals are:

```text
Code reconstruction
  64536 / 940036 bytes (6.8653%)
  875500 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    semantically owned packed-sprite graphics and palettes:
    44224 bytes (33664 graphics + 10560 palette)
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  140266 / 7717440 bytes (1.8175%)
  final ROM padding is excluded from this reconstruction denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space

fomt.gba: OK
```

The retail SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The free-space number is the contiguous final ROM tail from the end of linked
content to the current 8 MiB ROM size. It intentionally does not claim internal
holes as available space.

## Expansion milestones

| Area | Current state | Next useful boundary |
| --- | --- | --- |
| Matching build | Retail SHA1 reproduced | Keep every baseline contribution matching |
| Input | Polling and new-press helpers are matching C++ | Extend only for a concrete control feature |
| Save data | Matching checksum/record writer and slot geometry; each slot has a proven unused 0xAF0-byte tail; retail loader behavior is bounded and exact-match research is preserved | **Paused** during the non-save expansion pivot; resume when persistence becomes the blocking dependency |
| Characters | Exact 43-entry metadata, identity/location/schedule/Lillia support, native GameObject lookup/teardown, complete 94-selector factory map, both NPC/bachelorette/Harvest-Sprite resolver blocks, native social-call routing, and `func_08045584` | Asset/provider round trips, runtime registration, and eventual seventh-candidate policy; `func_080455D8` is parked at a five-byte scheduling-only mismatch |
| Scenes and dialogue | Event bytecode can be inspected with the existing Mary tooling | Recover native trigger dispatch and verify original bytecode round trips |
| Items and tools | Core tables/wrappers, GameObject article paths, MoneyState, six typed shop catalogs, exact description helpers, proven 40-index shop stock, exact packed animation-provider parsing, and **all 347 Tool/Food/Article icons as editable PNG build inputs** | New unique icons still require extending saturated animation/frame/sprite-descriptor namespaces; treat 20-byte service shop records separately and avoid product-count growth because `ShippingBin::product_stats[NUM_PRODUCTS]` is persistent-state layout |
| Crops and field | Field/FieldPlot structure and many methods are source, but crop-state semantics remain partly opaque | Name and type planting/growth/harvest/tool transitions and their item/product links |
| Maps | Logical-to-physical map resolution and TerrainInfo layout are researched | Trace map/tileset consumers and resource registration first, then publish editable round-trip structures only for semantically owned, regenerated retail bytes |
| Graphics | Shared animator/effect/provider support is source; the packed bank has exact editable sources for **416 semantically owned animations: 405 / 450 simple and 11 / 43 multi-frame**. Completed non-core families include Water Splash, six Fish Kings, five menu-special presentation icons, and Dog Ball 21..48. The 416-entry manifest rebuilds the full bank exactly and the full ROM matches retail | Code-coupled lane: all 22 explicit `gUnk_086678A0` constructor sites and the common packed renderer/provider APIs are accounted for. `func_080CE184` and `func_0800F258` are closed false leads. Continue resource-family-first provenance on the **45 simple + 32 multi-frame** unowned animations, prioritizing 173..180, 413..420, 54..57, and 160/161; do not promote without runtime/table semantics |
| Sound and music | M4A runtime is partly source, but the current song payload remains baserom-backed and excluded from reconstructed-data progress | Trace song/voicegroup/sample ownership through the M4A runtime tables, then convert proven resources to editable byte-exact sources |

The five retail NPC support functions add 1,128 matching source bytes.
Custom-character research/docs implement no new NPC. See [CHARACTERS.md](CHARACTERS.md), [CUSTOM_CHARACTERS.md](CUSTOM_CHARACTERS.md)
and [SAVE_FORMAT.md](SAVE_FORMAT.md) for proven facts, proposals and required
verification. Code percentage and expansion readiness are separate measures. Asset/data and overall-ROM reconstruction are tracked separately in [ASSET_DECOMPILATION.md](ASSET_DECOMPILATION.md).

Milestone claims should link back to exact source, assembly, ROM data, or tool
output. Gameplay interpretations should also be checked against documentation
for the original GBA release. Matching status proves binary preservation; it
does not by itself prove a semantic name or mechanic.

The character-table recovery adds 344 bytes of typed readonly data and no
executable code. The later GameObject lookup/teardown contributions plus the
October 5 social-resolver and heart-event integrations bring the exact worktree
to **64,536 source bytes (6.8653%)**. Current scope is retail decompilation and
interface recovery for **non-save custom-game expansion** across characters,
items/tools, crops, dialogue/events and assets. Save-loader exact matching is
paused; custom behavior remains on the separate custom-game track.
