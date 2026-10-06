# FoMT Retail Decompilation Playbook

This is a private local engineering document for zero-context continuation. It is not an upstream contribution file.

## Purpose

This playbook records the durable process, proven rules, anti-patterns, toolchain facts, validation ladder, target-selection strategy, documentation duties, and commit/push discipline for the Harvest Moon: Friends of Mineral Town retail decompilation.

The project has two goals that support each other but must remain separate:

1. Retail decompilation on `ches-dev`: recover the original US GBA game into readable source while preserving a byte-identical retail ROM.
2. Custom-game/QoL/custom-character work in the separate custom-game worktree: make intentional gameplay improvements and added content after the relevant retail behavior is understood.

Never mix custom behavior into a retail-matching contribution.

Current priority is **throughput-first whole-game retail decompilation**.
Custom-game readiness remains an important payoff, but target selection is now
driven by total useful reconstruction: coherent translation units/type clusters,
repeated-function families, shared class/data ownership, and recoverable bytes
per unit effort. Save-loader exact matching remains paused. Custom behavior still
stays on the separate custom-game worktree.

## Authority and read order

For a fresh agent with no conversation context, read in this order:

1. `AGENTS.md`: standing project contract and safety rules.
2. `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`: reusable reverse-engineering workflow.
3. `START_HERE.md`: authoritative live dashboard.
4. `docs/DECOMP_PLAYBOOK.md`: this durable process manual.
5. `tools/ches/NEXT_AGENT_HANDOFF.md`: exact next task and preserved candidate state.
6. `tools/ches/SESSION_STATUS.md`: current snapshot plus chronology.
7. Relevant subsystem docs, experiment index, and failure ledger.

For compiler-sensitive work, especially when a current target depends on previously reconstructed compatibility behavior, also read:
- `docs/FOMT_COMPILER_RESEARCH.md`
- `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`
- `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`

The top/current snapshot of a canonical file is authoritative. Older chronological entries are evidence/history, not the current next action.

## Definition of done for one retail function or coherent unit

A function is not done because it compiles, has the right size, or looks semantically equivalent.

A retail unit is complete only when all of these are true:

1. The exact retail range is bounded.
2. Behavior, ABI, callers/callees, signedness, field offsets, side effects, and likely ownership are understood well enough to write credible source.
3. The source matches the exact linked retail bytes for that range.
4. The integration removes only the corresponding assembly/linker range.
5. The isolated full-ROM integration passes the project compare/hash.
6. The production tree passes the normal plain build/compare path.
7. ROM SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
8. Progress and symbol boundaries are verified.
9. Relevant docs, success evidence, failures, and reusable lessons are updated.
10. Contribution-only diff is reviewed and clean.
11. Under the standing user authorization, exact retail work is committed and pushed to `ches-dev`.

If any of these gates fail, the unit is still research, not completed work.

## Research-first feature pivots

When the user requests research/docs first, map current source, assembly, data,
consumers, persistence and ownership before choosing a support batch. Distinguish
proven retail facts, proposed mod design, and open questions; documentation work
is not a completed matching-function batch or authorization to publish a mod.
Recheck inherited research against current evidence, identify receiver types for
virtual slots, and keep logical IDs separate from runtime/resource namespaces.

Update the dashboard, priority map, current handoff/status and stable subsystem
pages together. Mark the previous continuation deferred and preserve its evidence.
For custom characters, use `docs/CHARACTERS.md`, `docs/CUSTOM_CHARACTERS.md` and
`docs/SAVE_FORMAT.md`. Track a full gameplay/persistence path for the first
prototype, then apply the ordinary exact-ROM gates to every retail recovery.
Docs-only checkpoints verify changed paths, links and preservation of code/build inputs; rerun full builds when actual build inputs change. Every durable checkpoint on `Live-temp`, including docs/research checkpoints, is then committed and pushed to `ches/Live-temp` after diff verification. This checkpoint history is separate from exact retail contribution commits to `ches-dev`.

## Standard decompilation workflow

### 1. Orient before editing

