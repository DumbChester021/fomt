# FoMT documentation audit | October 11, 2026

This is a **dated decision report**, not a default-read project document. File size, purpose, category, importance, proposed disposition and SHA256 are all in `document_inventory.tsv`; duplicate groups in `document_census.json`. The classification uses filenames, current headings and project roles; it does **not** assert a semantic line-by-line verification of every historical note.

## Scope

- **274 actual reference/Markdown documents** (6361 KiB). Generated compiler `*.mismatch.txt` output is deliberately excluded.
- **62 nonhistorical docs** (733 KiB). These are reference sources, not a mandatory reading list.
- **212 historical/archived docs** (5629 KiB), intentionally preserved and accessed by search on demand.
- **11 exact duplicate groups**; snapshots are not automatically disposable just because content matches.

## Recommended hierarchy

1. **Three default docs:** `AGENTS.md` = rules; `START_HERE.md` = latest project status; `tools/ches/NEXT_AGENT_HANDOFF.md` = one bounded next action. The decompilation skill still applies when required. No extra history or beginner guide is loaded routinely.
2. **One technical truth per active subsystem:** for save work, the small live `docs/SAVE_EVIDENCE_MATRIX.md` and source/layout evidence linked from it. Later consolidate the overlapping save-format, lifecycle, parent assignment and layout summaries into one current save reference.
3. **Append-only history:** `tools/ches/HISTORY.md` records dated changes and supersession; older checkpoint docs remain searchable and immutable.
4. **Guides are conditional:** `docs/DECOMP_PLAYBOOK.md` for workflow changes; compiler fingerprint/research only for compiler issues; beginner guide only for onboarding.
5. **Generated checks:** `make docs-check` (links + status); `make save-check` (adds exact ownership, boundaries and synthetic SRAM tests); `make save-verify` (adds forced full ROM compare). The daily path never enumerates all 274 documents.

## File-by-file classification: 62 nonhistorical documents

Each `Purpose` is a concise explanation of why the file exists. Importance means importance **when relevant**, not default reading priority. A proposed action is a review recommendation, **not an executed deletion**.

