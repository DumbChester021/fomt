# FoMT Compiler Reconstruction Research

## AUTHORITATIVE CURRENT COMPILER TRUTH

This section supersedes all historical package/current-state paragraphs below.

- Public compiler repo `https://github.com/notyourav/agbcc.git`, pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c`.
- Authority: tracked `tools/install_agbcp.sh` and `tools/agbcp_fomt_compat.patch`, SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`;13 enabled structural behaviors. No compiler change in this subtree batch.
- Current public retail branch is `main`. The exact October 6 state is **71,504 / 940,036 source bytes = 7.6065%** with `fomt.gba: OK` at the retail SHA1. The tracked compiler authority is unchanged. The legacy loader and all documented compiler-sensitive frontiers remain parked unless new structural evidence justifies reopening them.
- `func_08092A70` wrapping eligibility is now **parked at behavior-complete 0x260 / 3**, not an active compiler target. Fresh production-wrapper `-da` repro confirms the final-`jump2` orientation mismatch. The exact October 3, 2003 Nintendo THUMB compiler reproduces the same three wrong branch bytes on unchanged v8 (0x260 / 7 total, with four extra alignment-NOP bytes), so there is no evidence for a missing compatibility-compiler rule. Targeted explicit-label v13 and outer-`else if` v14 both regress to the already-known 0x254 / 518 whole-call cross-jump merge. Resume only on genuinely new source-structural evidence.
- October 5 loader oracles remain preserved historical evidence. Exact Dog and Farmer constructors show that equal zero values can naturally remain distinct across nested aggregate construction, but the loader-shaped six-byte-copy microprobe is closed as a transferable mechanism: under the normal tracked compiler it creates a useful later narrow/string-zero split while collapsing the early literal/source zero distinction, and retail has no memcpy at +0x1CCC. The prior `proof-v96-da-current` early r9 split is a private `AGBCC_PRESERVE_DISTINCT_USERVAR_ZERO=1` oracle, not stock v96; stock v96 is the recorded 0x2E4 / 495 collapsed-zero result. Do not reopen loader compiler work without new structural evidence.
- Prior compiler-change package-v20 proof remains authority for the13 rules:21 focused checks and54/54 unchanged modules, four private corpus ablations, both fresh installs/full ROMs. Newest rules use pointer metadata only after equal priorities and the existing standard threader after reload, honoring flag_thread_jumps. No target identity or diagnostic selector was promoted.

Constructor provenance: PRE-generated count and end pointer have identical 8 refs/live18/one set and allocation priority. REGNO_POINTER_FLAG records only the end pointer; pointer preference after existing priority comparisons yields unchanged constructor 0x15C/0. Acquisition provenance: an intervening return-value copy obstructs early standard threading; combine removes it. Re-running the existing standard threader after reload yields unchanged acquisition 0xD2/0. No custom branch rewrite is used.

All twenty recovered resource functions and entity/effect callers remain exact. Raw copy, reservation and tiny query islands are preserved. Initial water matcher bound included two alignment bytes beyond its 166-byte symbol; the corrected body proof is 166/0 and full ROM validates alignment. This was a measurement error, not a compiler regression.

The compatibility patch is a validated reconstruction, not proof of the original Nintendo compiler. Historical compiler families and private packages remain provenance only. Generated compiler directories must come from the tracked pinned installer for final proof.

Allocation08008020 is still126/10, only root/full-byte r5/r6 reversed. All 13 rules individually unset give the same result; setting0 was a false first ablation because switches use getenv. Saved flow/global metadata: root refs12/live53 versus full refs6/live18. Existing pointer tie is not causal. Natural source/inline variants either preserve this result or add copies; no new allocator rule is justified by current evidence. See allocation-causal/allocation-ablation in the allocator checkpoint; do not repeat these closed experiments.

Order-8 partial fill `080D7094` is130/50 versus132 expected; partial clear `080D72C4` is132/50 versus134 expected. V1 and explicit-copy V2 converge. Fill V2 RTL copy134 survives CSE, but CSE substitutes end for remaining in subtraction137; the copy becomes unused and is deleted in flow. Saved `rtl-v1/`, `rtl-v2/`, and `rtl-slices/` own the causal evidence. Do not repeat source-spelling variants or add a compiler rule without new structural evidence. Root allocation remains126/10, all13 genuinely unset-rule ablations unchanged; reservation best300/211 with aggregate-reference ABI unproven.

This measured copy-loss frontier is saved without changing the compiler. A new compatibility rule would require an independent structural discriminator and full regression proof; the present two source variants are not historical compiler proof.

## Wrapping eligibility `08092A70` final-`jump2` frontier - October 5, 2026

Target range: `0x08092A70..0x08092CD0`, exactly **0x260 bytes**. Do not use the earlier scratch `0x2F4` comparison; that accidentally included the already-exact `func_08092CD0`.

Best natural source is:
`tools/ches/checkpoints/ui-packed-sprite-2026-10-05/candidate-wrap-eligibility-92a70-v8.cc`

Result: **0x260 bytes / 3 differing linked bytes**. Every mismatch is in the Thumb conditional/long-branch trampoline after the second `ToolStack::IsEmpty()` check.

Causal pass timeline from saved RTL dumps:

- CSE2: second emptiness edge is `NE -> label 206`;
- flow: still `NE -> label 206`;
- local allocation: still `NE -> label 206`;
- global allocation: still `NE -> label 206`;
- final `jump2`: rewritten to `EQ -> label 731`, where label 731 is `cannot_wrap`.

Therefore the first divergence is **final cross-jumping**, not frontend semantics, CSE2, flow/liveness, allocation, or ordinary thread-jumps. Compiling unchanged v8 with both the production `tools/agbcc/bin/agbcp` wrapper and the older scratch compatibility wrapper gives the same 3-byte result. Adding `-fno-thread-jumps` also changes nothing.

The pinned GCC `jump.c` explains the mechanism: final `jump_optimize(..., cross_jump=1)` compares renumbered RTL and can cross-jump identical instruction tails. In v8 it merges the duplicate rejection-sound tails (`func_08008B6C(..., 0xC7)`) and chooses the opposite edge orientation from retail. Positive-condition v11 still contains two distinct `IsEmpty()` calls after the early jump pass, but final `jump2` merges the entire matching call/check sequence and regresses to **0x254 / 518 differences**. Direct-label v12 regresses to **0x254 / 570**.

Closed source families for this target include v6-v12 as documented in the active UI-packed-sprite checkpoint. Do not resume cosmetic condition/goto/named-bool spelling permutations. A new compatibility-compiler behavior is **not justified yet**: first require either historical compiler evidence for different cross-jump orientation or a genuine source/RTL structural discriminator, then prove it across independent canaries and the full regression corpus.

Private local research note. Do not include this file in retail contribution commits unless the project explicitly decides to adopt a reconstructed compiler.

MANDATORY EXPERIMENT REGISTRY: `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md`. Any future LLM must read/search that file before creating or rerunning a Call238 experiment. It records existing scripts, compiler switches, result tables, exact artifacts, regression canaries, and closed/superseded hypotheses specifically to prevent context-loss rediscovery.

## Why this document exists

Call238 reduced several hard retail functions from apparent source-matching problems to measurable compiler bookkeeping differences, then generalized those differences into a reproducible FoMT compatibility compiler package.

This still is not proof that the original Nintendo/Cygnus compiler source has been recovered. The working result is a separately packaged **exact FoMT compatibility compiler candidate** with reproducible clean-base build inputs and regression evidence.

The package is `tools/ches/checkpoints/call238/compat-compiler-v3/`; its patch is `generalized-compiler-candidate-v3.patch` with SHA-256 `27c06f675f17a5a736a112922bba044d68f1f101b4ea0ad57347b04727a8e206`. No permanent public compiler name has been selected.

## Historical production rule (superseded)

The repository's canonical compiler binaries and default Makefile remain unchanged. However, the current source-converted `ches-dev` working state requires the package-v3 `cc1plus` wrapper for an exact ROM build because several reconstructed functions intentionally depend on the validated compatibility behaviors.

Do not silently replace `tools/agbcc/bin/agbcp`, change the default compiler path, or present package v3 as the recovered historical compiler.
Never integrate these research techniques as production matching mechanisms:

- hard-register forcing;
- per-function allocator exceptions;
- arbitrary live-length edits;
- CSE or RTL rewrites keyed to a function/pseudo number;
- volatile/padding/inline-asm coercion.

Research diagnostics are allowed only in isolated compiler clones.

## Water breakthrough

Target:

`GetWaterRegion / func_080A45A8`

Retail size:

`168 bytes`

Natural source family:

`tools/ches/checkpoints/call238/cse-counterfactual-order-scan/rxyim.cc`

The semantic source is closed. It contains every required branch, comparison, table access, loop action, and return behavior.

### Measured compiler differences

The isolated compiler research identified these retail-relevant behaviors:

