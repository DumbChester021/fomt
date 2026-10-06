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

Production `ches-dev` remains at `9078f36` (`decompile game object entity teardown`). The active exact `Live-temp` branch carries the private throughput/decomp checkpoints, including the October 6 resident-NPC family integration. Current worktree totals are:

```text
Code reconstruction
  69056 / 940036 bytes (7.3461%)
  871180 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    semantically owned packed-sprite graphics and palettes:
    44224 bytes (33664 graphics + 10560 palette)
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  144786 / 7717440 bytes (1.8761%)
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

## Reconstruction milestones

| Area | Current state | Next useful boundary |
| --- | --- | --- |
| Matching build | Retail SHA1 reproduced | Keep every promoted retail contribution byte-identical |
| Throughput tooling | Unified remaining-function inventory, ranked region queue, similarity clusters, and resident-NPC factory/vtable/class map are live and regenerate from the current build | Keep the inventory fresh after integrations; deepen TU/type ownership only where it improves the next ranked coherent unit |
| Input | Polling and new-press helpers are matching C++ | Extend only for a concrete control or scripted-runtime need |
| Save data | Matching checksum/record writer and slot geometry; each slot has a proven unused 0xAF0-byte tail; retail loader behavior is bounded and exact-match research is preserved | **Paused** until persistence becomes a blocking dependency |
| Characters | Exact 43-entry metadata, identity/location/schedules, complete 94-selector factory map, native lookup/teardown/social routing, all 35 resident constructors, +0x30 source for IDs 1..34, Child +0x3C, and the adjacent neutral location-bound actor hierarchy at its proven scope | Child +0x30 remains an understood assembly island; continue adjacent entity/class work while structural reuse stays high. Custom work still needs runtime registration and seventh-candidate policy |
| Scenes and dialogue | Event bytecode can be inspected with Mary and substantial script evidence exists | Rank native trigger/dispatch/event TUs; use scripted runtime coverage to classify scene/event code and indirect targets |
| Items and tools | Core tables/wrappers, GameObject article paths, MoneyState, six typed shop catalogs, exact description helpers, proven 40-index shop stock, exact packed animation-provider parsing, and all 347 Tool/Food/Article icons as editable PNG inputs | Use these recovered types as leverage inside higher-ranked item/menu/shop TUs; avoid product-count growth because persistent layout depends on `NUM_PRODUCTS` |
| Crops and field | Field/FieldPlot structure and many methods are source, but crop-state semantics remain partly opaque | Rank coherent field/crop/tool TUs and recover planting/growth/harvest transitions as clusters rather than isolated functions |
| Maps | Logical-to-physical map resolution and TerrainInfo layout are researched | Fold map/tileset consumers, tables, and runtime coverage into the TU/data-ownership queue; promote editable structures only when byte-exact and semantically owned |
| Graphics | Shared animator/effect/provider support is source; packed-bank ownership is **416 / 493 = 405 / 450 simple + 11 / 43 multi-frame** and the build regenerates all promoted families exactly | The remaining **77** IDs are parked as a by-product lane. Resolve them while decompiling owning scenes/events/TUs; do not manually hunt them as the main queue |
| Sound and music | M4A runtime is partly source, but the song payload remains baserom-backed | Treat audio as a coherent subsystem/TU/data project and rank it against other clusters rather than mining individual assets |
| Runtime analysis | Durable opening-farm mGBA savestate exists; prior selective watchpoint work is preserved | Build deterministic savestate + scripted-input coverage/indirect-call/RAM-diff scenarios; watchpoints answer focused questions only |

Exact reconstruction is now **68,856 / 940,036 source bytes = 7.3248%**,
**75,334 data/asset bytes**, and **144,786 overall meaningful-ROM bytes** at the
current verified baseline. The strategy change does not alter these numbers.

A future semantic/understood metric should be reported separately from exact
matched source. Production source remains exact-only unless the project later
adopts an explicit supported NONMATCHING convention.

Milestone claims should link back to exact source, assembly, ROM data, or tool
output. Matching status proves binary preservation; it does not by itself prove
a semantic name or mechanic. Current scope is throughput-first whole-game retail
decompilation, with custom-game readiness as a major downstream benefit and
save-loader exact matching still paused.
