# FoMT Matching Decomp Notes

## Active scope - October 6, 2026

The active goal is **throughput-first whole-game retail decompilation**.
Preserve the byte-identical US retail ROM on `main`, keep custom behavior in
the separate custom-game worktree, and prioritize inferred translation units,
structural/type clusters, repeated function families, shared class/data
ownership, and recoverable bytes per effort.

The legacy save loader `func_08011650` remains paused, with its experiments and
exact continuation preserved. Other documented compiler-sensitive islands stay
parked unless new structural evidence materially changes their leverage.

The unified remaining-function inventory/ranked queue is operational. Runtime
analysis should evolve into deterministic savestate/scripted coverage and
indirect-call collection rather than manual resource hunting.

Custom behavior still belongs only in the separate custom-game worktree.

## CURRENT DECOMP NOTE POLICY

Use `docs/DECOMP_PLAYBOOK.md` for the durable process and `START_HERE.md` for
live state. This file keeps subsystem/function evidence and matching lessons.

Current retail state:
- Active public retail branch: `main`; the former `Live-temp` line is retired. Historical `ches-dev` commits remain provenance only.
- Current exact progress: **73,280 / 940,036 = 7.7954% source** and **866,756 assembly bytes**. Data/assets reconstruction is **75,334 / 6,777,404 = 1.1115%** and overall meaningful-ROM reconstruction is **149,010 / 7,717,440 = 1.9308%**. `make progress` reports `fomt.gba: OK`; retail SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Remaining linked assembly functions: **2,329**; inferred function ranges cover **865,592 / 866,756 = 99.8657%**, with **1,164 unattributed bytes** and **17 explicitly parked functions**.
- Shared NPC identity/location/schedule support, all resident constructors, GameObject entity lookup/teardown, and the exact 43-entry metadata table remain complete.
- Packed-bank ownership remains **416 / 493 animations: 405 / 450 simple and 11 / 43 multi-frame**. The remaining 77 are a parked by-product lane.
- `func_08092A70`, `func_080455D8`, `func_080CAC7C` / `func_080CAD18`, `func_08092940`, and the documented Entity38740/Ball codegen islands remain parked at their recorded frontiers.
- Authoritative compiler remains the tracked 13-rule compatibility path, patch SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.
- The Entity38740/Entity398A4 neighborhood now owns exact source through `func_0803A8A0`, including `398A4`, `399C0`, `39A60`, `39DA8`, `39E18`, `39A30`, `39F50`, `3A144`, `3A320/334`, `3A350`, `3A798`, and the seven-helper `3A804..3A8A0` tail. `39E98`, `39F90`, `3A180`, and `3A394` are behavior-complete/bounded parked codegen islands. The logical map resolver at `0x0803A8A4` is now 652 bytes of exact source as `GetMapResourceId`; `docs/MAP_DATA.md` owns its stable logical/physical namespace and variant rules. Resource-owner provider/descriptor and 0xA0/0x46C owner layouts are now recovered in `docs/RESOURCE_OWNERS.md`. Four methods (AC78, ACD8, AE58, B0A8) are now source-integrated, adding 680 linked bytes. Final production-header targets, fresh isolated compiler/full-ROM build, production full-ROM build, symbol/input hashes and inventory audit all pass. Next assess the persistent statistics-state initializer/consumer family toward save-structure recovery. AB30 constructor source-shape work is parked at 316/217 versus 328; B128 update remains 382/2, with operand-commutation spelling closed.
- The opening-farm savestate/watchpoint work remains seed infrastructure for later scripted runtime coverage, not the primary queue.

Naming rule:
Use semantic names when evidence is strong. If identity remains unresolved, an honest address-derived name is acceptable for an otherwise fully exact retail contribution. Do not invent a semantic name merely to eliminate `func_*` or `unk_*`.

Recent reusable lessons:
- search for existing project types before duplicating a layout;
- declaration scope and value lifetime can control old-GCC allocation;
- pointer provenance/expression tree can change literal placement;
- independent frame/handle expressions and the birth order of a graphics-data pointer and size zero can preserve retail register lifetimes without forcing registers;
- distinguish true function bodies from following alignment bytes, while preserving both in the full-ROM gate;
- an inline client getter can preserve the interior-object pointer/value relationship while correcting a previously incomplete call ABI;
- preserving a small inline initializer can be required even when flattened assignments are semantically identical;
- shared object layout can often be introduced through inheritance without changing bytes when the original source shape is preserved;
- wrapper return contracts can be visible only in the epilogue;
- tiny C++ objects may have larger alignment than their meaningful byte fields;
- exact per-function bytes still require exact full-ROM integration and trusted toolchain provenance.

Project working notes for the public `main` decompilation line. Historical research chronology remains here, but upstream pull-request diffs should stay focused on contribution-facing files.

## October 4, 2026 — character table and narrowed enablement scope

The user explicitly deferred actual custom NPCs. Current work recovers retail
parts/data/interfaces needed for future characters. The 43-entry metadata is
now exact typed data in its own minimal TU: 344 bytes, no executable gain,
original aliases/name pointers/packed birthdays/padding preserved. A bounded
header declaration preserves the complete 956-byte identity-helper module.
V1 wrongly inserted after the file's first rodata section instead of the
existing after_cursed section. First difference was a relocated pointer at
0809BD44; V2 placement alone fixes every byte. Read the checkpoint's failure
record before reopening source/compiler hypotheses. Both forced ROMs now pass.

## October 4, 2026 — exact NPC support boundary

All five first credible candidates matched directly. Existing Location/Npc and
ScheduleInfo/PathInfo types capture the aggregate-return and packed-coordinate
ABI; a conditional ActorLocation initializer expresses both schedule branches.
The base declaration moved to `entity_npc.hh` without changing its existing
1,684 bytes. `#pragma interface` suppresses the already-owned base/concrete
vtables, and normal C++ constructor/vfunc symbols use linker aliases. Combined
source and whole-ROM proofs cover both methods, base code and all seams.
Stable interfaces/layouts belong in `docs/CHARACTERS.md`; exact artifacts and
private generator correction are in the dated checkpoint.

## October 3, 2026 — character expansion research and evidence corrections

Stable character/birthday/state/schedule/lifecycle facts now live in
`docs/CHARACTERS.md`; proposed design and acceptance criteria in
`docs/CUSTOM_CHARACTERS.md`; legacy writer/loader and extension contract in
`docs/SAVE_FORMAT.md`. Checkpoint `tools/ches/checkpoints/character-expansion-2026-10-03/`
contains reproducible current-ROM/source evidence. Retail code/source percentage
and custom-game source are unchanged.

Revalidation found two errors in the older Call233 research:

- `func_0803D7E4` has 32 applications **total**: 31 fixed records (IDs 1..29,
  33,34), plus the conditional child35. It does not have 32 fixed plus child.
- `AEntity` virtual +0x30 allocates its `UnknownEntityThing` effect. Lillia's
  0x48-byte NPC entity is allocated by `func_0801A8E0` case1 at 0801AEE4 and
  constructed by 08035AFC; its separate 0x8C-byte effect comes from 08035B38.
  `GameObject` virtual +0x30 is map height; the 0802CDCC call is not a factory.

The main factory initializes/looks up an indexed runtime domain distinct from
character metadata; selector43 is occupied. Direct metadata parsing also proves
184 display animation entries at 0852D984. Full expression mapping and import
workflow remain open. The old `CHARACTERS.md` description of an unknown second
word was stale: +4/+5 are birthday bytes and +6/+7 padding; the table itself is
still `.incbin`. No unproven registry or serialization scheme was promoted.

## Matching standard

The primary requirements are a byte-for-byte match with the US retail ROM and a
complete semantic understanding of the reconstructed code. A function is
considered decompiled only when the complete project rebuild passes
`make compare` / `sha1sum -c fomt.sha1` and its responsibilities, data,
callers, callees, fields, parameters, and return value have been investigated
well enough to name accurately.

The secondary goal is to reconstruct source that is as plausible as possible for the original project/compiler rather than merely coercing identical machine code. Prefer, in order:

1. Existing repository types, constants, idioms, and formatting.
2. Simple natural C/C++ source that produces the retail instructions.
3. Specific semantic names supported by call-site, data-flow, and ownership
   evidence, following the naming conventions already used by the repository.
4. Small compiler-shape accommodations only when necessary for agbcc matching.

Prefer meaningful semantic names when the evidence supports them. Continue
tracing callers, ownership, data flow, and neighboring types before naming.
However, do not invent certainty merely to remove an address-derived `func_*`
or neutral `unk_*` name. If the behavior and binary boundary are fully exact
but the higher-level identity remains unresolved, keep the conservative name,
document the proven behavior and open naming question, and preserve the
project's established naming/formatting style.

## Historical repository / ROM state (resource checkpoint; superseded by the top snapshot)

- Local branch: `ches-dev`. Contribution save: `0514b05ec4a1dbfab37f49a377e27163923d8429` (`0514b05 decompile resource subtree ranges and release`), committed, pushed to `ches/ches-dev`, and independently remote-verified. Index empty.
- Upstream baseline: `b8471ae` (`origin/main`).
- ROM SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; production 8,388,608-byte equality verified.
- At that checkpoint, twenty resource functions were exact at 6.3768% source. Both ROMs and 20 combined target proofs passed. This is preserved historical state; the authoritative current totals are at the top of this file.
- Shared entity state owns two 0x40-byte effects, rather than independent animation/padding fields. Each effect owns the proven animator at +0x28 and the four state bytes at +0x3C..3F.
- The byte reset zero must remain independent of a wider multi-set source-variable zero through both CSE passes. Quantity-level metadata, not the selected register alone, identifies that alias chain.
- Realistic combined-unit validation caught the nested-state union alignment and generated destructor vtable store. Correct packed ABI layout and an explicit destructor-flags boundary preserve all five bodies naturally.
- A typed table must not select unrelated `.rodata` emitted by `<new>`; its minimal translation unit keeps exactly 0x14 data bytes at the retail seam.
- All compiler/probe/integration evidence is saved in `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/`; historical compiler lookup remains in the Call238 index.

## October 3, 2026 - shared resource-handle boundary

Current extension: construction/acquisition, reference/query operations, root/order8 full resets, root/order9 partial ranges, root/order9/order8 release and entry initialization are recovered. Generation +0x922 and client first word retain their observed uninitialized boundary. Fill visits child0 then1; clear visits child1 then0. All20 functions and both ROMs are exact under unchanged13-rule compiler. Stable contracts: `docs/RESOURCE_HANDLES.md`; newest proofs: resource-subtrees checkpoint isolated/production-proof-v3.json. The original evidence below is historical where superseded.

Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.

- Owner layout is 0x92C: occupancy +0, entry pool +0x20, recursive 1024-unit allocation tree +0x824, active count +0x920, generation +0x922, client count +0x924, reserved start/size +0x928/+0x92A. Entries are eight bytes; free linking overlays their first word.
- Packed IDs contain an eight-bit entry index and sixteen-bit generation. Occupancy plus generation validation rejects stale IDs. Release returns a block and entry only on the last reference; Retain restores the old u16 count on overflow. Invalid start/order queries return -1/11.
- Natural C++ base destruction supplies the hidden deletion flags. An explicit manager null guard before `operator delete` preserves retail; the linker maps the retail name to the emitted destructor ABI symbol.
- Release's surviving index local belongs inside the occupied branch. `Matches` initializes its bool before generation extraction. These credible lifetime/expression choices make the methods exact without compiler changes.
- The old one-argument lookup declaration omitted a real r1 argument. Inline `UnkHandle::GetStart()` forwards both client and packed ID with exact caller bytes. Direct access from the outer object caused an extra reload and register rotation.
- Final flat typed proof is `candidate-flat-v15.cc` / `v15-flat/results.json`; isolated and production proofs are `isolated-proof-v16.json` / `production-proof-v17.json` in `tools/ches/checkpoints/resource-handles-08007874-2026-10-03/`. All five methods, three caller canaries, full ROM, 14 symbol addresses, and input hashes pass. Code coverage increases by 572 bytes; two ordinary alignment bytes belong to the operation section.
- Constructor remains 0x15C/5 at a PRE-created count/end-pointer allocation tie; acquisition is 0xD2/1 after excluding two alignment bytes. Preserve saved dumps and investigate those causes; do not repeat source permutation or existing-rule ablation families.

## September 30, 2026 - exact unified compiler-research breakthrough

- Production remains unchanged at contribution HEAD `ddf0296`. `GetWaterRegion / func_080A45A8` and `IsFootprintOnWaterSurface / func_080AC5D0` remain retail assembly. The results below are isolated compiler-research proofs, not production integration.
- Terrain is now exact in the isolated compiler. `terrain-mech-temp_copy_shift.cc` with `AGBCC_CSE_KEEP_MINUS8_COPY=1`, `AGBCC_COMBINE_KEEP_MINUS8_REG_COPY=1`, and `AGBCC_RESTORE_COMBINE_COPY_REFS=1` produces **164/0**. Artifact `artifacts/terrain-targeted-three-way.mismatch.txt` records `size=0xa4`, `differing_linked_bytes=0`; diff is empty.
- This closes the old staged 164/3 frontier. The measured mechanism is CSE/combine preservation of the distinct `y - 8` pseudo/copy plus restoration of combine-eliminated copy reference accounting before allocation. The targeted `-8` rules are exact diagnostic evidence, not yet a historically proven general rule.
- Water is also exact in the same isolated compiler. Natural getter-aware `rxyim.cc` with `AGBCC_CSE_KEEP_FIRST_78=1`, `AGBCC_CSE_CHAIN_WATER=1`, `AGBCC_CSE_REORDER_WATER_TABLE=1`, and `AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE=1` produces **168/0**. Artifact `artifacts/water-structural-reorder-verify.mismatch.txt` records `size=0xa8`, `differing_linked_bytes=0`; diff is empty.
- The final water-table reorder no longer uses hard-coded RTL instruction UIDs; it recognizes the map halfword-load/bitfield-shift pattern and `gUnk_0810563C` table literal structurally. It remains FoMT/water-specific research logic.
- Unified candidate with all seven switches passes `full-flow-regression/structural_reorder_combined_results.tsv`: **54/54 exact C++ modules, every diff 0**, including `src/code_0800BC58.cc` and mutable-r0 canaries.
- Exact water roles remain result=`r8`, x=`r5`, y=`r3`, index=`r4`, map=`r7`, stable=`r6`, moving=`r2`, offset=`r1`, common=`ip`. Existing packed Location storage remains unchanged.
- Historical compiler archaeology remains strongly bounded: recovered agbcc, coherent May-2000 `arm-000512`, real Oct-2003 Nintendo THUMB, May-2000 C frontend, stock GCC 2.7.2.3, EGCS 1.1.2, GCC 2.95.3, and GCC 2.96 do not naturally solve both targets.
- Exact next work is compiler reconstruction/generalization, not source hunting: recreate the final scratch patch set from a clean isolated tree, replace targeted diagnostics with coherent/historically defensible behavior where possible while preserving terrain 164/0 + water 168/0 + 54/54, then run wider/full-ROM validation. Dedicated compiler-research note: `docs/FOMT_COMPILER_RESEARCH.md`; authoritative anti-rediscovery map: `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`.