1. preserve the stable table base through CSE2;
2. retain table dependency ancestry as `r6 stable -> r2 moving -> ip common`;
3. place the invariant table literal load between the map halfword load and its bitfield shifts;
4. account for the self-modifying `index++` pseudo so that global allocation chooses index=`r4`, x=`r5`.

The first three behaviors leave only the x/index swap.

Recovered allocation inputs:

- x pseudo 24: 5 refs / live 57;
- index pseudo 69: 7 refs / live 80.

### Stronger flow-accounting closure

The earlier arbitrary global-allocator experiment changed index live length 80 -> 79. That experiment is now superseded by an upstream accounting explanation.

Recovered flow counts the self-modifying `index++` pseudo:

- once because it is live through the instruction;
- once again because it is the SET destination in `mark_set_1`.

Flow therefore reports index live length 40.

The constant initialization `index = 0` receives a `REG_EQUIV` note in `local-alloc.c::update_equiv_regs`, which doubles 40 -> 80.

Research-only diagnostic:

`AGBCC_WATER_MOD_SET_NO_LIVE=1`

It skips only the extra modified-SET live-length increment for index pseudo 69.

Result:

- flow length 40 -> 39;
- equivalence-adjusted length 80 -> 78;
- normal allocator picks index=`r4`, x=`r5`;
- no hard-register forcing;
- 168 bytes;
- 0 differing linked bytes.

Proof artifact:

`tools/ches/checkpoints/call238/artifacts/water-natural-modset39.bin`

This is currently the strongest evidence that the water mismatch is a compiler flow/accounting difference rather than missing source.

## Terrain breakthrough

Target:

`IsFootprintOnWaterSurface / func_080AC5D0`

Retail size:

`164 bytes`

Natural source:

`tools/ches/checkpoints/call235/terrain.unmatched.cc`

The natural source already has the correct operation graph, adjusted-y scratch lifetime, bounds logic, table access, and loop body.

Recovered allocator inputs:

- terrain parameter pseudo 22: 5 weighted refs / live 29;
- top pseudo 25: 4 weighted refs / live 26.

Recovered compiler therefore chooses:

- terrain -> r3;
- top -> r4.

Retail requires:

- terrain -> r4;
- top -> r3.

Research-only diagnostic:

`AGBCC_TERRAIN_REFS_MINUS1=1`

It changes only terrain pseudo 22 from 5 weighted references to 4 before global allocation.

Result:

- normal allocator chooses terrain=`r4`, top=`r3`;
- no hard-register forcing;
- 164 bytes;
- 0 differing linked bytes.

Proof artifact:

`tools/ches/checkpoints/call238/artifacts/terrain-natural-refs4.bin`

The remaining terrain question is therefore specifically why the retail-era compiler/source accounted for one fewer weighted reference to the incoming terrain pseudo.

## Historical compiler evidence

### Recovered agbcc C++ compiler

The recovered C++ compiler is not a clean single-date compiler tree. Its backend provenance is mixed across early-2000s snapshots.

Relevant recovered flow behavior includes:

- modified SET destinations contribute to `REG_N_REFS`;
- modified SET destinations contribute an extra `REG_LIVE_LENGTH` unit;
- `REG_EQUIV` can cause `REG_LIVE_LENGTH *= 2`;
- global allocation priority depends sensitively on these values.

### Bundled old ARM compiler snapshot

The older bundled ARM compiler source from the recovered agbcc history was checked.

Its relevant modified-register reference and live-length accounting is the same as the recovered C++ flow implementation.

Therefore the discrepancy is not simply:

`old C compiler behavior != recovered C++ compiler behavior`.

### GCC 2.96

A genuine ARM C++ compiler from the GCC `2.96 20000731 (experimental)` lineage was reconstructed.

It was rejected because:

- the water candidate collapses to 132 bytes;
- already-exact `AEntity::GetLocation()` changes from 144 to 140 bytes;
- exact FoMT C++ module code generation regresses materially.

### EGCS 1.1.2

Public historical source was downloaded and extracted:

`/mnt/data/Github/egcs-1.1.2-call238/egcs-1.1.2`

Version:

`egcs-2.91.66 19990314 (egcs-1.1.2 release)`

It still contains:

- modified SET destination reference counting;
- the extra SET live-length increment;
- `REG_LIVE_LENGTH *= 2` equivalence behavior.

However, its final liveness propagation uses an older implementation based on:

- `maxlive`;
- `regs_sometimes_live`;
- per-block tracking of registers that have ever become live.

The recovered FoMT compiler instead uses the later direct bitmap scan across the current live set. That narrow EGCS accounting path has already been ported behind `AGBCC_USE_EGCS_LIVE_ACCOUNTING` and tested; it does not change the relevant water/terrain allocator inputs, so it is closed as a standalone explanation.

### GCC 2.7.2.3

A complete public GNU GCC 2.7.2.3 archive was downloaded and extracted under `/mnt/data/Github/gcc2723-call238/gcc-2.7.2.3`.

Its historical flow/global allocator already:
- counts pseudo SET destinations in weighted references by loop depth;
- explicitly treats modified registers as receiving both use/set reference weight;
- adds the SET instruction to pseudo live length;
- uses the same core `floor_log2(n_refs) * n_refs / live_length` global-allocation priority formula.

Therefore neither terrain's one-reference priority boundary nor water's constant-step modified-SET result is explained by reverting to stock pre-1998 GCC behavior.

### Whole-file EGCS flow transplant

An isolated clone was created:

`/mnt/data/Github/agbcc-egcs-flow-call238`

Replacing the recovered compiler's entire `flow.c` with EGCS 1.1.2 `flow.c` was tested.

It does not compile directly because the surrounding compiler core changed substantially. Incompatibilities include:

- `find_basic_blocks` APIs;
- `compute_preds_succs`;
- predecessor/successor bitmap helpers;
- `recompute_reg_usage`;
- basic-block infrastructure and prototypes.

Conclusion:

Do not pursue whole-file historical compiler swaps. Port only narrowly isolated accounting logic into a compatible research compiler.

## Working historical hypothesis

The broad “wrong Nintendo compiler revision” hypothesis is now strongly demoted. The exact October-3-2003 Nintendo/Cygnus THUMB `cc1plus.exe` is local and directly tested, and a coherent May-2000 `arm-000512` C++ compiler has now been built from the preserved full source tree. On the hard-target candidates, those two known revisions are codegen-equivalent.

October-2003 vendor package: `/mnt/data/Github/gba-compiler-patches-call238/thumb_patch03-OCT-03.zip`, extracted under `thumb03/`. Natural terrain is 164/10 and natural water `rxyim` is 172/104.

Coherent May-2000 build:
- source: `/mnt/data/Github/arm-000512-midkid-call238`;
- build: `/mnt/waydroid-hdd/home-chester-waydroid/call238-arm000512-build`;
- host compatibility only: `-std=gnu89 -fgnu89-inline`;
- `cc1plus` SHA256 `1b437f793a4603153136dc79c8da1987ee588cb177b5dc13c11375730e9874db`;
- matching C frontend `cc1` SHA256 `2ba75e8f47b466d297f5180f46cd1ff263394f681698e53f56775719a43f0794`.

Direct binary comparison:
- May-2000 terrain == recovered terrain == Oct-2003 vendor terrain;
- May-2000 water == Oct-2003 vendor water;
- recovered water differs from those only by the known two padding/alignment bytes;
- C frontend terrain is also byte-identical to the C++/vendor/recovered terrain output.

Therefore the remaining FoMT differences are better framed as source/RTL-shape or very narrow undocumented-toolchain behavior, not as a generic known compiler-version mismatch. Only genuinely new historical evidence should reopen compiler-family hunting.

A second local historical archive, `/mnt/data/Github/gba-compiler-patches-call238/src_patch021206.zip`, was compared against `/mnt/data/Github/arm-000512-midkid-call238/gcc`. The relevant `flow.c`, `global.c`, `local-alloc.c`, `cse.c`, `loop.c`, `toplev.c`, `version.c`, and `cp/lex.c` files are byte-identical. There is no hidden 2002 allocator/CSE/frontend change there; do not re-extract or re-diff that source family.

## What would justify a FoMT-specific compiler

Do not create a permanent project compiler merely because two hard functions can be made exact.

A candidate compiler reconstruction should satisfy all of these:

1. Water matches naturally from credible C++ source.
2. Terrain matches naturally from credible C++ source.
3. Multiple already-exact C++ functions remain exact.
4. Several allocator-sensitive functions improve or remain exact.
5. No widespread regressions appear in exact modules.
6. The behavior comes from coherent compiler logic or a historically supported patch, not function-specific exceptions.
7. The compiler can be built reproducibly from source.
8. Its provenance, differences from canonical agbcc, and validation results are documented.
9. It remains a separate tool package until project maintainers deliberately adopt it.

