# FoMT Decompilation Priority Map

## Active scope - October 6, 2026

The active goal is **throughput-first whole-game retail decompilation**.
Preserve the byte-identical US retail ROM on public branch `main`, keep custom
behavior in the separate custom-game worktree, and prioritize coherent
reconstruction that maximizes useful source and downstream understanding.

The project already has strong foundational types and APIs. The next phase is to
exploit them across the remaining assembly instead of making an individual
resource family the main queue.

Current verified working state on `main`:
- code: **75,904 / 940,036 = 8.0746%**;
- assembly remaining: **864,132 bytes**;
- remaining linked assembly functions: **2,266**;
- data/assets: **75,334 / 6,777,404 = 1.1115%**;
- overall meaningful ROM: **151,634 / 7,717,440 = 1.9648%**;
- packed bank: **416 / 493 semantically owned animations**;
- retail ROM remains exact at SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The legacy save loader `func_08011650`, `func_080455D8`,
`func_08092A70`, `func_080CAC7C` / `func_080CAD18`, and
`func_08092940` remain parked unless new structural evidence raises their
leverage.

This is the project roadmap for zero-context continuation on the public fork.
It is not intended as upstream pull-request content.

## Why this exists

Address adjacency, raw fan-out, and easy function count are all useful signals,
but none is sufficient by itself. The roadmap now ranks **translation units and
coherent structural/type clusters**, not just individual functions.

The target queue should be driven by a machine-readable function database with:
- function address and exact size;
- callers, callees, and cross-module fan-out;
- data/global xrefs and likely owner;
- inferred original TU/subsystem;
- vtable/class/constructor/destructor relationships;
- normalized-assembly similarity cluster;
- exact / understood-nonmatching / parked / assembly status;
- known compiler-difficulty evidence;
- runtime coverage and indirect call targets when available.

The old direct-call leverage analyzer remains useful input:

`python3 tools/ches/analyze_decomp_leverage.py --top 100 --min-callers 5 --markdown`

but its score is no longer an execution order.

## Current priority: work the live queue and preserve family-level leverage

The throughput pipeline is operational. The Ball family remains parked at its documented mover seam. The adjacent `vtable_unk_080E7380` family now owns **316 exact retail bytes** in source: 224 bytes of entity surface plus 92 bytes of controller helpers. Controller constructor `0x08038820` is behavior-complete and exact-size but bounded by register-lifetime codegen.

The raw queue can still rank parked work highly, so score is not execution order. The Entity38740/Entity398A4 region now owns exact source through the seven-helper tail `3A804..3A8A0`, including preceding exact `3A798`, `3A350`, `3A320/334`, `39A60`, `3A144`, `398A4/399C0`, and related strategy helpers. `39E98`, `39F90`, `3A180`, and `3A394` are explicitly parked after bounded natural-source work. The 652-byte logical map resolver at `0x0803A8A4` is exact source. Four resource-owner methods AC78/ACD8/AE58/B0A8 are integrated, adding 680 linked bytes. The eight fishing-record methods add 276 linked bytes and recover the 472-byte persistent block. The mine-floor cluster owns 872 exact linked bytes through E0AC plus E174..E1B4 and proves the adjacent 0x628-byte persistent object. The exposed E118..E174 and E1B4..E2D4 code islands are behavior-recovered but parked after bounded source-shape attempts. The next adjacent persistent block at GameState+0x3480 is now a typed 0x14-byte CursedToolState; continue with the bounded +0x3494..+0x34C4 persistent block. D8E8 and DA00 remain parked source-shape/compiler frontiers. The whole-loader compiler puzzle remains parked.

### Save recovery selection rule

Persistent subobject recovery is active; the whole-loader matching puzzle and
custom extension implementation are separate, deferred work. Fishing provides
one successful example: 472 bytes of typed save layout and 276 bytes of exact
code recovered without solving the loader. Mine-floor CE8C now provides a
second: a 0x628-byte persistent object and 168 exact initializer bytes.