| File | KiB | Category | Importance | Purpose | Proposed action |
|---|---:|---|---|---|---|
| [`AGENTS.md`](../../../../AGENTS.md) | 25.8 | Contract | Critical | Project-wide safety, matching and agent obligations | Keep |
| [`assets/item_icons/README.md`](../../../../assets/item_icons/README.md) | 5.3 | Asset guide | Low | Item icon extraction and image assets | Keep targeted |
| [`docs/ASSET_DECOMPILATION.md`](../../../../docs/ASSET_DECOMPILATION.md) | 11.1 | Subsystem reference | Medium | Asset extraction and reconstruction | Keep targeted |
| [`docs/CHARACTERS.md`](../../../../docs/CHARACTERS.md) | 16.2 | Subsystem reference | Medium | NPC and character identity mapping | Keep targeted |
| [`docs/CUSTOM_CHARACTERS.md`](../../../../docs/CUSTOM_CHARACTERS.md) | 15.8 | Subsystem reference | Medium | Custom-game character feature notes | Keep targeted |
| [`docs/CUSTOM_GAME_EXPANSION.md`](../../../../docs/CUSTOM_GAME_EXPANSION.md) | 9.4 | Subsystem reference | Medium | Custom-game expansion architecture | Keep targeted |
| [`docs/DECOMP_NOTES.md`](../../../../docs/DECOMP_NOTES.md) | 133.9 | Research history | High | Large long-running reverse-engineering notes; lookup only | Archive |
| [`docs/DECOMP_PLAYBOOK.md`](../../../../docs/DECOMP_PLAYBOOK.md) | 50.2 | Operating instructions | High | Exactness gates, workflow, compiler research discipline | Condense |
| [`docs/DECOMP_PRIORITY_MAP.md`](../../../../docs/DECOMP_PRIORITY_MAP.md) | 29.7 | Planning/history mix | Medium | Historical throughput queues and current save priority | Split/archive |
| [`docs/ENTITY_08037008.md`](../../../../docs/ENTITY_08037008.md) | 7.6 | Subsystem reference | Medium | Unidentified entity address research | Keep targeted |
| [`docs/ENTITY_BALL.md`](../../../../docs/ENTITY_BALL.md) | 5.7 | Subsystem reference | Medium | Ball controller and entity recovery | Keep targeted |
| [`docs/ENTITY_EFFECTS.md`](../../../../docs/ENTITY_EFFECTS.md) | 5.6 | Subsystem reference | Medium | Effects entity constructors and lifecycle | Keep targeted |
| [`docs/FISHING_RECORDS.md`](../../../../docs/FISHING_RECORDS.md) | 4.0 | Subsystem reference | Medium | Fishing persistence and methods | Keep targeted |
| [`docs/FOMT_COMPILER_FINGERPRINT.md`](../../../../docs/FOMT_COMPILER_FINGERPRINT.md) | 8.3 | Compiler reference | High | Compact original compiler ABI/codegen fingerprint | Keep targeted |
| [`docs/FOMT_COMPILER_RESEARCH.md`](../../../../docs/FOMT_COMPILER_RESEARCH.md) | 73.4 | Compiler history | High | Compiler reconstruction hypotheses and evidence | Archive |
| [`docs/GAME_STATE_AUDIO_CALLBACKS.md`](../../../../docs/GAME_STATE_AUDIO_CALLBACKS.md) | 2.3 | Subsystem reference | Medium | Audio callback code evidence | Keep targeted |
| [`docs/GAME_STATE_MENU_ACTIONS.md`](../../../../docs/GAME_STATE_MENU_ACTIONS.md) | 2.8 | Subsystem reference | Medium | Menu action code evidence | Keep targeted |
| [`docs/GAME_STATE_MENU_CALLBACKS.md`](../../../../docs/GAME_STATE_MENU_CALLBACKS.md) | 2.9 | Subsystem reference | Medium | Menu callback code evidence | Keep targeted |
| [`docs/GAME_STATE_MENU_DISPATCH.md`](../../../../docs/GAME_STATE_MENU_DISPATCH.md) | 2.8 | Subsystem reference | Medium | Menu dispatch and implementation notes | Keep targeted |
| [`docs/GAME_STATE_SAVE_CLEANUP.md`](../../../../docs/GAME_STATE_SAVE_CLEANUP.md) | 6.1 | Save evidence | High | Exact GameState and nested cleanup function proofs | Archive detail |
| [`docs/GROUND_PICKUP_STATE.md`](../../../../docs/GROUND_PICKUP_STATE.md) | 2.7 | Subsystem reference | Medium | Discarded and pickup object state | Keep targeted |
| [`docs/HARDWARE_TRANSFER.md`](../../../../docs/HARDWARE_TRANSFER.md) | 3.1 | Subsystem reference | Medium | DMA and transfer code | Keep targeted |
| [`docs/HARDWARE.md`](../../../../docs/HARDWARE.md) | 3.8 | Subsystem reference | Medium | Hardware access and GBA I/O | Keep targeted |
| [`docs/INTRUSIVE_CALLBACK_LIST.md`](../../../../docs/INTRUSIVE_CALLBACK_LIST.md) | 3.8 | Subsystem reference | Medium | Callback-list ownership | Keep targeted |
| [`docs/KEY_INPUT.md`](../../../../docs/KEY_INPUT.md) | 3.1 | Subsystem reference | Medium | Button handling | Keep targeted |
| [`docs/LIVESTOCK_SHOP.md`](../../../../docs/LIVESTOCK_SHOP.md) | 8.2 | Subsystem reference | Medium | Livestock vendors and state | Keep targeted |
| [`docs/MAP_DATA.md`](../../../../docs/MAP_DATA.md) | 2.9 | Subsystem reference | Medium | Game map data and resource IDs | Keep targeted |
| [`docs/MENU_GLYPH_CACHE.md`](../../../../docs/MENU_GLYPH_CACHE.md) | 5.2 | Subsystem reference | Medium | Menu glyph cache behavior | Keep targeted |
| [`docs/MENU_TEXT.md`](../../../../docs/MENU_TEXT.md) | 5.8 | Subsystem reference | Medium | Text rendering and layout | Keep targeted |
| [`docs/MENU_TILEMAP.md`](../../../../docs/MENU_TILEMAP.md) | 7.7 | Subsystem reference | Medium | Menu tilemap behavior | Keep targeted |
| [`docs/MINE_FLOOR.md`](../../../../docs/MINE_FLOOR.md) | 9.8 | Subsystem reference | Medium | Mine floor state and tile layout | Keep targeted |
| [`docs/POLYMORPHIC_OWNERS.md`](../../../../docs/POLYMORPHIC_OWNERS.md) | 3.5 | Subsystem reference | Medium | Virtual owner and destructor relations | Keep targeted |
| [`docs/PROGRESS.md`](../../../../docs/PROGRESS.md) | 15.6 | Status/history mix | High | Old metrics and integration milestones, overlapping dashboard | Split/archive |
| [`docs/REPO_MAP.md`](../../../../docs/REPO_MAP.md) | 23.1 | Navigation | Medium | File locations, source islands and project structure | Generate/condense |
| [`docs/RESOURCE_HANDLES.md`](../../../../docs/RESOURCE_HANDLES.md) | 9.1 | Subsystem reference | Medium | Resource handle lifecycle | Keep targeted |
| [`docs/RESOURCE_OWNERS.md`](../../../../docs/RESOURCE_OWNERS.md) | 6.8 | Subsystem reference | Medium | Resource owner lifecycle | Keep targeted |
| [`docs/SAVE_BARN_STATE_COPY.md`](../../../../docs/SAVE_BARN_STATE_COPY.md) | 4.3 | Save evidence | High | Exact Barn assignment and rejected candidates | Archive detail |
| [`docs/SAVE_DECOMP_BEGINNERS_GUIDE.md`](../../../../docs/SAVE_DECOMP_BEGINNERS_GUIDE.md) | 6.3 | Learning guide | Low | Programming concepts for first-time contributors | Archive/optional |
| [`docs/SAVE_DOG_STATE_COPY.md`](../../../../docs/SAVE_DOG_STATE_COPY.md) | 4.7 | Save evidence | High | Exact Dog assignment and implicit Animal assignment ABI | Archive detail |
| [`docs/SAVE_EVIDENCE_MATRIX.md`](../../../../docs/SAVE_EVIDENCE_MATRIX.md) | 6.5 | Save reference | Critical | Live ASM/source ownership by save function and proof links | Merge into save index |
| [`docs/SAVE_FARM_STATE_COPY.md`](../../../../docs/SAVE_FARM_STATE_COPY.md) | 4.4 | Save evidence | High | Exact Farm copy and compiler loop structure | Archive detail |
| [`docs/SAVE_FARMER_STATE_COPY.md`](../../../../docs/SAVE_FARMER_STATE_COPY.md) | 4.7 | Save evidence | High | Exact Farmer assignment and memcpy ABI rationale | Archive detail |
| [`docs/SAVE_FORMAT.md`](../../../../docs/SAVE_FORMAT.md) | 12.5 | Save reference | High | Save slot header, storage and checksum format | Merge |
| [`docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md`](../../../../docs/SAVE_GAMESTATE_ASSIGNMENT_MAP.md) | 6.7 | Save reference | High | Parent GameState copy dependency offsets and states | Merge |
| [`docs/SAVE_LIFECYCLE.md`](../../../../docs/SAVE_LIFECYCLE.md) | 25.2 | Save reference/history mix | Critical | SRAM geometry and end-to-end load/save behavior | Condense |
| [`docs/SAVE_MENU_RETRY_TRACE.md`](../../../../docs/SAVE_MENU_RETRY_TRACE.md) | 8.6 | Save reference | High | Save/load menu and failed-read ownership transitions | Merge |
| [`docs/SAVE_PACKED_PROGRESS.md`](../../../../docs/SAVE_PACKED_PROGRESS.md) | 2.0 | Save evidence | High | Packed persistent flags and proof | Archive detail |
| [`docs/SAVE_RUCKSACK_COPY_RESEARCH.md`](../../../../docs/SAVE_RUCKSACK_COPY_RESEARCH.md) | 4.9 | Save evidence | High | 128-byte Rucksack copy failures and 64-byte cleanup correction | Archive detail |
| [`docs/SAVE_SERIALIZED_LAYOUT.md`](../../../../docs/SAVE_SERIALIZED_LAYOUT.md) | 7.2 | Save reference | High | Typed persisted GameState offsets and assertions | Merge |
| [`docs/SAVE_TRANSITION_STATE.md`](../../../../docs/SAVE_TRANSITION_STATE.md) | 3.7 | Save evidence | High | SavedTransitionState type and exact methods | Archive detail |
| [`docs/SAVED_BYTE_BUFFER.md`](../../../../docs/SAVED_BYTE_BUFFER.md) | 3.0 | Save evidence | High | SavedByteBuffer type and exact methods | Archive detail |
| [`docs/SCENES.md`](../../../../docs/SCENES.md) | 12.9 | Subsystem reference | Medium | Scene creation, ownership and flow | Keep targeted |
| [`docs/SOURCE_READABILITY_AUDIT.md`](../../../../docs/SOURCE_READABILITY_AUDIT.md) | 6.3 | Quality report | Medium | Counts of opaque symbols and source-quality debt | Generate |
| [`docs/SPRITE_ANIMATOR.md`](../../../../docs/SPRITE_ANIMATOR.md) | 9.4 | Subsystem reference | Medium | Sprite animation structures | Keep targeted |
| [`INSTALL.md`](../../../../INSTALL.md) | 2.3 | Setup guide | High | Compiler and ROM setup for an unfamiliar machine | Keep |
| [`README.md`](../../../../README.md) | 12.0 | Public overview | High | Project introduction, supported features and build orientation | Shorten |
| [`START_HERE.md`](../../../../START_HERE.md) | 6.2 | Live status | Critical | Current focus, validated metrics and first next step | Shorten |
| [`TODO.md`](../../../../TODO.md) | 10.1 | Planning | Medium | Tasks overlapping current dashboard and handoff | Merge |
| [`tools/ches/DECOMP_QUEUE.md`](../../../../tools/ches/DECOMP_QUEUE.md) | 16.6 | Planning/history mix | Medium | Backlog/heuristic ranking, historical queue and unresolved tasks | Generate/park |
| [`tools/ches/NEXT_AGENT_HANDOFF.md`](../../../../tools/ches/NEXT_AGENT_HANDOFF.md) | 3.9 | Live task | Critical | One-page current work, exact next task and blocked experiments | Shorten |
| [`tools/ches/NPC_ENTITY_CLASS_MAP.md`](../../../../tools/ches/NPC_ENTITY_CLASS_MAP.md) | 5.7 | Subsystem reference | Medium | NPC ownership/vtables and class relationships | Keep targeted |
| [`tools/ches/SESSION_STATUS.md`](../../../../tools/ches/SESSION_STATUS.md) | 9.7 | Status/history mix | Medium | Duplicated status and chronological evidence | Merge/archive |