## Naming plan

If the reconstructed compiler passes the validation gates and becomes a genuinely useful FoMT decompilation tool, give it a distinct name.

The final name is reserved for the user to choose.

Until then, use neutral working descriptions such as:

- `FoMT compiler reconstruction`;
- `FoMT-specific compiler candidate`;
- `Call238 compiler candidate`.

Do not brand an unvalidated diagnostic compiler as recovered/original.

## September 30, 2026 - final Call238 exact unified proof

Call238 reached the first isolated compiler state where **both remaining hard targets are exact at the same time and the entire 54-module exact-C++ regression corpus remains byte-exact**.

### Terrain exact proof

Research source:

`tools/ches/checkpoints/call238/terrain-mech-temp_copy_shift.cc`

Relevant source shape:

```cpp
int adjusted_y = y - 8;
int top = adjusted_y;
top >>= 3;
```

Isolated compiler switches:

- `AGBCC_CSE_KEEP_MINUS8_COPY=1`
- `AGBCC_COMBINE_KEEP_MINUS8_REG_COPY=1`
- `AGBCC_RESTORE_COMBINE_COPY_REFS=1`

Verified artifact:

`tools/ches/checkpoints/call238/artifacts/terrain-targeted-three-way.mismatch.txt`

Result:

- size = `0xa4` / 164 bytes
- differing linked bytes = **0**
- paired `.diff` is empty

The mechanism preserves the distinct `y - 8` pseudo through CSE/combine, keeps the pseudo-to-pseudo copy feeding `top`, and restores weighted reference information for combine-eliminated copies before allocation. This closes the old 164/3 plateau as a compiler bookkeeping/coalescing issue. The `-8` targeting remains diagnostic evidence, not yet a proven historical general compiler rule.

### Water exact proof

Research source:

`tools/ches/checkpoints/call238/cse-counterfactual-order-scan/rxyim.cc`

Isolated compiler switches:

- `AGBCC_CSE_KEEP_FIRST_78=1`
- `AGBCC_CSE_CHAIN_WATER=1`
- `AGBCC_CSE_REORDER_WATER_TABLE=1`
- `AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE=1`

Verified artifact:

`tools/ches/checkpoints/call238/artifacts/water-structural-reorder-verify.mismatch.txt`

Result:

- size = `0xa8` / 168 bytes
- differing linked bytes = **0**
- paired `.diff` is empty

The final table-reorder experiment was improved from hard-coded RTL instruction UIDs to structural recognition of the map halfword-load/bitfield-shift sequence and the `gUnk_0810563C` table literal. It is therefore stronger evidence than the earlier UID-specific diagnostic, but it is still FoMT/water-specific research behavior rather than a validated production compiler rule.

### Unified regression

Enable all seven switches above in the current isolated research compiler:

`/mnt/data/Github/agbcc-fomt-trace-call238/g++/cc1plus`

Final regression artifact:

`tools/ches/checkpoints/call238/full-flow-regression/structural_reorder_combined_results.tsv`

Result:

- **54/54 exact C++ modules**
- every recorded diff = **0**
- canonical and candidate sizes match for every module
- includes `src/code_0800BC58.cc` and the mutable-r0 accounting canaries

This is a major validation gate, but it is not enough to call the compiler recovered/original. The candidate still contains targeted diagnostic switches and has not yet been rebuilt cleanly/reproducibly as a coherent compiler package or subjected to wider/full-ROM validation.

## Immediate next work

Do not restart broad terrain syntax searches or compiler-version hunting. The old 164/3 search target is closed.

1. Reconstruct the final isolated compiler modifications from a **clean** research compiler tree and document the patch set so no conversation context is required.
2. Identify which of the seven switch behaviors correspond to coherent, historically defensible compiler logic. Remove pseudo/function-specific or FoMT-target-specific diagnostics where possible.
3. Preserve all three gates after every cleanup:
   - terrain 164/0;
   - water 168/0;
   - 54/54 exact-C++ regression.
4. Then perform wider/full-ROM validation with the cleaned compiler candidate before proposing any production compiler change or source conversion.
5. Keep the candidate separate from canonical agbcc. Do not copy the exact research sources into production `src/` merely because the scratch compiler can match them.
6. Only after reproducible source, coherent behavior, wider regression, provenance documentation, and maintainability review should the project consider packaging a separate FoMT-specific compiler. The permanent name remains reserved for the user.

For exact prior results and artifact paths, use `tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md` and the newest tail of `tools/ches/checkpoints/call238/checkpoint.md`.

## October 1, 2026 clean reconstruction and full-ROM gate

The seven-switch proof has now been reproduced from a clean isolated compiler tree at `/mnt/data/Github/agbcc-fomt-reconstruct-call238` (base `1caa6bec`). The clean `cc1plus` reproduces terrain 164/0, water 168/0, all five focused canaries, and the saved 54/54 raw-`.text` module corpus with total diff 0.

A forced full-ROM rebuild using the candidate only through the Makefile `CC1PLUS` override exposed a previously untested section class. The candidate ROM linked at the correct 8 MiB size but differed from retail by exactly 9 bytes, all inside `src/script_engine.o`'s 60-byte `.gnu.linkonce.t.__lower_bound...` helper at `0x080E0EB4..0x080E0EEF`. The existing 54-module runner extracts only `.text`, so this template/linkonce section was outside its coverage.

Single-switch ablation isolates the full-ROM regression to `AGBCC_RESTORE_COMBINE_COPY_REFS`. With no research switch or with any of the other six switches alone, the helper is exact. Reference restoration alone changes the helper by the same 9 bytes, an r4/r5 allocation swap.

Allocator evidence shows why the rule cannot simply be removed: in terrain it raises pseudo 26 from 4 to 6 weighted references, moving the required `top` value from r4 to retail r3; in `lower_bound` it raises the long-lived iterator pseudo 22 from 7 to 11 references, incorrectly moving it from retail r5 to r4. The next reconstruction target is therefore a coherent structural/historical rule for when combine-eliminated copy references should survive recomputation. Final logic must not key on FoMT function names, addresses, pseudo IDs, UIDs, or symbols.

After the candidate experiment, canonical `make -B -j4 compare` was rerun with the untouched production compiler and passed (`fomt.gba: OK`), restoring normal production build artifacts.

## October 1, 2026 user-variable copy accounting refinement

The broad combine-copy reference restoration has been narrowed using GCC's existing `REG_USERVAR_P` distinction. Reference information is now retained only for eliminated pseudo copies where both source and destination correspond to source-level variables. This excludes the compiler-temporary-to-user-variable STL `lower_bound` copy that caused the earlier 9-byte full-ROM mismatch, while retaining the terrain `adjusted_y -> top` copy.

This narrowing passes all current gates: terrain 164/0, water 168/0, the five focused canaries, 54/54 raw `.text` modules, and a forced full-ROM retail SHA1 comparison (`fomt.gba: OK`). It is therefore the strongest currently supported generalization of the terrain reference-accounting behavior.

A second attempted generalization, preserving all uservar->uservar copies through both CSE and combine, is too broad. It keeps the hard targets exact but changes `src/code_0800BC58.cc` by 111 `.text` bytes and shrinks the module from 536 to 532 bytes. Preserving such copies in only CSE or only combine does not change that canary; the regression requires both passes.

A narrower immediate-self-update test distinguishes the terrain shape (`top = adjusted_y; top >>= 3`) from the canary's iterator-copy shapes. It restores the canary, but terrain falls back to 164/3. Pass isolation shows this remaining failure is entirely CSE-side: keeping the old CSE `-8` protection restores terrain 164/0, while keeping only the old combine `-8` protection does not. The next historical/general reconstruction question is therefore specifically how CSE should treat a source-variable copy that later becomes an in-place update.

## October 1, 2026 terrain compiler behavior generalized

The terrain proof no longer depends on the arithmetic constant `-8`. The clean reconstruction now uses a source-variable copy-preservation rule based on GCC's own `REG_USERVAR_P` metadata and local RTL structure.

In CSE, copy reversal is suppressed for a uservar->uservar copy when the next real SET overwrites the same destination. A stricter form that required the next source to literally mention the copied destination failed by 3 terrain bytes because a later CSE revisit had already rewritten the source to an equivalent register. The destination relationship persisted and cleanly distinguishes terrain from the `code_0800BC58` canary copy chains.

In combine, the narrower immediate-self-update form is sufficient. Combined with uservar-only restoration of weighted reference counts, the cleaned compiler reproduces terrain 164/0 without either old `-8` hook.

Validation of the cleaned tree: water 168/0, all five focused canaries, 54/54 raw `.text` modules, and full retail ROM SHA1 all remain exact. The earlier constant-specific terrain hooks and temporary diagnostics are removed from the isolated reconstruction tree. The next reconstruction frontier is the still-targeted water behavior.

## October 1, 2026 water CSE ancestry refinement