## September 28, 2026 - Call238 water allocator / table-ancestry consolidation

- Production remains unchanged at contribution HEAD `ddf0296`; both hard targets remain retail assembly. Call238 work is private research under `tools/ches/` plus isolated compiler clones under `/mnt/data/Github/`.
- The water behavior is no longer in doubt: signed x/y are divided by 8 with truncation toward zero, eight 24-byte records at `gUnk_0810563C` are scanned in order, map and inclusive bounds are checked, and the first matching region id is returned or 7.
- Existing packed Location storage is supported by exact binary evidence. Changing stored y to a 32-bit-base bitfield breaks exact `AEntity::GetLocation()`, so do not change the shared storage declaration. A private accessor-return hypothesis (`GetMap()->u16`, `GetY()->int`, `GetX()->i16`) with storage unchanged survives checks against exact getter consumers and improves the direct-array water candidate to 172 bytes / 102 linked-byte differences.
- Allocator tracing in an isolated rebuilt `agbcp` proves the accessor/API effect is causal: x and index live lengths cross old GCC's allocation-priority threshold, moving x into retail `r5`. The canonical compiler is unchanged.
- The strongest structural control is the direct indexed-array source with known pseudos forced to retail hard registers only in the isolated compiler. With those assignments, coordinate extraction and nearly the entire loop body become retail-shaped. The decisive remaining mismatch is the table-address copy graph. Retail wants `table -> r6 stable/left base -> r2 moving record -> ip common alias`; the direct candidate creates the common table base first and derives stable/moving copies as siblings, costing an extra setup instruction.
- Exact-size 168-byte diagnostic families are not automatically better. Map/region getter and declaration-order variants can naturally recover x=`r5`, map=`r7`, result=`r8`, and stable base=`r6`, but their bottom check folds into `[moving_record + 16]` instead of retail's explicit `common_base + byte_offset + 16` path. Predicate helpers can reduce raw mismatch counts but materialize booleans and branch patterns absent from retail.
- All 120 separate declaration/assignment-order permutations are byte-for-byte identical to their corresponding declaration-order binaries. Old GCC completely canonicalizes that source distinction here.
- Call238 also closed ordinary loop spellings, `register` qualifiers, scalar-width variants, map staging, index-expression casts, table-bound signedness, pointer/reference aliases, table-layout variants, record/table helpers, inline bottom accessors, nested rectangle/point subobjects, and broad getter-subset combinations. None recovers the retail ancestry while preserving the direct compare structure.
- Genuine GCC 2.96 / early-GCC-3 ARM C++ was reconstructed from the pristine 20000731 snapshot plus the validated Golden Sun ARM backend and independently rejected: the unchanged water candidate becomes 132 bytes, and already-exact `AEntity::GetLocation()` changes from 144 to 140 bytes. The recovered FoMT `agbcp` backend was traced to a mixed early-2000s source set; the official October-2003 Nintendo THUMB `cc1plus` remains an external compiler lead but should not block source reconstruction.
- Current exact retail roles remain result=`r8`, x=`r5`, y=`r3`, index=`r4`, map=`r7`, stable base=`r6`, moving record pointer=`r2`, byte offset=`r1`, common secondary base=`ip`.
- Next action: stop broad syntax permutations. Keep the direct indexed-array candidate as the structural control and investigate source/RTL forms or compiler-CSE ancestry that make the original table address belong to the stable/left path first, then derive the moving record and common alias, while preserving the indexed bottom path. Look for analogous exact FoMT C++ patterns before inventing new abstractions.

## September 27, 2026 - external agbcc allocator cross-check

- pret/agbcc PR #91 adds opt-in `AGBCC_TRACE_ALLOC` diagnostics that print hard-register assignments and allocator priority inputs including `live_length`, `n_refs`, and call crossings. The PR reports byte-identical code generation with tracing enabled or disabled. Use this only in an isolated research compiler copy, not by modifying FoMT's canonical compiler.
- Klonoa: Empire of Dreams decomp issue #92 documents two GBA near-matches blocked by agbcc register allocation after register pinning, declaration-order, and separate-variable attempts. This is close precedent for FoMT terrain's 164-byte / 3-linked-byte plateau and supports treating that plateau as allocator/source-shape limited unless contrary evidence appears.
- FoMT's ordinary C++ build uses `agbcp -O2` and does not enable `-funsigned-bitfields`. GCC documents plain `int` bitfields as signed by default, so Call237's `int y : 16`-class 102-difference water candidate is a credible historical declaration hypothesis rather than an arbitrary trick.
- This does **not** prove `Location::y` should change in `include/actor.hh`. Require independent exact-function evidence for x/y/map representation before touching the shared header.
- pokefirered provides a useful declaration-level precedent: a logically bitfield-shaped value is deliberately represented as a raw byte because the obvious bitfield/cast form does not match retail code. Binary/compiler evidence takes priority over aesthetic type reconstruction.
- Exact next action: trace the Call237 103 baseline versus 102 y-base-type diagnostic and identify the precise pseudo lifetime/reference/allocation change that moves x from r6 to retail r5. Then use measured allocator properties to target y=r3, index=r4, map=r7, stable table base=r6, offset=r1, moving pointer=r2, and alias=ip.

## September 22, 2026 — discard handler and terrain/water data

- `3a5e0ee`: `func_0801EE00` is now 844 bytes of exact C++ in `src/game_object_discard.cc`. Removing inherited register bindings fixed spill-pool and lifetime mismatches. Shared inline `CreateDiscardEffect` fixed constructor argument scheduling without compiler changes; existing `SmartPtr` preserves cleanup behavior.
- `98eaff2`: `include/terrain.hh` exposes the already-proven descriptor fields and 12-byte terrain view; `include/water_region.hh` and `src/data_water_regions.cc` expose eight inclusive rectangles at 0x0810563C (192 bytes). Exact data ends at 0x081056FC; the trailing 12 raw bytes retain their original placement.
- Terrain bitfield semantics reuse the existing code proofs in `tools/ches/map_warp_map.json`, particularly `proven_at_call20` and `call50_checkpoint`: bits 2..16 are movement-contact script IDs; bits 17..31 are front-tile A-button interaction script IDs. They do not directly encode warp destinations. Bit 1 water-surface interpretation was already established in the previous held-item work.
- Two incomplete functions remain assembly. `func_080AC5D0` best natural candidate is the correct 0xA4 bytes but differs by 3 register-selection bytes. `func_080A45A8` natural flat-table candidate is 0xAC vs 0xA8 bytes and differs by 107 bytes. Reject the fixed-r7 map-in-loop trial: its generated loop repeatedly shifts the already-extracted map value, so it is semantically wrong even though its size is closer.
- Full build/compare, SHA1, ROM size, progress accounting, and diff checks passed; no emulator/gameplay test. Next batch Call236 begins with the 3-byte terrain mismatch. Complete evidence and candidate paths: `tools/ches/checkpoints/call235/checkpoint.md`.
- Current resume prompt: `tools/ches/NEXT_AGENT_HANDOFF.md`. This status supersedes historical entries below. Save a new checkpoint after each coherent unit and before context is lost.

## Local contribution commits

- `55cd071` fix calcrom progress accounting
- `7206c3e` decompile actor payload setters
- `54e85a2` decompile actor state reset
- `68f2d12` decompile actor state initializer
- `ee7222c` decompile cursed tool state helpers
- `5f8af3f` decompile cursed tool completion checks
- `14a5f99` decompile cursed tool progression start
- `0d57cc9` decompile cursed tool progression counter
- `a295e33` decompile cursed tool progression wrappers
- `f5d7d43` decompile tool state reset
- `9c4dac2` decompile tool state bit check
- `e7ee556` decompile persistent map stamp descriptor lookup
- `ce7e014` decompile persistent map stamp mask helpers
- `b7809b2` decompile held item action classifier
- `d4ef6ba` name held item water surface check
- `3a5e0ee` decompile discarded item handler
- `98eaff2` reconstruct terrain layout and water region data

Each contribution commit above was rebuilt against the owned retail ROM before commit. The helper docs (`README.md`, `START_HERE.md`, `docs/`, `tools/ches/`) must remain outside contribution commits.

## Cursed-tool state: proven layout

Strong behavioral evidence now supports an 18-byte state with six tool-family slots:

| Offset | Length | Proven behavior |
| --- | ---: | --- |
| `0..5` | 6 | active cursed-tool state / progression enabled flag |
| `6..11` | 6 | completed/blessed flag |
| `12..17` | 6 | progression counters |

The six indices map through `func_0809C22C`:

0. cursed sickle (`TOOL_CURSED_SICKLE`, id 5)
1. cursed hoe (`TOOL_CURSED_HOE`, id 13)
2. cursed axe (`TOOL_CURSED_AXE`, id 21)
3. cursed hammer (`TOOL_CURSED_HAMMER`, id 29)
4. cursed watering can (`TOOL_CURSED_WATERING_CAN`, id 37)
5. cursed fishing rod (`TOOL_CURSED_FISHING_ROD`, id 45)

This is a proven storage/behavior model, but it is not yet proof that the original source used a named `CursedToolState` struct. Keep raw/conservative signatures until surrounding ownership evidence supports a structural refactor.

## Decompiled helper semantics

### `func_0809C144`
Zeros all 18 bytes of the cursed-tool state.

### `func_0809C160`
Returns whether a `Tool` is one of the six cursed tools.

### `func_0809C22C`
Maps cursed tool id to family index `0..5`.

### `func_0809C304`
Returns active-state byte for a cursed tool id.

### `func_0809C318`
Returns completed/blessed byte for a cursed tool id.

### `func_0809C32C`
Returns true when every tool family has either its active state or completed/blessed state set.

### `func_0809C38C`
Returns true when all six completed/blessed flags are nonzero.

### `func_0809C3BC`
Starts progression for a family if inactive: sets active byte to 1 and initializes that family's counter from the previous active value (zero in the entry path).

### `func_0809C3E0`
Progression counter update. If the family is active, compare `count[index]` against `gUnk_081036C0[index]`. Increment while below the threshold. Once the threshold has already been reached, clear active, set completed/blessed, and return 1. Otherwise return 0.

Important matching lesson: the natural expression

```cpp
if (*count < gUnk_081036C0[index])
    ++*count;
```

produced the retail load/order behavior. The exact match also currently uses a fixed `r5` result variable (`register unsigned int result asm("r5")`) because agbcc otherwise chose the wrong callee-saved register. Do not generalize fixed-register locals unless demonstrated necessary.

### `func_0809C420`
If a family is active and the family index is 0 or 3, resets its progression counter to zero.

### `func_0809C444`
For active family index 0 or 3, applies `func_0809C3E0` and returns its completion result.

### `func_0809C474`
For an active family:
- index 1 or 4: applies `func_0809C3E0` and returns completion result.
- index 0 or 3: calls `func_0809C420` to reset its counter.

### `func_0809C4B4`
For active family index 5 or 2, applies `func_0809C3E0` and returns its completion result.

### `func_0809C4E4`
Zeros one 32-bit state word.

### `func_0809C4EC`
Previously stored in asm only as raw `.byte` data, with no public symbol. Now matched as a helper that checks a bit index up to 13 and returns the inverse of whether the corresponding bit is set. For indices above 13 it returns 1. Exact behavior:

- initialize `result = 0`
- for `index <= 13`, derive mask `1 << (index & 31)` and canonicalize `(*self & mask) != 0` to 0/1
- return `1 ^ result`

The descriptive meaning of this bitfield is not yet proven; retain the conservative numeric function name.

## `func_0809C510` — matched descriptor lookup

Commit: `e7ee556` (`decompile persistent map stamp descriptor lookup`).

Retail range: `0x0809C510..0x0809C5B4` (164 bytes), now reproduced exactly from C++.

### Proven interface/behavior

The matching source establishes this concrete behavior:

- `r0`: destination for three 32-bit output words; the same pointer is returned.
- `r1`: pointer to a 32-bit state mask.
- `r2`: descriptor index.
- `r3`: selector narrowed to `u8`.
- Indices `0..13` participate in the bit mask.
- `gUnk_081036D4` is indexed in 12-byte strides.
- Each normal descriptor contributes:
  - a 32-bit value at offset `+0` for the clear/off state,
  - a 32-bit value at offset `+4` for the set/on state,
  - byte values at offsets `+8` and `+9`, widened to the output words at `+4` and `+8`.
- For descriptor index 13 with selector nonzero, the normal first word is replaced by the address of `gUnk_08107094` when the bit is clear and `gUnk_081070AC` when the bit is set; the two byte fields still come from descriptor 13.
- For a normal set bit, output word 0 comes from descriptor `+4`.
- For a normal clear bit, output word 0 comes from descriptor `+0`.

The table therefore has strong evidence for fourteen 12-byte descriptor entries, but the original semantic type/name is still unknown. `persistent map stamp descriptor` is a useful working description used in the commit message, not a claim that this was the original developer's identifier.

### Matching lesson

A natural reconstruction got very close but not byte-exact. The exact source required the three common-store locals to be fixed to the ABI registers used by the retail compiler:

```cpp
register u32 data asm("r0");
register u32 x asm("r1");
register u32 y asm("r2");
```

It also required building the normal set-state data pointer from `base + 4` before adding the `index * 12` offset. With those compiler-shape details, the function matched all 164 bytes and preserved the following function boundary at `0x0809C5B4`.

This is exactly the kind of register forcing that should remain local and evidence-driven: prefer ordinary source first, use fixed registers only when the retail code proves agbcc needs that shape.

## `func_0809C5B4` through `func_0809C5F4` — matched state-mask helpers

Commit: `ce7e014` (`decompile persistent map stamp mask helpers`).

These four helpers operate on the same 32-bit state word used by `C510`:

### `func_0809C5B4`
For `index <= 13`, set bit `index`. Higher indices are ignored.

### `func_0809C5D0`
For `index <= 13`, clear bit `index`. Higher indices are ignored.

### `func_0809C5EC`
Clear the entire 32-bit state word.

### `func_0809C5F4`
Return whether the state word is nonzero.

Together with `func_0809C4EC`, this proves a 14-bit logical domain in the low bits of the word. What the fourteen entries represent in gameplay is not yet sufficiently proven for authoritative naming.

Call-site evidence already found:

- game-state offset `0x34D8` is initialized/reset with `func_0809C4E4` / `func_0809C5EC`.
- game-state copy logic copies this field as one 32-bit word.
- `func_0801DDCC` sets one indexed bit then calls `func_080AA850` with the same index.
- `func_0801DDF8` clears one indexed bit then calls `func_080AA850` with the same index.
- `func_080AA850` uses `func_0809C510` to materialize a 12-byte three-word descriptor that is forwarded to `func_080A5BD8`.

The wrappers live in a vtable-driven area, so direct static callers are not expected to appear as ordinary `bl func_0801DDCC` / `bl func_0801DDF8` references.

## 2026-09-20: farmer held-item action classifier

Commit: `b7809b2` (`decompile held item action classifier`).

Retail range `0x0802A7E0..0x0802AA84` is now reproduced exactly as
`FarmerEntity::ClassifyHeldItemAction` in
`src/farmer_entity_item_action.cc`. The full ROM still matches SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

The result enum is now understood as:

- throw the held item,
- perform its contextual interaction,
- block the action,
- use the Ball-specific throw path.

The classifier preserves distinct handling for wrapped gifts, the Ball,
Stones, Branches, Lumber, Golden Lumber, terrain placement, and the
GameObject article-interaction virtual slot at runtime `+0xE8`. Dog, chicken,
and Basket placement all validate the same 14-by-9 footprint in front of the
farmer. The typed `GameObject` declaration still stops at `+0x68`; accounting
for the GCC vtable header, the base GameObject `+0xE8` slot is the vtable word
at label `+0xF0`, currently Thumb pointer `0x0801CFB9` / target `0x0801CFB8`.
This is the active item-lane interface to recover and type.

Held-item discriminator values are now named `KIND_FOOD`, `KIND_ARTICLE`,
`KIND_DOG`, `KIND_CHICKEN`, `KIND_BASKET`, and `KIND_SPRITE`. Evidence for
the Basket mapping includes entity `0x4A` using the kind-4 pickup path,
while adjacent entity `0x4B` becomes Article `0x35`, the Ball. The final
kind stores a sprite identifier that is passed directly to the held-item
sprite setup routine; it is used for scripted/direct visual displays.

The matching source required a local `HeldItemInteractionBox` constructor.
Its right edge uses an `r0` register variable and an empty compiler constraint
to reproduce the retail instruction choice. Replacing it with the repository's
general `Box` constructor was semantically equivalent but left three differing
bytes. This compiler-shape accommodation is local to the matched function.

Later terrain and thrown-Ball tracing proved that `func_080AC5D0` accepts only
footprints whose sampled terrain descriptors all carry the water-surface bit.
The classifier declaration now uses the semantic name
`IsFootprintOnWaterSurface`; this is a source-only rename and preserves the
byte-identical ROM.

## Next boundary: `func_0809C600`

No C/C++ conversion has been attempted at this checkpoint.

Retail assembly initially shows a compact structure with:

- a 32-bit count at offset `+0`,
- 16-bit elements beginning at offset `+4`,
- capacity behavior consistent with at most three elements (`count <= 2` before append),
- `func_0809C600` searching before appending a `u16`,
- `func_0809C644` searching before removing a `u16` and shifting later bytes with `memmove`,
- a separate 16-bit field at offset `+0xC`, tested by `func_0809C694`, assigned by `func_0809C6AC`, and reset to `0xFFFF` by `func_0809C6B0`.

This strongly resembles a tiny unique/bounded `u16` collection plus an independent sentinel-backed `u16` property, but that is **not yet proven semantics**. Before naming a type or methods, inspect `func_080E3DB4`, `func_080E3E28`, all callers/owners of `C600..C6B0`, construction/reset paths, and adjacent functions beginning at `C6BC`.

## Style / naming rules for this effort

- Match repository conventions first; do not modernize for aesthetics.
- Keep `func_XXXXXXXX` / `gUnk_XXXXXXXX` names until semantics are supported by multiple independent clues or existing project terminology.
- Prefer existing enums such as `TOOL_CURSED_*` over numeric literals once the mapping is proven and exact matching survives.
- Do not add speculative source comments as facts.
- Research notes may state hypotheses, but label them clearly.
- A clean readable source form is preferred over register forcing when both match.
- Never sacrifice ROM identity for readability.
- Contribution commits contain only intended source/asm changes; private helper documentation remains uncommitted.

## 2026-09-16: game-state +0x214C interaction/native-call state object

The state cluster beginning at game-state +0x214C is a larger object and must not be conflated with the independent persistent map-stamp mask at +0x34D8.

The head of the +0x214C object is now proven by exact decompilation:

- +0x00: u32 count for a fixed-capacity collection containing at most three u16 values.
- +0x04, +0x06, +0x08: the three u16 collection slots.
- +0x0C: separate u16 sentinel-backed value; reset/constructor value is 0xFFFF.
- func_0809C600 inserts a u16 only when it is not already present and count <= 2.
- func_0809C644 removes a matching u16, compacts later entries with memmove, and decrements count.
- func_0809C694 compares the separate +0x0C value with a u16 argument.
- func_0809C6AC assigns +0x0C.
- func_0809C6B0 resets +0x0C to 0xFFFF.
- func_0809C6BC constructs/resets the larger +0x214C object; it clears count, resets +0x0C, and initializes many later packed fields.
- func_080D44D4 copies this larger object as part of game-state copying; the next top-level game-state field starts at +0x21CC, so this object occupies the +0x214C..+0x21CB region (0x80 bytes).

Native script-call dispatcher relationship:

- func_08048FFC receives a native callable ID in r8.
- It evaluates func_0804590C before and after dispatching the callable.
- For a selected set of callable IDs, when the returned state changes to 1 it inserts the FoMT internal callable ID into the +0x214C three-entry u16 collection with func_0809C600.
- When the state changes to 0 or 2 it removes that callable ID with func_0809C644.
- Therefore the collection is specifically tracking selected native callable IDs whose func_0804590C state has transitioned to 1. The exact semantic meaning of func_0804590C's 0/1/2 states is still not proven; do not rename this as an event-ID list yet.
- Mary confirms these are native callable IDs used by the event-script VM, not bytecode opcodes. Mary library names can contain MFoMT-style numeric suffixes that differ from FoMT's internal callable ID, so always distinguish the FoMT internal ID from a Mary function-name suffix.

The separate +0x0C sentinel value is used by bachelorette/player/rival event logic and at least one entity path, but its precise domain name is still uncertain. Keep func_0809C694/6AC/6B0 generic until stronger evidence exists.

Exact contribution commit for the five head methods: 8c52b9f (`decompile interaction state id helpers`).

## 2026-09-16 — Batch 4 checkpoint: +0x214C state and statistics helper family

### Transport / execution note
- The original attempted Batch 4 Call 9 produced no result and is treated as **not executed**.
- Replacement Call 9 wrote and returned `/tmp/fomt-batch4-call09.executed`, proving the replacement command really ran.
- Repository remained at contribution commit `8c52b9f` and the ROM stayed SHA1-exact.

### Hard source-placement barrier at `func_0809C6BC`
- `src/code_actor_0809BFE8.cc` currently ends at `func_0809C6B0`.
- `asm/code_actor_0809BFE8.s` currently begins at `func_0809C6BC`.
- Makefile links all C/C++ objects before asm objects (`ALL_OBJS := $(C_OBJS) $(CXX_OBJS) $(ASM_OBJS) ...`).
- Therefore any later helper moved from this asm file into `src/code_actor_0809BFE8.cc` before C6BC itself is moved will be emitted starting at the current C++ boundary `0x0809C6BC` and reorder the ROM.
- Consequence: although several later helpers now have exact C++ reconstructions, they cannot be banked independently until `func_0809C6BC` is replaced (or the contiguous barrier through them is otherwise removed). Do **not** commit the later helpers out of order.

### `func_0809C6BC` structural evidence
- Retail extent: `0x0809C6BC..0x0809CD78` = `0x6BC` bytes.
- Function returns `self` in r0.
- Called by both game-state initialization paths on game-state `+0x214C`.
- Object extent remains exactly `0x80` bytes (`+0x214C..+0x21CB`), followed by next object at `+0x21CC`.
- Head remains strongly consistent with `FixedVec<u16,3>`-like layout:
  - `+0x00` u32 count, initialized 0
  - `+0x04/+0x06/+0x08` three u16 values
  - `+0x0A` alignment/padding
  - `+0x0C` independent u16 marker, initialized `0xFFFF`
- Constructor initializes/clears dense packed fields from `+0x0E` through `+0x7F`, frequently preserving unrelated bits in shared storage units rather than simply memset(0).
- Direct game-state access covers essentially every byte from `+0x0E` through `+0x7F`, confirming this is a large packed-state aggregate, not unused padding.
- Existing repo code commonly uses C++ bitfields, including cross-byte packed fields; C6BC and copy helper `func_080D44D4` show the same compiler-style mask/merge behavior.
- `func_080D44D4` is the strongest template for reconstructing the exact field boundaries: it copies the `+0x214C` object field-by-field/bit-by-bit and uses the same masks seen in C6BC.
- Repeated mask constants shared among constructor/copy/direct access include:
  - `0xFFFE7FFF` (clear bits 15..16)
  - `0xFFFFFE7F` (clear bits 7..8)
  - `0xFFFC3FFF` (clear bits 14..17)
  - `0xFFFFFE3F` (clear bits 6..8)
  - `0xFFFC7FFF` (clear bits 15..17)
  - `0xFFFFC03F` (clear bits 6..13)
  - `0xFFC03FFF` (clear bits 14..21)
  - `0xFFFFF87F` (clear bits 7..10)
  - `0xFFFFFE01` (clear bits 1..8)
  - `0xFFFFFC7F` (clear bits 7..9)
- Similar masks appear in many game-state field accessors, supporting the packed-field interpretation.
- Keep semantic names conservative until those accessor groups are mapped to game concepts.

### Statistics helper family at game-state +0x2C80
Callers and constructors show `func_0809CD78` operates on game-state `+0x2C80` (`0xB2 << 6`), separate from the +0x214C packed state.

Strong inferred layout:
- 59 entries (`index 0..58`)
- each entry = two u32 values, 8 bytes total
- first u32 behaves as a count, saturating at 1,000,000,000
- second u32 stores a maximum/high-water value
- helper `CDCC` checks indices 8..58 all have nonzero count
- helper `CDEC` sums counts for indices 8..58 with saturation at 1,000,000,000

Exact C/C++ shapes discovered but **not yet bankable because C6BC is still asm**:

`func_0809CD78` (32 bytes exact): natural form is sufficient and return type must be pointer/self:
```cpp
EC u32 * func_0809CD78(u32 * self)
{
    u32 * current = self;
    int index = 58;
    do
    {
        current[0] = 0;
        current[1] = 0;
        current += 2;
        --index;
    } while (index != -1);
    return self;
}
```

`func_0809CD98` (52 bytes exact): a clean no-asm form matches when second-field base is expressed separately:
```cpp
EC bool func_0809CD98(u32 * self, unsigned int index, u32 value)
{
    bool result = false;
    unsigned int offset = index << 3;
    u32 * count = (u32 *)((u8 *)self + offset);
    if (*count <= 999999999)
        *count = *count + 1;
    u32 * second = self + 1;
    u32 * maximum = (u32 *)((u8 *)second + offset);
    if (value > *maximum)
    {
        *maximum = value;
        result = true;
    }
    return result;
}
```

`func_0809CDCC` (32 bytes exact):
```cpp
EC bool func_0809CDCC(u32 const * self)
{
    bool result = true;
    for (unsigned int index = 8; index <= 58; ++index)
        if (self[index * 2] == 0)
            result = false;
    return result;
}
```

`func_0809CDEC` (48 bytes exact):
```cpp
EC u32 func_0809CDEC(u32 const * self)
{
    u32 result = 0;
    for (unsigned int index = 8; index <= 58; ++index)
    {
        result += self[index * 2];
        if (result > 999999999)
            result = 1000000000;
    }
    return result;
}
```

`func_0809CE1C` (8 bytes exact), pointer-arithmetic form:
```cpp
EC u32 func_0809CE1C(u32 const * self, unsigned int index)
{
    index <<= 3;
    return *(u32 const *)((u8 const *)self + index);
}
```

`func_0809CE24` (12 bytes exact):
```cpp
EC u32 func_0809CE24(u32 const * self, unsigned int index)
{
    index <<= 3;
    self += 1;
    return *(u32 const *)((u8 const *)self + index);
}
```

`func_0809CE7C` (16 bytes exact):
```cpp
extern u32 gUnk_08103A18[];
EC u32 func_0809CE7C(void const *, unsigned int index)
{
    return gUnk_08103A18[index];
}
```

### `func_0809CE30`
- Semantics are clear: for input index values 0x35..0x3A, returns `{0xFC,0xF9,0xFE,0xFD,0xFA,0xFB}` respectively; outside range returns 0xFC.
- Retail is a jump-table switch.
- Many natural switch forms reach a very close compiler shape but none tested so far are byte-exact.
- Best structural candidate explicitly includes `case 0x35` and default mapping to 0xFC; generated jump-table ordering/layout still differs.
- Do not use matching hacks yet. Revisit after C6BC barrier is solved, when neighboring placement/literal-pool effects can be tested in final context.

### Next batch priority
1. Reconstruct a provisional packed C++ struct for `+0x214C` using `func_080D44D4` as the authoritative field-boundary map.
2. Generate constructor assignments/default member values matching C6BC semantics.
3. Test C6BC as one contiguous C++ replacement, iterating on compiler shape.
4. Once C6BC is exact, immediately bank the already-exact CD78/CD98/CDCC/CDEC/CE1C/CE24/CE7C helpers in address order and then finish CE30.

<!-- CHES_PACKED_NAMESPACE_CORRECTION_BEGIN -->
### Packed-state namespace correction

The numeric IDs in the packed setter map are **generic action selectors** consumed by `func_08048FFC`. Scripts reach those setters through `CALL 0x03E`, with the selector below the companion value on the VM stack. A direct script `CALL 0x0FB`, for example, enters callable case `0x0FB` in `func_0803F8DC` and is a different operation. Thus the historical counts `0x0FB = 1013` and `0x0FC = 182` describe direct callable usage only; corrected proven generic setter usage is `0x0FB = 3` and `0x0FC = 3` constant-selector calls.
<!-- CHES_PACKED_NAMESPACE_CORRECTION_END -->

<!-- CHES_NATIVE_PACKED_MAP_BEGIN -->
## Native script ↔ packed game-state map (verified structural seed)

This section is private reverse-engineering guidance. It maps native script callable IDs to exact bytes inside the 0x80-byte object at game-state `+0x214C`. Mary names are hints only unless separately proven. Constructor-preserved does **not** mean padding: assignment/copy evidence shows some preserved bits are live fields.

