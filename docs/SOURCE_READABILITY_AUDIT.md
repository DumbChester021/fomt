# Source Readability Audit

Snapshot: October 10, 2026. Audit scope: reconstructed `src/*.cc` only, not the remaining retail assembly, generated code, assets, or public API documentation.

## What is verified and what is not

**Byte-identical ROM matching is a necessary correctness gate, not proof that a function is human-readable or semantically complete.** Current `make progress` code percentage counts recovered executable bytes; it does **not** measure understandability, descriptive naming, safety for modding, or independence from compiler register quirks.

Human-readable reconstruction means a maintainer can tell *what a function does, what its arguments and state mean, and how to change it safely* without constantly returning to the disassembly. The repository has examples that do this well, notably `src/fishing_records.cc`: `RecordFishingCatch`, `GetTotalFishCaught`, and typed fishing records explain gameplay effects. Other code is clearly structured but not yet understood at the same level.

The preceding GameState/menu units, `src/game_state_menu_dispatch.cc`, `src/game_state_menu_actions.cc`, and `src/game_state_menu_callbacks.cc`, are **structurally readable but only partially semantically named**. Their C++ exposes true state/target/child pointers, argument widths, callback tables, status changes and the known coop-incubation call. However, symbols like `func_08015970`, `action88`, generic target/child types and vtable padding still require further callsite/runtime evidence. Renaming an unknown callback to a pleasant-sounding gameplay name would risk misinformation.

The previously integrated `src/game_state_audio_callbacks.cc` adds a sound-player busy query grounded by other named callers, plus a still-unidentified child callback. The latter remains neutral despite being byte-exact. See `docs/GAME_STATE_AUDIO_CALLBACKS.md`.

There is also lower-level matching debt. For example, `src/mine_floor.cc` uses explicit ARM register bindings and inline assembly to reproduce compiler-specific behavior. Those functions need careful independent review before anyone treats them as straightforward portable or mod-friendly C++.

**Save-header readability milestone:** `src/save_slot_header.cc` adds seven named, naturally readable and byte-exact methods. In particular, `ClearSaveSlotValid` replaces 68 bytes of anonymous Thumb instructions with a proven valid-slot mask operation. The full 740-byte save loader and UI save/load paths are still assembly; see [SAVE_LIFECYCLE.md](SAVE_LIFECYCLE.md). Their readable research descriptions must not be counted as reconstructed executable source.

## Repeatable heuristic snapshot

Run: `python3 tools/ches/audit_source_readability.py` (or `--json`). Latest post-Farm-source-audit snapshot, October 11, 2026:

| Indicator | Occurrences | C++ files containing it |
| --- | ---: | ---: |
| Files and lines scanned | 147 files | 20,500 lines |
| Address-derived function definitions (conservative regex) | 143 | 20 |
| Address-derived symbol references | 1,503 | 104 |
| Unknown/padding array fields | 78 | 21 |
| Offset-named callback calls | 44 | 3 |
| Compiler-sensitive syntax indicators | 20 | 7 |

These **are not quality percentages**, and their counts overlap. A mere mention of an address-derived external symbol does not make the entire function unreadable. The definition regex intentionally does not attempt to parse C++, so it may miss some functions. Padded fields can be correct, honest ABI documentation rather than a bug. Manual semantic review is essential.

## Review rubric and integration gate

| Status | Evidence required | What to do |
| --- | --- | --- |
| **Semantic/maintainable** | Verified gameplay purpose, meaningful names/constants and typed state, understandable control flow and effects | Preserve exact build, expose safe APIs/data for modding |
| **Structural/partially understood** | Readable natural C++ with proven layout, arguments, side effects and return value, but unknown names/slot roles | Keep neutral identifiers, annotate unresolved behavior, inspect consumers and promote names only when justified |
| **Matching-constrained** | Correct bytes, but forced registers, inline assembly, obscure aliasing or codegen-sensitive expression forms limit readability | Track debt explicitly, keep exact code, attempt simplification only with fresh compiler/ABI evidence and a full ROM gate |
| **Still assembly/parked** | No verified production C++ replacement | Do not present as reconstructed or editable C++; preserve bounded scratch findings separately |

For each new C++ family: (1) confirm real type offsets, callers, side effects and ownership; (2) use natural control flow and descriptive *evidence-based* names; (3) explain uncertain slots and padded ABI fields, rather than inventing names; (4) reject forced register/opaque assembly tricks in production unless the matching ABI genuinely demands them and the exception is documented; (5) run individual function comparisons and the full forced `make -B -j4 compare`; (6) update this audit when a material readability boundary changes. The quality bar applies independently of recovered-byte progress.

## Concrete next improvements

- **GameState/menu:** infer semantic meanings of target/child vtable slots from callsites, event and scene state, then consolidate validated types into shared headers. The three current files use local independent structure definitions because the ABI is proven but the original class model is not.
- **Address-derived APIs:** review the 15 flagged source files with the top impacts first: GameState/menu, `src/entity_unk_08038740.cc`, and `src/scene_owners.cc`. Do not force speculative names merely to eliminate `func_0...` identifiers.
- **Register-pinned code:** revisit `src/mine_floor.cc` and other flagged low-level files only when compiler-fingerprint evidence supports a cleaner, exact implementation. Keep honest exceptions until then.
- **Mod-readiness:** distinguish reconstructed byte coverage from functions ready for safe gameplay edits. A separate human-verified semantic inventory may be added, but no fabricated percentage should be published before that manual review.

Source-level annotation and formatting improvements to the newest three GameState/menu units are a readability cleanup, **not additional decompilation coverage**. Those edits must preserve the ROM SHA1 exactly.