Start with:
- `git status`
- recent `git log`
- `make progress`
- live dashboard/handoff
- experiment index and failure ledger
- relevant source, assembly, headers, vtables, data tables, callers, and callees

Search existing candidates and artifacts before writing a new one.

Do not rediscover an experiment that is already documented.

### 2. Bound the exact retail range

Identify:
- function start/end addresses
- following symbol or local-label boundary
- literal pool/padding
- section/linker seam
- any raw-byte function without a named symbol

Record the expected byte size before candidate work.

### 3. Recover semantics before syntax

Establish:
- parameter origin and calling convention
- return value
- hidden C++ ABI parameters
- signed/unsigned widths
- class/struct field offsets
- vtable slot meaning where possible
- loop bounds
- state-machine cases
- ownership/lifetime
- side effects and dirty flags
- global/table layout
- caller assumptions

Prefer existing project types and helpers over duplicate private structs.

### 4. Write the smallest credible natural source

Use upstream/project-native style.

Good first candidates:
- existing types
- ordinary control flow
- natural C++ member functions where ABI evidence supports them
- existing helper methods and data structures
- conservative names when semantics are uncertain

Keep unfinished candidates under `tools/ches/checkpoints/.../` or another scratch location. Do not place speculative code in `src/`, because production automatically builds it.

### 5. Compare the exact target

Use `tools/ches/compare-function.py` with the authoritative compatibility compiler path when needed.

Always record:
- expected size
- actual size
- differing linked byte count
- candidate filename
- execution/result artifact

Interpret mismatches instead of doing random syntax roulette.

### 6. Refine source shape by cause

Proven FoMT lesson: declaration placement, object shape, inline helpers, and value lifetime can materially change old GCC/agbcc register allocation and instruction order.

When source is semantically correct but bytes differ, classify the difference:
- wrong operation/control flow
- signedness/width
- object layout
- source lifetime/declaration placement
- return-value handling
- old C++ ABI
- register allocation
- CSE/combine
- literal scheduling
- section/link order
- actual compiler behavior

Only escalate to compiler research after credible source shapes converge and the first compiler-pass divergence is demonstrated.

### 7. Validate the target before production

For a final candidate:
- re-run exact function comparison
- verify any coupled functions in the same translation unit still match
- inspect generated object sections for unexpected linkonce/vtable/orphan output where relevant

For C++ class work, a realistic multi-method translation unit is more trustworthy than isolated methods.

### 8. Integrate in a detached worktree first

Create a detached integration worktree.

Copy only required dirty production source/asm/linker files and baserom prerequisites. Remember that Git worktrees do not inherit ignored/local build inputs. In particular, make the local `baserom.gba` available explicitly and install the compiler inside the detached worktree. If `tools/agbcc` is absent, preprocessing may fall through to modern devkitARM headers and produce misleading parser errors that are unrelated to the candidate source.

For the compiler, use the tracked reproducible path:
`tools/install_agbcp.sh`

Do not trust an arbitrary existing/generated `tools/agbcc` directory. A stale generated compiler copy already caused a uniform four-byte layout shift even though every new target was individually exact. A missing generated compiler is also not a source mismatch; install from the tracked path before interpreting integration failures.

Run plain:
`make -B -j4 compare`

The isolated ROM must be exact before production mutation.

### 9. Promote only the proven integration

Copy the exact proven source/asm/linker seam into production.

Run plain:
`make -B -j4 compare`

Then run:
- `sha1sum fomt.gba`
- `make progress`
- symbol/map checks for each replaced function and following boundary
- `git diff --check` on contribution files

The normal tracked installer/build path is the authority. Do not use a private compiler override as the final proof.

### 10. Document before commit

Update every document whose current truth changed.

At minimum, for a meaningful completed batch:
- `START_HERE.md`
- `tools/ches/NEXT_AGENT_HANDOFF.md`
- `tools/ches/SESSION_STATUS.md`
- `docs/DECOMP_NOTES.md`
- `docs/REPO_MAP.md`
- `EXPERIMENT_INDEX.md`
- `FAILURES_AND_CLOSED_PATHS.md` when a failed path taught something reusable
- `docs/FOMT_COMPILER_RESEARCH.md` when compiler/toolchain facts changed