The next bounded assessment stays in that mine-floor translation unit because
the proven layout now constrains DA00 strongly. D8E8 is parked; if DA00
reveal a repeated compiler obstacle or require broad legacy refactoring, save
the result and rank other persistent subobjects by type readiness,
caller/consumer evidence and downstream value.

The concrete method and stop conditions are in DECOMP_PLAYBOOK.md under
"Recover persistent subobjects without blocking on the whole loader".
Do not treat a high queue score, a previously matching scratch helper, or an
old research label marked PROVEN as sufficient promotion evidence.

### 1. Keep the function/TU inventory current

Regenerate the inventory and class maps after meaningful exact integrations. Treat address/section locality, padding/literal seams, call locality, vtables, constructor/destructor groupings, data ownership and known failure history as ranking inputs rather than independent goals.

### 2. Cluster repeated machine-code families

Normalize registers, relocatable addresses, and suitable immediates, then
cluster similar remaining functions. FoMT contains many repeated entity/NPC,
menu, wrapper, state, map, item/tool, and scene patterns where one exact source
member can become a strong oracle for the rest.

Prioritize clusters by total remaining bytes and how much shared type/source
shape one representative can teach.

### 3. Build the class/global/data ownership map

Scan vtable/function-pointer runs, link them to constructors/destructors and
known virtual callsites, and connect globals/tables to their main consumers.
Feed recovered ownership and types back into the function database before
ranking the next queue.

### 4. Score coherent TUs/clusters

Use a multi-factor score rather than raw fan-out alone. Inputs should include:
- recoverable source bytes;
- downstream unresolved bytes unlocked;
- type readiness;
- similarity to already-exact source;
- TU/subsystem coherence;
- compiler difficulty/failure history;
- useful data/asset formats exposed as a by-product.

A tiny wrapper with hundreds of calls may still rank below a medium TU whose
types unlock several large callers.

### 5. Decompile by TU/cluster, not by fixed function count

There is no longer a five-function batch target. Work through as much of a
coherent unit as remains high-throughput. When one function becomes a pure
compiler/codegen island, preserve the best natural candidate and cause, mark it
parked/understood privately, and continue the rest of the unit.

Only byte-exact source replaces assembly in production. Semantically understood
but nonmatching source is valuable research and mod-readiness evidence, but must
stay private unless a supported NONMATCHING convention is deliberately adopted.

### 6. Use runtime tracing as bulk classification

The existing opening-farm savestate is useful infrastructure, not the main
frontier. Build deterministic savestate + scripted-input scenarios that can
collect:
- function-entry coverage;
- indirect and virtual caller/callee targets;
- first-hit frame/scenario;
- targeted RAM before/after diffs.

Use watchpoints only to answer focused ownership or field questions.

### 7. Treat assets/data as a by-product and parallel structural lane

The remaining **77 packed-sprite animations** are parked as an open list rather
than the primary queue. Their current family evidence remains valid:
173..180, 413..420, 54..57, 160/161, plus the other documented IDs. Resolve
them naturally as their owning TUs, tables, scenes, events, minigames, and
consumers are reconstructed.

Bulk-catalog recognizable pointer tables, fixed-stride arrays, palettes, tile
banks, script tables, and resource headers when cheap. Assign semantic ownership
through consumers. Only editable project-side representations that regenerate
retail bytes count as reconstructed assets/data.

### 8. Re-score continuously

After a shared type, class family, TU, major table, or runtime coverage set is
recovered, update the function database and re-rank the remaining work. The
queue is evidence-driven and dynamic, not a permanently hand-written list.

## Previous resource unit and deferred allocator continuation

Twenty shared-resource functions are exact source. Latest five are order8
full fill/clear, order9 partial fill/clear and order8 release. Both full ROMs
are byte-identical; source **59,944 / 940,036 = 6.3768%**,436 linked bytes added.
Contribution save: `0514b05ec4a1dbfab37f49a377e27163923d8429` (`0514b05 decompile resource subtree ranges and release`), committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.