The first two water-specific CSE diagnostics now have a structural replacement candidate. Trace of `make_regs_eqv` and the existing CSE copy-reversal path showed that stock CSE first retargets the symbolic literal-pool load into a later pseudo. That destroys the adjacent copy chain needed for the following long-lived pseudo to trigger generic copy reversal.

A research rule that preserves the register copy immediately following `MEM(SYMBOL_REF)` literal-pool loads leaves the literal temporary intact. Existing CSE behavior then naturally creates the retail dependency chain; no pseudo IDs or water function identity are needed.

Target result: water remains 168/0 with `AGBCC_CSE_KEEP_FIRST_78` and `AGBCC_CSE_CHAIN_WATER` disabled. This is not yet broad-regression validated, so the old hooks remain in the research tree until the next validation ladder completes. The table-load placement rule still depends on identifying the FoMT table symbol and remains the next generalization target after regression.

## October 1, 2026 final generalized candidate and provenance classification

The clean reconstruction at `/mnt/data/Github/agbcc-fomt-reconstruct-call238` now has a safety-hardened five-rule candidate with no FoMT function/table names, addresses, RTL UIDs, pseudo IDs, terrain `-8` special case, or hard-coded water shift amount. Active research switches are:

- `AGBCC_PRESERVE_USERVAR_COPIES`
- `AGBCC_RESTORE_COMBINE_COPY_REFS`
- `AGBCC_PRESERVE_LITERAL_POOL_COPY`
- `AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD`
- `AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE`

Final validation: terrain 164/0, water 168/0, all five focused canaries exact, `full-flow-regression/hardened3_results.tsv` = 54/54 exact / total diff 0, and full-ROM candidate build `sh_mup4pun0_a281e666` = `fomt.gba: OK`. Canonical production restore `sh_mup4rumi_6b27ec0f` also = `fomt.gba: OK`.

Reproducible patch: `tools/ches/checkpoints/call238/generalized-compiler-candidate.patch`, 281 lines, SHA-256 `921369729130a64d9e440916736ca64d1269f955a0f23c2a8176d2560942726f`.

### Provenance / confidence classification

**Design-backed, but exact historical patch still unproven:**

- User-variable copy preservation. GCC 2.7.2.3, EGCS 1.1.2, and the recovered compiler all contain the same generic CSE `(set REG0 REG1)` copy-reversal optimization. Historical combine code already uses `REG_USERVAR_P` as a real semantic distinction in optimization decisions. Our narrow uservar preservation rule is therefore consistent with contemporary GCC design, but no historical source inspected contains this exact exception.
- Combine-copy reference restoration. GCC 2.7.2.3 and the recovered compiler contain the same explicit top-of-file warning that combine does not completely update `reg_n_refs` when a register becomes unnecessary. Restoring only eliminated uservar->uservar copy reference information is a coherent repair of a documented limitation. The exact Nintendo/FoMT historical repair remains unproven.

**Conservative compatibility behavior, historically plausible in spirit but not found directly:**

- Literal-pool copy preservation. This only declines an existing CSE copy-reversal when the copied value was just loaded from symbolic literal-pool memory. The rule lets the compiler's own long-standing copy-reversal logic form the retail dependency chain naturally. No matching stock GCC 2.7.2.3/EGCS exception was found.

**FoMT compatibility behavior, not stock historical GCC behavior:**

- Constant-step self-modified-SET live accounting. Stock GCC 2.7.2.3 and EGCS 1.1.2 both count the SET instruction in live length, including the general modified-SET family. The narrow `reg = reg + CONST_INT` exception is regression-clean and exact for FoMT, but it is not explained by reverting to known stock historical GCC behavior. Treat it as a possible undocumented vendor compatibility patch or reconstructed behavior, not recovered fact.
- Bitfield/literal-load hoist. Neither GCC 2.7.2.3 nor EGCS 1.1.2 `cse.c` contains a comparable `reorder_insns` post-CSE motion. This rule is therefore a compatibility scheduling behavior, not evidence of stock GCC ancestry. It is safety-hardened to remain within straight-line control flow, reject volatile literal loads, require `MEM(SYMBOL_REF)` plus `REG_EQUAL SYMBOL_REF`, and ensure the moved destination is unused across the motion.

Accordingly, call this an **exact FoMT compatibility compiler candidate**, not the recovered/original compiler. A future package may be justified by reproducibility and full-ROM exactness even if some behavior ultimately proves to be compatibility reconstruction rather than historical source recovery.

### Safety-hardening experiments

- `hardened-hoist-water`: 168/6. Adding `RTX_UNCHANGING_P` to the literal-load requirement was too strict and suppressed the required hoist. Rejected.
- `hardened2-water`: 168/6. After removing `RTX_UNCHANGING_P`, the scan still continued after finding a valid pair; a later jump reset the saved pair before the final reorder. Rejected implementation bug.
- `hardened3-water`: 168/0. Stop scanning immediately after finding the first safe same-region literal candidate. This retains the control-flow/nonvolatile/no-intervening-use guards and is the current final form.

## October 1, 2026 compatibility compiler adoption and source conversion

The five-rule compiler candidate is now packaged as a private opt-in compatibility compiler and has been used to remove the two remaining compiler-blocked retail assembly implementations. `GetWaterRegion` and `IsFootprintOnWaterSurface` now live as readable C++ in `src/water_region.cc` and `src/terrain.cc` respectively.

The final source-converted validation preserves the retail SHA1 with the package wrapper, including the historical 54-module regression corpus and focused canaries. The unchanged canonical agbcc compiler does not reproduce the two new source functions exactly; therefore this state should be described as a source-complete FoMT compatibility build, not as proof that the recovered canonical compiler is the exact historical compiler.

## October 1, 2026 - exact constructor allocator rule and pre-integration validation

- func_080A46AC is EXACT 0x94 / 0 linked-byte differences from natural C++ source tools/ches/checkpoints/call238/next-080A46AC-poly-natural.cc using the isolated reconstructed compiler.
- func_080A4740 is EXACT 0x74 / 0 from tools/ches/checkpoints/call238/next-080A4740-one-local.cc. Key source detail: a natural local u32 one = 1 carried across memset reproduces retail's r4 constant lifetime.
- func_080A47B4 remains EXACT 0x58 / 0 from tools/ches/checkpoints/call238/next-080A46AC-class2.cc.
- Final research-only allocator behavior lives in /mnt/data/Github/agbcc-fomt-reconstruct-call238/g++/local-alloc.c behind AGBCC_EXTEND_CALL_RESULT_LIFETIME=1.
- Structural discriminator: hard-register to pseudo copy immediately after CALL_INSN; call/copy/immediate consuming store all have RTX_INTEGRATED_P; pseudo is SImode with REG_N_REFS == 2 and REG_N_DEATHS == 1; next non-note insn is a single SImode MEM store whose source is exactly that pseudo; allocation death is extended to MIN(insn_number * 2 + 1, qty_death + 3).
- Why +3: find_free_reg scans born_index <= ins < dead_index, so +2 stopped before the next hard-register boundary and had no effect.
- Broader rule regressed src/script_engine by 1333 .text bytes. Requiring the integrated/inlined sequence restored script_engine exactly while keeping both constructors exact.
- Final validation under the narrowed rule: destructor 0x58/0; terrain 0xA4/0; water 0xA8/0; all five focused canaries exact; 54 saved modules changed 0 total_diff 0; forced full-ROM rebuild passed SHA1 with fomt.gba: OK.
- Important executions: constructor + script_engine targeted proof sh_mupfu6y3_bb3d5a02; final 54-module regression sh_mupfunsr_5ea0358c; forced full-ROM pre-integration PASS sh_mupfvcfw_32d657be.
- Final compiler env: AGBCC_PRESERVE_USERVAR_COPIES=1, AGBCC_RESTORE_COMBINE_COPY_REFS=1, AGBCC_PRESERVE_LITERAL_POOL_COPY=1, AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD=1, AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE=1, AGBCC_EXTEND_CALL_RESULT_LIFETIME=1.
- Production/package compiler files remain unchanged. Current build outputs were produced with the isolated compiler, but tools/agbcc/bin/agbcp was not replaced.
- Production integration boundary: linker order is src/code_080A4650.o(.text), src/map_data.o(.text), asm/code_809E804.o(.text.after_get_map_data). Retail lifecycle block occupies 0x080A46AC..0x080A480B at the beginning of .text.after_get_map_data; next asm function is func_080A480C.
- Exact next action: create an upstream-style source unit at this linker slot (likely src/code_080A46AC.cc) containing the coherent provider/helper/outer class plus both exact constructors and exact destructor; insert its object after map_data in fomt.lds; remove only func_080A46AC, func_080A4740, and func_080A47B4 assembly while leaving .text.after_get_map_data immediately before func_080A480C; build with isolated compiler + six switches and require full-ROM SHA1 exact; if integration passes, package/generalize the sixth allocator behavior into the compatibility compiler and rerun validate.sh.
- No production source/asm/linker mutation for this class block has happened yet. No commit/push occurred.

