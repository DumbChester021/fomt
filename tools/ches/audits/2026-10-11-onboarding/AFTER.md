# FoMT onboarding simplification | October 11, 2026

This is a **dated maintenance report**, not an onboarding prerequisite. The previous entire contents of all ten affected docs are stored at `tools/ches/checkpoints/onboarding-consolidation-2026-10-11/`, with SHA256 integrity records in `MANIFEST.json`. Nothing was inferred from earlier conversation context.

## New onboarding contract

Read **only `START_HERE.md`** to learn:

1. What the project is
2. What is currently verified and unfinished
3. The one next bounded task
4. Where source, ASM, generated inventory, tests and optional evidence live

`AGENTS.md` supplies durable implementation policy to agents but has **no current task list or one-off function warnings**. `README.md` is the public description, `INSTALL.md` a setup guide. Research histories, experiments, compiler notes and specialist docs are opened **only if a specific task needs them**.

## Exact live-text reduction

| Formerly overlapping file | Before bytes | After bytes | Role now |
| --- | ---: | ---: | --- |
| `AGENTS.md` | 26,420 | 3,813 | Permanent rules only |
| `README.md` | 12,314 | 1,653 | Public project overview |
| `START_HERE.md` | 6,320 | 3,945 | **Sole current status, next task and path map** |
| `TODO.md` | 10,357 | 0 | Removed after archival |
| `tools/ches/NEXT_AGENT_HANDOFF.md` | 4,001 | 475 | Compatibility redirect |
| `tools/ches/SESSION_STATUS.md` | 9,907 | 444 | Historical-status redirect |
| `docs/PROGRESS.md` | 15,974 | 479 | Progress redirect |
| `docs/DECOMP_PRIORITY_MAP.md` | 30,421 | 468 | Superseded-queue redirect |
| `docs/REPO_MAP.md` | 23,701 | 439 | Navigation redirect |
| `tools/ches/DECOMP_QUEUE.md` | 16,961 | 413 | Superseded-queue redirect |
| **Total** | **156,376** | **12,129** | **92.2% smaller** |

All earlier bytes remain in the dated archive, with 10 recorded SHA256 hashes. The archive is a **historical evidence store**, not a place to fetch instructions on every new session.

## A formerly global warning moved to its proper scope

The game clears a held item before reaching the later discarded-item callback in `func_0802F0EC`. That is relevant for a future **custom-game item restriction**, not for routine retail save matching. The earlier rule remains intact in the archived `AGENTS.md`, and the researched behavior already exists in `docs/DECOMP_NOTES.md`; it was deliberately dropped from current global policy.

## Automation and validation

- `make docs-check`: broken links, one-page onboarding sections, root-TODO absence, document size limits, append-only history, and SHA256 verification of all ten archived originals.
- `make save-check`: documentation checks plus original save-function ASM/source owner checks and read-only SRAM inspector synthetic tests.
- `make save-verify`: the above plus forced full-ROM rebuilding and original SHA1.
- `tools/ches/audit_docs.py`: targeted document inventory by role/size/hash; only run when conducting an audit, **not** at startup.
- Current code bytes remain **91,388 / 940,036 (9.7218%)**, and the last forced ROM comparison was already verified. No code/ASM/linker changes were made during the consolidation, so no new full rebuild is needed.

## Boundaries for later cleanup

Specialized `SAVE_*`, compiler, menu, scene, NPC and historic experiment records are **not** default context. They stay available for relevant investigations. Larger technical merges should only occur after reviewing field/function dependencies and inbound paths. This pass deliberately removed duplicate **live** truth first rather than hiding or deleting technical evidence.

Previous whole-document audit: `tools/ches/audits/2026-10-11/REVIEW.md`; new machine-readable file census: `document_inventory.tsv` in this same audit folder.
