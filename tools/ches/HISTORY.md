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