## October 1, 2026 - lifecycle production integration + six-rule package complete

- Production source integration is complete for the coherent lifecycle block `0x080A46AC..0x080A480B`.
- New source: `src/code_080A46AC.cc`, containing readable C++ for `func_080A46AC` (0x94), `func_080A4740` (0x74), and `func_080A47B4` (0x58). The three retail assembly bodies were removed from `asm/code_809E804.s`; `.text.after_get_map_data` now begins at `func_080A480C`.
- C++ ABI integration uses normal old-GCC destructor ABI plus linker aliases. `#pragma interface` suppresses duplicate local vtable emission. `fomt.lds` aliases `__vt_7UnkPoly`, `__13UnkHandleBase`, `_._13UnkHandleBase`, and `func_080A47B4`, and places `src/code_080A46AC.o(.text)` after `src/map_data.o(.text)` at the exact retail slot.
- Production integration full-ROM proof with cleaned isolated six-rule compiler: `sh_mupgd3fb_ec5bfeb0` -> `fomt.gba: OK`.
- Final compatibility patch regenerated at `tools/ches/checkpoints/call238/generalized-compiler-candidate.patch`: 400 lines, SHA-256 `9fbaaf6a4947a45d7ac90ba763b850bd95de81499d1f4c2e1d73db2a7ff12ac3`.
- Compatibility package upgraded to six behaviors. Fresh build directory: `/mnt/data/Github/agbcc-fomt-compat-package-call238-v2`. Fresh clean-base build `sh_mupgfpis_dc629328` succeeded.
- Final package validation `sh_mupggswl_4692cc57`: terrain 0xA4/0; water 0xA8/0; lifecycle main 0x94/0; lifecycle alt 0x74/0; lifecycle destructor 0x58/0; five focused canaries exact; saved regression corpus 54/54 changed 0 / total diff 0; full source-converted ROM `fomt.gba: OK`; validator reports compatibility compiler PASS and full-ROM PASS.
- Current linked-code progress: **53,344 / 940,036 bytes in source = 5.6747%**, with **886,692 bytes = 94.3253%** still linked from assembly. This lifecycle block added 352 exact source bytes, moving progress from 5.6372% to 5.6747%.
- Concise anti-rediscovery ledger created at `tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md`. Read it before reopening compiler/version/source-shape families; detailed history remains in `EXPERIMENT_INDEX.md`, registry, checkpoint, and compiler research notes.
- Reusable decompilation skill was expanded with the generalized lessons from this investigation: stop syntax roulette once RTL converges, inspect allocator interval semantics, validate realistic multi-method C++ units, handle old C++ destructor/vtable ABI carefully, treat linker placement and generated sections as part of matching, require full linked binary/hash beyond `.text` corpora, and maintain a concise failure ledger.
- Exact next decompilation action after bookkeeping: continue the same coherent class/subsystem at retail `func_080A480C`, using the recovered object layout, six-rule compatibility wrapper, and `tools/ches/compare-function.py` rather than restarting compiler research.
- No commit or push performed.


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

## October 2, 2026 - fixed-address ARM/IWRAM call scheduling candidate

New evidence from the unnamed retail wrapper `0x080A4A4C..0x080A4A93` isolates an eighth potential compatibility behavior.

### Source/ABI evidence
- The callee `func_030004DC` is ARM code in `.iwram`, while the caller is Thumb with `-mthumb-interwork`.
- Natural fixed-address function-pointer source v4 produces the correct `_call_via_r4` interworking mechanism and exact 0x48 size.
- Exact October-2003 Nintendo/Cygnus `cc1plus.exe` gives the same v4 result as package v3: **0x48 / 8**. This therefore is not established historical vendor behavior from that binary.

### First compiler divergence
- In the recovered `calls.c`, `prepare_call_address` runs before hard register parameters are loaded.
- Retail repeatedly stages stack arguments, then r0-r3, then loads the fixed IWRAM target into r4 immediately before `_call_via_r4`.
- Mainline EGCS 1.1.2, GCC 2.95.3, ARM 000512, and GCC 2.96 inspected locally all retain the known pre-register-load `prepare_call_address` ordering. Do not claim a stock historical revision explains retail.

### Isolated structural probe
`AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` delays `prepare_call_address` until after hard-register argument loads only when:
- there is no direct function declaration (`fndecl == 0`);
- register parameters are present; and
- the call target RTL is `CONST_INT`.

The rule contains no FoMT address, symbol, UID, pseudo ID, or hard-register identity.

Result: `next-080A4A4C-v4.cc` becomes **0x48 / 0** (`sh_muq5e5fe_d8a7f29c`).

Status: **VALIDATED / PACKAGED AS COMPATIBILITY COMPILER V4 / PRODUCTION INTEGRATION PENDING**. Long-lived regression `sh_muq5la3k_58116924` and fresh-package validator `sh_muq5u5tf_811df27f` both passed: target exact, hard targets exact, five canaries exact, 54/54 corpus unchanged with total diff 0, and full source-converted ROM `fomt.gba: OK`. Fresh package build `sh_muq5r3xp_0f22f076` proves the behavior is reproducible from pinned base `1caa6becde5e4676b59c31c74d68f45ced79557c` using patch SHA-256 `c72cc9c9b7b1cf71d2c602e08fee188e484645a39fc8c50013b96437cb0db04c`. Production source/link integration of the 0x48 wrapper is the remaining exactness gate before commit/push.

## October 2, 2026 - contribution-safe compatibility compiler adoption

The validated eight-behavior compatibility compiler is no longer dependent on private Call238 packaging for reproducibility.

A sanitized, contribution-safe patch now lives at `tools/agbcp_fomt_compat.patch`. The normal installer `tools/install_agbcp.sh` pins public notyourav/agbcc commit `1caa6becde5e4676b59c31c74d68f45ced79557c`, applies the patch, builds upstream normally, installs generated files under ignored `tools/agbcc/`, preserves the real patched C++ compiler as `agbcp.bin`, and writes the normal `agbcp` entrypoint as a wrapper enabling the eight validated behaviors.

Fresh-checkout proof:
- installer: `sh_muq8ub7e_d7121409` PASS;
- plain no-override `make -B -j4 compare`: `sh_muq8xx1u_33bf1f63` PASS;
- exact retail SHA1: `sh_muq8yefu_1a0bdc0f`.

This satisfies the repository's clean/fresh-checkout reproducibility requirement. Generated compiler binaries remain ignored and are not contribution inputs.

## October 2, 2026 - generated compiler provenance matters

A five-function full-ROM integration exposed an important reproducibility distinction: the tracked compatibility patch/installer was correct, but an older generated `tools/agbcc` directory in the main worktree was stale. Copying that generated directory into a detached integration worktree produced a uniform four-byte layout shift beginning before the new targets.

Reinstalling from the tracked pinned path with `tools/install_agbcp.sh` produced an exact full ROM immediately. Therefore future integration proofs should treat the tracked installer + pinned compiler source/patch as authority, not the mere presence of generated compiler binaries.

## October 2, 2026 - SpriteAnimator global-allocation ordering evidence

The active func_0805E8F0 target provides a new global-allocation oracle.

v28a preserves the desired count-zero and frame-pointer-copy user-variable identities through CSE, combine, and flow under compatibility v4. AGBCC_PRESERVE_USERVAR_COPIES therefore succeeds at middle-end preservation but does not determine hard-register homes.

Global allocation trace shows no hard-register preferences for the remaining semantic roles. Normal v28 gives:
- result r5
- step r7
- count r8
- constant4 ip
while index r2 and frames r6 are already retail-correct.

A proof-only comparator ordering count -> frames -> result causes the remaining conflicts to cascade into all retail homes:
- count r5
- frames r6
- result r7
- step ip
- constant4 r8
This is diagnostic proof only and is not a valid final rule.

Even with those homes, v28 remains 0xA4/111 because retail also preserves a separate descriptor-base lifetime in r5 before reusing r5 for count. v15 naturally emits that descriptor/count identity split.

Next compiler research must distinguish source live-range identity and allocation accounting structurally. Any final rule must avoid function names, addresses, pseudo IDs, UIDs, and hard-register-specific special cases.

## October 2, 2026 - SpriteAnimator v31 allocation-order proof

v31b isolates a clean global-allocation oracle. Normal compatibility-v4 allocation gives result=r5, final-count=r6, frames=r7 while all other important homes are retail-correct. A pseudo-specific scratch ordering final-count -> frames -> result changes no source/RTL semantics and reduces the target from 25 to 10 differing bytes, recovering retail result=r7, count=r5, frames=r6.