Deferred allocator five: order-9 full fill `080D6EEC` and clear `080D6F5C`, order-7 full fill `080D6EAC` and clear `080D6F1C`, and order-7 release `080D7634`. Use the exact order-8 helpers and release as source anchors. These next five are still assembly; no new match is claimed. Their callees and known geometry are proven in current typed source.
If the allocator work is resumed, close these dependencies before returning to its partial-range copy issue.

Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.

The original five-target plan rotated two mismatching partial ranges to
already-understood full reset helpers; no compiler change was required.
Original resource leverage was start query80 unique callers/329 calls,
release55/224 and acquire32/137. Remaining-assembly ranking omits newly
recovered source callers, so that reduced score does not remove architectural
value. When that allocator unit resumes, rerank other shared infrastructure after its next five. The current
snapshot excludes completed functions; earlier tables retain selection history.

## Main-author strategy

If starting FoMT from scratch with what we know now, the order would be:

1. Lock the exact build/toolchain and byte-comparison workflow.
2. Map sections, function boundaries, vtables, common object families, and call relationships.
3. Recover high-fanout foundational types and tiny helpers.
4. Recover high-fanout methods on those types.
5. Work subsystem-by-subsystem, using easy/medium functions to expose layouts before large state machines.
6. Rotate away from one stubborn function when nearby helpers can strengthen the model.
7. Return to the difficult function with better type/ABI evidence.

The current project has already completed steps 1 and much of 2. The roadmap should now emphasize steps 3 and 4 rather than simply advancing by address.

## Priority Tier A: shared typed infrastructure

These are the strongest leverage targets because readable source already gives semantic anchors.

### A1. SpriteAnimator core - COMPLETE

Completed October 2, 2026 as one exact five-function typed subsystem batch.

Current readable type:
`include/sprite_animator.hh::SpriteAnimator`

Stable architecture:
`docs/SPRITE_ANIMATOR.md`

Readable use:
`src/entity_actor.cc`

The former 0x14-byte pad is now a proven typed object with provider, animation descriptor, frame index, Q8 timer, signed step, and change latch. All five methods are readable C++, the two readable actor call sites use `SetAnimation`, and the full retail ROM remains byte-identical under the tracked compatibility compiler.

Recommended coherent batch:

| Function | Approx size | Direct calls | Unique callers | Modules | Why it matters |
| --- | ---: | ---: | ---: | ---: | --- |
| `func_0805E824` | 0x2C | 159 | 56 | 7 | Constructor/init-style routine; reveals fields and resource-provider contract. |
| `func_0805E850` | 0x10 | 18 | 14 | 2 | Small initializer/wrapper around 5E860; easy type/API win. |
| `func_0805E860` | 0x34 | 179 | 75 | 8 | Already called from readable C++ as `SpriteAnimator *`; extremely high leverage. |
| `func_0805E894` | 0x5C | 2 | 2 | 2 | Small state/query helper that exposes frame/timer semantics. |
| `func_0805E8F0` | 0xAC | 119 | 49 | 10 | Central animation-step/update routine; high cross-module fan-out. |

Why this cluster was selected first:
- the type already exists in readable source;
- its exact size is known;
- its methods already have real call sites in C++;
- it appears in at least two fields of `UnknownEntityThing`;
- completing it will replace opaque calls in actor/entity code with a real shared abstraction;
- the five functions are adjacent and form one coherent object API;
- understanding 5E894/5E8F0 should reveal field names for the 0x14-byte object.

Expected downstream benefit:
- entity actor refresh/update code becomes easier to name and decompile;
- intro/new-game/game-state sprite setup gets typed;
- renderer/effect code can reuse the same animation semantics;
- later calls to 5E6CC/5E790/5E99C become easier to classify.

October 5 follow-through confirmed that leverage: `func_0805E6CC` and
`func_0805E760` are source-integrated, the packed seven-pool item bank is
understood well enough to round-trip all 347 named item icons through PNG source,
and `func_0805E790` is structurally understood but intentionally parked at a
compiler-scheduling mismatch.

