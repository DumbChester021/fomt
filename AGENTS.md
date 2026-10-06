# FoMT Project Charter for Coding Agents

Read this file before changing the repository. It records the standing goals and working rules for this local project. For decompilation or matching work, also read `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`; that reusable skill owns the generic reverse-engineering workflow. Then read `START_HERE.md` for authoritative live state, `docs/DECOMP_PLAYBOOK.md` for the FoMT-specific process and proven lessons, `docs/DECOMP_PRIORITY_MAP.md` for leverage-first target selection, and `tools/ches/NEXT_AGENT_HANDOFF.md` for the exact next work. `tools/ches/SESSION_STATUS.md` keeps the current snapshot plus chronology. For Call238/compiler-sensitive work, `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md` and `FAILURES_AND_CLOSED_PATHS.md` are mandatory anti-rediscovery reading before any new experiment.

This is a private local coordination file. Do not include it in upstream or retail-decomp contribution commits unless the user explicitly requests that.

## The two-track mission

This work has two connected but strictly separated tracks.

1. **Retail-accurate decompilation (`ches-dev`)**
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

## Active scope — October 6, 2026

The active goal is now **non-save custom-game expansion enablement through retail
decompilation**. Preserve the byte-identical US retail ROM on `ches-dev`, but
prioritize the runtime/data boundaries that let the separate custom-game branch
add or extend NPCs, bachelorettes, items, tools, crops, dialogue/events,
inventory/shops, and their assets.

The legacy save loader `func_08011650` is **paused, not abandoned**. Its
behavior, experiments, failures, and exact continuation are preserved under
`tools/ches/checkpoints/save-loader-08011650-2026-10-04/`. Do not resume that
compiler-sensitive exact-match puzzle unless the user explicitly asks, or a
later expansion feature requires a missing persistence fact.

Use a throughput-first decomp strategy across **both code and assets**. Prefer
coherent clusters and high-leverage functions/data banks, recover
semantics/types/providers/formats first, and rotate away from compiler
archaeology once a function's remaining problem is source-spelling/allocation
exactness rather than missing game behavior. For assets, count progress only
when editable project-side source regenerates the retail bytes exactly; moving
an opaque `.incbin` into another binary file is not reconstruction.

The character/romance resolver pass and the first item/tool expansion lane are
now substantially recovered in the exact worktree. Article interaction, the
MoneyState core, typed shop catalogs, the packed animation provider, and all
**347 Tool/Food/Article item icons** are readable/editable boundaries. The normal
matching build regenerates the retail packed bank from PNG/JSON sources and still
reproduces the retail SHA1.

The active retail frontier is **code-coupled asset reconstruction**. Do not
promote anonymous graphics merely to raise the asset percentage. The packed bank
has **416 semantically owned animations: 405 / 450 simple and 11 / 43
multi-frame**, leaving **45 simple and 32 multi-frame animations unowned**.
Completed non-core families include Wrapped Present (352), Basket (53), the eight
cooking utensil assets, Money Bag (106), 18 overnight forage/map variants, Water
Splash (425 / 0x1A9), the six Fish Kings, five menu-special presentation icons,
and the Dog Ball visual family 21..48. Dog Ball alone contributes 28 animations /
53 frames, including 10 multi-frame animations.