This proves allocation priority/conflict ordering accounts for the three-register rotation. The diagnostic rule is not acceptable final compiler behavior because it keys on pseudo IDs. Final reconstruction must explain the ordering structurally through historical/general reference accounting, live-range identity, or allocator behavior.

Under the proof only two code-order islands remain: count-zero before frames-copy and the timer-positive branch orientation. The first should be traced through RTL scheduling/identity before any broader compiler change.

## October 2, 2026 - v34b final ordering isolation

SpriteAnimator v34b reduces `func_0805E8F0` to one compiler-order discrepancy. Existing compatibility behavior is ruled out:
- all v4 switches enabled: 0xAA/6
- user-variable-copy preservation disabled: 0xAA/6
- combine-copy-ref restoration disabled: 0xAA/6
- all eight v4 env switches disabled on the patched binary: 0xAA/6
- scheduling disabled in either pass: 0xAA/6; enabling scheduling is unsupported on this Thumb target

RTL proves persistent frames copy p45 precedes Count zero p52 from the initial RTL dump onward. There are only notes between them and p45's first real consumer is immediately after p52, so moving p52 ahead of p45 is dependency-safe.

A proof-only structural CSE rule was added to the scratch compiler under `AGBCC_HOIST_ZERO_BEFORE_DEFERRED_USER_COPY`. It deliberately contains no target address/function/pseudo identity. Initial test did not alter output. Dump verification proves the matcher did not fire at all, rather than a later pass undoing the move.

Next compiler task is to instrument that matcher and determine which generic guard fails for the p45/p52 pair. Any retained rule must remain structural and then pass the full SpriteAnimator/canary/54-module/full-ROM regression ladder.

## October 2, 2026 - Pointer-only post-dead ordering rule

The remaining SpriteAnimator order mismatch is now explained and solved structurally.

Stage discovery:
1. v34b initial RTL creates the persistent frames user-var copy before Count's zero temp.
2. At end-of-CSE, two Count address/load temporaries still separate that copy from the zero, even though CSE output later hides them after dead deletion.
3. Therefore the original CSE-end matcher never fired.
4. Immediately after `delete_trivially_dead_insns`, the deferred copy and zero-init become adjacent real instructions and a safe motion can be expressed directly.

Broad rule:
- user-variable SImode pseudo copy
- next real instruction zero-initializes another user-variable SImode pseudo
- copy and zero are independent
- copied value is first consumed by the following real instruction
- move zero immediately before the copy

The broad rule made SpriteAnimator exact but matched two unrelated `src/farm` loop-control patterns in corpus testing. Those farm copies were non-pointer flag value 1; Sprite's deferred frames copy is explicitly pointer metadata.

Final proof rule adds:
`REGNO_POINTER_FLAG (REGNO (copy_dest))`

This pointer-only structural rule:
- keeps v34b Update 0xAA/0
- leaves existing hard targets exact
- leaves five focused canaries exact
- leaves saved 54-module corpus 54/54 unchanged, total diff 0
- produces full source-converted ROM `fomt.gba: OK`

Clean proof tree:
`/mnt/data/Github/agbcc-fomt-compat-package-call238-v4-postdeadproof`

Full validation:
`sh_muqi2jdy_c96633ee`

Do not use the older `/mnt/data/Github/agbcc-spritealloc-diag-call238` tree as a regression baseline; it contains earlier allocator diagnostics and fails established targets even with the new rule off. Next step is a fresh reproducible package from the pinned base plus the established v4 patch and this ninth rule.

## October 2, 2026 - compatibility-v5 reproducible package

The pointer-only post-dead SpriteAnimator ordering behavior is now a reproducible private package. Artifacts: `tools/ches/checkpoints/call238/generalized-compiler-candidate-v5.patch` (SHA-256 `52967111d94167e27d7d61ed6036470e340b131458d4c9b9ed02ad5b55e1d420`) and `tools/ches/checkpoints/call238/compat-compiler-v5/`. Relative to validated v4, the only new compiler source delta is `g++/toplev.c`. The package removes proof-only tracing and retains only the structural pointer guard. Fresh validations `sh_muqjwtre_48b20def` and `sh_muqk18n0_42cefaf1` both pass all hard targets, SpriteAnimator 5/5, five focused canaries, 54/54 corpus total diff 0, and full ROM `fomt.gba: OK`; independent package build `sh_muqjy1a8_b5de0034` passes. Fresh compiler binaries are not byte-identical, so reproducibility is established by clean pinned-source/patch reconstruction plus identical validation behavior, not compiler-file hash identity. This remains private research packaging until promoted into the contribution-safe tracked compiler path.

## October 2, 2026 - ninth behavior adopted into tracked production path

The SpriteAnimator pointer-only post-dead ordering behavior is now part of the tracked contribution-safe compiler path.

- tracked patch SHA-256: `863af8d8692e45b94e40f6e5b57b778fd35c56bc2c4f171a38322054adf339ec`
- installer SHA-256: `6a1a8de9ae69940cf62fc8405eb8a90d3e08b317ab47d7a4a75576e4c128b2eb`
- the tracked patch preserves the existing contribution-safe `compat_*` helper naming; the private `call238_*` research names were not imported
- only the ninth structural `toplev.c` behavior was added over the prior tracked compiler source; the final patch-file edit was minimized so existing `calls.c` patch ordering was not churned
- clean pinned-source apply check and semantic source comparison: `sh_muql2pbg_34afdd67` PASS
- production tracked compiler install from pinned source: `sh_muql3qy2_babf67ad` PASS
- production plain `make -B -j4 compare`, no private compiler override: `sh_muql8c0t_10159bcb` PASS, `fomt.gba: OK`
- explicit production SHA1/progress/symbol/diff proof: `sh_muql8vwy_d2f4fcda` PASS

This is still a FoMT compatibility reconstruction, not a claim that the historical Nintendo compiler has been recovered.


## October 2 checkpoint: renderer layout correction, v43/v44, and bounded compiler diagnostics

This section supersedes earlier statements that called v34's local field layout exact.

### Retail local layout, re-verified directly

Retail `08032690` uses a 0x50 frame with:
- outgoing args: `sp+0x00..0x13`;
- `SpriteRenderDataCandidate`: `sp+0x14..0x33`;
- transfer queue: `sp+0x34`;
- renderer: `sp+0x38`;
- game object: `sp+0x3C`;
- screen x: `sp+0x40`;
- screen y: `sp+0x44`;
- depth: `sp+0x48`;
- secondary effect x: `sp+0x4C`.

Retail initialization order is game object, x, y, depth, then queue and renderer.

v34 has the correct 0x50 frame SIZE but places the 20-byte state object at `sp+0x34..0x44` and resources at `sp+0x48..0x4C`. Therefore v34 is not field-layout exact.

### v43 / v44 natural source frontier

`candidate-vfunc10-v43-combined-constructor.cc`
SHA-256 `d7f48fb2b0deb64c3fe447cbb86c207e64c3e94af5e640b1aaf30dadc9bfe779`
Result: **0x26A / 557 diffs**.

v43 uses one seven-word `RenderLocalsCandidate` with a real constructor body assigning in retail order. It recovers exact retail stack field placement and initialization order, plus `context=sl`, `owner=r8`, and secondary `effect_y=r9`. The combined locals base takes r6, moving self to r7.

`candidate-vfunc10-v44-combined-constructor-nested-mode.cc`
Tracked compiler result: **0x26E / 536 diffs**.

v44 adds natural nested signed range checks and emits the exact retail mode ladder:
`cmp 0; beq; cmp 0; blt; cmp 2; bgt`.
It preserves v43's exact stack placement/order, but still keeps the combined locals base in r6 and self in r7.

### Private compiler diagnostics

Private tree:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1`

Base is pinned `1caa6becde5e4676b59c31c74d68f45ced79557c` plus the current tracked FoMT compatibility patch. No tracked compiler source changed.

Private, OFF-by-default diagnostics:
- `AGBCC_TRACE_NARROW_CONTROL`;
- `AGBCC_PRESERVE_PROMOTED_SIGNED_COMPARE` (neutral);
- `AGBCC_KEEP_SINGLE_RIGHT_BOUND`;
- `AGBCC_DISABLE_SHORT_CIRCUIT_RANGE_FOLD` (broad diagnostic only);
- `AGBCC_SKIP_PRE_FRAME_ADDR` (diagnostic only).

`AGBCC_KEEP_SINGLE_RIGHT_BOUND` restores the generic single-right-leaf switch lower-bound branch and reproduces retail:
`cmp #1; beq; cmp #1; ble default; cmp #2; beq`.
On unchanged v34: baseline 0x26A/559, switch rule **0x26E/530**. Strong evidence, not validated/promoted.

`fold_range_test()` is the mechanism merging `mode >= 0 && mode <= 2`. Broadly disabling that fold restores the mode ladder but rotates allocation, so the broad rule is closed:
- v34 range-off: 0x26E/538;
- v34 range-off + switch: 0x272/586.

