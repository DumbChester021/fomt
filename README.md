# Harvest Moon: Friends of Mineral Town (GBA) Decompilation

This repository is a matching decompilation of the US release of **Harvest Moon: Friends of Mineral Town** for the Game Boy Advance.

The goal is to reconstruct the retail game as readable, maintainable source and editable data while continuing to build the exact original ROM byte-for-byte. Intentional gameplay changes live separately from the retail-matching project.

This fork builds on the original work in [StanHash/fomt](https://github.com/StanHash/fomt). Reconstructed source is not the original commercial source code.

## Current status

The active public retail-decompilation branch is **`main`**.

The matching build currently reproduces:

- ROM: `fomt.gba`
- Size: **8,388,608 bytes**
- SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**
- Full verification: **`fomt.gba: OK`**

Current exact reconstruction metrics:

| Metric | Current |
| --- | ---: |
| Code | **71,612 / 940,036 bytes (7.6180%)** |
| Assembly remaining | **868,424 bytes** |
| Data/assets | **75,334 / 6,777,404 bytes (1.1115%)** |
| Overall meaningful ROM | **147,342 / 7,717,440 bytes (1.9092%)** |
| Contiguous ROM tail free space | **671,168 bytes (655.44 KiB)** |

Run `make progress` for the live report.

Asset/data progress is intentionally conservative. A byte counts only when editable project-side source regenerates the retail byte exactly; moving opaque ROM data into another binary blob does not count.

## What is already reconstructed

The project contains readable matching source across many game and engine boundaries, including:

- key input and hardware access;
- DMA/graphics-transfer infrastructure;
- intrusive callback lists;
- resource handles and allocation support;
- `SpriteAnimator` and packed animation-provider parsing;
- shared entity/effect lifecycle code;
- character identity, social-state, location and schedule helpers;
- all 35 resident-NPC constructors and most resident effect factories;
- GameObject entity lookup/teardown;
- money and shop-catalog infrastructure;
- item/article interaction paths;
- the thrown Ball entity and a substantial adjacent entity/controller strategy family;
- typed and editable retail data such as character metadata and shop catalogs.

The packed item/UI animation bank also has an exact editable pipeline. All 347 retail Tool/Food/Article icons are PNG build inputs, with additional code-proven special families recovered as their runtime owners were identified.

## Current decompilation focus

Work is throughput-first and organized by coherent translation unit, type, vtable, or repeated machine-code family rather than by a fixed function count.

`func_08039F90` is now behavior-complete and parked after the bounded natural lifetime family failed to reproduce retail register ownership. The adjacent Q8 trigonometric helpers `func_0803A320` and `func_0803A334` are exact source, adding 48 retail bytes; they read a 256-entry signed Q8 sine table, with `3A334` using the quarter-turn cosine phase. The active same-region target is `func_0803A180` (0x1A0), a shared movement/state helper with eight direct callers. `func_08039E98` remains behavior-complete and exact-size in scratch but parked on register/lifetime allocation.

Compiler-sensitive functions that are behavior-complete are parked rather than blocking whole-game progress. The canonical continuation is always in [tools/ches/NEXT_AGENT_HANDOFF.md](tools/ches/NEXT_AGENT_HANDOFF.md).

## Build requirements

You need:

- an ARM `arm-none-eabi` toolchain;
- Python 3;
- Pillow;
- a legally obtained US FoMT base ROM named `baserom.gba`.

Install the pinned FoMT compatibility compiler:

```sh
tools/install_agbcp.sh
```

Then build and compare:

```sh
make -B -j4 compare
```

A successful matching build ends with:

```text
fomt.gba: OK
```

For the full setup notes, see [INSTALL.md](INSTALL.md).

**The retail ROM is not distributed by this repository.**

## Project layout

```text
src/                 readable reconstructed source
include/             shared types and interfaces
asm/                 retail code/data not yet reconstructed
data/                source-owned data definitions
assets/              editable generated assets
docs/                architecture, progress and decompilation documentation
tools/               build and analysis tooling
tools/ches/          decompilation inventory, queue and durable research handoff
fomt.lds             linker map and exact ROM ordering
```

## Documentation

Start here:

- [START_HERE.md](START_HERE.md) - current zero-context dashboard and exact next action
- [INSTALL.md](INSTALL.md) - reproducible build setup
- [docs/PROGRESS.md](docs/PROGRESS.md) - current reconstruction metrics and milestones
- [docs/REPO_MAP.md](docs/REPO_MAP.md) - repository and subsystem orientation
- [docs/DECOMP_PLAYBOOK.md](docs/DECOMP_PLAYBOOK.md) - matching workflow and validation rules
- [docs/DECOMP_PRIORITY_MAP.md](docs/DECOMP_PRIORITY_MAP.md) - throughput-first target strategy
- [docs/ASSET_DECOMPILATION.md](docs/ASSET_DECOMPILATION.md) - asset/data counting and authoring policy

Stable subsystem documentation includes [CHARACTERS.md](docs/CHARACTERS.md), [ENTITY_BALL.md](docs/ENTITY_BALL.md), [ENTITY_EFFECTS.md](docs/ENTITY_EFFECTS.md), [HARDWARE.md](docs/HARDWARE.md), [HARDWARE_TRANSFER.md](docs/HARDWARE_TRANSFER.md), [INTRUSIVE_CALLBACK_LIST.md](docs/INTRUSIVE_CALLBACK_LIST.md), [KEY_INPUT.md](docs/KEY_INPUT.md), [RESOURCE_HANDLES.md](docs/RESOURCE_HANDLES.md), [SAVE_FORMAT.md](docs/SAVE_FORMAT.md), and [SPRITE_ANIMATOR.md](docs/SPRITE_ANIMATOR.md).

## Branch policy

- **`main`**: active public byte-exact retail reconstruction and durable project checkpoints.
- **`custom-game`**: separate intentional QoL/content work. Retail matching and custom behavior must not be mixed.
- **`ches-dev`**: retained historical exact-contribution line from earlier project phases.

Every source/data promotion on `main` must preserve the retail ROM exactly. Research candidates that are behaviorally understood but nonmatching stay in the research/checkpoint area instead of replacing assembly.

## Contributing

Matching contributions should be small, evidence-backed, and consistent with the surrounding project style.

Before considering a retail reconstruction complete:

1. prove the intended behavior and ABI from retail evidence;
2. match the exact target bytes;
3. integrate only the corresponding source/assembly/linker boundary;
4. run the full ROM comparison;
5. verify the expected SHA1;
6. update the documentation and progress state affected by the change.

Avoid speculative semantic names, unrelated refactors, artificial register-forcing tricks, or custom behavior inside retail-matching work.

## Upstream and related work

- [StanHash/fomt](https://github.com/StanHash/fomt) - upstream decompilation project
- [StanHash/FOMT-DOC](https://github.com/StanHash/FOMT-DOC) - earlier reverse-engineering documentation
- [StanHash/mary](https://github.com/StanHash/mary) - FoMT/MFoMT event-script compiler/decompiler

The original upstream README/contact history remains available in the repository history.
