# FoMT research history, append-only corrections and discoveries

This is an **append-only dated chronology**, not a live checklist, not a source of current priorities and not an invitation to load every old note. Existing checkpoint documents, compiler proofs and Git commits are preserved separately. When a historical claim is wrong, append a dated correction with a reference to the old claim; don't silently erase it. When information becomes current, update START_HERE, NEXT_AGENT_HANDOFF, the relevant subsystem matrix and tests.

## 2026-10-11 — Retrospective baseline from exact retail evidence

- **Source match:** `CopySavedBarnState` 296 bytes and `CopySavedFarmerState` 448 bytes were integrated as C++ with zero linked byte differences. Forced isolated and production ROM hashes passed. Published as part of commit `ac239ba`.
- **Correction:** The interval `0x080D6A80..0x080D6B40` is **not one 192-byte Rucksack copy**. It is a **128-byte still-ASM copy** at `080D6A80..080D6B00` plus an already-source-owned **64-byte cleanup** at `080D6B00..080D6B40`. This must not count as additional recovered source bytes. See `docs/SAVE_RUCKSACK_COPY_RESEARCH.md`.
- **Readability-only improvement:** The existing Rucksack nested cleanup was rewritten from raw offsets to typed `RucksackItem` and `ToolStack` loops; full ROM remained exact. This was **not** new assembly coverage.
- **Closed compiler hypothesis:** Changing Coop copy to a C++ assignment operator still yields 292 bytes with 35 differing bytes, identical to the free-function candidate. Published research note `ec6d61b`; no production Coop replacement.
- **Documentation governance:** Current save-first priority supersedes earlier October 5 loader “PAUSED” status and general-throughput “Active next direction”. The historic text is preserved in dated checkpoints, and current status is held only in live dashboard/handoff/matrix. Never use the archived status as a current instruction.
- **Inventory:** The first documentation audit identified 271 Markdown/reference docs (62 nonarchive and 209 historical, about 6.5 MB). 11 exact duplicate groups were detected but not deleted, since checkpoint identity and provenance can matter.
- **Verification:** Original retail ROM SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Synthetic SRAM inspector tests passed; **no backed-up real player SRAM was tested**.

Future entries go **at the bottom** in chronological order. Never rewrite earlier outcomes except to mark an external factual typo with a linked dated amendment.

## 2026-10-11 — One-page onboarding and root-document consolidation

- **Supersession:** The earlier instructions to preload README/AGENTS/START_HERE/TODO/playbook/priority map/session status/handoff no longer represent the workflow. START_HERE is the **sole current onboarding and work queue**; AGENTS is permanent policy only, README is public project description, INSTALL is setup only, all other technical evidence is opened on demand.
- **Preservation:** The complete original byte content of AGENTS.md, README.md, START_HERE.md, TODO.md, NEXT_AGENT_HANDOFF.md, SESSION_STATUS.md, PROGRESS.md, DECOMP_PRIORITY_MAP.md, REPO_MAP.md and DECOMP_QUEUE.md was stored in the dated onboarding-consolidation checkpoint. MANIFEST.json preserves byte counts and SHA256 checksums. These snapshots are historical, not active instructions.
- **Redundancy removed:** Root TODO.md was retired (archived first); live NEXT_AGENT_HANDOFF, SESSION_STATUS, PROGRESS, DECOMP_PRIORITY_MAP, REPO_MAP and DECOMP_QUEUE are compatibility redirects rather than competing status/priority documents. Live status and next function remain only in START_HERE.
- **Scoped safety:** Previous specific discarded-item/GameObject callback warning is retained in the original archived charter and its earlier research evidence, docs/DECOMP_NOTES.md (func_0802F0EC). It is **not** a global rule to load while working on save-state C++.
- **Automation:** docs-check now verifies all archived original SHA256 values, short document sizes, the four required onboarding questions, absence of a duplicate root TODO, relative links and append-only HISTORY. save-check still validates original function bounds, exact ASM/source ownership and synthetic SRAM tests; code-build gates remain separate.
- **What did not change:** No retail C++, assembly, linker placement, compiler, ROM or custom-game files changed. Current whole-game byte-exact code remains 91,388/940,036 (9.7218%). The original save loader, Rucksack copy, Coop and MoneyState are not complete.