Natural nested source v37 and equivalent v38/v40/v41 forms also emit the exact mode ladder at the same 0x26E/538 family, confirming source semantics but not final allocation.

GCSE/PRE analysis proved the nested control blocks add an extra copy of the frame-relative combined-locals base. Its reaching pseudo gains enough references to outrank self in global allocation.

`AGBCC_SKIP_PRE_FRAME_ADDR` skips PRE replacement for frame-pointer-relative `PLUS(REG FRAME_POINTER_REGNUM, CONST_INT)` expressions in `pre_delete()`, so no reaching pseudo is created and later insertion phases safely skip it.

Measurements:
- v43 + PRE-frame exclusion: 0x264/558;
- v43 + PRE-frame exclusion + switch: 0x268/558;
- v44 + PRE-frame exclusion: 0x268/579;
- v44 + PRE-frame exclusion + switch: **0x26C/563**.

The v44 PRE-off + switch result is structurally valuable despite worse raw diff count:
- exact retail stack field layout and initialization order;
- exact mode ladder;
- exact state8B ladder;
- `self=r6`;
- `context=sl`;
- `owner=r8`;
- secondary `effect_y=r9`.

Remaining visible mismatch: it still materializes `sp+0x34` into a short-lived r4 through the secondary draw, while retail performs direct sp-relative loads/stores. This points toward a more granular natural local model rather than promoting the PRE exception.

Historical May-2000 and Oct-2003 vendor C++ compilers compile v34 byte-identically at 0x268/585, binary SHA-256 `344d410191b8c702ed48f78cc35b46f6ac968e34ac6305fde80b2d09e79a94ab`. The 2003 signedness fix does not explain this target. Do not reopen compiler-family hunting.

Existing compatibility-rule ablation: of the nine tracked FoMT rules, only `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` affects v34.

Closed branches:
- v37/v38/v40/v41 exact mode ladder but same allocation rotation;
- v39 boolean helper 0x27E/602;
- v42 individual locals + nested mode 0x246/584;
- v31 tail3 aggregate rechecked and found to use non-retail field positions.

EXACT NEXT ACTION:
Resume from v43/v44. Preserve the verified retail field order and nested mode control shape. Search for a natural granular local model yielding `queue+34, renderer+38, game_object+3C, x+40, y+44, depth+48, effect_x+4C` while avoiding a combined locals base live through the secondary draw. Use the PRE-frame exclusion only as diagnostic evidence. Do not promote either private compiler rule until natural source work is exhausted and any generalized rule passes the full regression ladder.


## October 2 renderer checkpoint: scalar-layout breakthrough and v59 frontier

This section supersedes older renderer guidance that treated v43/v44 as the active natural-source frontier.

### Natural stack model is now strongly evidenced

The retail renderer behaves like:
- a real 2-word resources object at `sp+0x34/+0x38`;
- independent scalar `game_object/x/y/depth/effect_x` values at `+0x3C/+0x40/+0x44/+0x48/+0x4C`;
- a real `SpriteRenderDataCandidate` at `sp+0x14`.

Historical May-2000 and Oct-2003 vendor compilers compile the scalar v42 source identically at **0x24C / 589 diffs**, and naturally place:
`resources +34/+38, game_object +3C, x +40, y +44, depth +48`.
This is strong independent evidence for the scalar layout.

The current tracked compatibility compiler changes that allocation only because of the already-validated `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` rule:
- v42 with no compatibility flags: **0x24C / 589**;
- v42 with all tracked flags: **0x246 / 584**;
- omitting any other single tracked flag is neutral;
- omitting only `AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS` returns **0x24C / 589**.

Do NOT disable that rule globally. It is required for the exact production `080A4A4C` 9-argument fixed-IWRAM wrapper, and the renderer uses the same structural call form to `0x030004DC`. Retail renderer also clearly delays the target load until immediately before `_call_via_r4`.

### Register-pressure source recovered

Retail keeps additional real-object address lifetimes:
- after each `GetSpriteRenderData`, `r7 = &render_data`;
- before the SECOND getter/draw, after owner is no longer needed, `r8 = &resources`.

Adding those natural aliases to the scalar source is the major breakthrough.

#### v50
`candidate-vfunc10-v50-render-resource-aliases.cc`
Tracked result: **0x26C / 342 diffs**.

Natural aliases:
- `SpriteRenderDataCandidate *render = &render_data` after each getter;
- `RenderResourcesCandidate *resources_ptr = &resources` before the second getter.

This recovers naturally:
- exact 0x50 frame;
- stack slots `+34/+38/+3C/+40/+44/+48/+4C`;
- `self=r6`, `context=sl`, `owner=r8`;
- `r7=&render_data` after each getter;
- second-phase `r8=&resources`.

v50 initially kept effect_x in r9 and spilled effect_y.

#### v52
Initializing effect_y before effect_x flips the pair to the retail identities but reverses the two table halfword loads. Result: **0x26C / 338**. Useful proof only.

#### v53
`candidate-vfunc10-v53-offset-temps.cc`
Tracked result: **0x26C / 328 diffs**.

Explicit full-width offset temporaries:
```
i32 offset_x = offset->x;
i32 offset_y = offset->y;
i32 effect_x = x + offset_x;
i32 effect_y = y + offset_y;
```

This naturally reproduces the retail primary effect island:
- load offset x, then offset y;
- load x from `sp+0x40`;
- compute/store effect_x at `sp+0x4C`;
- load y from `sp+0x44`;
- compute effect_y into r9;
- materialize `r7=&render_data` after the getter.

The i16-temp v54 regresses to 342 and is closed.

#### v56
`candidate-vfunc10-v56-late-effect.cc`
Tracked result: **0x26C / 317 diffs**.

Moving `DiscardEffectRenderCandidate *effect = &self->effect_48` until AFTER both offset loads matches retail's source/evaluation order and improves 11 more bytes.

#### v55 / v57 helper evidence
Passing the whole resources object into `QueueEffectGraphicsV2` rather than pre-evaluating the queue pointer moves the queue load after the effect-active test, matching retail's evaluation order:
- v55 resource-helper only: 329 diffs;
- v57 resource-helper + late effect: 318 diffs.
Useful evidence, but v56 remains better than v57.

#### v58
`candidate-vfunc10-v58-table-order.cc`
Explicit facing/variant offset temporaries move the table arithmetic into a more retail-like order but raw result stays **0x26C / 317 diffs**. v56 and v58 are tied local oracles.

### Current strongest natural source: v59

`candidate-vfunc10-v59-resource-two-arg.cc`
Tracked result: **0x26C / 309 diffs**.

Change from v56:
```
RenderResourcesCandidate(GraphicsTransferVector *queue, void *render)
    : transfer_queue(queue), renderer(render)
{
}

RenderResourcesCandidate resources(
    context->transfer_queue,
    context->renderer);
```

This causes old GCC to evaluate/load both context fields before storing either resource field and makes the renderer prologue/resource construction match retail instruction-for-instruction:
- exact prologue and 0x50 frame;
- self/context/owner = r6/sl/r8;
- game object, x, y, depth stores exact;
- `add r2, sp, #0x34`;
- load queue then renderer;
- store queue to `sp+0x34`;
- store renderer to `[r2,#4]`;
- exact nested signed mode ladder follows.

v59 is the current natural-source authority.

#### v60
`candidate-vfunc10-v60-resource-two-arg-table-order.cc`
v59 + explicit retail-like table arithmetic ordering.
Result: **0x26C / 311 diffs**, two worse than v59. Keep as a local table-order oracle only.

### Closed aggregate/object variants from this continuation
- v45 resources-before-tail3 aggregate: 0x25E/577, aggregate allocated before render data and destroys layout.
- v46/v47 reversed state/resources declaration: old GCC keeps the same object stack order, no solution.
- v48 one-word y object: optimized back into a register, identical family.
- v49 x/y pair object: 0x258/547, aggregate shifts the frame.
These reinforce that the retail model is resources object + scalar render state, not a larger aggregate.

### Private switch rule refinement required

Current private `AGBCC_KEEP_SINGLE_RIGHT_BOUND` still proves the missing retail state_8B ladder, but it is too broad.

On v53:
- natural source: 0x26C and 295 decoded entries;
- with current switch rule: 0x274 and 299 entries;
- retail: 0x270 and 297 entries.

The rule adds the desired two instructions to the 2-case `state_8B` switch, but also adds two unwanted instructions recursively inside the later 4-case `state_88` switch.

Therefore the next compiler experiment must refine this structurally to the true two-case/root-style switch shape. No function address, symbol, UID, pseudo, or hard-register discriminator is allowed.

### Exact next action

Resume from **v59**, not v34/v43/v44.