| Native ID | Mary hint | Packed byte | Game-state byte | Retail script usage | Evidence |
|---:|---|---:|---:|---:|---|
| `0x0DC` | `Proc0DF` | `+0x22` | `+0x216E` | 1 CALLs | `ldr r2, .L0804ADB0 @ =0x0000216E` |
| `0x0DD` | `Func0E0` | `+0x22` | `+0x216E` | 2 CALLs | `ldr r2, .L0804ADD0 @ =0x0000216E` |
| `0x0DE` | `Func0E1` | `+0x23` | `+0x216F` | 3 CALLs | `ldr r2, .L0804ADFC @ =0x0000216F` |
| `0x0F8` | `Proc0FB` | `+0x2A` | `+0x2176` | 3 CALLs | `ldr r2, .L0804B138 @ =0x00002176` |
| `0x0F9` | `Func0FC` | `+0x2A` | `+0x2176` | 1 CALLs | `ldr r2, .L0804B158 @ =0x00002176` |
| `0x0FA` | `Func0FD` | `+0x2A` | `+0x2176` | 1 CALLs | `ldr r2, .L0804B178 @ =0x00002176` |
| `0x0FB` | `Func0FE` | `+0x2A` | `+0x2176` | 1013 CALLs | `ldr r2, .L0804B198 @ =0x00002176` |
| `0x0FC` | `Proc0FF` | `+0x2A` | `+0x2176` | 182 CALLs | `ldr r2, .L0804B1B8 @ =0x00002176` |
| `0x1A9` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804C698 @ =0x000021CA` |
| `0x1C3` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804C98C @ =0x000021A6` |
| `0x1C4` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804C9AC @ =0x000021A6` |
| `0x1C5` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804C9CC @ =0x000021A6` |
| `0x1C6` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804C9EC @ =0x000021A6` |
| `0x1C7` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804CA00 @ =0x000021A6` |
| `0x1C8` | `—` | `+0x5A` | `+0x21A6` | 0 CALLs | `ldr r2, .L0804CA20 @ =0x000021A6` |
| `0x244` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D944 @ =0x000021CA` |
| `0x245` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D964 @ =0x000021CA` |
| `0x246` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D984 @ =0x000021CA` |
| `0x247` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D9A4 @ =0x000021CA` |
| `0x248` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D9C4 @ =0x000021CA` |
| `0x249` | `—` | `+0x7E` | `+0x21CA` | 0 CALLs | `ldr r2, .L0804D9D4 @ =0x000021CA` |
| `0x24A` | `—` | `+0x7F` | `+0x21CB` | 0 CALLs | `ldr r2, .L0804D9EC @ =0x000021CB` |
| `0x24B` | `—` | `+0x22` | `+0x216E` | 0 CALLs | `ldr r2, .L0804DA0C @ =0x0000216E` |
| `0x24C` | `—` | `+0x22` | `+0x216E` | 0 CALLs | `ldr r2, .L0804DA50 @ =0x0000216E` |

### Constructor-preserved fields already distinguished

- `+0x2A.b0` (game-state `+0x2176.b0`) is a **live preserved field**: `func_080D44D4` explicitly extracts/copies it.
- `+0x5A.b2..b6` (game-state `+0x21A6.b2..b6`) are **live preserved fields**: `func_080D44D4` explicitly transfers all five bits.
- `+0x22.b7 .. +0x23.b3` (game-state `+0x216E.b7 .. +0x216F.b3`) remain **reserved/padding candidates**, not proven padding.
- `+0x7E/+0x7F` tail bits need field-by-field copy/accessor confirmation before assigning semantics.

Use these offsets as patch/hook landmarks, not semantic names, until handler behavior and game use agree.
<!-- CHES_NATIVE_PACKED_MAP_END -->

<!-- CHES_MODDING_PLAYER_SYSTEMS_BEGIN -->
## Player systems modding landmarks

- `Rucksack` is addressed at **game-state `+0x1C38`** throughout native/script handlers (`Upgrade__8Rucksack`, item/tool search and add-space helpers). This is a verified structural offset and a strong inventory patch/hook landmark.
- `ToolChest` is independently addressed at **game-state `+0x0380`** in the same inventory handlers (the code forms it as `0xE0 << 2`).
- Do not infer money/stamina/fatigue offsets merely from nearby literals; record those only once their `Farmer` member layout and top-level `Farmer` base are both independently established.

These are internal US-retail game-state offsets, not save-file offsets unless a save/copy path separately proves the serialization correspondence.
<!-- CHES_MODDING_PLAYER_SYSTEMS_END -->

<!-- CHES_MODDING_FARMER_LAYOUT_BEGIN -->
## Verified Farmer / player-condition layout

- `Farmer` begins at **game-state `+0x1BD8`**, proven by both game-state constructor paths calling `__6FarmerPCcRC8GameDate` at that offset.
- `Farmer::rucksack` is member `+0x60`, therefore **game-state `+0x1C38`**. This independently agrees with many native inventory handlers.
- `Farmer::stamina` is the exact decompiled 8-bit bitfield starting at `Farmer +0x44 bit 7`, therefore **game-state `+0x1C1C bit 7` through `+0x1C1D bit 6`**. Constructor value is 150; `func_0800E4F0` reads it; `func_0800E9E4` adjusts it with clamping; `func_0800EA38` subtracts; `func_0800EA44` restores to max.
- The following 8-bit field (`unk_44_0F`) starts at `Farmer +0x44 bit 15`, i.e. **game-state `+0x1C1D bit 7` through `+0x1C1E bit 6`**. Its behavior is strongly fatigue-like: getter returns value/2, threshold check is >=200, positive adjustment is doubled unless the `unk_44_04` berry flag is set, and it can be reset to zero. Keep the semantic label as probable until script/native names independently corroborate it.
- `num_power_berries` is `Farmer +0x44 bits 0..3`; maximum stamina is computed as `150 + 10 * num_power_berries`.
- `step_count` is a 30-bit field beginning at `Farmer +0x44 bit 31`; `func_0800ED8C` increments it only when the pedometer is held or present in the rucksack, capped at 1,000,000,000.
- `Farmer::unk_54` (held item) is game-state **`+0x1C2C`**, `Farmer::unk_5C` (held tool stack) is **`+0x1C34`**, and the rucksack follows at **`+0x1C38`**.

These are runtime game-state layout facts for the US retail ROM, not yet asserted to be raw save-file offsets.
<!-- CHES_MODDING_FARMER_LAYOUT_END -->

<!-- CHES_MODDING_SCRIPT_DISPATCH_SPLIT_BEGIN -->
## Script callable dispatch split

- Important correction: the Farmer getter calls around ROM `0x080463xx` are **not** inside `func_08048FFC`. They belong to an earlier value/getter dispatch path. `func_08048FFC` begins later at ROM `0x08048FFC` and is the separate native/action dispatcher.
- Therefore an ID must be associated with the correct dispatch table before assigning getter/action semantics. Physical proximity elsewhere in `asm/code_0803EE94.s` is not enough.
- Any Call-5-generated many-to-many Farmer/native mapping was discarded as invalid; the default/error target `.L0804DA2E` must never be used as a lexical ownership region for later code.
<!-- CHES_MODDING_SCRIPT_DISPATCH_SPLIT_END -->

<!-- CHES_MODDING_VALUE_DISPATCH_BEGIN -->
## Value/query dispatcher (`func_0804590C`)

- `func_0804590C` at ROM `0x0804590C` takes its selector directly in `r1`, accepts IDs `0x000..0x24D`, and indexes a 590-entry jump table without subtracting a base.
- Verified Farmer query selectors from exact jump-table entries and helper calls:
  - `0x00A` -> `func_0800E4F0` -> current stamina.
  - `0x00B` -> `func_0800E51C` -> maximum stamina.
  - `0x00C` -> `func_0800E4FC` -> fatigue value divided/scaled by two (retain helper-level description until the field unit is fully named).
  - `0x00D` -> `func_0800E53C` -> mysterious-berry flag.
  - `0x02D` -> `func_0800E958` -> step/pedometer count.
- These are **query-dispatch selectors**, not automatically action-native IDs. `func_08048FFC` is a separate action/native dispatch path and must be mapped independently.
<!-- CHES_MODDING_VALUE_DISPATCH_END -->

<!-- CHES_MODDING_VM_DISPATCH_OPS_BEGIN -->
## Script VM value/action dispatch opcodes

- The script VM contains two distinct dispatcher opcode handlers adjacent in the interpreter:
  - one pops a selector, calls `func_0804590C`, and pushes/returns the resulting value to the VM stack;
  - the other pops the action selector/argument state and calls `func_08048FFC`.
- `func_08048FFC` first calls `func_0804590C` with the same selector and saves that pre-action value, then handles mutating action IDs `0x01C..0x24D` through a table indexed by `id - 0x1C`.
- IDs below `0x1C` do not index that action table; they flow directly to the post-dispatch path. Numeric selector equality therefore does **not** imply identical semantics between Mary/script procedure names and value-query meanings.
- After the action path, `func_08048FFC` queries `func_0804590C` again and uses additional selector-specific transition logic. This pre/post structure is the basis of the C600/C644 interaction-state tracking and should be treated as state-transition monitoring, not as ordinary action dispatch.
<!-- CHES_MODDING_VM_DISPATCH_OPS_END -->

<!-- CHES_MODDING_OPCODE_REVALIDATION_BEGIN -->
## Script bytecode versus callable dispatch

- Base-game script CODE uses bytecode opcode `0x21` for **CALL**, exactly as Mary defines. Its operand is a 32-bit callable ID. The verified decoder reaches the exact end of all 1,328 non-null scripts with zero decode errors.
- `func_0803F8DC` is **not the bytecode opcode dispatcher**. It is a callable-ID dispatcher with cases `0x000..0x146`.
- Callable ID `0x03D` pops one selector, evaluates `func_0804590C(selector)`, and pushes the returned value back to the VM stack. It is therefore a generic value/query callable.
- Callable ID `0x03E` pops the action selector plus its companion argument/state value and invokes `func_08048FFC`; it is therefore the generic mutating/action callable.
- This explains the earlier corpus perfectly: aligned `CALL 0x03D` occurs 15,614 times and aligned `CALL 0x03E` occurs 1,850 times, while aligned bytecode opcodes `0x3D/0x3E` never occur. Numeric `0x3D/0x3E` here are CALL operands, not bytecode opcodes.
- Consequently all prior script CALL-frequency statistics produced by the verified `0x21 + u32 id` decoder remain valid.
<!-- CHES_MODDING_OPCODE_REVALIDATION_END -->

<!-- CHES_ACTION_SELECTOR_ORDER_BEGIN -->
## Generic action callable argument order and usage correction

- `CALL 0x03E` pops the VM stack twice. The first/top value becomes `r2`; the second value becomes `r1`.
- `func_08048FFC` immediately saves `r1` as the action selector and indexes its action table with `r1 - 0x1C`. Therefore **the selector is the second-popped (lower) stack value**, while the top stack value is the companion action value/argument.
- Earlier Batch 7 constant propagation accidentally treated the first/top value as the selector. Those action-selector statistics are superseded by the corrected map in `tools/ches/callable_dispatch_map.json`.
- Also keep the namespaces distinct: a script `CALL 0x0FB` is a direct callable ID handled by `func_0803F8DC`; an action selector `0x0FB` is a value passed as an argument to generic callable `0x03E` and handled inside `func_08048FFC`. Equal numbers do not prove equal semantics or usage.
- Consequently the old direct-CALL corpus counts attached to packed-field action selector IDs are **not valid evidence of generic action-selector usage** unless separately observed as arguments to `CALL 0x03E`.

Corrected proven generic-action selector counts for the packed-field targets:

- selector `0x0DC`: 1 proven constant uses
- selector `0x0DD`: 2 proven constant uses
- selector `0x0DE`: 0 proven constant uses
- selector `0x0F8`: 1 proven constant uses
- selector `0x0F9`: 3 proven constant uses
- selector `0x0FA`: 1 proven constant uses
- selector `0x0FB`: 3 proven constant uses
- selector `0x0FC`: 3 proven constant uses
- selector `0x1A9`: 0 proven constant uses
- selector `0x1C3`: 3 proven constant uses
- selector `0x1C4`: 3 proven constant uses
- selector `0x1C5`: 3 proven constant uses
- selector `0x1C6`: 3 proven constant uses
- selector `0x1C7`: 3 proven constant uses
- selector `0x1C8`: 2 proven constant uses
- selector `0x244`: 0 proven constant uses
- selector `0x245`: 5 proven constant uses
- selector `0x246`: 5 proven constant uses
- selector `0x247`: 5 proven constant uses
- selector `0x248`: 5 proven constant uses
- selector `0x249`: 5 proven constant uses
- selector `0x24A`: 0 proven constant uses
- selector `0x24B`: 2 proven constant uses
- selector `0x24C`: 1 proven constant uses
<!-- CHES_ACTION_SELECTOR_ORDER_END -->

<!-- CHES_FARMER_VITALS_BEGIN -->
## Farmer stamina / fatigue / pedometer state — verified modding map

- The embedded `Farmer` object is at **GameState + `0x1BD8`**. Query selectors `0x0A`, `0x0B`, `0x0C`, `0x0D`, and `0x2D` all construct that exact address before calling Farmer accessors, and independent stamina/fatigue mutation paths use the same offset.
- `Farmer::stamina` initializes to **150**. `func_0800E4F0` returns current stamina. `func_0800E51C` returns maximum stamina as **`150 + 10 * num_power_berries`**. `func_0800EAFC` caps power berries at 10 and adds 10 stamina when a berry is gained.
- `func_0800E9E4(Farmer &, int)` is the core stamina delta routine and clamps to `0..max_stamina`; `func_0800EA38` is the decrease wrapper and `func_0800EA44` fully restores stamina.
- Fatigue is stored in `Farmer::unk_44_0F`. `func_0800E4FC` returns `unk_44_0F / 2`, and `func_0800E504` tests exhaustion at storage value `>= 200`, so storage `0..200` maps to queried fatigue `0..100`.
- `func_0800EA68(Farmer &, int)` is the core fatigue delta routine. Positive gains are doubled when `unk_44_04` is clear; negative deltas are doubled in magnitude; storage clamps to `0..200`. `func_0800EAD4` is the decrease wrapper and `func_0800EAE0` clears fatigue.
- `func_0800E53C` returns `unk_44_04`, and `func_0800EAF0` sets it. The existing header comment `ate_mysterious_berry?` is behaviorally plausible but still not promoted beyond comment-level semantics.
- Query dispatcher `func_0804590C` is directly proven: `0x0A` -> current stamina (`func_0800E4F0`), `0x0B` -> max stamina (`func_0800E51C`), `0x0C` -> fatigue/2 (`func_0800E4FC`), `0x0D` -> `unk_44_04` (`func_0800E53C`), `0x2D` -> step count (`func_0800E958`).
- Proven retail constant-query usage from the script corpus: `0x0A` 4 calls in script 483; `0x0B` 4 in 483; `0x0C` 19 across scripts 350/483/978/986; `0x2D` 1 in script 571. No constant `0x0D` query was proven by that pass.
- `func_0800ED8C` increments `step_count` only while below `1,000,000,000` and only when a pedometer is equipped or present in the rucksack.
- `func_08025068` is a verified entity-level vitals wrapper: argument 2 is passed to `func_0800E9E4`, argument 3 to `func_0800EA68`, and the `Farmer *` comes from entity offset `+0x38`. It samples stamina/fatigue before and after applying the deltas and performs entity-state reactions. Its Thumb pointer `0x08025069` occurs at ROM `0x080E66BC`; if the surrounding dense callback table begins at `0x080E6658`, this is slot `+0x64`. Keep that table-base/type attribution explicitly provisional until constructor or symbol-boundary evidence proves it.
<!-- CHES_FARMER_VITALS_END -->

<!-- CHES_PLAYER_ENTITY_VITALS_BEGIN -->
## Concrete player entity vitals path

- `func_08024974` constructs the concrete player-facing actor entity. It installs `vtable_unk_080E6658` (ROM `0x080E6658`, exact table extent `0xB0`), stores the owning `GameState *` at entity `+0x34`, and stores `GameState + 0x1BD8` (`Farmer *`) at entity `+0x38`.
- Vtable slot **`+0x64`** is exactly `func_08025068`. This is therefore the concrete entity's stamina/fatigue delta virtual. Keep the original source class/method name unresolved unless independent naming evidence appears.
- `func_0802A400` (food-use path) calls `Food::GetStaminaGain()` and `Food::GetFatigueGain()` and dispatches both values through this same virtual slot `+0x64`.
- `func_08025068` writes reaction state at entity `+0xC3` on threshold crossings: `0x24` = stamina falls to `<= 50%` max, `0x25` = `<= 20%`, `0x26` = `<= 5%`, `0x27` = reaches `0`, `0x28` = queried fatigue crosses above `49`, `0x29` = crosses above `79`, `0x2A` = reaches exactly `100` from a previous non-100 value. The `0x2A` transition uniquely returns `1`; ordinary paths return `0`.
- The wrapper samples old/current stamina and fatigue, so these states are **edge-triggered transitions**, not merely level tests. Some positive-delta paths also clear an already-active `0x24..0x2A` state once the corresponding condition is no longer satisfied.
- Threshold priority after applying deltas is fatigue `100`, then fatigue `>79`, fatigue `>49`, stamina `0`, stamina `<=5%`, stamina `<=20%`, stamina `<=50%`.
<!-- CHES_PLAYER_ENTITY_VITALS_END -->

<!-- CHES_PLAYER_REACTION_DISPATCH_BEGIN -->
## Player vitals reaction dispatch

- Player entity `+0xC3` is a queued reaction byte. `func_0802EC00` detects a nonzero queued value, copies it to the active action-state byte at entity `+0x3C`, clears `+0xC3`, resets `+0xA6`, invokes player vtable slot `+0x6C`, and exits that update path.
- Therefore stamina/fatigue thresholds `0x24..0x2A` are not passive flags: they feed directly into the player's actor action-state machine.
- `func_08024CA0` explicitly reports true when the current actor state byte `+0x3C` lies in inclusive range `0x24..0x2A`, further confirming these seven values form one reaction-state family.
- Queued state `0x2A` (fatigue reaches 100) has a special main-update path using numeric request/message id `0x2B6`, then clears the queued state and invokes player vtable slot `+0x6C`. The interface identity of `0x2B6` is not yet independently proven, so do **not** label it a script/event ID.
<!-- CHES_PLAYER_REACTION_DISPATCH_END -->

<!-- CHES_PLAYER_REACTION_HANDLERS_BEGIN -->
## Player reaction-state handlers

- In the 58-case action-state switch inside `func_0802F0EC`, states `0x24`, `0x25`, `0x26`, `0x27`, `0x28`, and `0x29` all target the same handler label `.L08031AA8`. State `0x2A` alone targets `.L08031AC0`.
- The concrete player vtable slot `+0x6C` points to `func_080299D0` (`0x080299D0`). That routine clears entity bytes `+0xA4` and `+0x88`, then calls `SetAnim(entity, 0x192)`.
- This establishes a two-tier behavior family: the six ordinary stamina/fatigue threshold reactions share one update handler, while fatigue reaching 100 has a distinct main-update path before the common concrete `+0x6C` animation/reset behavior.
<!-- CHES_PLAYER_REACTION_HANDLERS_END -->

<!-- CHES_MODDING_ECONOMY_BEGIN -->
## Player money / economy runtime anchor

- **Player money is `GameState + 0x1AA8` (32-bit word).** This is now binary-proven rather than inferred from the old notes.
- Shop/menu code compares this word against purchase cost, uses `money / unit_price` to bound quantity, renders the word as the displayed currency amount, and passes `unit_price * quantity` to the `func_0809ABxx` money routines during purchases.
- **Starting money is 500, binary-proven.** `func_0809AB8C` constructs this object and stores `0xFA << 1` (500) into its first word. The older FOMT-DOC note independently agrees.
- `func_0809ABD8` is the add/credit path: the daily shipping settlement passes `GetValueShipped()` into it. `func_0809ACC0` is the subtract/debit path used by shop purchases.
- Credits saturate the balance exactly at **1,000,000,000**: `func_0809ABD8` adds `min(amount, 1,000,000,000 - balance)`. Debits do not underflow: `func_0809ACC0` returns failure and leaves money unchanged when `amount > balance`; otherwise it subtracts the requested amount and returns success.
- `func_0809ABD8` also latches byte `+4` bit 1 after the resulting balance exceeds **99,999,999** (`0x05F5E0FF`). The purpose of that persistent flag is not yet semantically named.
- The direct script API is dispatcher-proven: callable `0xEC` takes no arguments and returns the current balance through the common VM value-result path; `0xED` pops one VM value and credits that amount through `func_0809ABD8`; `0xEE` pops one VM value and debits that amount through `func_0809ACC0`. The debit helper's C-level success/failure result is discarded by callable `0xEE`, which exits through the common no-value completion path. These are dedicated direct callables; the generic query/action handler scan found no direct money field/API cases.
- Independent whole-ROM Mary IR census (all 1328/1328 scripts decoded, 0 errors; 75522 total direct CALL instructions): `CALL 0x0EC` = **33 direct CALLs across 15 scripts (IDs 139, 285, 358, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 483)**; `CALL 0x0ED` = **1 direct CALLs across 1 scripts (IDs 717)**; `CALL 0x0EE` = **26 direct CALLs across 7 scripts (IDs 139, 285, 469, 479, 483, 811, 812)**. These are direct callable IDs only, not generic query/action selector values.
- Do not confuse this balance with ShippingBin/statistics totals, which also use large saturation constants.
<!-- CHES_MODDING_ECONOMY_END -->
### Money history cadence (Batch 10)
- `GameDate` packs `season` in bits 0..1 and zero-based `day` in bits 2..6 of `GameState+0x11`.
- `func_08010F54` advances the day once per daily transition. When the increment reaches 30, it advances season modulo 4 and wraps into the new season boundary.
- Therefore the money object at `GameState+0x1AA8` has a **daily** 30-entry income/spend ledger at `+0x00C` (count at `+0x008`) and a **seasonal** 4-entry income/spend ledger at `+0x100` (count at `+0x0FC`).
- `func_0809ADA8` performs ordinary-day daily-ledger rollover. `func_0809AE6C` is the day-0/season-boundary path and also rolls the seasonal ledger.
- Maxima are `+0x120` daily income, `+0x124` daily spend, `+0x128` seasonal income, `+0x12C` seasonal spend.
### Weather, calendar and clock layout (Batch 10 + save-loader research)
- **GameState+0x08 is the current weather and GameState+0x0C is tomorrow's forecast, both 32-bit values.** This is now binary-proven in `func_08010F54`: at the daily transition it copies `[state+0x0C]` into `[state+0x08]`, generates a new weather value 0..4 into `+0x0C`, then passes `[state+0x08]` as the `int weather` argument to `Farm::DayUpdate(int weather, GameDate const &)`. Historical FoMT RAM maps independently identify the same addresses as current weather and tomorrow's weather.
- The initializer family shows these weather words and the packed calendar are one contiguous 12-byte state region beginning at `GameState+0x08`: current weather at inner +0x00, forecast at +0x04, and the four-byte year/date/time calendar at inner +0x08. In new-game `func_08010358`, both weather words are set to 0 and a separately constructed four-byte start calendar is copied wholesale to `GameState+0x10`.
- Weather values are behaviorally bounded to 0..4 by the forecast generator. External historical tables label them Sunny, Rainy, Snowy, Storm/Typhoon, and Blizzard respectively; keep the exact enum spelling provisional until a source-facing type is reconstructed.
- `GameState+0x11` is the packed `GameDate`: season is bits 0..1; zero-based day is bits 2..6. A season is exactly 30 days and the daily transition advances season modulo 4 when the day increment reaches 30.
- `GameState+0x12/+0x13` is the packed 16-bit `GameTime`: hour is bits 0..4; minute is bits 5..10. The query dispatcher independently exposes both fields.
- `GameState+0x10` is the packed **year counter**, now write-side proven. It stores `E(year)=((year/7)<<3)|(year%7)`: the year rollover increments the low remainder through 0..6 and, on 6→0, increments the upper quotient. Generic query selector `0` decodes this as `7*(byte>>3)+(byte&7)` and caps the returned year at 200.
- Weekday arithmetic is modulo 7 over the 120-day FoMT year (`4*30`), with a fixed epoch offset of 6 in the observed query body.
- Generic query selector `0` returns the decoded year, capped at 200.
- Generic query selector `1` returns season (`0..3`).
- Generic query selector `2` returns the one-based day of season (`stored day + 1`, therefore `1..30` during normal calendar state).
- Generic query selector `3` returns clock hour (`GameTime` bits 0..4).
- Generic query selector `4` returns clock minute (`GameTime` bits 5..10).
- Generic query selector `5` returns a weekday index `0..6`, derived from year mod 7, season, day, and epoch offset 6.
- `func_08017C30` owns packed clock/calendar progression. A byte divider at game-object `+0x1044` increments on accepted updates: counts 1..24 return without changing packed time, while count 25 resets the divider to 0 and increments the packed minute by exactly 1. Minute rolls after 59, hour after 23, midnight advances `GameDate`, day 30 wraps to day 0 and advances season, and season 3→0 advances the packed year counter. Thus 25 accepted `func_08017C30` invocations equal one in-game minute; whether those accepted invocations are exactly video frames remains a separate caller-cadence question.

### Clock progression architecture (Batch 11)

Exact retail evidence now pins the active game object's scene `Run` slot: `vtable_unk_080E5EC4 + 0x0C` is `func_08017C30`, and `func_0800082C` repeatedly invokes the current scene's `+0x0C` method. `AgbMain` enters that scene runner.

`func_080175B4` initializes the clock helper state by storing `GameState + 0x10` at game-object `+0x1040` and zeroing the byte at `+0x1044`. During eligible `func_08017C30` calls, `+0x1044` increments; values 1..24 return without advancing game time, while the 25th eligible call resets the counter and advances the packed clock by one minute.

The packed clock itself is exact: `GameState +0x12` holds `GameTime` with hour in bits 0..4 and minute in bits 5..10. Minutes wrap after 59, hours after 23. When the hour wraps, the date at `GameState +0x11` advances: day bits 2..6 use a 30-day season, and season bits 0..1 advance modulo four. This independently agrees with the day/season rollover evidence used for the money-history cadence.

Clock advancement is gated. The normal increment path requires game-object `+0x103C == 0`, `GameState +0x34C4 == 0`, current `MapData +0x24 == 0`, and an additional entity/actor virtual predicate to return zero. Keep the last predicate unnamed until its owner and semantics are stronger.

Important precision: the proven cadence is **25 eligible game-scene Run invocations per game minute**, not 25 video frames. `func_08017C30` has no direct `func_08008AF0` / `func_08000568` / `IntrWait` / VBlank wait edge. A frame-equivalence claim needs a concrete synchronization path and remains deliberately unpromoted.

Exact boundary side effects are visible at 00:00, 02:00, 04:00, 06:00, and 20:00, but their higher-level event meanings remain unnamed unless separately proved.

## Inventory / held tools / rucksack (Batch 12)

Retail Farmer inventory members are at Farmer+0x54 (HeldItem), +0x5C (held ToolStack), and +0x60 (Rucksack), corresponding to GameState+0x1C2C, +0x1C34, and +0x1C38. These retail offsets are authoritative; modern GCC offsetof probes do not match the historical agbcp/gcc-2.9 ABI used by the project.

Rucksack is 0x38 bytes structurally: item active-size at +0x00, eight physical 4-byte RucksackItem slots at +0x04; tool active-size at +0x24, eight physical 2-byte ToolStack slots at +0x28. A new rucksack exposes 2 slots of each class, then Upgrade expands active capacity 2 -> 4 -> 8.

The direct VM callable cluster provides a practical modding API: 0x04E held-tool id, 0x04F held-tool amount, 0x050 set held ToolStack(tool id, amount), 0x051 clear held ToolStack, 0x052/0x053 find food/article slots, 0x054 clear an item slot, 0x055/0x056 first free tool/item slot, 0x057/0x058/0x059 add article/food/tool amounts, 0x074 upgrade rucksack, and 0x075 return upgrade level. Generic query selector 0x02C also returns rucksack upgrade level. The 0x050 ToolStack constructor converts amount 0 to 1 and caps positive amount at 99.

HeldItem remains partly semantic-unknown beyond food/article: byte0 bits0..2 are kind, bit3 is wrapped, inner payload starts +0x02; empty is KIND_5 with the inner u16 sentinel 0xFFFF. Do not assign meanings to KIND_2/KIND_3/KIND_4/KIND_5 variants without stronger evidence.

## Batch 13 - Tool progression and forge transaction

The six Farmer `ToolLevel` records use a 16-bit accumulated-use value plus current and pending/staged 3-bit levels. `func_0800EF68` returns the accumulator, `func_0800EF6C` returns the current level, and `func_0800EF74` reports whether the pending/staged level differs from the current level.

The ordinary forge progression thresholds are exact binary behavior:

| Target level | Material | Article ID | Minimum accumulator |
| --- | --- | ---: | ---: |
| 1 | Copper | `0x12` | 6000 |
| 2 | Silver | `0x13` | 18000 |
| 3 | Gold | `0x14` | 36000 |
| 4 | Mystrile | `0x15` | 65535 |

The Mythic Stone path is separate: Article `0x1C` maps to requested tool level 5, and there is no fifth ordinary accumulator cutoff after 65535. This does **not** by itself prove or replace any additional Mythic eligibility prerequisites; those must be established independently.

The blacksmith transaction keeps four useful selection fields in the scene object. `+0x48DC` is the selected Article id. `+0x48E0` is the money amount later passed to the money debit helper `func_0809ACC0`. `+0x48E4` is passed to `func_0809EE20`, but its semantic name is still unresolved. `+0x48D8` contains a selection encoding: `(value >> 3)` selects one of six tool families through the exact remap `0->1, 1->0, 2->2, 3->3, 4->4, 5->5`, while the low three bits are tested separately.

At the staging step, the selected upgrade material maps directly to the requested level: Copper/Silver/Gold/Mystrile/Mythic Stone (`0x12/0x13/0x14/0x15/0x1C`) -> levels `1/2/3/4/5`. `func_0800EFB4(mapped_tool_level, requested_level)` is called only when `(field_0x48D8 & 7) == 0`.

On the observed commit path, the selected material is consumed from the held item first when the held item is the matching Article; otherwise the first matching Rucksack Article slot is cleared. The stored `+0x48E0` amount is then debited through `func_0809ACC0`. Menu/progression presentation in `func_08068344` and transaction mutation in `sub_08082F50` are separate control-flow paths, so modding changes should not assume one contains every validity check used by the other.


## Batch 14: Save/load and SRAM format

Binary-proven retail save geometry:

- SRAM header occupies `0x0000..0x0027`; the two retail slot bases are `0x0028` and `0x4014`, with stride `0x3FEC`.
- Each primary slot record uses only `0x34FC` bytes: a 4-byte size word (`0x34F4`), the complete `0x34F4`-byte `GameState` memory image copied verbatim, then a 4-byte checksum.
- `func_08011588` computes the checksum as an unsigned byte sum over the serialized `GameState`, accumulated modulo 2^32.
- `func_080115B0` is the writer. `func_08011650` creates a fallback/default `GameState`, requires the stored size to equal `0x34F4`, overwrites the whole object from SRAM, then validates the stored checksum. There is no successful-load field migration/fixup pass inside that routine.
- Save compatibility is therefore ABI-like: changing `GameState` layout or serialized representation cannot be made retail-compatible merely by changing constructors; a compatibility/migration layer is required.

Per-slot extension space for mods:

- Relative `0x34FC..0x3FEB` is `0xAF0` bytes not touched by the retail save reader/writer.
- A complete high-level SRAM proxy census found 17 read/write calls, all limited to the SRAM header or the primary record through relative `0x34FB`.
- The direct low-level SRAM call graph has exactly four branches: `func_080006A4 -> func_080D38D4`, `func_080006E4 -> func_080D379C`, and the two internal calls `func_080D38D4 -> func_080D3800/func_080D3870`. No game code bypasses that proxy/library chain, and the assembly-source census found no explicit raw SRAM address materialization outside the SRAM subsystem.
- Thus the `0xAF0`-byte tail in each retail slot is a strong extension area for mod-owned data while preserving the retail header and primary record. Custom formats should still carry their own magic/version and must not assume unrelated hacks have left the same space unused.

Save-menu code separately loads full temporary `GameState` objects and derives the visible 0x80-byte-per-slot preview/UI data from them; those preview buffers are RAM-side UI state, not an additional SRAM record in the slot tail.

## Batch 15 - Progression and relationship event gates

Retail event-script queries route relationship checks through the six `Bachelorette` objects embedded in GameState. The actor IDs and names are now structurally proven from `gUnk_08104258` (`@CharacterNamePointers`), whose 8-byte records are indexed by actor ID and begin with the character-name pointer:

- `0x03` Popuri -> GameState relationship block `+0x98`
- `0x0C` Mary -> `+0x154`
- `0x13` Karen -> `+0x1E4`
- `0x15` Elli -> `+0x210`
- `0x19` Ann -> `+0x264`
- `0x1F` Harvest Goddess -> `+0x2E4`

`func_08045584` is now exact source in `src/heart_event_days.cc`. It is a stage-specific elapsed-days query. For the player side it returns `GetDaysSincePlayerEvent_bugged()` only when that bachelorette's player-event count is exactly 5; for the rival side it returns `GetDaysSinceRivalEvent()` only when rival-event count is exactly 4. Otherwise it returns zero. The player getter is genuinely bugged in the decompilation: it reads `days_since_rival_event`, not `days_since_player_event`. These checks are not maximum-count checks: `PlayerEventUpdate()` permits `player_events` to reach 6, and `RivalEventUpdate()` permits `rival_events` to reach 5.

`func_080455D8` is a tri-state threshold gate. It first checks an interaction/state bit: if already set it returns 1. If the bit is clear, it resolves the selected bachelorette and compares either player- or rival-event count against the requested threshold, returning 2 when the count is at least the threshold and 0 otherwise. Rival threshold-5 selectors are reachable through the raw counter because `RivalEventUpdate()` allows `rival_events` to reach 5; the return-1 state-bit path is still semantically distinct from the return-2 numeric-threshold path. Scratch V4/V6 match the exact 0x60-byte size and all body instructions after setup; only five linked bytes differ because the tracked compiler schedules one three-instruction stack-argument/event-ID setup in a different order. Treat that as parked compiler/source spelling, not a semantic blocker.

The player threshold families use six stages (thresholds 1 through 6) for Karen, Popuri, Ann, Mary, and Elli; Harvest Goddess appears separately at selectors `0x172`/`0x173` for thresholds 5/6. The rival families exist for the five normal heroines only. Exact selector-to-threshold tables are kept in `tools/ches/progression_event_gates_map.json`.

## Logical map resource resolver

`GetMapResourceId` / `func_0803A8A4` is now matching source in
`src/map_resource.cc`, exposed by `include/map_data.hh`. Its complete 652-byte
range and both full-ROM gates are exact under the unchanged tracked compiler.
The renderer caller uses the named interface without changing bytes. Stable
namespace, variant and mine-floor rules are in `docs/MAP_DATA.md`; candidate
history and proof artifacts remain in the map-resolver checkpoint.

## Batch 16 - Map metadata, terrain event scripts, and player location persistence

- `GetMapData(resource_index)` indexes `gUnk_08105EDC` with a 0x28-byte record stride. The physical table is exactly 0xA50 bytes = **66 MapData resources** (`0x00..0x41`). Logical `Location.map` IDs span `0x000..0x233` and are resolved to those physical resources by `func_0803A8A4`; `MAP_NONE = 0x234` is the logical-location sentinel, not a table-end proof.
- MapData `+0x20` and `+0x22` are map width/height in tiles; scene helpers scale them by 8 to pixels. `+0x18/+0x1C` participate in target-map scene setup, while byte `+0x24` is a scene boolean whose exact semantic name remains unresolved.
- Terrain descriptors have two independent 15-bit event-script ID channels. Bits 2..16 use `(word >> 2) & 0x7FFF`; bits 17..31 use `(word >> 17) & 0x7FFF`. Both enqueue `{script_id, 0}` through the same mode-0 request path, which is later consumed by `ScriptEngine::LoadById`.
- Therefore the historical idea that these packed descriptor fields directly encode warp destinations is not established by the current evidence: their proven payload is script IDs. Warp destinations can instead be selected by the loaded script/action path.
- Player persistence is two-way. `func_0802B908` reads the saved `Farmer::location` (`func_0800E924`) to construct the live AActorEntity-derived player object. Separately, an entity-side synchronization routine calls `GetLocation__C12AActorEntity` and writes that ActorLocation back to the Farmer object with `func_0800EB34`.
- A hard-coded write of map 7, x=4, y=1, facing=0 exists in `sub_08082F50`, but that function is the forge transaction/state machine, not the generic script callable dispatcher; it must not be generalized as the normal warp mechanism.


### Batch 16 Call 40 checkpoint — TerrainInfo input semantics

The two TerrainInfo script channels are now behaviorally separated. The low field (bits 2..16) is the movement-contact channel used by the warp-edge work. The high field (bits 17..31) is queried on a tile projected in the actor's current facing direction by `func_0802D59C`; it only enqueues the extracted script when bit 0 of the second halfword in the per-update input packet (`+4`) is set. Its retail script corpus is disjoint from the low channel and includes front-facing inspect/use objects and locked doors. The final hardware-key name is intentionally left pending until the KEYINPUT producer's bit transform is traced exactly.

### Batch 16 Call 50 checkpoint — terrain interaction input and map-resource correction

The high TerrainInfo payload is now tied to a physical input edge, not merely an abstract interaction state. `func_0800912C` reads GBA `REG_KEYINPUT` (`0x04000130`) and inverts the low ten active-low bits into pressed=1 form. `func_08009190` samples a new key state and writes `new_current & ~previous_current` at input-object offset `+4`, i.e. the newly-pressed edge mask. The player update forwards that packet into `func_0802F0EC`; its state-7 interaction path reaches `func_0802D59C`, which requires bit 0 of the `+4` edge mask before looking up the TerrainInfo high payload on the tile projected in the actor's facing direction. GBA keypad bit 0 is A, so TerrainInfo bits 17..31 are the **front-tile A-button newly-pressed interaction event-script ID** channel.

The low field remains the **movement-contact event-script ID** channel: `func_08024CD0` only reaches its low-payload terrain scan while player movement velocity is nonzero, extracts `(word >> 2) & 0x7FFF`, and queues `{script_id, 0}`. The low and high retail script sets remain disjoint.

A graph-generation attempt in Call 48 was rejected before being used as evidence: it incorrectly indexed `gUnk_08105EDC` with logical `Location.map` IDs. That blob is only `0xA50` bytes = 66 physical `MapData` records (`0x00..0x41`). Logical location IDs have a wider domain and must first pass through the engine's logical-location/state -> physical resource resolver (the traced path includes `func_0803A8A4`). The invalid Call 48 JSON/CSV were quarantined with `.INVALID_CALL48` suffixes; the warp graph will be regenerated only from the proven resolver mapping.



### Batch 16 Call 53 — corrected low transition graph

The low movement-contact terrain corpus contains **71 unique event scripts across 722 physical terrain cells / 100 connected source components**. Source terrain is represented by the 66 physical `MapData` resources; logical map IDs are attached through `func_0803A8A4`, whose variant inputs are the effective season (`func_0800E324`) plus farmhouse, coop, and barn upgrade levels. For logical maps 0..8, Winter (`season == 3`) selects the alternate paired physical resource; `func_0800E324` treats day 0 before 06:00 as the previous season. Logical map 17 varies with coop upgrade, 29 with farmhouse upgrade, and 37 with barn upgrade.

Mary structurally decompiles 65 of the 71 low scripts. The remaining six fail only in Mary’s final control-flow reducer: its partial pretty-print still decodes their bytecode and exposes their transition calls. Those six are now recovered as transition-bearing scripts too. Script 400 is likewise confirmed to call `Proc016(308 + 9, 160, 24)` when facing 0. Script 339 is the sole indirect low transition: when facing 0 it routes to script 977; script 977 sends source logical maps 52..307 to map 0 at `(900,350)` and maps 308..563 to map 0 at `(424,448)`.

Private machine-readable artifacts: `tools/ches/low_warp_resource_graph.json` / `.csv`, plus `tools/ches/low_transition_classification.json`.


### Batch16 Call60 terrain bit1 checkpoint

- Retail TerrainInfo bit1 remains separate from the low script field (bits 2..16) and high script field (bits 17..31). The known script/collision-query consumers using `0x0001FFFC` explicitly exclude bits 0 and 1.
- A new assembly lead in `code_809E804.s` loads a 32-bit word and independently tests bit0 (`<<31`) and bit1 (`<<30` sign test). Call60 traces whether this word is directly sourced from `MapData::terrain_info`; naming remains withheld until that provenance is exact.

## Terrain descriptor collision flags (Batch16)

The physical map-resource table at `gUnk_08105EDC` contains exactly **66 `MapData` records** (`0x00..0x41`). Logical `Location.map` IDs are a separate namespace (`0x000..0x233`, with `0x234` as `MAP_NONE`) and are resolved to those physical resources by `func_0803A8A4`.

Three independent descriptor channels are now separated by exact consumers:

- bits **2..16** encode a movement-contact event-script ID: `func_08024CD0` masks with `0x0001FFFC`, extracts the payload, and queues the script while the player is moving.
- bits **17..31** encode a front-tile interaction event-script ID: `func_0802D59C` checks the tile one 16-pixel step in the actor's facing direction and consumes the newly-pressed **A** edge from the key-input packet before queuing the script.
- bit **1** is a **collision/special-surface flag**, strongly associated with water. Ordinary directional movement collision goes through `func_080AC124`, where descriptor bit0 **or bit1** is blocking. The thrown-Ball movement family (`func_08038110` via `func_080ABBA0/BC4/BEC/C14 -> func_080AC388`) checks bit0 but deliberately ignores bit1. Fishing-region overlap supports the water interpretation, but the fishing state-machine mask is an input-button test, as proven below.

Retail census across the 66 physical resources finds bit1 on **10,675 cells** in resources `00,01,06,07,08,09,0E,0F,3C,3E`; the only descriptor words carrying it are `0x00000002` and `0x00000003`. Under the proven logical-to-physical resolver, these resources are reachable from logical map IDs **0, 1, 2, 7, 43, and 48**.

## Terrain descriptor collision channels

`TerrainInfo` descriptor **bit 1 (`0x00000002`) is a collision-domain flag with object-specific behavior**. The normal directional collision predicate `func_080AC124` treats either bit 0 or bit 1 as blocking, and its wrappers are used by ordinary actor/animal movement, including dog and chicken update paths. The alternate predicate `func_080AC388` tests bit 0 only and therefore permits bit-1 terrain. Its four directional wrappers are used only by `func_08038110`.

The `func_08038110` mover is strongly tied to the dog-play thrown-object path: selector `0x4B` connects this entity family directly to the dog controller, and adult-dog behavior calls `func_08038374` / `func_08038398` on it. **Resolved correction:** entity field `+0x28` is the thrown Ball entity's packed animation resource ID, not an Article ID. Retail `ARTICLE_BALL` remains `0x35`, while initial packed animation resource `0x31` is animation 49, the already-owned Ball icon. `func_08038398(ball, dog.anim_id, dog.facing)` rewrites `+0x28` into IDs 21..48, and `func_0803853C` passes that field through the GameObject vfunc `+0x64` packed provider.

For the Dog Ball, bit-1 terrain is not rejected by directional collision, and the landing logic explicitly distinguishes descriptor bit 1: after terrain lookup, `func_08038110` tests bit 1 and invokes its game-object callback with a different argument than the non-bit-1 path. The exact behavior is **terrain that blocks ordinary movers but has special thrown-Ball traversal/landing behavior**. Water is strongly supported by geometry and location-dependent behavior; fishing classifier overlap does not establish a direct descriptor test.

The event payload channels remain separate: descriptor bits 2..16 are movement-contact script IDs, while bits 17..31 are front-tile newly-pressed A-button interaction script IDs. Bit 1 is not part of either script payload.

### BallEntity source integration - October 6, 2026

The previously proven selector-`0x4B` thrown Ball family now has matching C++ class anchors in `include/entity_ball.hh` / `src/entity_ball.cc`. `BallEntity(GameObject*, Location&)` at `0x08038028` is **0x70 / 0 diff** and proves the writable location back-reference at +0x18. `Launch` / `IsActive` / virtual `GetBox` / `GetFlightHeight` are also exact at retail addresses. This pass adds **188 exact source bytes**, reaching **69,056 / 940,036 = 7.3461%** code reconstruction. The large `func_08038110` landing/movement semantics documented below are unchanged and remain assembly.

### Thrown Ball and TerrainInfo bit 1

The Ball is article ID `0x35` (`ARTICLE_BALL`, description: a dog toy). The world object selected with ID `0x4B` is the thrown-Ball mover. Its movement path uses the alternate collision helper that ignores `TerrainInfo` bit 1.

When the Ball finishes its flight, `func_08038110` resolves the landing terrain and has three exact outcomes:

- invalid / out-of-range terrain: invoke the owning GameObject callback with reason `1`;
- valid terrain whose descriptor has bit 1 set: invoke the same callback with reason `0`;
- valid terrain without bit 1: look up selector `0x2B` and call `func_0802151C` with the landing location.

`func_0802151C` is the adult-dog Ball interaction path: it requires the controlled dog to be grown, checks that the dog is on the same map and close enough to the landed Ball using pet adequacy, enters a dog play/fetch behavior, updates dog state, and calls `SetHasPlayedToday`.

The reason-0 Ball callback removes the Ball world object and then feeds the recorded landing location into the same location classifier / littering subsystem used by generic discarded rucksack items. Most classified locations apply the normal friendship/love littering penalty and create resource/effect `0x1A9`; classifier result `2` instead starts event/script `0x23B`. Reason `1` removes the Ball without this in-bounds discard handling.

This establishes bit 1 as a special **in-bounds Ball-discard landing class** which ordinary actors treat as blocking but the thrown Ball can cross. The fishing-region/result trace provides supporting evidence for water semantics, separately from the exact descriptor behavior.

<!-- CHES:BATCH16_WATER_BIT1_START -->
### Terrain descriptor bit 1: alternate collision / special-surface regions and the thrown Ball

Batch16 establishes the collision and Ball-discard behavior of `TerrainInfo` descriptor bit 1 (`0x00000002`). **Water surface** remains a strongly supported interpretation; distinguish that interpretation from the exact consumers.

* The bit occurs on 10 physical map resources (`R00/R01`, `R06/R07`, `R08/R09`, `R0E/R0F`, `R3C`, `R3E`), representing logical maps `0`, `1`, `2`, `7`, `43`, and `48`. Almost every such descriptor is exactly `0x2`; 16 cells in `R08/R09` are `0x3` (water plus bit 0).
* Ordinary collision through `func_080AC124` treats descriptor bit 0 **or** bit 1 as blocking. The alternate collision helper `func_080AC388` tests bit 0 only. The selector-`0x4B` thrown-Ball mover uses this alternate path, so the Ball can travel onto bit-1 cells while ordinary movers cannot.
* Selector `0x4B` is the thrown **Ball** entity, not the dog: the launch path creates/gets that selector while removing the held item, and `func_0802E0FC` reconstructs `Article(0x35)`, whose item entry is `BALL` / `"Ball"` / `"A dog toy."`.
* At Ball landing, `func_08038110` distinguishes three outcomes. Invalid/no terrain queues callback reason `1`; a descriptor with bit 1 queues callback reason `0`; valid terrain without bit 1 calls the adult-dog play/fetch handler `func_0802151C`. Callback `func_0801C0E0` stores the pending flag at GameObject `+0x10C8` and the reason at `+0x10C9`. The reason-0 path deletes selector `0x4B`, classifies the saved landing location with `func_080A45A8`, enters the same discard/littering consequence machinery used by generic thrown items, and creates the special-surface effect resource `0x1A9` unless the classifier selects its special event.
* `func_080A45A8` is an eight-rectangle location classifier. The same classification feeds `func_080A3E90`, and its state is later consumed by `func_080A3F4C` to generate fishing rewards. Those rewards include Food `0xA0..0xA2` (`SMALL_FISH`, `MEDIUM_FISH`, `LARGE_FISH`, whose descriptions explicitly say they are caught in ocean or river) and fishing articles such as Pirate Treasure, Fossil of Fish, Empty Can, Boots, and Fish Bones.
* The classifier rectangles and descriptor-bit-1 geometry strongly overlap regions used by fishing classification and by special environmental interactions already traced in this batch (including offering/special-event and Hot Spring item behavior). This is strong evidence that bit 1 marks a water-like/special surface class, but the exact environmental label is intentionally left unresolved until a direct TerrainInfo-derived consumer proves it. The fishing state-machine `& 2` checks investigated later are **not** TerrainInfo accesses; they are newly-pressed B-button tests.

For modding, keep the two layers distinct: descriptor bit 1 marks the **collision/special-surface class strongly associated with water**, while `func_080A45A8` assigns a broader location class used to choose fishing tables and special location-dependent consequences. They are related but not interchangeable tables.
<!-- CHES:BATCH16_WATER_BIT1_END -->

### Fishing bit-mask provenance closed (Call170)

The fishing `[r4+4] & 2` checks in `func_0802F0EC` are newly pressed **B-button** tests. The exact owner+0xA8 trace now closes the pointer gap left in the Call150 handoff.

`func_08014AF8` obtains a scene implementation from handle+4 and installs its GameObject at implementation+0xA8. Handle vtable `0x080E5E64 +0x0C` reaches `func_08012028`, which passes the same implementation into `sub_080D8178`. In that run frame, let S denote the local stack pointer: `[S+0x564]` holds implementation+0xA8, and S+0x10 is the input record initialized by `func_080091A4` and updated by `func_08009268`.

At `0x080DAB0C`, the code calls the GameObject's vtable slot+0x0C (`func_08017C30`) with r1=S+0x4C0 and `[S+0x4C0]=S+0x10`. `func_08017C30` copies that first word into its entity-update wrapper; the dispatch at `0x0801805A` reaches `func_08024CD0` through player vtable `0x080E6658 +0x18`. That method forwards the pointer to `func_0802F0EC`, where it becomes r4 unless cooldown suppresses input. Thus fishing r4 is the input record, not the wrapper address and not TerrainInfo.

`func_08009190` writes `current_keys & ~previous_keys` at record+4. Its polling chain reaches `func_0800912C`, which reads KEYINPUT at `0x04000130`; bit1 is B. Neither this producer nor this pointer chain derives from `MapData::terrain_info`. The proposed direct fishing-to-terrain-bit1 proof is therefore rejected, while the independent collision/Ball evidence remains valid.

Full instruction-level evidence: `tools/ches/checkpoints/call170/fishing-input-proof.md`. No contribution code or semantic names were changed for this finding.

### Held-item discard lifecycle

`func_0802F0EC` copies the held `RucksackItem`, then calls `ClearHeldItem` at `.L0802F942` before dispatching the `GameObject` virtual method at slot `+0x158` (`func_0801EE00` for the normal player object). Therefore, rejecting a landing inside `func_0801EE00` cannot retain the item: the held slot has already been cleared. Accidental dry-ground throws must instead be rejected by the held-item action classifier before the throw animation and removal sequence begins, while leaving contextual actions, the Ball path, and water-surface offerings available.


## October 1, 2026 - lifecycle integration complete

- `src/code_080A46AC.cc` now replaces retail `func_080A46AC`, `func_080A4740`, and `func_080A47B4`.
- The production lifecycle translation unit is exactly 0x160 bytes of .text and uses `#pragma interface` to suppress a duplicate weak vtable while retaining the retail vtable in `asm/vtables.s`.
- `fomt.lds` provides the required old-GCC C++ ABI aliases and inserts `src/code_080A46AC.o(.text)` after `src/map_data.o(.text)` and before the remaining `.text.after_get_map_data` assembly.
- The assembly bodies for 0x080A46AC..0x080A480B were removed; `func_080A480C` remains the next assembly function.
- Fresh six-rule compatibility package v2 built from the pinned clean base at `/mnt/data/Github/agbcc-fomt-compat-package-call238-v2`.
- Fresh package validation `sh_mupkuyqn_64244b58`: terrain exact; water exact; lifecycle main/alt/destructor exact; five focused canaries exact; saved 54-module corpus 54/54 total_diff 0; full retail ROM SHA1 exact.
- Current linked-code progress: **53,344 / 940,036 bytes in src = 5.6747%**; **886,692 bytes = 94.3253%** remain in asm.
- Comprehensive anti-rediscovery ledger: `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`. Read it before reopening compiler/version/source-shape experiments from Call238.
- Generic reusable lessons were also distilled into `/mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md`.

