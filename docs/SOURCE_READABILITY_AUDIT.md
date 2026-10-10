# Source Readability Audit

**Reviewed October 11, 2026.** Scope is the current production `src/*.cc` **and** `src/*.c` (including `src/rt` when present). This is a human-guided triage of recovered source, **not** a claim that all C/C++ has been semantically verified. Code remaining in `asm/` is not decompiled or editable C++.

## What exactness establishes

A passing complete-ROM hash proves the current source/assembly/build mix reproduces the original ROM. It does **not** prove descriptive names, understood ownership, portability, maintainable source, safely editable gameplay, or actual player-save loading. The official byte-reconstruction percentage is **not a readability score**; find its current value in [START_HERE.md](../START_HERE.md).

We preserve original ABI entrypoints and honest unknown field names rather than invent names to make the scanner look better. The `ALIAS` macro, address references, linker sections and `asm("func_...")` symbol-binding declarations are **not themselves** evidence of unreadable or forced-code C++. Actual inline ARM instructions and pinned registers deserve separate attention.

## Reproducible audit and protection

| Command | Purpose | Needs retail ROM? |
| --- | --- | --- |
| `make readability-report` | Current source inventory with file/line evidence of register and inline-assembly debt | No |
| `python3 tools/ches/audit_source_readability.py --json --details` | Machine-readable locations for **all** detected indicators | No |
| `make readability-check` | Fast lexer self-test and regression gate against new pinned-register/inline-ASM constructs | No |
| `make`, `make compare`, `make fomt.gba`, `make fomt.elf` | Automatically execute the fast readability guard, with order-only dependencies so a check does **not** force a relink; ROM builds still require original inputs | Yes (for fresh ROM builds) |
| `make ci` | Includes readability gate, save evidence, documentation and source-only tests | No |
| `make test` | All above plus **forced complete ROM rebuild** and original SHA1 compare | Yes |

The audit masks comments and quoted strings before scanning and distinguishes C/C++ assembler **symbol labels** from real inline ASM. The reviewed existing hotspots are recorded in [readability_exceptions.json](../tools/ches/readability_exceptions.json) as **per-file category count ceilings**, not exceptions authorizing future coercion. Reductions pass. Any increase makes `make readability-check` fail until reviewed and deliberately baseline-updated. This check is **not a compiler or semantic proof**, and count ceilings cannot detect a one-for-one replacement at the same file; exact-ROM validation and human review remain mandatory.

### October 11 measured inventory

The revised scanner finds **157** compiled C/C++ files totaling **22,469** lines (155 `.cc`, 2 `.c`; line counts include source-only explanatory comments). This broadens the October 10 C++-only audit, whose old indicators and counts are **not directly comparable** because the lexical classifier also changed.

| Indicator | Occurrences | Files | Interpretation |
| --- | ---: | ---: | --- |
| Address-named function definitions | 254 | 39 | Conservative syntactic candidates, not all necessarily anonymous behavior |
| Address/symbol references | 1,435 | 107 | Includes legitimate compatibility calls |
| Legacy `ALIAS` spellings | 79 | 29 | Original entrypoint preservation; usually acceptable |
| External ASM symbol bindings | 60 | 6 | Usually typed linkage, **not** machine-code injection |
| Unknown/padding array fields | 78 | 21 | ABI layout may be proven even if semantics are not |
| Offset-named callback calls | 44 | 3 | Missing gameplay names, structural ABI evidence |
| Hard-register bindings | 53 | 7 | High-risk compiler forcing, manual remediation candidates |
| Executable inline-ASM sites | 40 | 21 | Includes legitimate hardware paths and compiler barriers |
| `volatile` tokens | 47 | 8 | Hardware/MMIO versus codegen forcing must be reviewed individually |
| `reinterpret_cast` | 252 | 35 | Requires justification for aliasing/layout; not automatically bad |

The high-risk baseline records existing sites in **22 distinct files**. Raw category totals overlap; no percentages or source-level quality pass rate can be derived from them.

## Manual sample audit: conclusions and actionable issues

This review inspected source bodies, not just file names. Status describes the inspected routines/areas, not an unexamined entire file.