Record both successes and failures that would affect a future decision.

### 11. Commit and push exact retail work

Stage explicit contribution-safe paths only.

Never stage private agent/research docs merely because they are dirty.

Review:
- `git diff --cached --check`
- `git diff --cached --stat`
- `git diff --cached --name-status`
- private marker scan when compiler or scratch-derived code is involved

Use project-style commit messages.

Push `ches-dev`, then verify the remote tip with `git ls-remote`.

## Current compiler/toolchain truth

The historical/private Call238 packages are research evidence. They are not the current contribution authority.

The contribution-safe path is:
- public compiler repo: `https://github.com/notyourav/agbcc.git`
- pinned commit: `1caa6becde5e4676b59c31c74d68f45ced79557c`
- tracked compatibility patch: `tools/agbcp_fomt_compat.patch`
- patch SHA-256: `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`
- installer: `tools/install_agbcp.sh`

The installer builds the patched compiler and installs the normal `tools/agbcc/bin/agbcp` wrapper with thirteen validated compatibility behaviors enabled. The newest two use pointer metadata only after allocation priorities tie and retry standard jump threading after reload while honoring the normal flag. Integrated narrow-zero protection remains enabled. Clean focused/corpus and isolated/production full-ROM proofs cover the resulting compiler.

A fresh checkout has already passed a plain no-override `make -B -j4 compare` and reproduced the retail SHA1.

Do not claim this patch is the recovered historical Nintendo compiler. It is a validated FoMT compatibility reconstruction.

## Proven source-shape lessons

### Reuse existing project types before inventing a duplicate

`func_080A56DC` became exact when the existing `Location` type from `include/actor.hh` replaced a manually reconstructed packed-position struct.

Rule: search headers/source for an existing matching layout before hand-writing bit extraction.

### Declaration and lifetime placement are part of matching

`func_080A5670` required testing `pairs[i].source` directly, then declaring the long-lived source pointer inside the non-null branch. This recovered the retail r0-to-r5 value lifetime and exact register allocation.

Rule: a semantically equivalent local declared one scope earlier can compile differently.

### Pass the semantic object, not an interior field pointer, when retail keeps the base

`func_080A4BEC` only became exact when the inline helper received the animation descriptor base and read `descriptor->duration` internally. Passing `&duration` shifted literal references by +8.

Rule: pointer provenance and expression tree matter.

### Correct ABI declarations through the natural object interface

The effect constructors previously declared resource lookup with one argument even though retail consumes both client and packed ID. Direct outer `handle.value` forwarding introduced a reload and rotated allocation. Inline `UnkHandle::GetStart()` passes both real arguments while preserving the constructor's interior-object pointer/value relationship; both callers remain exact.

Rule: audit argument provenance from machine code, then test a credible shared object interface rather than preserving an incomplete declaration or forcing registers.

### Separate function bytes from section alignment

Resource acquisition ends at `08007C26`; the next entry begins at `08007C28`. Including those two alignment bytes incorrectly turns a 0xD2/1 body mismatch into a 0xD2-versus-0xD4/3 report. Compare the complete true body, then verify ordinary padding through section/link and full-ROM proof. Source progress counts linked sections and can include their alignment.

### Inline tiny methods can reveal the original object model

`func_080A4A94` became exact when repeated color clearing was expressed as inline member `Clear()` calls and the embedded node used an inline `Init()`.

`func_080A6640` became exact when +0xB4/+0xB8 were modeled as two tiny C++ objects with an inline `Clear()`. The target compiler aligned the class to four bytes, so manual padding was wrong.

Rule: repeated retail store patterns may be compiler-inlined member methods, not hand-written raw field assignments.

### Preserve return values when the wrapper forwards them

`func_080A6420` was two bytes short until it was modeled as returning the result of `func_0803A8A4` rather than calling it as void.

Rule: epilogue register differences often reveal a real return-value contract.