## October 2, 2026 - func_080A480C integration complete

- `src/code_080A480C.cc` now replaces retail `func_080A480C` at `0x080A480C..0x080A4943`.
- `asm/code_809E804.s` resumes in `.text.after_func_080A480C` at `func_080A4944`.
- `fomt.lds` places `src/code_080A480C.o(.text)` after `src/code_080A46AC.o(.text)` and before the remaining post-target assembly.
- The isolated section proof is 0x138 / 0 under compatibility package v3. The function symbol body is 0x136 bytes; the final two bytes are normal align-4 section padding.
- Controlled detached-worktree full-ROM integration `sh_muq23j8y_853e23ea` passed before production mutation.
- Production full-ROM integration `sh_muq24h47_fe3d160f` passed `fomt.gba: OK`.
- Explicit production SHA1 `sh_muq25a6a_5d4782ab`: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Link map verifies `func_080A480C` at `0x080A480C` and `func_080A4944` at `0x080A4944`.
- Current linked-code progress: **53,656 / 940,036 bytes in src = 5.7079%**; **886,380 bytes = 94.2921%** remain in asm.
- Exact next adjacent retail target: `func_080A4944`.

## October 2, 2026 - adjacent effect block through func_080A4A00 integrated

- `src/code_080A480C.cc` now contains exact source for four consecutive retail routines: `func_080A480C`, `func_080A4944`, `func_080A49A0`, and `func_080A4A00`.
- `func_080A4944` exact source uses a running pointer over `EffectBase::values`; the indexed form `values[i]` was semantically correct but produced 57 differing linked bytes by preserving `this` and recomputing the byte address. Running-pointer v2 matched **0x5C / 0**.
- `func_080A49A0` exact compare: **0x60 / 0**. It is the array/count overload and forwards its provider/value/args/count inputs to `func_080A46AC`.
- `func_080A4A00` exact compare: **0x4C / 0**. It is the simpler overload already referenced as `DiscardEffect` by `src/game_object_discard.cc` and forwards provider/value/arg to `func_080A4740`.
- Both constructors install `vtable_unk_080E681C`, construct the 0x14-byte member at +0x28 through `func_0805E824(..., 0x100)`, set byte +0x3C to 1, byte +0x3D from the caller's refresh flag, and byte +0x3E to 0.
- Controlled constructor-pair integration `sh_muq2tbfh_fabd01b0` passed full retail SHA1 before production mutation.
- Production integration `sh_muq2uam9_aa65ca5f` passed `fomt.gba: OK`; explicit SHA1 `sh_muq2ur9o_a4ba18f6` remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- `asm/code_809E804.s` now resumes in `.text.after_func_080A4A00` at local label `.L080A4A4C`. Next named function is `func_080A4A94`.
- Current linked-code progress: **53,920 / 940,036 bytes in src = 5.7360%**; **886,116 bytes = 94.2640%** remain in asm.
- Exact next target is the unnamed 0x48-byte routine `0x080A4A4C..0x080A4A93`.