## Histories and duplicate evidence

All 212 archived reference documents appear **individually** in `document_inventory.tsv` with exact size, SHA256, filename, category, title and disposition. They are deliberately not duplicated into an onboarding document. We must preserve chronology and proof provenance rather than delete old records.

- Identical-content group: `docs/RESOURCE_HANDLES.md`, `tools/ches/checkpoints/resource-subtrees-080D7094-2026-10-03/RESOURCE_HANDLES-candidate-v3.md`
- Identical-content group: `tools/ches/checkpoints/character-enablement-2026-10-04/before/README.md`, `tools/ches/checkpoints/npc-support-2026-10-04/before/README.md`
- Identical-content group: `tools/ches/checkpoints/character-enablement-2026-10-04/before/docs/CUSTOM_CHARACTERS.md`, `tools/ches/checkpoints/character-enablement-2026-10-04/before-custom/docs/CUSTOM_CHARACTERS.md`
- Identical-content group: `tools/ches/checkpoints/character-enablement-2026-10-04/before/docs/SAVE_FORMAT.md`, `tools/ches/checkpoints/character-enablement-2026-10-04/before-custom/docs/SAVE_FORMAT.md`, `tools/ches/checkpoints/npc-support-2026-10-04/before/docs/SAVE_FORMAT.md`
- Identical-content group: `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/custom/docs/CHARACTERS.md`, `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/retail/docs/CHARACTERS.md`
- Identical-content group: `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/custom/docs/PROGRESS.md`, `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/retail/docs/PROGRESS.md`
- Identical-content group: `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/custom/docs/SAVE_FORMAT.md`, `tools/ches/checkpoints/character-expansion-2026-10-03/docs-before/retail/docs/SAVE_FORMAT.md`
- Identical-content group: `tools/ches/checkpoints/livestock-offer-builder-2026-10-09/docs-before/docs/LIVESTOCK_SHOP.md`, `tools/ches/checkpoints/menu-tilemap-2026-10-09/docs-before/docs/LIVESTOCK_SHOP.md`
- Identical-content group: `tools/ches/checkpoints/livestock-offer-builder-2026-10-09/docs-before/tools/ches/SESSION_STATUS.md`, `tools/ches/checkpoints/menu-tilemap-2026-10-09/docs-before/tools/ches/SESSION_STATUS.md`
- Identical-content group: `tools/ches/checkpoints/npc-support-2026-10-04/before/docs/CHARACTERS.md`, `tools/ches/checkpoints/npc-support-2026-10-04/before-custom/docs/CHARACTERS.md`
- Identical-content group: `tools/ches/checkpoints/npc-support-2026-10-04/before/docs/CUSTOM_CHARACTERS.md`, `tools/ches/checkpoints/npc-support-2026-10-04/before-custom/docs/CUSTOM_CHARACTERS.md`

