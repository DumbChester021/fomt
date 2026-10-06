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
  70472 / 940036 bytes (7.4967%)
  869564 bytes remain in asm

Data/assets reconstruction
  75334 / 6777404 bytes (1.1115%)
  31110 bytes from typed/source non-code data
  44224 bytes from editable generated assets
    33664 graphics bytes
    10560 palette bytes
  396 additional source-owned ROM-header bytes count only toward overall

Overall meaningful-ROM reconstruction
  146202 / 7717440 bytes (1.8944%)
  final ROM padding is excluded from this denominator

ROM space
  7717440 / 8388608 bytes used (91.9991%)
  671168 bytes free (655.44 KiB, 8.0009%) contiguous tail space
```

The code inventory currently reports **2,341 linked assembly functions**, **868,400 bytes** covered by inferred function ranges, and **1,164 unattributed assembly bytes**.

## What the metrics mean

The project keeps separate dimensions rather than combining unlike work into one inflated percentage:

1. **Code reconstruction** counts linked executable source replacing retail assembly.
2. **Data/assets reconstruction** counts non-code ROM bytes regenerated from editable typed data or asset sources.
3. **Overall meaningful-ROM reconstruction** combines reconstructed code and data/assets against linked ROM content before final padding.

Understanding or documenting an opaque `.incbin` does not count as asset/data reconstruction. Editable project-side source must regenerate the retail bytes exactly.

## Recent exact milestones

The current Entity38740 strategy/controller run substantially expanded the readable entity family.

The latest exact promotion added **112 retail bytes**:

- `Entity398A4::~Entity398A4` / retail `func_080399C0`: 0x70

The immediately preceding exact batch added 332 retail bytes across `39DA8`, `39E18`, `39A30`, and `39F50`.

The broader recent family also promoted exact nearest-entity selection, coordinate-region tests, strategy selectors, state helpers, table/mask lookups, and strategy-pointer selection.

Other major recovered areas include:

| Area | Current state |
| --- | --- |
| Build/toolchain | Reproducible pinned FoMT compatibility compiler and exact retail build |
| Input/hardware | Key input, Hardware context accessors, DMA/transfer queue, VBlank infrastructure |
| Containers/resources | Intrusive callback list and substantial resource-handle/allocation logic |
| Animation/effects | SpriteAnimator, packed provider parsing, EntityEffect lifecycle |
| Characters | 43-entry character metadata, identity/social/location/schedule helpers, all 35 resident constructors |
| Entity system | GameObject indexed lookup/teardown, Ball entity, substantial adjacent strategy/controller family |
| Economy/items | MoneyState, typed shop catalogs, article interaction paths |
| Editable graphics | 347 retail Tool/Food/Article icons plus code-proven special families |
| Save format | Exact checksum/writer/slot geometry; loader research bounded and parked |

## Current frontier

The exact next code target is constructor `func_080398A4` at `0x080398A4..0x080399C0` (0x11C), using the owner layout now proven by the exact destructor.

Its first saved candidate did not compile only because of two C++ declaration issues. Its retail destructor behavior is already understood. See `START_HERE.md` and `tools/ches/NEXT_AGENT_HANDOFF.md` for the exact resume steps.

The adjacent `func_08039E98` constructor is behavior-complete and exact-size in scratch at **0xB8 / 109 differing linked bytes**; it is parked on register/lifetime allocation.

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
