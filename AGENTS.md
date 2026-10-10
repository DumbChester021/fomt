# FoMT retail decompilation: standing rules

**Read [START_HERE.md](START_HERE.md) for the entire current onboarding.** This charter holds durable rules only, not progress reports, task lists, one-off function warnings, or research chronology. For decompilation, follow the repository's matching procedures and any **optional** agent-specific tools available in your environment. Machine-specific instructions belong in ignored `AGENTS.local.md`, not this public charter.

## Scope and separation

- Retail `main` reconstructs the **US Harvest Moon: Friends of Mineral Town (GBA)** into **readable, evidence-based C++** whose complete ROM remains byte-identical. No intentional gameplay changes on the retail branch.
- The separate `custom-game` worktree is for future QoL and content. The user requires **full, human-readable save-system recovery first**, before unrelated retail queues or custom features.
- Preserve original author attribution, licenses, existing code style and upstream boundaries. No unsolicited upstream PRs, pushes to `origin`, AI branding, or unrelated restructuring.

## Source and proof integrity

- Understand original assembly, ABI, signedness, callers/callees, packed layouts, ownership, destructor behavior, and exact function boundaries before assigning semantic names. Mark unknown fields honestly. Machine-code exactness and human comprehension are **separate** requirements.
- Promote C++ into production only with **zero linked-byte differences**, preserved neighboring addresses, and a **passing full forced ROM compare** with original SHA1. Code that is only semantically plausible or size-matched stays outside auto-built `src/`.
- No register forcing, padding tricks, fake volatile statements, inline ASM, compiler patches, or ROM modification just to force a match. Do not substitute whole-object copying when retail copies only active entries.
- Search the **specific target's** old experiment results before probing; reuse established types and ABI findings. No repetitive syntax roulette without new structural evidence.

## Repository and verification safety

- Inspect Git HEAD, status, target paths, and retail/custom worktrees before mutation. Preserve preexisting edits; no blind reset, clean, stash, delete or destructive overwrites.
- Use `make docs-check` for documentation changes, `make readability-check` for new compiler-forcing debt (also automatically gated by ROM/ELF builds), and `make save-check` for save research metadata. Use `make ci` for all portable checks and `make test` for the full local test suite including a forced exact-ROM rebuild. `make save-verify` covers a focused save-source integration. Any emulator gameplay tests need separate recorded proof; do not claim those passed because the ROM matched. Inspect exit codes and staged diffs.
- After exact code integration, regenerate inventory and check source readability. Do not inflate coverage for a previously owned function or a readability-only refactor.
- Publish verified coherent checkpoints to **`ches/main` only**, after diff review, with updated impacted evidence. Do not claim success or a push if it did not happen.

## Navigation, evidence and historical corrections

- One current state and next action: [START_HERE.md](START_HERE.md). For save work, the function index is [docs/SAVE_EVIDENCE_MATRIX.md](docs/SAVE_EVIDENCE_MATRIX.md). Inspect the selected source/ASM and one relevant experiment note, not all archived reports.
- The project-level procedure manual `docs/DECOMP_PLAYBOOK.md` and compiler research are **on demand** for methodological or compiler issues, not mandatory onboarding.
- Preserve old proof artifacts, dates and compiler failures. When new evidence changes a boundary, type, ABI, owner, or earlier conclusion, update its actual source consumers, current save matrix, and append a dated supersession in `tools/ches/HISTORY.md`. No competing status tables.
- Historic, custom-only function warnings belong in targeted subsystem research, **not** permanent global policy. Example: the held-item discard-before-callback behavior is already recorded under `docs/DECOMP_NOTES.md`, to consult only if modifying item-discard paths.