## Safe merge and relocation decisions

| Group | Proposed action | Safety condition |
|---|---|---|
| `TODO.md`, `DECOMP_QUEUE.md`, `PROGRESS.md`, `SESSION_STATUS.md` | Combine **live** tasks/metrics into the dashboard and handoff; preserve dated history | First audit every incoming link and keep redirects until all consumers update |
| `DECOMP_NOTES.md` (large), `DECOMP_PRIORITY_MAP.md` (history), `FOMT_COMPILER_RESEARCH.md` | Archive as lookup-only research, not default context | Preserve exact text, dates and experiment references; do not silently omit failed trials |
| `SAVE_FORMAT`, `SAVE_LIFECYCLE`, `SAVE_SERIALIZED_LAYOUT`, `SAVE_GAMESTATE_ASSIGNMENT_MAP`, `SAVE_EVIDENCE_MATRIX` | Later consolidate current truth into one `SAVE_SYSTEM` doc | Reconcile byte offsets, ownership, error paths and original sources **field by field** |
| Individual `SAVE_*_COPY`, `GAME_STATE_SAVE_CLEANUP` proofs | Keep as per-function evidence, not startup docs | Verify links by original address, link matching source and failed variants |
| `REPO_MAP`, `SOURCE_READABILITY_AUDIT`, copied progress figures | Prefer automation-generated output or short indexes | Source-generated outputs must be verified; do not duplicate stale counts |
| General subsystem references (scenes, characters, menus, sprites) | Keep targeted and query-only | Never blanket-delete; they contain useful code provenance when those subsystems resume |
| Identical historical checkpoint snapshots | Dedup only in a separate controlled migration | Preserve path lineage and proof hashes; backfill content-addressed pointers first |

