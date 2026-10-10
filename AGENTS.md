# FoMT Project Charter for Coding Agents

Read this file before changing the repository. It records the standing goals and working rules for this local project. For decompilation or matching work, also read `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`; that reusable skill owns the generic reverse-engineering workflow. Then read `START_HERE.md` for authoritative live state, `docs/DECOMP_PLAYBOOK.md` for the FoMT-specific process and proven lessons, `docs/DECOMP_PRIORITY_MAP.md` for leverage-first target selection, and `tools/ches/NEXT_AGENT_HANDOFF.md` for the exact next work. `tools/ches/SESSION_STATUS.md` keeps a concise current snapshot. Detailed chronology belongs in Git history and dated checkpoint/experiment files. For Call238/compiler-sensitive work, `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md` and `FAILURES_AND_CLOSED_PATHS.md` are mandatory anti-rediscovery reading before any new experiment.

This is a project coordination file carried on the public fork. Do not include agent/research coordination material in an upstream pull request unless the user explicitly requests that.

## Readability and exactness are separate gates

The `make progress` source-code percentage measures byte-exact retail reconstruction, **not** the percentage of semantically understood or mod-ready C++. Before promoting a new family, review whether its names and local types explain the proven behavior; document unknown vtable slots, ownership or state explicitly rather than inventing names. Treat register-pinned code as maintainability debt to be tracked separately from ROM correctness. The repeatable heuristic checker is `tools/ches/audit_source_readability.py` and the manual rubric is `docs/SOURCE_READABILITY_AUDIT.md`. Never advertise its warning counts as a semantic completion percentage.

## The two-track mission

This work has two connected but strictly separated tracks.

1. **Retail-accurate decompilation (`main`)**
   - Reconstruct the original US Harvest Moon: Friends of Mineral Town GBA program as readable, editable source while retaining a byte-identical ROM. The long-term target is 100% of meaningfully decompilable game logic in project-native source, primarily readable C++, with understood binary data recovered into typed source where practical. Low-level C/assembly should remain only where fidelity or the original runtime boundary genuinely requires it.
   - Do not merely translate enough code to compile. Understand the assembly, ABI, callers, callees, layouts, ownership, state changes, and gameplay purpose.
   - Decompile the coherent code and data encountered during an investigation instead of leaving understood dependencies needlessly generic. Keep the scope reviewable and verify every integrated boundary.
   - Replace address-based or generic names only when evidence supports a real game concept. If identity is uncertain, keep the neutral address-derived name and document the hypothesis instead of inventing certainty.

2. **Quality-of-life custom game (`custom-game` worktree/branch)**
   - Implement quality-of-life improvements and added-content systems, including future NPC/bachelorette, item, tool, crop, dialogue/event, inventory/shop, and asset expansion.
   - Base each change on the retail understanding gained during decompilation, including all callers and side effects. Prefer fixes or extension points at the correct decision point rather than late symptoms.
   - Keep gameplay changes completely separate from retail reconstruction. Never weaken retail exactness or slip custom behavior into a decompilation commit.
   - Preserve save compatibility and normal gameplay paths unless a change explicitly requires otherwise. Test interactions and failure cases, not only the happy path.

These tracks support each other: retail reconstruction explains the game well enough to make safe QoL changes, and QoL investigations identify systems worth understanding and decompiling. They must still use separate worktrees, commits, and verification standards.

## Active priority override — October 10, 2026

The user explicitly requested that **full retail save decompilation and human-readable understanding take priority over all other function families**, and that no custom-game feature development proceed until the save structure and lifecycle are understood. This supersedes the earlier throughput-first/park-the-save-loader guidance **for target selection**; exact-ROM builds, no compiler hacks, evidence-based naming and separate clean retail/custom branches remain mandatory. Prioritize all SRAM header/proxy functions, the 740-byte `func_08011650` default initializer/loader, caller scenes `func_08003F9C`, `func_080040A0`, `func_080041DC`, remaining saved `GameState` subobjects and save/copy/erase/retry paths. See `docs/SAVE_LIFECYCLE.md` and current `tools/ches/NEXT_AGENT_HANDOFF.md`. Recover matching source wherever possible; keep naturally readable nonmatching candidates in research, not in production `src/`, and mark unresolved semantics explicitly.

## Earlier active scope — October 6, 2026 (superseded by save-first override)

The active goal is now **throughput-first whole-game retail decompilation**, while
continuing to improve the runtime/data boundaries needed by the separate
custom-game branch. Preserve the byte-identical US retail ROM on `main`.
Custom behavior still belongs only in the separate custom-game worktree.