### A2. Central global-manager accessor cluster around 0x080088xx-0x080089xx

Raw leverage ranking puts several tiny accessors at the very top:

| Function | Size | Unique callers | Calls | Observed behavior |
| --- | ---: | ---: | ---: | --- |
| `func_08008918` | 0x08 | 116 | 397 | Dereference owner pointer and return subobject at +0x34. |
| `func_08008910` | 0x08 | 86 | 384 | Return subobject at +0x24. |
| `func_08008940` | 0x0C | 90 | 200 | Return subobject at +0x494. |
| `func_08008920` | 0x20 in linked symbol span | 78 | 222 | Return subobject at +0x8C. |
| `func_080088CC` | 0x08 | 45 | 105 | Return halfword field +4 from owned object. |
| `func_080088D4` | 0x08 | 30 | 95 | Return halfword field +8. |
| `func_080088DC` | tiny body in a mixed raw-byte island | 34 | 45 | Return owned object pointer. |
| `func_080088B8` | 0x0C | 58 | 61 | Forward owner object to another manager/helper method. |

Status: completed October 2, 2026.

The owner is proven hardware infrastructure rather than a gameplay manager. `Hardware` owns a 0x4B0 `HardwareContext` containing expanded input/repeat state, a typed `GraphicsTransferVector`, display-register shadow, OAM shadow, scheduler handle, and persistent intrusive callback list.

Five accessors are source-integrated and retail-exact:
- `func_080088DC` -> owned `HardwareContext`;
- `func_08008910` -> `GraphicsTransferVector` at +0x24;
- `func_08008918` -> display-register shadow at +0x34;
- `func_08008920` -> OAM shadow at +0x8C;
- `func_08008940` -> shared `IntrusiveCallbackList` at +0x494.

Stable public architecture is documented in `docs/HARDWARE.md`. Unnamed duplicate accessors and neighboring scheduler routines remain assembly until their own interfaces are reconstructed.

B1 intrusive callback-list infrastructure is now production exact.

### A3. DMA/transfer descriptor infrastructure - COMPLETE

Completed October 2, 2026 as one exact five-function subsystem batch.

Recovered source:
- `func_08008E64` -> `DmaCopy`;
- `func_08008EB8` -> `DmaFill`;
- `func_08008F0C` -> copy `GraphicsTransfer` constructor;
- `func_08008F60` -> fill `GraphicsTransfer` constructor;
- `func_08008FE4` -> `ExecuteDmaTransfers`.

The proven descriptor is 16 bytes: mode, source-or-fill-value, destination, and count/control. `HardwareContext +0x24` is now the typed `GraphicsTransferVector` already used by readable graphics callers. The neighboring CPU-copy routines consume the same descriptor layout.

Stable public architecture: `docs/HARDWARE_TRANSFER.md`.

Production full-ROM validation preserves the retail SHA1 and raises readable-source coverage to **56,368 / 940,036 = 5.9964%**. Raw neighbors `08008E28..08008E63`, `08008FB8..08008FE3`, and `0800901C..08009093` remain assembly.

## Priority Tier B: generic object/container infrastructure

### B1. Intrusive callback-list infrastructure - COMPLETE

Completed October 2, 2026 as one exact five-function shared-container batch.

Recovered source:
- `func_080098AC` -> `DestroyIntrusiveCallbackNode`;
- `func_080098DC` -> `DestroyIntrusiveCallbackList`;
- `func_08009940` -> `IntrusiveCallbackList::Append`;
- `func_08009968` -> `IntrusiveCallbackList::Remove`;
- `func_08009984` -> `IntrusiveCallbackList::Clear`.

The proven 12-byte node stores `pprev`, `next`, and vtable. The proven 0x1C list adds a head pointer and embedded sentinel. The same generic list is used by hardware and game-state paths, and `HardwareContext +0x494` now uses the shared type.