## Completed in this audit

- Inventoried files and recorded sizes, categories, importance, purposes and proposed dispositions; historical Markdown remains untouched except the explicit priority banner correction.
- Archived the legacy general-work section of `START_HERE.md` **verbatim**, reducing live file size and eliminating a misleading `Active next direction`.
- Updated old published-checkpoint claims in `docs/PROGRESS.md` and `docs/SAVE_LIFECYCLE.md` and marked the October 5 save-loader pause as historically superseded.
- Created append-only `tools/ches/HISTORY.md` to track corrections without erasing experiment outcomes.
- Added `tools/ches/audit_docs.py`, `tools/ches/check_docs.py` and Make targets to automate routine consistency checks.

## Not yet done / do not infer

- **No bulk deletes or mass moves** of subsystem proofs, experiments or historical records. Current references must be mapped before any major relocation.
- No claim that all 211 historical documents were reviewed sentence by sentence. This is a complete *file inventory* plus targeted consistency review.
- Exact save reconstruction remains at **91,388 / 940,036 C++ bytes (9.7218%)**, not a percentage of save-system completion. No backed-up real SRAM/emulator test has passed.

## Conventions for future updates

- Stable names only for live docs; dated paths `tools/ches/checkpoints/<subsystem-or-function>-YYYY-MM-DD/` for immutable proofs.
- Name function records by original address + readable function name, inclusive start/exclusive end, source ownership (`EXACT`/`ASM`), byte match, and linked evidence.
- Append ISO-dated discoveries/errata to `tools/ches/HISTORY.md`, with old claim, new evidence, impact list, proof and commit; **never overwrite history**.
- Trigger an impact review when a field, ABI, function boundary or owner changes: current matrix, type assertions, callsites, linked source, related docs, failure ledger and tests.
- Use `make docs-check` for documentation edits; `make save-check` for save research status changes; and `make save-verify` only for program/build-input modifications.