## October 2, 2026 - unnamed 0x080A4A4C wrapper frontier

- Retail window: `0x080A4A4C..0x080A4A93` = 0x48 bytes, with next named function `func_080A4A94`.
- No ROM pointer to `0x080A4A4C/4D` and no decoded direct BL caller was found. Keep the function address-derived and semantically neutral.
- Retail behavior: if state word +0x08 is zero return 0; otherwise forward original args 1..7 plus state halfword +0x0C and pointer `state+0x10` to IWRAM `func_030004DC` through `_call_via_r4`.
- `next-080A4A4C-v1.cc`: semantic first candidate, 0x42 bytes / 66 differing linked bytes.
- `next-080A4A4C-v2.cc`: preserves state/arg1/arg2 as saved locals and uses the old-GCC sign idiom. Compare `sh_muq34b79_9466708f`: **expected 0x48, actual 0x48, 26 differing linked bytes**.
- v2 remaining diff has only two causes: (1) enabled/nonzero registers are reversed relative to retail (`ldr r0; neg r1` vs retail `ldr r1; neg r0`); (2) the `func_030004DC` literal load is hoisted before call-argument staging instead of occurring immediately before `_call_via_r4`.
- Exact next experiment: reverse the expression order to target retail register ownership and remove the local function-pointer variable so the casted `func_030004DC` call target is materialized at the call site. Do not broaden source search until those two evidence-led changes are tested.