Production proof `sh_muqxfbgt_d5c64a43` preserves the retail SHA1 and raises readable-source coverage to **56,568 / 940,036 = 6.0176%**. Raw `080098D8..080098DB`, `08009908..0800993F`, and `080099B0` onward remain unchanged assembly.

Stable public architecture: `docs/INTRUSIVE_CALLBACK_LIST.md`.

Next target should be chosen by leverage re-ranking rather than address adjacency.

### B2. Common allocator/retry wrapper: func_080D3BC0

Metrics:
- size 0x28
- 122 unique callers
- 508 calls

Observed behavior:
- waits for/calls a global callback;
- attempts `malloc(size)`;
- retries on allocation failure.

This is extremely high fan-out, but low semantic leverage because it is generic allocation infrastructure.

Recommendation:
decompile/name it early if easy, but do not let it displace shared gameplay/object types in the roadmap.

### B3. Entity/effect constructor family: func_080324BC and neighbors - COMPLETE

Metrics for `func_080324BC`:
- size 0xA4
- 43 unique callers

It constructs a polymorphic entity/UI helper and embeds effect objects that already use the newly decompiled 0x080A4A00 family.

Strategic value:
- connects entity/game-object code to the effect/renderer work already recovered;
- good bridge from engine infrastructure into higher-level gameplay entities.

Completed as `9a6a26f`: both constructors, update, renderer, destructor, shared layout, and typed virtual table are retail-exact. Stable architecture is in `docs/ENTITY_EFFECTS.md`; higher-level entity identity remains unresolved. This is historical selection rationale, not a pending batch.

## Priority Tier C: high-frequency leaf subsystems

These are worthwhile, but fan-out alone should not make them the first architectural targets.

### Audio wrappers

`func_08008B6C`:
- size 0x1C
- 108 unique callers
- 279 calls
- loads a song entry and calls `m4aMPlayStart`

Very easy and highly used, but mostly isolated to audio control. Good throughput target, limited cross-system type leverage.

Related `08008B54/88/BB0` should eventually become a coherent audio API.

### Thin forwarding wrappers near 0x08050Dxx-0x08050Exx

Many functions rank highly because they:
- dereference an owner pointer;
- forward arguments to another method;
- return a field or toggle a flag.

Examples:
- `08050D34`
- `08050D5C`
- `08050D74`
- `08050D8C`
- `08050DC8`
- `08050E50`
- `08050E5C`

These are attractive easy matches, but the biggest value comes from first identifying the wrapped object type and its underlying `0804Fxxx/08050xxx` API.

Treat them as a cluster, not isolated random wins.

## October 2 quantitative snapshot (historical)

The highest raw leverage-score functions at the time of analysis were:

1. `08008918` - 116 unique callers, 397 calls, 0x08
2. `08008910` - 86 callers, 384 calls, 0x08
3. `08008940` - 90 callers, 200 calls, 0x0C
4. `080D3BC0` - 122 callers, 508 calls, 0x28
5. `08008B6C` - 108 callers, 279 calls, 0x1C
6. `080088CC` - 45 callers, 105 calls, 0x08
7. `080088B8` - 58 callers, 61 calls, 0x0C
8. `08008920` - 78 callers, 222 calls
9. `08008F0C` - 96 callers, 431 calls, 0x54
10. `08050E50` - 34 callers, 144 calls, 0x0C
11. `080088D4` - 30 callers, 95 calls, 0x08
12. `080CE184` - 26 callers, 416 calls, 0x18
13. `0805E860` - 75 callers, 179 calls, 0x34
14. `08050DC8` - 39 callers, 68 calls, 0x10
15. `0805E824` - 56 callers, 159 calls, 0x2C

Do not interpret this table as an execution order. It is evidence for manual prioritization.

## Historical staged roadmap (completed stages retained as context)

### Phase 1: SpriteAnimator API

Completed five-function SpriteAnimator batch:
- 0805E824
- 0805E850
- 0805E860
- 0805E894
- 0805E8F0

