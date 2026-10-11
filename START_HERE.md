# FoMT | What, current state, next step, locations

**This is the single onboarding page.** Agents also follow permanent rules in [AGENTS.md](AGENTS.md) and the installed decompilation skill when doing reverse engineering. Load only the relevant specialized documentation if research requires it.

## What is this?

Human-readable, **byte-identical matching decompilation** of the US Game Boy Advance *Harvest Moon: Friends of Mineral Town*. Retail code lives on `main`, intentional QoL/custom gameplay on the separate `custom-game` worktree. The user wants the **entire readable retail save system finished first**.

## Where are we now?

- Retail workspace: the **root of this Git checkout**, branch `main` tracking `ches/main` on this fork. **Run `git status -sb` and `git log -1` for the real current commit**; old document SHAs are historical.
- Byte-exact C++ reconstructed: **95,004 / 940,036 bytes (10.1064%)**, **845,032 ASM bytes / 1,927 linked functions** remain across the whole game. This is **not** a save-system completion or human-readability percentage.
- Original ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. Latest exact-source work: the 48-byte packed-header B setter (`0x08011498`, commit `6212b65`) plus the adjacent 48-byte C setter (`0x080114C8`); both natural C++ and full forced `make test` passed October 11. Related A setter (52 B), flag initializer (24 B), and native-call initializer (1,724 B) are also exact source. Save-layout assertions and synthetic SRAM checks pass. The included `baserom.sav` contains **no valid slots**; **a real player-save load/round-trip is not verified**.
- Exact nested copies: Farmer 448 B, Barn 296 B, Farm 180 B, Coop 292 B, Dog 132 B, Social 1,048 B, plus cleanup/header helpers. Parent GameState assignment, Rucksack/MoneyState copies, loader, and save UI remain unfinished.

## What do we do next?

**Save priority:** Decompile the original **7,132-byte** `func_080D44D4` packed-state copy, then the 776-byte parent GameState assignment and 740-byte loader. Its 1,724-byte typed initializer is exact source. **450** native-action fields are mapped; base integer types are not fully known. Best scratch copy is **nonmatching** (3,621 differing bytes). See [packed-copy research](docs/SAVE_PACKED_NATIVE_COPY_RESEARCH.md) and [GameState map](docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md).

**Secondary save research:** Money rollover/history queries and SRAM/UI paths remain unfinished; all three packed-header progress setters are exact. See [save lifecycle](docs/SAVE_LIFECYCLE.md) and [packed progress evidence](docs/SAVE_PACKED_PROGRESS.md). Do not repeat closed guesses.

**Also unfinished:** Rucksack copy (128 B), MoneyState copy (200 B), real backed-up save/emulator round trip. Rucksack cleanup is exact. The bounded **12-function save-copy subset remains 8/12 exact**; no custom-game changes before save-system recovery.

## Where are things?

| Where | What to use it for |
| --- | --- |
| `src/`, `include/` | Actual reconstructed C++ and binary types |
| `asm/`, `fomt.lds`, `fomt.map` | Still-retail assembly and linked addresses/boundaries |
| [Save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md) | **Current save-specific index**: function address, bytes, exact/ASM, owner and proof link; [social-state copy proof](docs/SAVE_SOCIAL_STATE_COPY.md) is outside the 12-function subset |
| `tools/ches/decomp_inventory.json` | Generated remaining-ASM and progress inventory |
| `tools/ches/checkpoints/`, `tools/ches/HISTORY.md` | Timestamped experiments, rejected variants, historical corrections; **search only when needed** |
| `docs/DECOMP_PLAYBOOK.md`, `docs/FOMT_COMPILER_RESEARCH.md` | Optional matching methodology, speed lessons and compiler forensics (on demand, not onboarding) |
| [Source readability audit](docs/SOURCE_READABILITY_AUDIT.md), `make readability-check` | Reviewed C/C++ quality/debt, source-only regression gate; separate from byte matching |
| [INSTALL.md](INSTALL.md), `tools/`, `assets/` | Build setup, analysis tools and editable assets |
| `tools/ches/audits/2026-10-11/REVIEW.md` | Documentation audit/merge decisions; **not onboarding** |

## No-context continuation (Astra or any next agent)

Start at the retail repository root: `git status -sb`, `git log -1`; read `AGENTS.md`, this page, [packed copy research](docs/SAVE_PACKED_NATIVE_COPY_RESEARCH.md), and the [save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md). If available on this machine, read the Git-ignored `AGENTS.local.md` for optional private tools and scratch. Last verified exact-code commit before this documentation audit: `6212b65`.

**First target:** `func_080D44D4` in `asm/code_linkonce.s` (7,132 B, `0x080D44D4..0x080D60B0`). Its 0x80-byte type/initializer are source-owned; `python3 tools/ches/native_selector_map.py --check` proves 450 native-action fields. Local-only scratch: `shared-native-copy-width-probe.cc` and a scratch header (location recorded in the linked research and optional `AGENTS.local.md`); best **nonmatching** result is 7,120 generated bytes / 3,621 linked-byte differences, 24/24 *bounded* behavior trials. Scratch is not in the Git clone.

**Next evidence:** independently verify ambiguous `+0x34` field base types and instruction groups `+0x34`, `+0x4D..50`, `+0x62..6F`, `+0x7C`, using real accessors and the exact packed/aligned B/C header setter ABI (`src/game_state_packed_progress_{b,c}.cc`). No guessing, compiler coercion, or nonmatching ASM replacement. To count exact bytes, require zero linked differences and full `make test`/original ROM SHA1, regenerate inventory, update the relevant evidence, and push `ches/main`. Leave the custom-game worktree alone.

## Verify

- **Every normal retail ROM/ELF build** (`make`, `make compare`, `make fomt.gba`, `make fomt.elf`) automatically runs the source-readability regression guard without forcing a rebuild; portable `make ci` and full `make test` also run it. Documents: `make docs-check`; manual recheck: `make readability-check`; detailed source inventory: `make readability-report`. The guard catches new coercive constructs, **not** all semantic readability issues.
- Save metadata, function ownership/bounds and synthetic SRAM tests: `make save-check` (no ROM rebuild). The scoped save subset is printed by `make save-progress`.
- Save production source: `make save-verify` (includes full forced ROM comparison).
- All available local automated tests including a forced ROM rebuild: `make test`; whole-game and scoped save numbers: `make progress`.
- Portable source-only checks without a licensed ROM or private integrations: `make ci`. **GitHub Actions was disabled for the `ches` fork in repository settings on October 11, 2026** (confirmed via the GitHub Actions permissions API, `enabled=false`). The workflow YAML remains available for future opt-in. Local `make ci` and `make test` stay active. GitHub Actions is ordinarily free for public repositories using standard hosted runners; a previous account billing restriction is not evidence that this repository must pay.

**Truth order:** verified Git/source/ASM/build > this current page > target evidence matrix > historical experiments. Preserve old evidence with dated corrections, but do not let it issue current instructions.
