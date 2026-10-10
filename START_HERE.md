# FoMT | What, current state, next step, locations

**This is the single onboarding page.** Agents also follow permanent rules in [AGENTS.md](AGENTS.md) and the installed decompilation skill when doing reverse engineering. Load only the relevant specialized documentation if research requires it.

## What is this?

Human-readable, **byte-identical matching decompilation** of the US Game Boy Advance *Harvest Moon: Friends of Mineral Town*. Retail code lives on `main`, intentional QoL/custom gameplay on the separate `custom-game` worktree. The user wants the **entire readable retail save system finished first**.

## Where are we now?

- Retail workspace: the **root of this Git checkout**, branch `main` tracking `ches/main` on this fork. **Run `git status -sb` and `git log -1` for the real current commit**; old document SHAs are historical.
- Byte-exact C++ reconstructed: **91,776 / 940,036 bytes (9.7630%)**, **848,260 ASM bytes / 1,934 linked functions** remain across the whole game. This is **not** a save-system completion or human-readability percentage.
- Original ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. Recent exact-source additions: **16-byte** nonzero random helper (`0x08010348`), **76-byte** daily shipping payout (`0x0801140C`), **64-byte eight-member packed-state getter cluster** (`0x08010E48..0x08010E68`, `0x08010F04..0x08010F24`), and **156-byte** all-owned-animals affection predicate (`0x08010E68..0x08010F04`). The additional **52-byte** capped packed-progress setter (`0x08011464`) and **24-byte** packed-header initializer (`0x080114F8`) are also exact C++, with latest forced full-ROM proof `sh_mv2zjs7o_1c4bad58` (`fomt.gba: OK`). These additions are outside the bounded 12-function save-copy matrix. 41 binary save-layout checks and synthetic SRAM inspector tests passed previously. The included `baserom.sav` has no valid save slots (read-only inspection October 11). **No real backed-up player SRAM/emulator load has been verified.**
- Saved-state copies already exact: Farmer **448 B**, Barn **296 B**, Farm **180 B**, Dog **132 B**, plus several save/cleanup/header helpers. Parent GameState assignment, active-entry Rucksack copy, Coop, MoneyState, loader and save/erase/error menu paths are **unfinished**.

## What do we do next?

**Next bounded investigation:** Complete the **save-related money/history and daily shipment** cluster. The shipping payout (`func_0801140C`, 76 B) is now exact C++. The money daily rollover (`func_0809ADA8`, 196 B) has readable scratch candidates (v1 168 B / 160 differences; `std::copy` v2 172 B / 157 differences), neither matching. Study the original counted-history shift/append ABI and compiler traces before any new experiment. The 428-byte season boundary rollover (`func_0809AE6C`) is still ASM. The adjacent 48-byte packed-field B/C setters (`0x08011498`, `0x080114C8`) are also ASM despite the now-exact surrounding 52-byte progress setter and 24-byte flag initializer; a complete shared four-byte header layout is recovered, but local candidate families v1/v2/v3/v5 are closed. See [packed progress research](docs/SAVE_PACKED_PROGRESS.md). A real GBA Shooting Star wish doubling shipment income is independently documented; confirm the *writer* for `GameState+0x34C5` before claiming it is that event flag. See the October 11 note in [SAVE_LIFECYCLE](docs/SAVE_LIFECYCLE.md).

The **128-byte Rucksack active-entry copy** (`func_080D6A80`), Coop (292 B), MoneyState (200 B), parent GameState copy (776 B), loader (740 B), SRAM/UI save/erase/error cases, and real backed-up save/emulator round-trip are all unfinished. The adjacent **64-byte Rucksack cleanup** is already exact C++; its typed rewrite added **zero** matching bytes. Four original source candidates and three copy-ctor hypotheses failed (closed October 11). **Do not repeat closed compiler experiments without new ABI/layout evidence.** Keep custom-game edits untouched.

## Where are things?

| Where | What to use it for |
| --- | --- |
| `src/`, `include/` | Actual reconstructed C++ and binary types |
| `asm/`, `fomt.lds`, `fomt.map` | Still-retail assembly and linked addresses/boundaries |
| [Save evidence matrix](docs/SAVE_EVIDENCE_MATRIX.md) | **Current save-specific index**: function address, bytes, exact/ASM, owner and proof link |
| `tools/ches/decomp_inventory.json` | Generated remaining-ASM and progress inventory |
| `tools/ches/checkpoints/`, `tools/ches/HISTORY.md` | Timestamped experiments, rejected variants, historical corrections; **search only when needed** |
| `docs/DECOMP_PLAYBOOK.md`, `docs/FOMT_COMPILER_RESEARCH.md` | Optional matching methodology, speed lessons and compiler forensics (on demand, not onboarding) |
| [Source readability audit](docs/SOURCE_READABILITY_AUDIT.md), `make readability-check` | Reviewed C/C++ quality/debt, source-only regression gate; separate from byte matching |
| [INSTALL.md](INSTALL.md), `tools/`, `assets/` | Build setup, analysis tools and editable assets |
| `tools/ches/audits/2026-10-11/REVIEW.md` | Documentation audit/merge decisions; **not onboarding** |

## Verify

- Documents: `make docs-check`; fast source/readability regression review: `make readability-check` (detailed inventory: `make readability-report`).
- Save metadata, function ownership/bounds and synthetic SRAM tests: `make save-check` (no ROM rebuild). The scoped save subset is printed by `make save-progress`.
- Save production source: `make save-verify` (includes full forced ROM comparison).
- All available local automated tests including a forced ROM rebuild: `make test`; whole-game and scoped save numbers: `make progress`.
- Portable source-only CI without a licensed ROM or private integrations: `make ci`. GitHub-hosted jobs currently cannot start because of a GitHub account billing lock; this is not a test-code failure.

**Truth order:** verified Git/source/ASM/build > this current page > target evidence matrix > historical experiments. Preserve old evidence with dated corrections, but do not let it issue current instructions.