Goal:
replace the 0x14-byte placeholder with proven fields/methods and propagate semantic knowledge into entity/actor code.

### Phase 2: central manager/accessor owner type

Trace:
- constructor/destructor/vtable around the object dereferenced by 080088xx/080089xx;
- subobjects at +0x24, +0x34, +0x8C, +0x494;
- how new-game, intro, renderer, and hardware callers use each returned pointer.

Then decompile/name the accessor cluster as one coherent unit.

### Phase 3: transfer/DMA abstraction

Recover and name:
- 08008F0C
- 08008E64
- 08008EB8
- closely related descriptor users/helpers

Goal:
replace repeated low-level transfer setup with a typed shared abstraction.

### Phase 4: common container/list and allocator infrastructure

Prioritize:
- 080098AC intrusive node/list base
- 080D3BC0 allocator wrapper
- related constructors/destructors

### Phase 5: resume subsystem-local renderer hard targets

Return to preserved:
- 080A5CC0
- 080A5DB8
- 080A5D14
- 080A58EC
- 080A5960
- 080A5760
- 080A4F50

At that point, shared animation, manager, and transfer types should make those functions easier to name and reason about.

## Target-selection rule for future agents

Before starting a new source unit:

1. Refresh or consult the function/TU database and ranked queue.
2. Prefer a coherent TU/type/similarity cluster over unrelated easy functions.
3. Check whether an already-exact family member can serve as a source-shape
   oracle.
4. Prefer work where recovered types are already strong and where the unit
   unlocks large unresolved callers/data.
5. Balance total bytes and leverage against known compiler difficulty.
6. Preserve hard local candidates instead of letting one function block the
   cluster.
7. Re-score after major shared types, classes, TUs, or runtime coverage are
   recovered.

Address adjacency remains valuable when it reflects a real TU, type family,
shared static data, or subsystem. It is not a rule to advance linearly through
ROM addresses.

## Historical SpriteAnimator batch state - October 2, 2026

This section preserves an intermediate 4/5 matching checkpoint. It is historical, not active work; SpriteAnimator was later completed, production-integrated, and documented in `docs/SPRITE_ANIMATOR.md`. The leverage-first choice was already validated at this checkpoint by matching progress:
- 5E824 body exact 0x2A / 0.
- 5E850 body exact 0x0E / 0.
- 5E860 exact 0x34 / 0 on the first natural class model.
- 5E894 v6 exact 0x5C size with only 6 differing bytes.
- At that checkpoint, 5E8F0 remained active; v3 was the best mismatch-count candidate at 104 differing bytes.

At that checkpoint, the recovered layout/API facts were tracked in `NEXT_AGENT_HANDOFF.md`, and production integration had not yet occurred.

## Historical SpriteAnimator progress update - 4/5 exact

The leverage-first batch is now 4/5 exact:
- 5E824 0x2A/0 body
- 5E850 0x0E/0 body
- 5E860 0x34/0
- 5E894 0x5C/0
- 5E8F0 was active; v15a/v15b had the best mismatch count at 98 bytes, 0xB2 vs retail 0xAC

At that historical checkpoint there was no production integration yet; the instruction was to finish 5E8F0 before recalculating global leverage priorities. That work is now complete.

### SpriteAnimator allocator-isolation update - October 2, 2026

At this historical checkpoint SpriteAnimator was the immediate priority and was 4/5 exact. `func_0805E8F0` had been isolated to a descriptor/count lifetime plus allocator-ordering problem rather than unknown high-level behavior. The batch was subsequently completed; do not resume it from this chronology.


Latest recovered GroundPickupState: +0x34C8..+0x34D7, 56 availability
bits and fifteen packed three-bit durability fields. Four exact functions
add 1,032 linked bytes. A1EA8 is parked. See docs/GROUND_PICKUP_STATE.md.
The +0x34D8 mask and +0x34DC actor state are already source-owned. Active throughput target: coherent repeated-small-function families; keep C6BC parked.
