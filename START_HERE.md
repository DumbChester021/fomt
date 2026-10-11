# FoMT | What, current state, next step, locations

**This is the single onboarding page.** Follow permanent rules in [AGENTS.md](AGENTS.md). Read ignored `AGENTS.local.md` if present for private tools and scratch; load specialized evidence only for the target.

## What is this?

Human-readable, **byte-identical matching decompilation** of the US Game Boy Advance *Harvest Moon: Friends of Mineral Town*. Retail code lives on `main`; intentional gameplay changes belong in the separate `custom-game` worktree. The user requires **complete readable save-system recovery first**.

## Where are we now?

- Retail checkout: this repository root, branch `main` tracking `ches/main`. Run `git status -sb` and `git log -1` for actual publication state.
- Exact C++ code: **96,108 / 940,036 bytes (10.2239%)**. **843,928 ASM bytes / 1,924 linked functions** remain. This is whole-game code coverage, not save completion.
- Latest source recovery: **GameState parent copy, 776 linked bytes**, in readable C++ with a complete 0x34F4-byte typed storage layout. Shared social-state types, active buffer construction, fixed metadata arrays, strings and preserved gaps are explicit. Isolated forced ROM rebuild and full production `make test` passed October 11, including original-ROM SHA1, layout, selector, SRAM, portable and readability checks.
- Original ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. No gameplay changes. The included `baserom.sav` has **no valid slots**; **real player-save load/round-trip remains unverified**.
- Exact nested copies: Farmer 448 B, Barn 296 B, Farm 180 B, Coop 292 B, Dog 132 B, Social 1,048 B, Rucksack 128 B and MoneyState 200 B. The parent adds 776 B; cleanup/header helpers and the 1,724-byte native-call initializer are also exact. The bounded **12-function save-copy subset is 11/12 exact**; its 740-byte loader remains ASM. The separate 7,132-byte packed-state copy is unfinished.

## What do we do next?

**Next:** the **740-byte loader/default initializer**, `func_08011650` in `asm/game_state.s`. Read its existing closed experiments at `tools/ches/checkpoints/save-loader-08011650-2026-10-04/README.md` before a new hypothesis. Use the now exact parent copy and shared layout as concrete type/lifetime evidence. Then continue remaining SRAM/UI and Money rollover/history logic. Do not touch the custom-game worktree.

The **7,132-byte packed-state copy** `func_080D44D4` remains a separate open dependency. Its best scratch candidate is still **7,120 bytes / 3,621 differing linked bytes**, with 24/24 bounded interpreter trials, not matching source. The first 2,392 bytes differ only in the three-byte active-range endpoint sequence; the first packed-field divergence is pointer/mask allocation at +0x34. Generated-member-copy and integer-identity hypotheses are closed. Resume only with new structural evidence, using [packed-copy research](docs/SAVE_PACKED_NATIVE_COPY_RESEARCH.md).

Read the [GameState copy proof/map](docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md), [save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md), and [save lifecycle](docs/SAVE_LIFECYCLE.md). Exact code does not assign gameplay meanings to still-neutral fields or establish a real player-save round trip.

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

Read `AGENTS.md`, this page, local instructions if present, then the selected target's research. Check Git before edits. The Rucksack/Money copies use `CopyConstructFrom`, a captured count and `std::uninitialized_copy`. The parent uses the same range-construction evidence through byte-buffer `begin()` accessors and a one-byte record view; the raw payload and six existing accessor ABIs are unchanged. The existing non-POD STL range helper now has an ordinary `inline` declaration. This is a source/library recovery with **no compiler patch, forced inline attribute or register forcing**. Money maxima are paired `MoneyRecord` members at +0x120/+0x128; all four component offsets are asserted.

Local-only packed-copy candidates are `shared-native-copy.cc`, `scratch_native_copy_state.hh` and `shared-native-copy-width-probe.cc`; their directory is recorded in `AGENTS.local.md` and the research. Scratch is not part of a public clone. Old artifacts retain their original field names and measurements.

## Verify

- `make docs-check`: documentation integrity. `make readability-check`: source-regression guard, also run on normal ROM/ELF builds.
- `make save-check`: ownership/layout evidence, 455 selector mappings with negative-evidence tests, synthetic SRAM checks.
- `make ci`: all portable source-only checks. `make test`: full local automated suite and **forced full-ROM rebuild**. `make save-verify`: focused save integration gate.
- `make progress`: whole-game coverage and scoped save subset. Only zero linked differences plus original-ROM SHA1 permit source promotion; regenerate inventory after integration.
- Emulator gameplay proof is separate. Synthetic SRAM tests and a matching ROM do not establish a real player-save round trip.
- GitHub Actions is disabled for this fork (permissions API confirmed October 11). Local test gates remain required.

**Truth order:** verified Git/source/ASM/build > this page > target evidence > historical experiments.

Parent-copy scratch and isolated proof locations are recorded in ignored `AGENTS.local.md`; the exact candidate is `game-state-copy-v12.cc`. Public proof and closed hypotheses are in the GameState assignment map.