| Source/area | Status | Evidence and remaining work |
| --- | --- | --- |
| `fishing_records.cc` | **Semantic / readable** | Named catch counters, record queries, totals, species-range loops; sentinel/index assumptions should remain explicit |
| `save_byte_buffer.cc` | **Structural / mostly readable** | Count, payload, address and append are typed; location meaning is unresolved; full-width append parameter and an unusual pointer check reflect original codegen |
| `barn_state_copy.cc` | **Structural / mostly readable** | Exact per-field packed state and all 16 entity slots, but `unk_` state and name fields must not be speculatively renamed; raw entity-record copying matches **this** retail function |
| `game_state_shipping_revenue.cc` | **Structural / readable** | Shipping-to-money effect and extra-payout flag behavior established; the flag's event writer is unconfirmed |
| `game_state_packed_readers.cc`, `game_state_packed_progress.cc` | **Structural / readable** | Widths, shifts and truncation proven; packed gameplay labels not proven, and five-bit storage after max-99 input is intentional original behavior |
| `game_state_menu_dispatch.cc`, `game_state_menu_actions.cc`, `game_state_menu_callbacks.cc` | **Structural / unresolved meaning** | Typed proxy/target/child forwarding matches retail; 44 offset-named callback calls still require caller/vtable/scene evidence before descriptive naming |
| `scene_owners.cc` | **Structural / ABI-sensitive** | Old aggregate-return and moving-pointer ownership shapes are explained; dozens of `asm("func_...")` are external label bindings, **not inline ARM instructions**; class-level ownership still merits review |
| `entity_unk_08038740.cc` | **Structural / priority for discovery** | Large address-named owner, 31 address-defined functions, many unknown fields and casts; review hierarchy, related scenes and vtable users before naming |
| `save_format.cc` | **Semantic operation-level / matching-constrained** | Three physical SRAM writes and distinct error masks are clear, but 4 hard-register bindings and a barrier are compiler-specific; **do not replace with a naïve copy or reorder writes** |
| `mine_floor.cc` | **Matching-constrained / high priority** | 25 pinned-register sites, 9 inline-ASM sites, plus coercive `volatile`; persistent layout and initializer are genuinely typed, but the old floor-generation routine is not normal portable C++ |
| `character_info.cc`, `farmer_entity_item_action.cc`, `code_actor_0809BFE8.cc` | **Matching-constrained / targeted review** | Compiler register lifetime shaping remains; inspect the known compiler fingerprint and old failed naturalizations before any cleanup |
| `code_080A46AC.cc` | **Matching-constrained** | `volatile u8 zero` is a known codegen/source-shape dependency, **not MMIO**; natural forms previously diverged |
| `m4a.c`, `pure_virtual.c` | **Runtime support, not a recovered-gameplay grade** | Included so the scanner covers production C; do not interpret vendor audio/runtime implementation as a new FoMT decomp milestone |

**Concrete source documentation changes in this audit:** documented the save writer's unavoidable codegen constraints and non-atomic writes in `src/save_format.cc`, made mine floor's architecture-specific matching debt explicit in `src/mine_floor.cc`, explained external symbol linkage in `src/scene_owners.cc`, and fixed a comment indentation in `src/save_byte_buffer.cc`. These are readability-only changes, contributing **zero** newly recovered ROM bytes.

## Queue for future cleanup

1. **Prove a cleaner compiler/source mechanism before removing existing coercion.** Highest debt: mine-floor generator, character/NPC resolver and farmer item actions, then the save writer. Use [FOMT_COMPILER_FINGERPRINT.md](FOMT_COMPILER_FINGERPRINT.md) for prior exact/nonexact naturalizations. The matcher must remain exact after any refactor.
2. **Group related unknown APIs by owner/vtable before renaming.** GameState menu adapters and entity owner routines are structurally readable but need semantics; do not make up action names.
3. **Review modified functions, not just scanner totals.** Record the status, observed behavior, type/ABI proof, unresolved labels, constraints, and next decisive investigation in the relevant subsystem document.
4. **Never conflate manual readability work with newly decompiled bytes.** Semantic quality and full-ROM matching are independent gates. A real backed-up save-game emulator round-trip is also still missing.

The stable fast matching/research workflow and newly learned codegen lessons are kept in [DECOMP_PLAYBOOK.md](DECOMP_PLAYBOOK.md). Append genuine chronological corrections to `tools/ches/HISTORY.md`; keep [START_HERE.md](../START_HERE.md) the single live progress/onboarding page.