## October 2, 2026 - unnamed 0x080A4A4C wrapper isolated exact proof

- Retail wrapper is 0x48 bytes at `0x080A4A4C..0x080A4A93`, ending immediately before `func_080A4A94`.
- Semantics remain conservative/address-derived: if state word +0x08 is zero return 0; otherwise forward seven caller arguments plus state halfword +0x0C and pointer `state+0x10` to ARM/IWRAM entry `0x030004DC`.
- v4 uses `-enabled | enabled`, which gives the retail `ldr r1; neg r0; orr; cmp; blt` register ownership, and models the IWRAM call as `reinterpret_cast<UnkIwramCall>(0x030004DC)(...)`.
- Known October-2003 Nintendo/Cygnus compiler reproduces v4 at 0x48 / 8, so the final mismatch is not a generic historical compiler-version issue.
- Source/backend analysis found the final 8-byte island is only call-address scheduling: retail loads the constant ARM target after r0-r3 argument setup; the known compiler family forces the target before those hard-register loads.
- Isolated structural probe `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` defers `prepare_call_address` for non-decl `CONST_INT` call targets with register parameters.
- Exact target proof `sh_muq5e5fe_d8a7f29c`: **0x48 / 0**.
- This is compatibility reconstruction evidence, not proof of recovered Nintendo compiler source. Full regression/package/full-ROM validation remains mandatory before integration or commit/push.

## October 2, 2026 - unnamed 0x080A4A4C wrapper integrated