The project has already paid for substantial shared infrastructure: hardware,
DMA/transfer, intrusive lists, entity/effect lifecycle, resource handles,
SpriteAnimator/provider parsing, NPC/social support, GameObject entity
lookup/teardown, article interaction, MoneyState, typed shop catalogs, and
editable packed-sprite families. The priority is now to **cash in on those
shared types across the remaining assembly**, rather than optimizing one
resource family at a time.

### Throughput strategy

- Treat an inferred original translation unit or coherent structural/type
  cluster as the normal work unit. Do not target a fixed number of functions
  per batch.
- Build and maintain one machine-readable function inventory with address,
  size, callers/callees, data/global xrefs, vtable/class evidence, inferred TU,
  similarity cluster, current status, compiler-difficulty evidence, and later
  runtime coverage.
- Rank remaining TUs/clusters by expected recovered bytes, downstream unlock
  value, type readiness, subsystem coherence, and estimated difficulty.
  Re-rank after meaningful integrations.
- Use normalized-assembly similarity clustering aggressively. Solve one member
  of a repeated family carefully, then use it as a source/type oracle for its
  siblings.
- Recover vtables, constructors/destructors, globals, fixed-stride tables, and
  other shared ownership boundaries early when they unlock many callers.
- Keep exact matching as the production gate. A semantically reconstructed but
  nonmatching function may be preserved as research/understood work,
  but must not replace retail assembly in production `src/` unless an explicit
  supported NONMATCHING convention is deliberately adopted later.
- Park compiler-sensitive functions once their remaining delta is codegen or
  source-shape archaeology rather than missing behavior. Preserve the best
  candidate and cause, then move to higher-throughput work.

### Proven fast-path execution loop (Opus/Astra pattern)

Recent successful Opus/Astra sessions established a much higher-throughput
working style. Treat this as the default model-agnostic execution loop for
ordinary retail decompilation. Do not fall back to slow syntax-poking or broad
rediscovery unless evidence requires it.

1. **Trust the saved handoff first.** Read the canonical current state and the
   specific subsystem/failure records it names. Do not reread the whole repo or
   repeat closed experiments just to become comfortable.
2. **Choose one bounded coherent cluster.** Prefer an already-anchored
   subobject, translation-unit island, repeated family, or small accessor/helper
   group with known exact bounds and useful shared types.
3. **Reuse recovered structure immediately.** Start from proven types, offsets,
   callers, tables and old exact candidates. Do not rediscover semantics already
   established on disk.
4. **Try the obvious natural typed source first.** One credible candidate is
   more valuable than many speculative spellings. Compile/compare immediately.
5. **Classify a mismatch before editing source.** Check true body bounds,
   trailing alignment, literal pools, relocation/section seams and object layout
   before assuming codegen or behavior is wrong. A size delta with no differing
   byte positions is usually a boundary/alignment question, not a reason for
   syntax roulette.
6. **Exploit linker seams.** An exact island does not need to wait for a hard
   neighboring constructor/function. Split sections and preserve addresses when
   that is sufficient and reviewable.
7. **Prove the whole coherent block.** Once individual bodies match, compare the
   contiguous block including normal alignment/padding.
8. **Run the integration ladder without ceremony.** Isolated full-ROM proof,
   production full-ROM proof, ROM hash/size and neighbor symbols, inventory
   regeneration, then inspect that only intended ownership changed.
9. **Document once at the end of the batch.** Update only canonical docs whose
   answers changed, plus one subsystem page when architecture materially
   advanced. Do not pause a proven integration for repeated documentation passes.
10. **Publish and move on.** Under the standing exact-retail authorization,
    review the narrow diff, commit/push the coherent checkpoint, record the next
    bounded target, and continue. Timebox compiler/source-shape archaeology and
    park it when the remaining problem is codegen rather than understanding.

Operationally, prefer milestone updates over narrating every read/search. The
goal is the same pattern that made the fishing-record recovery fast: handoff ->
typed candidate -> exact body/block proof -> linker seam -> isolated ROM ->
production ROM -> inventory/docs -> commit/push -> next cluster.

### Runtime and asset role

Runtime work is now **bulk evidence collection**, not manual gameplay-driven
resource hunting. The durable opening-farm mGBA state at
`/mnt/data/Ches/runtime-saves/fomt/opening-farm.ss1` is retained as the first
scenario asset. Future emulator work should grow into deterministic savestate
plus scripted-input scenarios that record function coverage, indirect
caller/callee targets, and targeted RAM changes. Watchpoints remain useful for
specific ownership/field questions, but are not the primary discovery queue.

