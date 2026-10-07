# Current FoMT continuation - October 7, 2026

## Stop state and production authority

The user requested a documentation wrap; matching and integration are stopped.
No resource-owner source was promoted. Resume from the saved proofs when work
continues, rather than restarting discovery or the completed map resolver.

- Retail branch: **`main`**, tracking **`ches/main`**.
- Published production checkpoint/research base: **70a1d4bbb69120e1353b5946537e0fe7315fcf60** (`record exact map resolver checkpoint`). This wrap is documentation only; `git log -1` identifies the documentation commit.
- Latest exact source commit: **45dfb3f06eb800a152e967daa3f1a2a0efd2a561** (`decompile logical map resource resolver`).
- Retail ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**; wrap-up rechecks existing ROM equality and unchanged production inputs.
- Last isolated fresh-install and production `make -B -j4 compare`: **PASS**, for the completed map-resolver integration. No new resource-owner full-ROM integration was attempted.
- Compiler: tracked `tools/install_agbcp.sh` and thirteen-rule `tools/agbcp_fomt_compat.patch`, SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`; matching uses `tools/agbcc/bin/agbcp`. No compiler changes.
- Custom-game worktree `/mnt/data/Github/gba/fomt-custom-game-worktree` remains at `60eaccafa2c92056ee56283ea4ee8f5d6c59377c`, with its original four dirty documentation files preserved.

## Exact production totals remain unchanged

- code: **72,600 / 940,036 = 7.7231%**; assembly **867,436 bytes**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **148,330 / 7,717,440 = 1.9220%**
- free tail: **671,168 bytes**
- linked assembly functions: **2,333**; inferred ranges **866,272 / 867,436 = 99.8658%**; unattributed **1,164 bytes**
- generated parked functions **17**; retained runtime/library **33**
- repeated shape clusters **184**, members **864**; exact normalized clusters **176**

Inventory still reflects the published map checkpoint. Scratch research does
not increase exact coverage or generated parked counts.

## Saved resource-owner results

Checkpoint **`tools/ches/checkpoints/resource-owner-0803AB30-2026-10-07/`**
contains candidates, private header probes, compiled artifacts, linked diffs,
`baseline.json`, `results.json` (15 result records plus artifact hashes), and
`README.md`. It is ignored/local: a fresh clone lacks these artifacts. Tracked
layout facts are in [RESOURCE_OWNERS.md](../../docs/RESOURCE_OWNERS.md).

All methods below still live in `asm/code_0803A8A4.s`, section
`.text.after_map_resource`. Counts mean actual bytes / differing linked bytes.

| Target / true range | Expected | Best saved result | Source / proof prefix |
| --- | ---: | --- | --- |
| Constructor `AB30..AC78` | 328 | **316 / 217**, parked | `candidate-owner-v2.cc` / `owner-ab30-v2`; V3 is identical |
| Destructor `AC78..ACD8` | 96 | **96 / 0** | `candidate-dtor-ac78-v1.cc` / `owner-ac78-v1`; combined V4 also exact |
| Update `ACD8..AE56` | 382 | **382 / 0** | `candidate-family-v6.cc` / `owner-acd8-v6`; V8 independently exact |
| Forwarding `AE58..AEA0` | 72 | **72 / 0** | `candidate-family-v6.cc` / `owner-ae58-v6` |
| Sibling constructor `AEA0..B0A8` | 520 | No candidate proof | Retail assembly retained |
| Sibling destructor `B0A8..B128` | 128 | **128 / 0** | `candidate-family-v7.cc` / `owner-b0a8-v7` |
| Sibling update `B128..B2A6` | 382 | **382 / 2**, not exact | `candidate-family-v8.cc` / `owner-b128-v8` |

`AE56..AE58` and `B2A6..B2A8` are ordinary two-byte alignment gaps. The cached
owner's three proven methods span 552 linked bytes including alignment; with
the sibling destructor, there are **678 proven body bytes / 680 bounded bytes**.
These are research proofs, not a source gain. Destructor proof is V1/V4, not a
separately recorded V6 destructor run; recheck all methods in the final source.

The sibling update's only functional delta is at **0803B26A / 0803B26C**:
retail `mov r0,r9; add r0,r8`, candidate `mov r0,r8; add r0,r9`. These are the
byte capacity and new allocation pointer when setting end-of-storage after
`free`. V8 commutes the source addition but is code-identical to V7. V7's
four reported differences included two alignment bytes; V8's corrected body
bound removes those measurement bytes, leaving **two real differences**.

## Proven types and closed paths

- Owners are **0xA0** (three 0x2C records with cached starts) and **0x46C** (five raw-storage 0x28 records plus 32 0x1C animation slots).
- Sibling +0xE6 is a live zero-initialized byte. Use V8's corrected field layout even though its destructor was not separately proved after that correction.
- Provider slots +48/+4C/+54/+68 and 32-byte frame returns are mapped. Exact `resource_handle.hh`, `entity_effect.hh`, `sprite_animator.hh`, `hardware_transfer.hh`, `src/code_080A46AC.cc` and `src/code_080A480C.cc` are source/type anchors.
- Existing `FixedVec` has raw storage and no element-destroying destructor; sibling destruction explicitly walks the active animation and record ranges.
- Private `resource_handle_with_default.hh` and `fixed_vec_with_*_assign.hh` exist only for constructor experiments. Do not copy them wholesale into production headers.
- Constructor V1 316/284; V2/V3 316/217. The plausible frame copy constructor is elided and does not improve code. Reopen only on new provider/descriptor or value-storage lifetime evidence, not broad syntax variants.
- Cached update became exact by preserving independent frame/handle pointer ancestry and loading graphics data before zero-initializing size. Forwarding became exact with a direct constant renderer call and argument values prepared before it.
- Do not change the compiler, force registers, add padding/volatile/assembly, or replay closed source spellings for these deltas.

## Ordered continuation on resumption

1. Inspect branch/status and read checkpoint `README.md`, `results.json`, this handoff, stable layouts, and the experiment/failure ledgers. All previously launched comparisons finished; no execution session remains pending.
2. In scratch, extract **AC78 + ACD8 + AE58 + B0A8** into a coherent minimal shared type/source boundary using unchanged production headers. Omit both mismatching constructors and B128. Keep original assembly callable constructors and neutral owner names; preserve destructor aliases/hidden flags. V1 is the production-header destructor oracle, V6 the cached update/draw oracle, V7 the sibling destructor oracle, and V8 the corrected sibling layout.
3. Compare every method from that final combined source with the explicit tracked compiler. Do not treat older private-header proofs as proof of the final header/source. Keep constructor-only helper changes out unless independently needed and justified.
4. Integrate only that exact set through the source/assembly/linker seams. Preserve all still-assembly constructors and B128, alignment gaps, addresses, and vtable/caller contracts.
5. Use an isolated checkout with a fresh tracked compiler, then production `make -B -j4 compare`; verify whole-ROM equality, SHA1/size, symbol boundaries and contribution-input hashes. Run `make progress` and regenerate the inventory/queue/class maps after ownership changes.
6. Update affected docs, review explicit contribution paths and `git diff --check`, commit/push to `ches/main`, and independently verify the remote ref. Only then count an exact source gain.
7. Keep B128's two-byte delta saved; seek a genuine shared vector/source boundary if it has high leverage, otherwise park it and continue the ranked coherent queue. Neither that addition nor the parked constructor should delay integrating already-proven methods.

Matcher syntax for a final scratch source (replace `FINAL_SOURCE` and `PREFIX`):

```sh
python3 tools/ches/compare-function.py FINAL_SOURCE PREFIX --start 0x0803ACD8 --end 0x0803AE56 --symbol func_0803ACD8 --compiler tools/agbcc/bin/agbcp --out-dir tools/ches/checkpoints/resource-owner-0803AB30-2026-10-07/match
```

Other exact targets use AC78..ACD8 / `_._12Unk_0803AB30`, AE58..AEA0 /
`func_0803AE58`, and B0A8..B128 / `_._12Unk_0803AEA0`.

## Completed and separately parked work

The 652-byte `GetMapResourceId` resolver is integrated and published. Its
checkpoint `map-resolver-0803A8A4-2026-10-07/` retains both full-ROM proofs,
six-symbol/input checks, install/build logs, inventory audit and verified
publication record. Do not replay its integration or earlier exact entity tails.

Do not reopen `3A180`, `3A394`, `39F90`, `39E98`, the Ball mover, legacy save/UI
islands or other generated parked targets without new structural evidence.
Detailed lookup and closed paths remain in the Call238 experiment/failure ledgers.