Common packed-consumer lanes are now exhausted for the remaining multi-frame set:
direct `func_080A4A00`, `func_0805E824`, packed
`SpriteAnimator::SetAnimation`, `func_080CB304` / `func_080CC728` /
`func_080CBAF0`, `func_080CAC7C` / `func_080CAD18`, local packed-provider
screens, the script-driven OnCall-320 landing-resource path, and all 22 explicit
`gUnk_086678A0` provider-constructor sites. Continue by classifying coherent
unowned resource families and tracing them back to runtime/table owners.
Highest-priority clusters are exact-alias block 173..180, contiguous two-frame
block 413..420, shared-palette 54..57, and shared-frame pair 160/161. Keep
`func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and `func_08092940`
parked unless new structural evidence appears. Use `make progress` and
`docs/ASSET_DECOMPILATION.md` to track code, data/assets, overall linked-ROM
reconstruction, and PRET-style contiguous tail free space separately.

The separate custom-game worktree can then use these authoring paths for a first
new Tool/Food/Article plus unique icon. A unique new icon must extend the
saturated animation, frame, sprite-descriptor, graphics and palette pools. Do
not expand `ShippingBin::product_stats[NUM_PRODUCTS]` yet because product-count
growth changes persistent state layout. `func_080455D8` remains parked at a
five-byte instruction-order mismatch and is not an active compiler target.

Custom behavior still belongs only in the separate custom-game worktree.

## Respect for the original project and authors

- Treat the original authors' code, repository organization, toolchain, style, naming conventions, and review expectations as authoritative evidence. Match established local style instead of rewriting code to personal or AI preferences.
- Preserve copyright, licenses, attribution, commit history, and existing documentation. Do not imply that reconstructed code is the original source or claim the original authors' work as ours.
- AI assistance is a local implementation detail, not a reason to add branding, generated-by notices, promotional language, or unsolicited commentary to contribution files.
- Keep contribution commits narrow, technically justified, and easy for a human maintainer to audit. For retail reconstruction on `ches-dev`, the user gives standing authorization to save, commit, and push a coherent unit once BOTH gates are satisfied: (1) the reconstructed code/data boundary is 100% retail-exact at the target, and (2) the integrated/full-ROM build is 100% retail-exact with the expected SHA1. Before committing, update all relevant durable documentation in detail, review the exact contribution diff, run the normal verification gates, and keep private research/checkpoint files out of the contribution commit. Do not open pull requests, contact maintainers, publish private research, push incomplete/mismatching work, or push custom-game changes without separate authorization.
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
- Never place an unfinished candidate in `src/`; the build automatically compiles source files there. Keep experiments in the current private checkpoint directory or `/tmp`.
- Prefer meaningful semantic names backed by multiple pieces of evidence. Distinguish proven facts, strong inferences, and open hypotheses in notes.
- When a coherent exact function or data boundary is integrated, remove only its corresponding assembly/linker range and verify the complete ROM.

## Verification and commit discipline

- After meaningful integrated changes, run the exact project build/compare path and check the actual exit status and output. The "100% compiling retail" gate is not satisfied by a one-off local binary or unsaved toolchain mutation: a clean/fresh checkout must have a documented, saved, reproducible path to the same exact build using committed project/toolchain inputs or an already-established reproducible dependency.
- Verify the ROM is still 8,388,608 bytes with the expected SHA1, inspect progress, run `git diff --check`, and review the index and contribution diff explicitly.
- Commit only coherent, verified contribution files using explicit paths. Keep private handoffs, research, failed candidates, logs, and operator notes out of contribution commits. Once a retail unit has both an exact local/source proof and an exact integrated/full-ROM proof, treat documentation + save + explicit-path commit + push to the current `ches-dev` remote branch as the default completion step. This standing authorization applies only to fully retail-exact reconstruction work; anything still under investigation remains uncommitted/unpushed.
- Record findings, rejected hypotheses, exact mismatch counts, build logs, and next steps in the numbered checkpoint and update `tools/ches/SESSION_STATUS.md` before stopping or context compaction. When a retail unit reaches both exactness gates, also update every other project document whose current facts changed before the commit/push, so the pushed code and the local durable handoff cannot disagree.

## Documentation and anti-rediscovery discipline

- Durable notes are part of the engineering work. Record discoveries that would materially change a future agent's decisions: proven behavior, exact artifacts/results, important caller/callee relationships, rejected hypotheses, failed approaches worth not repeating, compiler/toolchain findings, safety constraints, and the exact next unresolved question.
- Before starting research, search the current handoff, relevant checkpoint/index, filenames, scripts, and saved result tables. Reuse existing evidence instead of rerunning or rediscovering it. For Call238, `EXPERIMENT_INDEX.md` is mandatory.
- Keep documentation concise and layered: current truth in the canonical handoff/status/index; detailed chronology and failed experiments in checkpoints; machine-readable experiment status in registries where available. Update existing canonical files instead of creating competing status documents.
- When a new result supersedes an older one, preserve useful history but mark the old state clearly as superseded/rejected so stale context cannot become the next task again.
- **Treat every run as if it may be the last run before the conversation hits its limit.** Do not postpone essential documentation until an end-of-turn cleanup. At every meaningful safe boundary, save current candidates/artifacts and update any canonical file whose answer changed, so an abrupt conversation end still leaves a zero-context agent with a complete continuation path.
- Save a verified coherent unit **before** stopping, switching conversations/models, context compaction, or starting a risky new direction. A fresh no-context agent should be able to recover the current state from files alone.
- Stable architecture is not the same thing as transient research. When a coherent subsystem/type/file format becomes materially understood, create or update a dedicated contribution-facing subsystem document under `docs/` when that knowledge will help humans or future decomp work. Existing examples are `docs/KEY_INPUT.md`, `docs/SAVE_FORMAT.md`, and `docs/CHARACTERS.md`.
- Dedicated subsystem docs should hold proven interfaces, layouts, invariants, boundaries, validation requirements, and explicitly unresolved semantics. Candidate versions, mismatch counts, failed compiler/source probes, and agent-only rationale stay in private handoffs/checkpoints.
- Do not turn upstream-facing source or subsystem docs into research notebooks. Private rationale, experiment logs, agent instructions, and extensive provenance belong in private docs/checkpoints; contribution code/comments should remain concise and native to the original project.

## Worktree and safety rules

- Inspect `git status` and recent history before editing. The working tree intentionally contains private modified/untracked files. Never reset, clean, stash, checkout over, or destroy them.
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
- `tools/ches/SESSION_STATUS.md` owns current snapshot plus historical chronology. The authoritative snapshot at its top supersedes older “current” paragraphs below.
- `docs/DECOMP_NOTES.md` owns cross-cutting function/subsystem semantics and matching lessons that do not yet merit a stable dedicated architecture page.
- Dedicated tracked subsystem docs such as `docs/KEY_INPUT.md`, `docs/SAVE_FORMAT.md`, and `docs/CHARACTERS.md` own stable human-facing architecture for their respective domains. Continue creating/updating this class of document when a recovered subsystem or shared type becomes durable enough to stand on its own.
- `docs/REPO_MAP.md` owns repository/module orientation and the index of important subsystem docs.
- `docs/FOMT_COMPILER_RESEARCH.md` owns compiler provenance, historical reconstruction, and current toolchain truth.
- `EXPERIMENT_INDEX.md` owns experiment/result lookup.
- `FAILURES_AND_CLOSED_PATHS.md` owns anti-rediscovery failures and reopened-path criteria.

Documentation is part of completion, not optional bookkeeping. For each exact function/batch record what was tried, exact measured results, why failed variants failed, what is proven, what remains inferred, what should not be repeated, reusable process lessons, integration/full-ROM proof, progress, commit/push evidence, and the exact next action.

A no-context agent must be able to answer from files alone: project goals, current state, exact ROM status, progress, compiler authority, latest commit, active targets, saved candidate state, failed paths, validation commands, commit rules, private files, and next step.

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

Standing batch-size rule: 5 completed retail functions per user-facing batch when feasible. Keep canonical docs current as exact functions land; only pause earlier for a genuine blocker or the mandatory Ches safety checkpoint.
