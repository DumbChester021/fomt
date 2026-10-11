# FoMT | What, current state, next step, locations

**This is the single onboarding page.** Follow permanent rules in [AGENTS.md](AGENTS.md). Read ignored `AGENTS.local.md` if present for private tools and scratch; load specialized evidence only for the target.

## What is this?

Human-readable, **byte-identical matching decompilation** of the US Game Boy Advance *Harvest Moon: Friends of Mineral Town*. Retail code lives on `main`; intentional gameplay changes belong in the separate `custom-game` worktree. The user requires **complete readable save-system recovery first**.

## Where are we now?

- Retail checkout: this repository root, branch `main` tracking `ches/main`. Run `git status -sb` and `git log -1` for actual publication state.
- Exact C++ code: **95,332 / 940,036 bytes (10.1413%)**. **844,704 ASM bytes / 1,925 linked functions** remain. This is whole-game code coverage, not save completion.
- Latest source recovery: **Rucksack active-entry copy, 128 linked bytes**, and **MoneyState copy, 200 linked bytes**. Both preserve inactive entries. Their 126/198 instruction bodies match separately; normal section alignment supplies the final two bytes of each span. Isolated forced ROM rebuild and production compare passed October 11. Full `make test` passed, including portable checks, selector rejection tests, readability and a forced production ROM rebuild.
- Original ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. No gameplay changes. The included `baserom.sav` has **no valid slots**; **real player-save load/round-trip remains unverified**.
- Exact nested copies: Farmer 448 B, Barn 296 B, Farm 180 B, Coop 292 B, Dog 132 B, Social 1,048 B, Rucksack 128 B and MoneyState 200 B. Cleanup/header helpers and the 1,724-byte native-call initializer are also exact. The bounded **12-function save-copy subset is 10/12 exact**; GameState parent copy and loader remain ASM. The separate 7,132-byte packed-state copy is also unfinished.

## What do we do next?

**First:** `func_080D44D4`, **7,132 bytes**, `0x080D44D4..0x080D60B0` in `asm/code_linkonce.s`. The 0x80-byte type and initializer are source-owned. **455 native-action fields** now have checked selector identities; original integer base types remain unresolved. Best scratch copy remains **7,120 bytes / 3,621 differing linked bytes**, with 24/24 bounded interpreter trials. This is **not matching source**.

Read [packed-copy research](docs/SAVE_PACKED_NATIVE_COPY_RESEARCH.md) and the [save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md). The new computed-address evidence maps selectors `0x120..0x123` to the four fields at `+0x34`, and `0x1EE` to `+0x74.bit6:3`. It confirms identities/bounds, **not u16 base types**. Five fields remain neutral, including the five-bit preserved gap.

**Next evidence:** inspect the remaining instruction-shape differences near `+0x34`, `+0x4D..50`, `+0x62..6F`, and `+0x7C`. The range-construction discovery below was tried on this large copy: typed and width-probe candidates regressed to 7,140/6,768 and 7,144/6,786 (size/differences). Do not repeat this container-only hypothesis or guess types from a score.

**Then:** the 776-byte parent GameState copy and 740-byte loader, followed by remaining SRAM/UI and Money rollover/history logic. Use the [GameState map](docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md) and [save lifecycle](docs/SAVE_LIFECYCLE.md). Do not touch the custom-game worktree.

## Where are things?

| Location | Purpose |
| --- | --- |
| `src/`, `include/` | Readable reconstructed source and binary layouts |
| `asm/`, `fomt.lds`, `fomt.map` | Remaining assembly, source ownership and linked boundaries |
| [Save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md) | Current function sizes, owners, proof and next clues |
| [Rucksack copy proof](docs/SAVE_RUCKSACK_COPY_RESEARCH.md), [GameState/Money map](docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md) | Exact range-construction evidence and superseded failed candidates |
| `tools/ches/decomp_inventory.json` | Generated linked ASM inventory |
| `tools/ches/HISTORY.md`, `tools/ches/checkpoints/` | Dated corrections and experiments; search only the selected target |
| `docs/DECOMP_PLAYBOOK.md`, `docs/FOMT_COMPILER_RESEARCH.md` | Matching methodology/compiler evidence, on demand |
| [Readability audit](docs/SOURCE_READABILITY_AUDIT.md) | Source quality/debt, separate from binary exactness |
| [INSTALL.md](INSTALL.md), `tools/`, `assets/` | Build requirements, tools and editable assets |

## No-context continuation

Read `AGENTS.md`, this page, local instructions if present, then the selected target's research. Check Git before edits. The new exact copies use `CopyConstructFrom`, a captured count and `std::uninitialized_copy`. The existing non-POD STL range helper now has an ordinary `inline` declaration. This is a source/library recovery with **no compiler patch, forced inline attribute or register forcing**. Money maxima are paired `MoneyRecord` members at +0x120/+0x128; all four component offsets are asserted.

Local-only packed-copy candidates are `shared-native-copy.cc`, `scratch_native_copy_state.hh` and `shared-native-copy-width-probe.cc`; their directory is recorded in `AGENTS.local.md` and the research. Scratch is not part of a public clone. Old artifacts retain their original field names and measurements.

## Verify

- `make docs-check`: documentation integrity. `make readability-check`: source-regression guard, also run on normal ROM/ELF builds.
- `make save-check`: ownership/layout evidence, 455 selector mappings with negative-evidence tests, synthetic SRAM checks.
- `make ci`: all portable source-only checks. `make test`: full local automated suite and **forced full-ROM rebuild**. `make save-verify`: focused save integration gate.
- `make progress`: whole-game coverage and scoped save subset. Only zero linked differences plus original-ROM SHA1 permit source promotion; regenerate inventory after integration.
- Emulator gameplay proof is separate. Synthetic SRAM tests and a matching ROM do not establish a real player-save round trip.
- GitHub Actions is disabled for this fork (permissions API confirmed October 11). Local test gates remain required.

**Truth order:** verified Git/source/ASM/build > this page > target evidence > historical experiments.