### Old C++ small-struct-return ABI is active evidence

`func_080A58EC` strongly indicates a member function returning a 4-byte viewport struct by value. The hidden structure-return pointer explains the observed register signature. `func_080A5960` reaching the exact retail size under that model corroborates it.

This pair is not exact yet, but the ABI inference is strong and should be preserved.

### Exact size alone is not enough

Several candidates reached exact size with many differing bytes. Treat size as one clue, never as completion.

### A full-ROM link failure can be integration/toolchain, not source

The five-helper batch had five exact target objects but initially failed the ROM because a stale generated compiler directory was copied into the detached worktree. Already-proven functions shifted before the new seam.

Rule: diagnose the first divergence before rewriting exact source.

## Do

- Read canonical docs before experimenting.
- Search saved candidates and failure ledgers.
- Prefer natural source and existing types.
- Keep hypotheses labeled as hypotheses.
- Preserve hard-target evidence when rotating to easier targets.
- Work in coherent subsystems so each solved helper teaches object layout and ABI.
- Use small/medium functions for throughput when a large function stalls.
- Validate each target exactly.
- Validate the full ROM after integration.
- Keep the normal reproducible compiler path authoritative.
- Update docs continuously, not only at the end.
- Record failures that future agents might otherwise repeat.
- Commit/push exact retail work once all gates pass.
- Keep custom-game work isolated.

## Do not

- Do not declare success from compilation or function size.
- Do not move speculative candidates into `src/`.
- Do not invent semantic names from weak evidence.
- Do not force register variables/volatile/asm merely to make bytes match unless used as a diagnostic and independently justified.
- Do not start compiler experiments while credible source-shape explanations remain.
- Do not hardcode FoMT addresses/symbols into compiler logic.
- Do not copy a stale generated `tools/agbcc` as a reproducibility shortcut.
- Do not remove more assembly than the proven source range.
- Do not stage private docs/research in retail contribution commits.
- Do not mix custom-game/QoL behavior into `ches-dev`.
- Do not discard a difficult candidate when switching targets. Preserve its evidence and exact next hypothesis.

## Target-selection strategy

The goal is not merely to maximize function count, and it is not to stay
strictly adjacent at all costs. Target selection is **throughput and
leverage-first**: prefer coherent work that recovers substantial source while
making many later functions easier to understand, type, name, or exact-match.

The normal unit of work is now an inferred original translation unit or coherent
structural/type cluster, not a fixed five-function batch.

Maintain one machine-readable function inventory that can grow to include:
- address and exact size;
- callers/callees and cross-module fan-out;
- globals/data xrefs and likely data owner;
- inferred TU/subsystem;
- vtable/class/constructor/destructor relationships;
- normalized-assembly similarity cluster;
- exact, understood/nonmatching, parked, or assembly status;
- known compiler-sensitive failure evidence;
- runtime coverage and indirect call targets when available.

Rank remaining TUs/clusters using a combination of:
- source bytes recoverable;
- downstream unlock value, weighted by unresolved caller/callee size;
- type readiness from already-recovered structs/classes/APIs;
- subsystem/TU coherence;
- similarity to an already-solved family member;
- tractability and known compiler risk;
- data/asset formats unlocked as a by-product.

`python3 tools/ches/analyze_decomp_leverage.py --top 100 --min-callers 5 --markdown`
remains useful raw evidence, but direct-call fan-out alone is not the queue.
The next tooling phase should merge that evidence with TU inference, xrefs,
similarity clusters, class/vtable data, and later runtime coverage.

Address adjacency matters when it represents a real original TU, shared literal/
rodata boundary, class family, or subsystem. Otherwise it does not override a
clearly higher-throughput coherent cluster elsewhere in the ROM.

Use normalized-assembly clustering aggressively. When many functions differ only
in constants, targets, or small state details, solve one representative carefully
and reuse its type/source shape as an oracle for the family.

If one hard function starts consuming disproportionate effort:
1. preserve its current candidate, mismatch counts, ABI/layout discoveries, and
   first proven compiler/source-shape divergence;