The packed sprite bank remains correctly reconstructed at its proven scope:
**416 / 493 animations are semantically owned: 405 / 450 simple and 11 / 43
multi-frame**, leaving **77** unowned. Those 77 are now a parked open list, not
the main decompilation frontier. Resolve them naturally as owning TUs,
tables, scenes, events, minigames, and other consumers are reconstructed.
Do not promote anonymous assets merely to raise coverage.

For data/assets, use a hybrid rule: bulk-catalog recognizable structure such
as pointer tables, fixed-stride arrays, palettes, tile banks, script tables,
and resource headers when cheap, then use recovered consumers to assign
semantics and ownership. Bytes count as reconstructed only when editable
project-side source regenerates the retail bytes exactly.

The legacy save loader `func_08011650`, `func_080455D8`,
`func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and
`func_08092940` remain parked at their documented compiler-sensitive
frontiers unless new structural evidence makes them high-value again.

Immediate strategy work is:
1. generate the complete remaining-function database from existing map/call
   graph evidence;
2. infer TU boundaries and global/data ownership;
3. cluster normalized assembly and identify repeated function families;
4. map vtables/classes/constructors/destructors;
5. score all remaining TUs/clusters and select the highest-leverage coherent
   units;
6. decompile those units while preserving exact production gates;
7. build scripted runtime coverage scenarios in parallel as a classification
   and indirect-call tool, not as the primary queue.

Use `make progress` to keep exact code, data/assets, overall meaningful-ROM,
and contiguous tail free-space metrics honest. Track semantic/understood
coverage separately when that machinery is implemented; do not mix it into the
exact matched-source percentage.

## Respect for the original project and authors

- Treat the original authors' code, repository organization, toolchain, style, naming conventions, and review expectations as authoritative evidence. Match established local style instead of rewriting code to personal or AI preferences.
- Preserve copyright, licenses, attribution, commit history, and existing documentation. Do not imply that reconstructed code is the original source or claim the original authors' work as ours.
- AI assistance is a local implementation detail, not a reason to add branding, generated-by notices, promotional language, or unsolicited commentary to contribution files.
- Keep retail reconstruction commits narrow, technically justified, and easy for a human maintainer to audit. On `main`, the user gives standing authorization to save, commit, and push a coherent unit once BOTH gates are satisfied: (1) the reconstructed code/data boundary is 100% retail-exact at the target, and (2) the integrated/full-ROM build is 100% retail-exact with the expected SHA1. Before committing, update all relevant durable documentation, review the exact diff, and run the normal verification gates. Do not open pull requests, contact upstream maintainers, push incomplete/mismatching production source, or push custom-game behavior onto `main` without separate authorization.
- Assume maintainers may not want AI-generated contributions. Respect that boundary through restraint, transparency when disclosure is required, careful verification, and faithful adherence to their workflow.

## Upstream-native contribution quality

- Write contribution code as if it belongs naturally in the original decomp project. Before introducing names, control flow, helpers, abstractions, comments, formatting, or file organization, inspect nearby exact source and analogous upstream code and follow those established patterns.
- Favor the original maintainers' conventions over generic modern C++ or assistant-generated preferences. Avoid unnecessary abstractions, verbose comments, speculative renaming, gratuitous refactors, stylistic churn, defensive code the project does not normally use, and other generated-looking noise.
- This is **style fidelity, not cargo-culting**. Do not preserve a bad reconstruction, incorrect type, misleading name, unsafe behavior, or lower code quality merely to imitate appearances. Retail evidence, correctness, clarity, maintainability, and the project's own established standards still win.
- Prefer the smallest credible implementation that a maintainer could review from assembly/data evidence. Names and abstractions should earn their place from evidence and existing project vocabulary.
- Optimize future contribution readiness: narrow diffs, native-looking code, no AI branding, no unrelated cleanup, reproducible verification, and a commit that can be understood without private agent context.

## Retail reconstruction rules

- Retail byte accuracy is required. Compiling, linking, semantic equivalence, or matching size alone is insufficient.
- Establish behavior from retail assembly and data first. Check callers, callees, ABI, signedness, layouts, ownership, and side effects before naming or implementation.
- Use the smallest credible source reconstruction. Investigate natural expression shape, lifetime, control flow, and types before considering compiler-sensitive tricks.
- Do not use padding, arbitrary volatile operations, inline assembly, fixed-register locals, or compiler modifications to force a match.
- Never place an unfinished candidate in `src/`; the build automatically compiles source files there. Keep experiments in the current research checkpoint directory or `/tmp`.
- Prefer meaningful semantic names backed by multiple pieces of evidence. Distinguish proven facts, strong inferences, and open hypotheses in notes.
- When a coherent exact function or data boundary is integrated, remove only its corresponding assembly/linker range and verify the complete ROM.

## Verification and commit discipline

- After meaningful integrated changes, run the exact project build/compare path and check the actual exit status and output. The "100% compiling retail" gate is not satisfied by a one-off local binary or unsaved toolchain mutation: a clean/fresh checkout must have a documented, saved, reproducible path to the same exact build using committed project/toolchain inputs or an already-established reproducible dependency.
- Verify the ROM is still 8,388,608 bytes with the expected SHA1, inspect progress, run `git diff --check`, and review the index and contribution diff explicitly.
- Retail production source on `main` remains exact-only: promote only coherent source/data boundaries after both exactness gates pass. Behavior-complete but nonmatching candidates stay under `tools/ches/checkpoints/` instead of replacing assembly.
- **Checkpoint publication rule:** every durable project checkpoint is committed and pushed to `ches/main` after canonical docs/artifacts are updated and the checkpoint diff is verified. The former `Live-temp` branch is retired. Do not leave a completed checkpoint only local unless push is genuinely blocked, in which case record the failure and exact local HEAD in the handoff.

## Documentation and anti-rediscovery discipline

- Durable notes are part of the engineering work. Record discoveries that would materially change a future agent's decisions: proven behavior, exact artifacts/results, important caller/callee relationships, rejected hypotheses, failed approaches worth not repeating, compiler/toolchain findings, safety constraints, and the exact next unresolved question.
- Before starting research, search the current handoff, relevant checkpoint/index, filenames, scripts, and saved result tables. Reuse existing evidence instead of rerunning or rediscovering it. For Call238, `EXPERIMENT_INDEX.md` is mandatory.
- Keep documentation concise and layered: current truth in the canonical handoff/status/index; detailed chronology and failed experiments in checkpoints; machine-readable experiment status in registries where available. Update existing canonical files instead of creating competing status documents.
- When a new result supersedes an older one, preserve useful history but mark the old state clearly as superseded/rejected so stale context cannot become the next task again.
- **Treat every run as if it may be the last run before the conversation hits its limit.** Do not postpone essential documentation until an end-of-turn cleanup. At every meaningful safe boundary, save current candidates/artifacts and update any canonical file whose answer changed, so an abrupt conversation end still leaves a zero-context agent with a complete continuation path.
- Save a verified coherent unit **before** stopping, switching conversations/models, context compaction, or starting a risky new direction. A fresh no-context agent should be able to recover the current state from files alone.
- Stable architecture is not the same thing as transient research. When a coherent subsystem/type/file format becomes materially understood, create or update a dedicated contribution-facing subsystem document under `docs/` when that knowledge will help humans or future decomp work. Existing examples are `docs/KEY_INPUT.md`, `docs/SAVE_FORMAT.md`, and `docs/CHARACTERS.md`.
- Dedicated subsystem docs should hold proven interfaces, layouts, invariants, boundaries, validation requirements, and explicitly unresolved semantics. Candidate versions, mismatch counts, failed compiler/source probes, and agent-oriented rationale stay in research handoffs/checkpoints.
- Do not turn upstream-facing source or subsystem docs into research notebooks. Research rationale, experiment logs, agent instructions, and extensive provenance belong in coordination docs/checkpoints; contribution code/comments should remain concise and native to the original project.

## Worktree and safety rules

- Inspect `git status` and recent history before editing. Preserve any intentional local modified/untracked files that appear. Never reset, clean, stash, checkout over, or destroy them merely to obtain a clean tree.
- Preserve `README.md`, `AGENTS.md`, `START_HERE.md`, `docs/DECOMP_PLAYBOOK.md`, `docs/DECOMP_PRIORITY_MAP.md`, `docs/DECOMP_NOTES.md`, `docs/FOMT_COMPILER_RESEARCH.md`, `docs/REPO_MAP.md`, `tools/ches/`, and any character-date experiments unless the user explicitly changes their status.
- Keep the retail repo and custom-game worktree separate. Recheck the active branch/worktree before every commit or behavioral change.
- When staging explicit paths through `shell_exec`, keep `git add -- path1 path2 ...` on one shell command line or use valid shell continuations. A bare newline after `git add --` executes following path lines as commands. If a staging wrapper fails, inspect the index and working-file hashes before retrying; never assume what was staged or mutated.
- Use local repository evidence, Mary analysis, the matching compiler source, and saved checkpoints before searching elsewhere. Do not debug unrelated Codex/bridge/browser infrastructure.
- Work directly unless current instructions explicitly authorize subagents.

## Known gameplay safety constraint

`func_0802F0EC` clears the held rucksack item before the GameObject callback at `+0x158` reaches the discarded-item handler. Rejecting an action only inside that callback can lose the item. Any custom restriction must reject earlier around `ClassifyHeldItemAction` while preserving gifts, Goddess offerings, shipping, material placement, Ball behavior, and other established paths.

## Documentation ownership and zero-context continuity

The documentation is deliberately layered. Do not make a fresh agent infer current truth from chronology.

- `START_HERE.md` owns the live dashboard: current branch/HEAD/hash/progress, latest completed batch, authoritative compiler path, and broad next direction.
- `docs/DECOMP_PLAYBOOK.md` owns the durable process: definition of done, exact validation ladder, do/don't rules, proven source-shape lessons, integration discipline, documentation duties, and commit/push rules.
- `docs/DECOMP_PRIORITY_MAP.md` owns leverage-first roadmap decisions, fan-out evidence, architectural target tiers, and why a non-adjacent target may supersede the nearest address.
- `tools/ches/NEXT_AGENT_HANDOFF.md` owns the exact next task: current candidates, exact mismatch counts, next hypothesis, and ordered execution sequence.
- `tools/ches/SESSION_STATUS.md` owns a concise current snapshot and verification state. Do not append session chronology to it; use Git history and dated checkpoints.
- `docs/DECOMP_NOTES.md` owns cross-cutting function/subsystem semantics and matching lessons that do not yet merit a stable dedicated architecture page.
- Dedicated tracked subsystem docs such as `docs/KEY_INPUT.md`, `docs/SAVE_FORMAT.md`, and `docs/CHARACTERS.md` own stable human-facing architecture for their respective domains. Continue creating/updating this class of document when a recovered subsystem or shared type becomes durable enough to stand on its own.
- `docs/REPO_MAP.md` owns repository/module orientation and the index of important subsystem docs.
- `docs/FOMT_COMPILER_RESEARCH.md` owns compiler provenance, historical reconstruction, and current toolchain truth.
- `EXPERIMENT_INDEX.md` owns experiment/result lookup.
- `FAILURES_AND_CLOSED_PATHS.md` owns anti-rediscovery failures and reopened-path criteria.

Documentation is part of completion, not optional bookkeeping. Keep canonical current-state files concise: record proven architecture, current exact measurements, integration/full-ROM proof, parked/reopen criteria, and the exact next action. Put detailed variant chronology, failed experiments, allocator/compiler traces, and superseded measurements in dated checkpoints, experiment registries, failure ledgers, and Git history instead of appending them to live dashboards.

A no-context agent must be able to answer from files alone: project goals, current state, exact ROM status, progress, compiler authority, latest commit, active targets, saved candidate state, failed paths, validation commands, commit rules, local-only files if any, and next step.

## Start every continuation here

1. Inspect `git status`, recent log, and the active retail/custom worktree.
2. Read `START_HERE.md`.
3. Read `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`.
4. Read `docs/DECOMP_PLAYBOOK.md`.
5. Read `docs/DECOMP_PRIORITY_MAP.md`.
6. Read `tools/ches/NEXT_AGENT_HANDOFF.md`.
7. Read the authoritative snapshot at the top of `tools/ches/SESSION_STATUS.md`.
8. If the task touches compiler-sensitive Call238 work, read/search `docs/FOMT_COMPILER_RESEARCH.md`, `EXPERIMENT_INDEX.md`, and `FAILURES_AND_CLOSED_PATHS.md` before creating or rerunning any experiment.
9. Read older checkpoints only for details not already indexed.
10. Inspect the relevant source, assembly, headers, callers, callees, vtables, and saved candidate artifacts before editing.

The live dashboard/current snapshot and newest evidence supersede older chronological handoff history.

Standing work-unit rule: use the ranked TU/type/similarity-cluster queue rather than a fixed function count. At every mandatory Ches safety checkpoint or other durable checkpoint, update canonical state, verify the checkpoint diff, commit it on `main`, and push to `ches/main` before ending the turn.