1. Re-run retail-v59 alignment now that the prologue and primary effect structure are substantially corrected.
2. Test v59 combined with the resources-reference queue-helper shape, because v59's exact two-argument resources constructor may change that interaction.
3. Continue matching the primary/secondary queue helper evaluation order and the final state_88/final func_0803AE58 islands from retail evidence.
4. In the private compiler only, refine `AGBCC_KEEP_SINGLE_RIGHT_BOUND` so it applies structurally to the true 2-case switch but not recursively to state_88. Test v59 first.
5. If the switch refinement is promising, run the established hard targets, five canaries, 54-module corpus, and full-ROM validation before any tracked compiler promotion.
6. No production renderer integration, commit, or push until the renderer target is exact and any compiler refinement passes the full regression ladder.


## October 2 renderer checkpoint: v92 reaches 8 tracked diffs, private exact proof

This checkpoint supersedes the earlier v59/309 renderer frontier.

### Source reconstruction breakthrough

The renderer has now reached exact retail size and instruction count under the normal tracked compiler.

Key progression:
- v68 active-value + active-pointer helper: **0x26C / 301**.
- v74 explicit draw enabled value as the LAST inline helper parameter: **0x26C / 299** and exact renderer/game_object/enabled evaluation order.
- v75 combines the facing-offset table form: **0x26C / 297**.
- v78/v79 natural state_8B rewrites recover exact 0x270 size and collapse the cascading mismatch to **65 diffs**.
- v81 explicit state_8B CFG reproduces the retail state_8B ladder instruction-for-instruction: **0x270 / 30 diffs**.
- v82 independently proves an exact state_88 CFG.
- v83 combines both exact CFGs: **0x270 / 22 diffs**.
- v84 changes the default attr mask from `value = owner->unk_21 & 3` to load then `value &= 3`, matching the retail r0/r1 mask sequence: **0x270 / 20 diffs**.
- v92 is the current source authority: **0x270 / 8 diffs**.

### v92 exact table model

File:
`tools/ches/checkpoints/entity-base-080324BC-2026-10-02/candidate-vfunc10-v92-table-shape.cc`

The table is modeled as:
```cpp
EC EffectOffsetCandidate gUnk_080F1328[][4];

u32 facing = owner->facing;
EffectOffsetCandidate const * offset =
    &gUnk_080F1328[self->state_8A_2][facing];
```

This makes the full table-address island retail-exact:
- packed state byte remains in r1;
- facing is loaded into r0;
- variant shifts happen after facing;
- facing is scaled by 4;
- base literal is loaded into r2;
- base + facing, then variant row offset, matches retail.

Under the normal tracked compiler v92 differs only at:
- 0x08032728..0x0803272B;
- 0x08032808..0x0803280B.

Both are the same ordering difference:
retail:
```
add r0, sp, #20
ldr r3, [r3, #16]
```
tracked candidate:
```
ldr r3, [r3, #16]
add r0, sp, #20
```

Everything else in the 0x270-byte renderer is linked-byte exact.

### Private compiler proof

A private opt-in rule was added to:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`

Initial diagnostic:
`AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS`
delayed non-symbol/non-constant indirect call-address preparation when:
- `fndecl == 0`;
- register parameters are present;
- `num_actuals > 1`;
- target is neither CONST_INT nor SYMBOL_REF.

With all established tracked compatibility flags plus this private rule, v92 became **0x270 / 0**:
execution `sh_murityir_2779a434`.

This also left the already-exact final 1-argument GameObject virtual call unchanged.

### Broad >1 rule rejected by regression

Full validator attempt:
`sh_muriun3m_fedea107`

Results before abort:
- terrain exact;
- water exact;
- lifecycle main regressed from exact 0x94 to **0x98 / 71 diffs**.

Cause:
`src/code_080A46AC.cc` contains a 2-argument virtual call:
`provider_arg->vtable->get_value(provider_arg, value)`.
The broad >1 rule delays that call target too and changes exact lifecycle scheduling.

Therefore `num_actuals > 1` is CLOSED / REJECTED.

### Refined private rule saved, not yet tested

The private rule has now been narrowed to:
`num_actuals > 2`

This structurally separates:
- renderer getter: 3 arguments, candidate for delayed target preparation;
- lifecycle get_value: 2 arguments, should remain baseline;
- final GameObject virtual call: 1 argument, should remain baseline.

Current private source:
`/mnt/waydroid-hdd/home-chester-waydroid/agbcc-renderer-frontdiag-v1/g++/calls.c`

Current calls.c SHA-256 after correction:
`49bbcaf9360db1d5c8691be218dd3a2e6975ad8c47b2d97f72658605cabae817`

Private compiler rebuild:
`sh_murivufx_d623638d` PASS.

IMPORTANT: the refined >2 rule has NOT YET been tested against v92 or the validator because the harness forced the 50-call checkpoint.

### Switch diagnostic status

The earlier private `AGBCC_KEEP_SINGLE_RIGHT_BOUND` root-depth experiment is CLOSED. A root-only discriminator still fires for state_88 because GCC's switch-tree preprocessing can produce the same simple-right-root shape there.

Do not promote that switch rule. Source CFG work already reproduces both state_8B and state_88 exactly without it.

### Production status

Production is untouched:
- branch: ches-dev
- HEAD: `77b459045ec0500b82b185ece77ab1c4dccaecc5`
- no renderer source/asm/linker integration;
- no commit/push;
- tracked compiler patch unchanged.

### Exact next action

1. Test v92 using the rebuilt private compiler with `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1` and the refined `num_actuals > 2` condition.
2. Require v92 **0x270 / 0**.
3. Re-test lifecycle main immediately and require **0x94 / 0**.
4. If both pass, run the complete established compatibility validator: hard targets, five canaries, 54/54 corpus, full source-converted ROM.
5. If the full ladder passes, create a clean pinned compiler authoring tree from the contribution-safe tracked authority and add ONLY the generalized >2 indirect-call rule. Rebuild/package independently and validate again.
6. Only after fresh reproducibility gates pass should the tracked compiler patch/install path be updated.
7. Then integrate the renderer in a detached retail worktree, prove full retail SHA1, apply the identical production seam, update architecture/progress docs, contribution diff review, and commit/push only if every retail gate is exact.


## October 3, 2026 - tenth behavior adopted into tracked production path

The generalized inline-body indirect-call scheduling behavior is now part of the tracked contribution/build compiler authority.

- clean tracked-authoring tree: `/mnt/data/Github/agbcc-fomt-tracked-v6-authoring`, based on pinned commit `1caa6becde5e4676b59c31c74d68f45ced79557c`;
- tracked patch SHA-256: `8f75608013b1fee6e20a11fbe7bac26d1e65b92747402415e5f0c9caf628579b`;
- `tools/install_agbcp.sh` now generates the wrapper with the prior nine flags plus `AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS=1`;
- the new structural rule delays a non-symbol/non-constant indirect call address until after register-argument loads only when `fndecl == 0`, register parameters are present, `num_actuals > 2`, and `current_function_decl && DECL_INLINE(current_function_decl)`;
- no FoMT function name, address, symbol, pseudo ID, instruction UID, hard-register identity, or first-argument declaration class is encoded;
- clean-base patch applicability and installer syntax passed before installation;
- tracked compiler installation from the pinned clean source: `sh_murpost4_59c54a8d` PASS, exit 0;
- generated default wrapper was verified to contain all ten flags and invoke `tools/agbcc/bin/agbcp.bin`;
- production plain `make -B -j4 compare`, with no `CC1PLUS` override or private compiler path: `sh_murps4s1_68b7eeb2` PASS, `fomt.gba: OK`.

This adoption follows the independent compatibility-v6 proof where all hard targets, five SpriteAnimator canaries, the 54-module exact corpus, and the full source-converted ROM passed. It remains a validated FoMT compatibility reconstruction, not a claim of recovered Nintendo compiler source.

## Entity update narrow-zero preservation - October 3, 2026

The natural typed `0803260C` source was 0x82 / 42 because CSE replaced a byte reset zero with the low part of a wider `clear_mode` zero. V17's selected-register `REG_USERVAR_P` filter missed equivalent temporaries. V18 tracing proved that their quantity still canonicalized to the multi-set user variable. V19 filtered those wider choices and retained a separate zero through first CSE, but second CSE canonicalized its narrow source back to the same variable. V20 protected narrow canonicalization and equivalent-source trials too and reached 0x84 / 0 without a source change.

Clean v21 packaging uses only the structural predicate: integrated instruction, QI view of SImode, zero-valued quantity, canonical pseudo marked as a source variable, and multiple sets. It has no target identity checks and no tracing/rejected hooks. The tracked installer rebuilds from the pinned base and the current patch. Both clean isolated and production installs preserve the full retail ROM; all hard targets and 54 saved modules pass. These tests validate this compatibility behavior; they do not identify the original vendor compiler.

Provenance: `tools/ches/checkpoints/entity-base-080324BC-2026-10-02/v21-package-provenance.json`, `production-proof-v27.json`, and the checkpoint README.