2. mark it parked or understood/nonmatching in the private research state;
3. continue the rest of its TU/cluster when useful;
4. return only when new structural evidence or a solved sibling changes the odds.

Production remains exact-only. Semantically reconstructed but nonmatching source
is useful research and mod-readiness evidence, but must remain outside production
`src/` unless the project later deliberately implements a supported NONMATCHING
build convention.

Runtime analysis supports the queue rather than defining it. Prefer deterministic
savestate + scripted-input scenarios that collect function hits, indirect
caller/callee edges, and targeted RAM diffs in bulk. Use watchpoints to answer
specific ownership/field questions, not to discover work by manually wandering
the game.

Historical example: the October 2 renderer batch solved 5A9C, 5EA0, 601C, 6420,
and 6640 while preserving harder neighbors, then pivoted to SpriteAnimator.
That remains a useful leverage example, but the fixed five-function batch size
is no longer current policy.

## Documentation contract

A no-context agent must be able to answer these questions from files alone:

- What are the project goals?
- Which branch/worktree is retail vs custom?
- What is the current exact ROM/hash status?
- What is the current progress percentage?
- What was the latest verified commit/push?
- What compiler path is authoritative?
- Which functions were just completed?
- Which targets are active next?
- What candidate/result already exists for each active target?
- Which experiments failed and should not be repeated?
- Which behaviors are proven vs inferred?
- What exact validation commands are required?
- When is commit/push allowed?
- Which files are private and must not be staged?

Whenever a result changes one of these answers, update the relevant canonical doc immediately.

### Last-run continuity rule

Treat every execution run as though the conversation may hit its maximum length immediately afterward.

Do not wait for a scheduled checkpoint to make essential state durable. After a decision-relevant result, save the candidate/proof and update the smallest canonical set needed to preserve:
- best current candidate and exact measurement;
- newly proven architecture/layout;
- newly closed or superseded path;
- toolchain/compiler state if changed;
- exact next experiment or command.

The periodic checkpoint is a consolidation and publication boundary, not permission to leave previous calls undocumented. At each durable checkpoint, update the canonical state, verify the checkpoint diff, commit on `Live-temp`, and push to `ches/Live-temp`. If the push cannot complete, record the exact local HEAD and failure before stopping.

The standard is strict: a zero-context model should be able to inspect the project or the published `ches/Live-temp` checkpoint after any completed safe step and continue without asking what happened in chat.

### Dedicated subsystem architecture docs

The tracked GitHub-facing docs such as `CHARACTERS.md`, `KEY_INPUT.md`, and `SAVE_FORMAT.md` are intentional and remain the preferred pattern for stable domain knowledge.

Use a dedicated subsystem/type document when recovered facts are reusable beyond one function or one matching session, especially for:
- shared classes/APIs and object ownership;
- input/control architecture;
- serialization/save formats;
- character/NPC identity and schedule models;
- animation/resource pipelines;
- scenes/managers;
- scripting/event formats;
- DMA/transfer abstractions;
- common containers or memory ownership models.

Keep these documents human-facing and durable: proven layout, semantics, interfaces, constraints, cross-subsystem relationships, unresolved fields explicitly marked unresolved, and validation/integration requirements.

Do not copy experiment chronology into them. Private candidate paths, mismatch counts, rejected syntax families, allocator probes, compiler patches, and exact next experiment belong in `tools/ches/` handoffs/checkpoints and compiler research.

When a batch materially recovers a subsystem architecture, the batch is not fully documented until the relevant dedicated subsystem doc is created or updated. The handoff must say which subsystem doc is expected at integration time.

## Current strategic direction