- Compatibility compiler v4 packages the eighth structural call-address scheduling behavior and reproduces the target from a fresh pinned-base build.
- `src/code_080A4A4C.cc` replaces `0x080A4A4C..0x080A4A93`. The function remains conservatively address-derived because its higher-level identity is unresolved.
- Behavior: return 0 when state word +0x08 is zero; otherwise forward seven caller arguments plus state halfword +0x0C and pointer `state+0x10` to fixed ARM/IWRAM entry `0x030004DC`.
- Controlled full-ROM integration `sh_muq5yhqg_65343efc` and production integration `sh_muq5z150_6378962b` both passed `fomt.gba: OK`.
- Explicit SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Current progress: **53,992 / 940,036 bytes in src = 5.7436%**.
- Next adjacent target: `func_080A4A94` at `0x080A4A94`.

## October 2, 2026 - 080A4A94 constructor and 080A4B6C destructor integrated

`func_080A4A94` constructs a common base object with a vtable pointer at +0x90, scalar state, three 0x7900-byte buffers, three 0x1E0-byte buffers, one 0xF200-byte buffer, ten repeated 4-byte RGB-like slots, and an embedded node-like object at +0x5C. Higher-level class naming remains intentionally conservative.

The constructor reached retail exactness only when the repeated 3-byte clears were expressed as calls to an inline helper on each 4-byte member. This emits the retail sequence of three byte stores from one base followed by a +4 base advance. A similar inline initializer for the embedded +0x5C node restored the last missing 4-byte address-setup instruction. Final constructor proof: `sh_muq6bft4_996b89d9`, **0xD8 / 0**.

`func_080A4B6C` is the matching base destructor. It restores the base vtable, deletes the full buffer, deletes the three large buffers, deletes the three small buffers, destroys the embedded node via `func_080098AC(..., 2)`, and conditionally frees `this` when flag bit 0 is set. First destructor candidate proof: `sh_muq6c2df_0e7e2402`, **0x80 / 0**.

Controlled integration `sh_muq6d6f3_2a25251b` and production integration `sh_muq6doxq_a99dba2d` both pass `fomt.gba: OK`. Explicit SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Progress is now **54,336 / 940,036 bytes = 5.7802% source**. Next adjacent routine is `func_080A4BEC`.

## October 2, 2026 - func_080A4BEC integrated

`func_080A4BEC` is the base update routine for the object constructed at `func_080A4A94`. It applies temporary per-frame deltas from +0x84/+0x88 while countdown +0x8C is active, marks +0x29 dirty, then advances animation timer records selected by state ID +0x04. Active switch states are 0/62/63, 1, 6, 7, 8, 9, 14, 15, 31, and 60. Exact source proof: `sh_muq7kmni_63c0c960` = 0x364 / 0. Production ROM remains SHA1 exact after `sh_muq7mmj2_62639172`. Source progress is now **5.8725%**.

## October 2, 2026 - func_080A5670 and func_080A56DC integrated

### func_080A5670

`func_080A5670` iterates three source/destination buffer pairs beginning at object offset +0x0C. For each non-null source it performs repeated DMA-style transfers through `func_080D0EBC`, stepping the source by `stride * 2` from +0x24 and the destination by 0x40 until 0x540 destination bytes have been covered. The natural source uses the existing `REG_DMA3SAD` definition from `gbaio.h`.

The exact source shape matters: retail first tests `pairs[i].source`, then keeps that value as the long-lived source pointer inside the branch. Expressing the condition directly and declaring `source` inside the branch yields the retail r0-to-r5 copy and exact register/literal layout. Proof: `sh_muq830z4_d1ff571c` = 0x6C / 0.

### func_080A56DC

`func_080A56DC` consumes the existing packed `Location` record, stores its map and fixed-point x/y into the target object, forwards three additional arguments through the operations table pointer at +0x90 / slot +0x14, then calls `func_080A5960` with the signed location coordinates.

The decisive type discovery is that the retail bit layout exactly matches `include/actor.hh::Location`: 10-bit map followed by signed 16-bit x and y. Reusing `Location::GetMap/GetX/GetY` is both more readable and byte-exact; manual duplicate packing code is unnecessary. Proof: `sh_muq88yko_8de9dc89` = 0x84 / 0.

Both controlled and production integrations passed the retail full-ROM comparison. Current source progress after the batch is **5.8981%**.

## October 2, 2026 - renderer helper batch

Five renderer helpers were moved from assembly to readable C++ with byte-exact retail output:
`func_080A5A9C`, `func_080A5EA0`, `func_080A601C`, `func_080A6420`, and `func_080A6640`.

Production full-ROM validation remains exact at SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Source progress is now 55,556 / 940,036 bytes = 5.9100%.

Notable reconstruction findings:
- 6420 is a return-forwarding wrapper, not a void call.
- 6640's +0xB4/+0xB8 state is naturally modeled as two small C++ objects whose class alignment is four bytes under the target compiler.

## Leverage-first roadmap note - October 2, 2026

Target selection now uses the private quantitative/human-classified roadmap in `docs/DECOMP_PRIORITY_MAP.md`.

The immediate shared-type target is `SpriteAnimator` rather than the nearest unresolved renderer address. Existing readable actor code already uses the type and calls `func_0805E860`; recovering its core five methods should replace a 0x14-byte placeholder with meaningful fields and make animation/resource logic easier across entities, actors, game state, intro scenes, and renderer/effect code.

This is a prioritization pivot only. Saved renderer candidates and exact mismatch evidence remain valid and must not be discarded.

## October 2, 2026 - SpriteAnimator Update allocator analysis

func_0805E8F0 high-level behavior is solved closely enough to isolate old-GCC source-provenance and lifetime effects. v3 allocator mapping is now known: this p22->r4, result p23->r5, step p32->ip, timer p33->r3, index p35->r2, frames p37->r7, count p44->r6, previous sprite p38->sb, constant 4 p51->r8. Retail wants result/count/frames r7/r5/r6. A proof-only pre-reload cycle helps but is not exact.

The adjacent exact func_0805E894 is the strongest source oracle. Its exact source uses u32 index, Count(), Begin(), and a local frame pointer. Applying that exact pattern to Update yields v26b at exactly 0xAC bytes, while changing lifetimes enough that step moves to r7, index to r1, and another value spills to sl. Use v3 as the lifetime/register oracle and v26b as the exact instruction-budget oracle.

## October 2, 2026 - SpriteAnimator descriptor/count lifetime isolation

func_0805E8F0 now has two complementary structural oracles.

v28 proves allocation behavior:
- index and frames naturally reach retail r2/r6.
- the remaining result/step/count/constant cycle has no hard-register preferences.
- forcing only the relative allocation order count -> frames -> result recovers result r7, step ip, count r5, frames r6, index r2, and constant4 r8.
- the target still mismatches because v28 has no separate &animation descriptor lifetime.

v15 proves source identity:
- old GCC emits a separate descriptor base before indexing.
- frames is copied to a long-lived pointer.
- Count has a zero temporary and a separate final count copy.
- the descriptor hard register is reused for final count after the descriptor dies.
This mirrors retail, but v15's 16-bit index causes unwanted truncation code.

v29a/b show that simply widening the v15 source is not sufficient. The remaining task is to preserve v15's lifetime split while recovering v28's allocation/index behavior.

## October 2, 2026 - SpriteAnimator scalar-offset breakthrough

func_0805E8F0 retail does not carry a frame pointer through the loop. It preserves the integer frame index, computes index << 2, and forms frames + offset separately for the duration and sprite-id loads. Direct repeated frames[index] lets old GCC create pointer induction and is wrong for retail.

v31a/v31b encode an explicit scalar frame offset and recover this body shape. v31b reaches 0xAA/25 normally and 0xAA/10 under a proof-only allocation order. The remaining proof differences are only count-zero/frames-copy order and an equivalent timer branch orientation.

The nominal 0xAC retail range includes a 0x0000 padding halfword at 0x0805E99A; the real function returns at 0x0805E998. Treat 0xAA as the functional body budget and validate the final two padding bytes at the integration seam.

## October 2, 2026 - SpriteAnimator v34b source shape

The best recovered `SpriteAnimator::Update` source is v34b. The decisive source structure is:
- keep a full-width u32 frame index;
- keep an explicit scalar `frame_offset = index << 2`;
- for nonzero duration, update timer, break only when timer becomes positive, otherwise continue;
- for zero duration, set timer to zero and break;
- perform sprite-change comparison and frame-index store after the loop.

This shape reproduces the retail loop CFG and all important register homes naturally. Under compatibility-v4 the functional body differs only in the order of two independent setup instructions: the persistent frames copy is emitted before Count's zero initialization, while retail places the zero first. The function's actual 0xAA instruction body otherwise matches; 0x0805E99A remains padding.

Multiple direct setup rewrites and hoisted-frame identities regress substantially. Treat v34b as the source oracle and solve the remaining order structurally in compiler reconstruction rather than distorting readable source.

## October 2, 2026 - SpriteAnimator exact source and padding boundaries

`tools/ches/checkpoints/sprite-animator-v34b.cc` is the first coherent source that reproduces all five SpriteAnimator methods byte-perfectly with the validated pointer-only post-dead compiler behavior.

True body ranges:
- 0x0805E824..0x0805E84D = 0x2A bytes, then 2-byte alignment padding
- 0x0805E850..0x0805E85D = 0x0E bytes, then 2-byte alignment padding
- 0x0805E860..0x0805E893 = 0x34 bytes
- 0x0805E894..0x0805E8EF = 0x5C bytes
- 0x0805E8F0..0x0805E999 = 0xAA bytes; 0x0805E99A is a retail 0x0000 padding halfword before the next function

The key Update source structure remains v34b's full-width index, scalar frame offset, break/continue timer flow, and post-loop sprite-change/index store. Do not distort this source to manufacture padding bytes.

## October 2, 2026 - SpriteAnimator production integration

The five-method SpriteAnimator core is now source-integrated and full-ROM exact. Stable human-facing architecture is in `docs/SPRITE_ANIMATOR.md`.

Durable integration facts:
- the class is 0x14 bytes and the combined source object contributes exactly 0x178 linked text bytes;
- method symbols remain at `0x0805E824`, `0x0805E850`, `0x0805E860`, `0x0805E894`, and `0x0805E8F0`; following assembly routine `func_0805E99C` remains at `0x0805E99C`;
- the halfwords at `0x0805E84E`, `0x0805E85E`, and `0x0805E99A` are alignment seams, not functional animation instructions;
- `src/entity_actor.cc` can call the recovered typed `SetAnimation` method directly without changing the ROM;
- the ninth tracked compiler behavior is required for exact `Update` code generation and is now part of the normal tracked installer path;
- production proof with the tracked path is `sh_muql8c0t_10159bcb`, followed by `sh_muql8vwy_d2f4fcda` for SHA1, size, progress, symbol, and diff hygiene.

Integration tooling lesson: detached Git worktrees do not inherit ignored/local `baserom.gba` or generated `tools/agbcc`. Missing those can produce misleading modern-devkit header/parser failures. Provide the baserom explicitly and install the tracked compiler inside the detached worktree before diagnosing candidate source.

## October 2, 2026 - hardware owner/accessor architecture reconstruction

The high-fanout cluster around `0x080088B8..0x08008940` is not a gameplay manager. It is an 8-byte owning hardware wrapper around a 0x4B0-byte hardware runtime context used directly or as a base/member by many scenes.

Proven outer-wrapper facts:
- constructors `08008444`, `080084DC`, and `08008574` write `vtable_unk_080E5B00` at wrapper +4, allocate exactly 0x4B0 bytes, initialize the allocation, and store its pointer at wrapper +0;
- `vtable_unk_080E5B00` is only `[0, 0, 0x080086BD]`; `080086BC` is the wrapper teardown path;
- intro-scene construction calls `08008444(this)` and then replaces the +4 vtable with its derived scene vtable, while other scene families embed the wrapper at a nonzero offset. Treat the wrapper as shared hardware ownership infrastructure, not one specific scene type.

Proven 0x4B0 context layout:
- +0x000..+0x023: expanded key-input/repeat state. `080091A4` calls the already-decompiled `InitKeyInput`; `080088C4`, `080088CC`, and `080088D4` read halfwords at +0, +4, and +8; `080088B8` forwards the context to `08009268` to update repeat state.
- +0x024..+0x033: 0x10-byte vector-like queue for 16-byte hardware/DMA transfer descriptors. Callers obtain it through `08008910`, build descriptors with `08008F0C` / `08008F60`, and append them. `08008FE4` executes the descriptors through DMA3 at `0x040000D4`.
- +0x034..+0x08B: 0x58-byte display-I/O register shadow. `080096B0` zeroes it and initializes BG2/BG3 affine identity fields; `080096F0` uploads it to `0x04000000` and `0x04000054`. `08008918` returns this subobject.
- +0x08C..+0x48F: 0x404-byte OAM shadow/state. `08009744` initializes 128 eight-byte OAM entries as disabled; `0800977C` uploads the 0x400-byte entry array to `0x07000000`. `08008920` returns this subobject.
- +0x490..+0x493: four-byte scheduler/interrupt-dispatch wrapper constructed by `08008980`; `08008AE0` returns its internal +0x0C interface.
- +0x494..+0x4AF: 0x1C-byte persistent VBlank callback list. `08008940` returns it. The list uses the intrusive-list machinery around `080098AC..080099D4`.

VBlank proof:
- `080087C8` builds temporary callback nodes for display upload (vtable 5AF0 -> `080D780C` -> `080096F0`), OAM upload (5AE0 -> `080D781C` -> `08009864`), and queued DMA transfers (5AD0 -> `080D782C` -> `08008FE4`);
- it also inserts the persistent context +0x494 callback list into that temporary callback collection;
- it registers the collection with the scheduler at context +0x490, calls `08008AF0`, then unregisters it;
- `08008AF0` calls `func_08000568(1)`; `08000568` is `IntrWait(1, 1)`, where IRQ bit 1 is VBlank;
- the display/OAM/DMA callbacks return zero after running, so the intrusive callback container removes the one-shot upload nodes.

Conservative naming policy for source work:
- the subsystem identity `Hardware` / `HardwareContext` is supported by direct GBA register, DMA, OAM, key-input, and VBlank evidence;
- use semantic names `transfer_queue`, `display_regs`, `oam`, and `vblank_callbacks` for the proven subobjects;
- keep the +0x490 scheduler wrapper conservative until its complete interface is reconstructed;
- do not invent gameplay-manager/audio/entity-manager meanings for this context.

First source-candidate target should be the high-fanout accessor API, using this proven layout and preserving the raw-byte islands between named functions.

## Range/release/pool boundary — October 3, 2026

Stable contracts and source ranges are in `docs/RESOURCE_HANDLES.md`. Private source/lifetime evidence is in `tools/ches/checkpoints/resource-allocator-08007A28-2026-10-03/README.md`. Partial ranges, conditional child release, raw byte getters and backward entry initialization are proven; reservation parameter aggregation is only a hypothesis. The unchanged 13-rule compiler independently passes this496-byte source gain. Order-9 fill148/0 is saved privately for the next unit.
