# FoMT | What, current state, next step, locations

**This is the single onboarding page.** Agents also follow permanent rules in [AGENTS.md](AGENTS.md) and the installed decompilation skill when doing reverse engineering. Load only the relevant specialized documentation if research requires it.

## What is this?

Human-readable, **byte-identical matching decompilation** of the US Game Boy Advance *Harvest Moon: Friends of Mineral Town*. Retail code lives on `main`, intentional QoL/custom gameplay on the separate `custom-game` worktree. The user wants the **entire readable retail save system finished first**.

## Where are we now?

- Retail workspace: the **root of this Git checkout**, branch `main` tracking `ches/main` on this fork. **Run `git status -sb` and `git log -1` for the real current commit**; old document SHAs are historical.
- Byte-exact C++ reconstructed: **91,388 / 940,036 bytes (9.7218%)**, **848,648 ASM bytes / 1,946 linked functions** remain across the whole game. This is **not** a save-system completion or human-readability percentage.
- Original ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. Last forced production compare passed after the typed Rucksack cleanup (`sh_mv2utzp3_be621085`). 41 binary save-layout checks and synthetic SRAM inspector tests passed. **No real backed-up player SRAM/emulator load has been verified.**
- Saved-state copies already exact: Farmer **448 B**, Barn **296 B**, Farm **180 B**, Dog **132 B**, plus several save/cleanup/header helpers. Parent GameState assignment, active-entry Rucksack copy, Coop, MoneyState, loader and save/erase/error menu paths are **unfinished**.

## What do we do next?

**One bounded task:** Investigate the **128-byte Rucksack active-entry copy** `func_080D6A80` at `0x080D6A80..0x080D6B00`. Preserve count and copying **only active entries**. The adjacent **64-byte** cleanup `func_080D6B00` is **already exact C++**; its typed readability rewrite added **zero** new matching bytes. Four ordinary source-shape candidates failed; open [Rucksack research](docs/SAVE_RUCKSACK_COPY_RESEARCH.md) **only when investigating this function**.

Then address Coop (292 B; best candidate has 35 differing bytes), MoneyState (200 B), parent GameState copy (776 B), loader (740 B), SRAM/UI save, overwrite/erase/error cases and real backed-up save/emulator round-trip. **Do not replay closed compiler experiments without new ABI, layout or source evidence.** Keep custom-game edits untouched.

## Where are things?

| Where | What to use it for |
| --- | --- |
| `src/`, `include/` | Actual reconstructed C++ and binary types |
| `asm/`, `fomt.lds`, `fomt.map` | Still-retail assembly and linked addresses/boundaries |
| [Save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md) | **Current save-specific index**: function address, bytes, exact/ASM, owner and proof link |
| `tools/ches/decomp_inventory.json` | Generated remaining-ASM and progress inventory |
| `tools/ches/checkpoints/`, `tools/ches/HISTORY.md` | Timestamped experiments, rejected variants, historical corrections; **search only when needed** |
| `docs/DECOMP_PLAYBOOK.md`, `docs/FOMT_COMPILER_RESEARCH.md` | Optional matching methodology and compiler forensics |
| [INSTALL.md](INSTALL.md), `tools/`, `assets/` | Build setup, analysis tools and editable assets |
| `tools/ches/audits/2026-10-11/REVIEW.md` | Documentation audit/merge decisions; **not onboarding** |

## Verify

- Documents: `make docs-check`.
- Save metadata, function ownership/bounds and synthetic SRAM tests: `make save-check` (no ROM rebuild). The scoped save subset is printed by `make save-progress`.
- Save production source: `make save-verify` (includes full forced ROM comparison).
- All available local automated tests including a forced ROM rebuild: `make test`; whole-game and scoped save numbers: `make progress`.
- Portable source-only CI without a licensed ROM or private integrations: `make ci`. GitHub-hosted jobs currently cannot start because of a GitHub account billing lock; this is not a test-code failure.

**Truth order:** verified Git/source/ASM/build > this current page > target evidence matrix > historical experiments. Preserve old evidence with dated corrections, but do not let it issue current instructions.