SpriteAnimator, hardware ownership, DMA/transfer infrastructure, intrusive lists, entity/effect lifecycle, shared-resource functions, NPC support, typed character metadata, native GameObject entity lookup/teardown, character/social resolvers, article interaction, MoneyState, typed shop catalogs, and the packed animation-provider pipeline are recovered at their documented scopes. Production HEAD remains `9078f36`; the active exact `Live-temp` worktree is **69,056 / 940,036 = 7.3461% source**, with **75,334 data/asset bytes** and **144,786 overall meaningful-ROM bytes** reconstructed while the retail ROM remains exact. The legacy save loader, `func_080455D8`, `func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and `func_08092940` are parked. The packed sprite bank remains **416 / 493 semantically owned**, with 77 IDs open, but sprite-family provenance is no longer the primary queue. The throughput pipeline is live: the remaining-function database/ranked queue and resident-NPC class map regenerate from the current build; all 35 resident constructors are source-owned, only Child +0x30 remains assembly, the adjacent `UnkEntity37008` hierarchy is bounded, and the thrown `BallEntity` constructor plus four methods are now exact source. Continue the Ball destructor/wrappers/controller family before its large mover, then re-rank. Preserve the opening-farm savestate and prior watchpoint work as the seed for later scripted runtime coverage. The handoff owns exact active commands/artifacts; the priority map owns target selection.

Preserved renderer candidates remain:
- `func_080A5CC0`: expected 0x54, v1 actual 0x58, 72 differing linked bytes;
- `func_080A5DB8`: expected 0x44, v1 actual 0x40, 50 differences;
- `func_080A5D14`: expected 0xA4, v1 actual 0xA0, 153 differences;
- `func_080A58EC`: expected 0x74, v2 actual 0x7C, 83 differences;
- `func_080A5960`: expected/actual 0x5C, 52 differences;
- `func_080A5760`: expected 0x18C, v1 actual 0x180, 301 differences;
- `func_080A4F50`: deferred 0x720 renderer/upload routine.

The detailed quantitative rationale and phase roadmap live in `docs/DECOMP_PRIORITY_MAP.md`.

### Use an adjacent exact function as a source-shape oracle

When neighboring routines manipulate the same object and one is already byte-perfect, treat its exact source API and statement order as stronger evidence than new syntax guesses.

SpriteAnimator example: exact func_0805E894 proves a full-width index, Count(), Begin(), and local frame-pointer pattern. Transplanting that pattern into func_0805E8F0 produced the first natural exact-size 0xAC candidate immediately, even though its register lifetimes still need reconstruction.

Rule: exact neighboring C++ can constrain object model, expression order, value widths, and instruction budget before further allocator work.

### Use exact-source pass dumps to isolate frontend lifetime boundaries

When an exact source-matched function exhibits the same value-identity problem as the active target, rebuild that exact source with the authoritative compiler and inspect RTL/CSE/flow/lreg before inventing another target candidate. The useful evidence is not just final register choice: track where a pseudo is born, whether CSE preserves or canonicalizes it, which calls/copies it spans, and where its narrow/full-width uses die.

Save-loader example: exact Dog and Farmer constructors both build an `ActorLocation` from a six-byte `Location` temporary, copy those six bytes, then write the facing byte. Dog preserves the facing zero as a distinct SImode user identity across the copy; Farmer canonicalizes the equivalent value to an earlier HI zero that still spans the copy and allocates to r5. That comparison isolated the relevant source boundary more cleanly than more typed-Location or compiler-family experiments.

Rule: before changing compiler behavior or broad source shape, look for an exact-source oracle that reproduces the same lifetime boundary and reduce the hypothesis to the smallest transferable structure.

### If the right source identities survive flow, stop rewriting C++

SpriteAnimator v28 explicitly contains the retail-looking count-zero and frame-pointer copy. RTL inspection proved both identities survive CSE, combine, and flow. Their disappearance or reassignment happens only during allocation/reload.

Rule: once the intended user-variable identities survive the middle end, stop generating broad source variants. Trace allocation priority, conflicts, preferences, and live ranges. Use proof-only ordering or register diagnostics to establish the required compiler behavior, then reconstruct a structural rule.

## Entity-effect integration lessons - October 3, 2026

- Judge equivalent-register restrictions on the CSE quantity's canonical register; a compiler temporary can still canonicalize to a source variable.
- A wider-mode lookup restriction can work in first CSE and be undone by canonicalization in second CSE. Follow the independent value through all relevant passes.
- Test genuine constructors, the shared object layout, update, renderer, and destructor boundary together. A nested byte bitfield union can acquire word alignment in this compiler; explicitly represent the proven packed ABI.
- Keep the legacy destructor flags explicit when normal compiler generation adds a vtable store absent from retail. Preserve its alias and exact range rather than forcing registers or instructions.
- Place a typed data table in a minimal translation unit when another object's `.rodata` contains unrelated compiler-generated constants. The 12-byte `bad_alloc` shift was a linker-section integration failure.
- Update every old actor field access when replacing a padded layout with typed embedded objects, then use complete-ROM equality as the final authority.

## Resource integration lessons - October 3, 2026

- On exact allocation-priority ties, examine existing pointer metadata before assuming allocno number or rewriting source. Preserve the original priority comparisons and deterministic final fallback.
- A late branch difference can arise because a copy obstructs standard early threading, then a later pass removes that copy. Trace pass state and reuse the standard optimizer before constructing a manual branch rule.
- Distinguish function body size from a padded section range. Symbol matchers exclude alignment; full-ROM equality remains the final authority for every byte.
- Test the complete typed subsystem, fresh clean compiler, saved module corpus and caller canaries before separate linker seams. Keep raw neighbors and ABI aliases explicit.

## Range/release/pool lessons — October 3, 2026

- The old STL `min` returns a const reference. Preserve that contract and its argument lifetimes. Computing Fill's left length before the child call avoids retaining a premature child pointer through min's branch; Clear retains its child receiver for later empty-flag evaluation.
- Raw byte flag getters preserve retail receiver provenance; explicit bool normalization can introduce compare bridges. Conditional child pointers reflect bit-based dispatch more faithfully than indexed multiplication.
- Keep the semantic half-size through right-offset calculation and stage the two unsigned subtractions. Late inline size accessor expansion changes literal bounds and is not interchangeable for matching.
- The free-list initializer writes its tail first and walks backward; last-index calculation is `entries+(count-1)`. Preserve the nonzero-count precondition.
- Body proofs exclude ordinary trailing alignment; whole ROM verifies it. Flatten SECTION attributes only after expanding shared headers for the `.text`-only matcher.
- Disable getenv-tested flags by unsetting them; value0 remains enabled. The13 independent allocation ablations are saved and have no effect; do not repeat them or infer a global-priority patch from a small register swap.

## Resource subtree CSE and scope lesson — October 3, 2026

Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.

When a local explicitly copies a shared value before mutating it, inspect both the copy and the mutation's source through CSE and flow. A copy still present after CSE may already be dead because canonicalization rewrote the mutation to use the earlier value. Source spelling alone does not restore the independent quantity. Save that frontier, then complete exact understood dependencies as a coherent batch. V3 demonstrates this rotation with five exact functions and full-ROM proof, without widening compiler rules.

## NPC support source and ownership lessons — October 4, 2026

- Try the existing Location/ActorLocation and ScheduleInfo/PathInfo interfaces
  before manual bit extraction. A natural conditional aggregate initializer
  reproduced both packed-coordinate schedule paths directly.
- Moving an understood base declaration into a shared header is a separate
  ABI/regression gate: compare its whole existing text and validate class sizes.
- Suppress already-owned vtables with the toolchain's supported interface pragma;
  use normal C++ ABI names and linker aliases for concrete classes.
- Pass `--compiler tools/agbcc/bin/agbcp` explicitly to the private function
  matcher; its historical default is not the current compiler authority.

## Typed-data parent-section lesson — October 4, 2026

Before splitting a data range, inspect the section directive active at the
actual range and its existing linker order. The parent file may already have
multiple typed-data insertions. An exact table placed after the first rodata
section can shift unrelated earlier data; diagnose the first relocated pointer
and the table/name-pool addresses before changing source or compiler behavior.
Keep failed layout evidence, correct only the responsible seam, and rerun the
forced full-ROM gate. A data-only unit is measured as typed data recovery and
adds no executable-source percentage.
