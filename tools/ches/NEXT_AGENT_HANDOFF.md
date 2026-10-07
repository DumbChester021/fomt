# Current FoMT continuation - October 7, 2026

## Current repository state

- Workspace: `/mnt/data/Github/gba/fomt`
- Retail branch: **`main`**, tracking **`ches/main`**
- Latest published exact code checkpoint: **`7900f82e7ba18688dd7705efc2b143d4bc89f42c`** (`decompile entity animation helpers`)
- Remote `ches/main` was explicitly verified at the same hash.
- Retail SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**
- Last full production gate for the code batch: `make -B -j4 compare` -> **`fomt.gba: OK`**
- Exact code progress: **71,948 / 940,036 = 7.6537%**
- Assembly remaining: **868,088 bytes**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **147,678 / 7,717,440 = 1.9136%**
- Free tail: **671,168 bytes**

## Current generated inventory

`tools/ches/build_decomp_inventory.py` was reconciled with the documented parked set and regenerated successfully:

- linked assembly functions: **2,334**
- function-range bytes: **866,924 / 868,088 = 99.8659%**
- unattributed assembly bytes: **1,164**
- explicitly parked functions: **17**
- runtime/library functions retained: **33**
- repeated opcode-shape clusters: **184**
- functions in repeated shape clusters: **864**
- exact normalized clusters: **176**

The generated queue and NPC class map were regenerated after this change.

## Latest completed exact batch

The complete retail tail `0x0803A804..0x0803A8A4` is now source-owned in `src/entity_unk_08038740.cc`.

Exact functions:

| Function | Retail role |
| --- | --- |
| `func_0803A804` | return embedded `SpriteAnimator::step` |
| `func_0803A80C` | set `SpriteAnimator::step` |
| `func_0803A814` | return `SpriteAnimator::WillFinish()` |
| `func_0803A820` | true when frame timer and step are both nonzero |
| `func_0803A840` | update embedded effect/animator and active/reset state |
| `func_0803A870` | switch animation and refresh/reset effect state when ID changes |
| `func_0803A8A0` | return owner `GameObject *` |

The seven functions add **160 exact source bytes**. Integration uses individual source sections immediately before `asm/code_0803A8A4.o(.text)`; ordinary section alignment reproduces the retail padding halfwords.

Verification:
- full compare execution `sh_muxvkcw1_1312ecc4`: **`fomt.gba: OK`**
- production diff hygiene after the EOF cleanup: PASS
- commit: **`7900f82e7ba18688dd7705efc2b143d4bc89f42c`**
- push: `sh_muxvlfhh_e9f624c1`
- explicit remote verification: `sh_muxvlnp2_9f20d1c0`

## Important parked work

The following are behavior-complete or otherwise bounded and must not be selected as ordinary queue work without new structural evidence:

- `func_0803A394`: weighted entity factory, retail 0x404 bytes. Natural candidates recover semantics/layout but remain a codegen island.
- `func_0803A180`: shared movement/state helper, retail 0x1A0. Best natural V2 is 0x19C / 382 differing linked bytes; remaining size/register gap is allocator ownership.
- `func_08039F90`: behavior complete after bounded lifetime probes.
- `func_08039E98`: constructor behavior complete, exact-size 0xB8 / 109 in scratch.
- `func_08039708`, `func_0803955C`, `func_08039310`, `func_08039204`.
- controller `func_08038820`, collection builder `func_08038EE0`.
- Ball mover `func_08038110`.
- legacy save/UI/compiler islands already listed in the generated `PARKED` set.

Use `tools/ches/DECOMP_QUEUE.md` only together with the parked status. Raw score is not execution order.

## Exact next action

Start the next coherent frontier at **`0x0803A8A4`** in `asm/code_0803A8A4.s`.

Ordered continuation:

1. Confirm current branch/dirty state and do not discard the documentation/inventory cleanup if it is still uncommitted.
2. Map `asm/code_0803A8A4.s` function boundaries, sizes, direct callers/callees, vtable references, globals/tables, and section/TU seams.
3. Search existing headers/source and exact neighboring Entity38740-family code for real type and source-shape anchors.
4. Identify the first coherent repeated family or small API, not merely the first address.
5. Write one natural scratch candidate and compare it with `tools/ches/compare-function.py`.
6. Inspect generated assembly before variants. If credible variants canonicalize or the function becomes a pure allocator island, document/park it and continue the family.
7. Integrate only exact source.
8. Run target checks, full `make -B -j4 compare`, SHA1/progress, inventory regeneration when ownership changes, and `git diff --check`.
9. Update only the canonical docs whose current truth changed.
10. Commit/push each durable exact checkpoint to `ches/main` under the standing repository authorization.

## Documentation cleanup verification

The full maintained-document audit and coordination-layer compaction are complete.

Cleanup scope:
- compacted `START_HERE.md`, `TODO.md`, `tools/ches/NEXT_AGENT_HANDOFF.md`, and `tools/ches/SESSION_STATUS.md`;
- reconciled current-state sections in `README.md`, `AGENTS.md`, progress/repo/priority/playbook/asset/character/compiler/decomp docs;
- updated `tools/ches/build_decomp_inventory.py` parked metadata;
- regenerated `decomp_inventory.json`, `DECOMP_QUEUE.md`, and NPC class-map outputs.

Final validation:
- stale-current sweep execution `sh_muxvxx1l_2beee413`: **zero matches** for the old 71,612 / 868,424 / 2,336 / 3A180-frontier markers;
- `make progress` execution `sh_muxvx2rb_3284bdae`: **71,948 / 940,036 = 7.6537%**, `fomt.gba: OK`;
- full rebuild execution `sh_muxvxgkc_224efb9d`: **`fomt.gba: OK`**;
- `git diff --check` execution `sh_muxvxtwp_44bd28a2`: PASS;
- inventory delta audit: only exact-source removals `func_0803A350` and `func_0803A798`, plus the 10 intended assembly -> parked status changes; no unexpected function additions/removals;
- generated summary: 2,334 linked asm functions, 868,088 asm bytes, 866,924 inferred range bytes, 1,164 unattributed bytes, 17 parked functions;
- class-map regeneration only renumbered Child's repeated-shape label from shape0041 to shape0039 because the inventory changed.

For a fresh continuation: if this cleanup is still dirty, publish it first. If the worktree is clean and the compact docs are present, continue directly at `0x0803A8A4`.

## Documentation cleanup state

A full maintained-document audit was completed before this compaction. Stable subsystem documentation was preserved. Current-state files are intentionally being reduced so a fresh model does not have to infer truth from hundreds of KB of duplicated chronology.

Detailed old session history belongs in Git history and the dated checkpoint/experiment directories. Do not re-expand this file by appending chronological session transcripts.
