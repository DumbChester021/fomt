# FoMT Session Status

Latest verified batch: October 10, 2026, exact red-black menu tree balancing and predecessor traversal (240 additional linked bytes), with subtree cleanup pair prepared but not integrated.
Workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main.
Committed/pushed HEAD remains **8c74a0e**. The current exact menu/glyph-cache/provider/range batch is an intentional dirty working tree and must be preserved.

## Exact progress

- Code: **87,236 / 940,036 = 9.2801%**.
- Assembly: **852,800 bytes; 2,037 unresolved linked functions**.
- Inferred ranges: **849,828 / 852,800 = 99.6515%**.
- Unattributed: **2,972 bytes; 27 explicitly parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **163,186 / 7,717,440 = 2.1145%**.
- Free tail: **671,168 bytes**.

## Earlier glyph-cache foundation

include/menu_glyph_cache.hh and src/menu_glyph_cache.cc recover four
functions / **308 exact linked bytes**:
- EFAC DrawCacheGlyph: 172 bytes.
- F058 ResetCacheColumn: 8 bytes.
- F0E0 ClearGlyphCache: 124 bytes.
- F15C GetCacheRowsDirty: 4 bytes.

The recovered layout is three smart row pointers, each row seven 0x10-byte
entries. The cache state fields occupy +0x14..+0x1B. Stable behavior/layout
details are in docs/MENU_GLYPH_CACHE.md.

The isolated full-ROM proof saved by the interrupted Sol 6.1 session passes.
The production working tree also passes make -B -j4 compare with
fomt.gba: OK. fomt.gba and baserom.gba both have SHA1
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
That earlier glyph-cache checkpoint reported 2,103 linked assembly functions and 855,984 assembly bytes; the superseding current totals are the Exact progress values above.

## Bounded sibling and continuation

F060..F0E0 remains assembly. Its behavior is recovered, but the best natural candidate (cache-family-v8.cc) is exact-size with 12 differing linked bytes. Do not repeat the saved v1..v9 spelling family without new evidence.

Proof root: tools/ches/checkpoints/menu-glyph-cache-2026-10-10/

## Source-hygiene audit

`docs/FOMT_COMPILER_FINGERPRINT.md` now owns the compact thirteen-rule compiler fingerprint and measured source-coercion debt. The audit removed two obsolete fixed-register patterns from production: func_0809C3E0 is naturally 0x40 / 0 and func_0809C600 is naturally 0x44 / 0. A forced full-ROM rebuild after cleanup passes fomt.gba: OK.

Other tested coercions still change linked bytes and remain intentionally exact-source debt. Do not remove them or create target-specific compiler exceptions. The 39 owned-polymorphic ABI destructors remain exact; retest one representative against an implicit-destructor/member-ownership model only as a bounded future experiment.

No commit or push has occurred for the current dirty batch.
No build or compiler execution is pending.
tools/ches/NEXT_AGENT_HANDOFF.md owns the exact next commands and dirty-state rules.

## Exact glyph-cache/interface foundation

The glyph-cache lifetime/interface family from E105C through E1498 is already exact source: E105C is the compiler-generated implicit cache destructor; E10E0..E1148 provides callback/interface/default-virtual support; E1148 is the menu-scene lifetime cleanup; E118C builds the article-name result; and E1498 is the article-provider lifetime wrapper. Retail vtables remain assembly-owned and generated helper/vtable sections stay excluded. E11EC remains assembly.

## October 10 provider/range checkpoint

This turn added **11 functions / 756 exact linked bytes** with no compiler change and no forced-register production source.

- E14B8..E15C0: `BuildAnimalNameText`, 0x108 bytes, exact after recovering the 40-byte overlapping scratch lifetime, six-way switch layout, branch-local `strcpy` calls, and one explicit local zero reused by the invalid-result stores.
- E1824, E1964, E1984 and E1A28: four 0x20-byte provider lifetime wrappers.
- E1844: `BuildIndexedItemName`, 0x60 bytes.
- E19A4: `BuildStoredStringName`, 0x52-byte body plus retail alignment before E19F8.
- E1A48: `RunProviderCheck`, 0x0C bytes.
- E1A54: `CleanupLargeProvider`, 0x1C bytes; exact once its second argument was forwarded to `func_08076E0C`.
- E1C18: dual counted-range cleanup, 0x58 bytes.
- E1D54: single counted-range cleanup, 0x38 bytes.

`src/menu_name_providers.cc` and `src/menu_range_cleanups.cc` own the new provider/range source. The exact range-cleanup source shape is: form the count/header pointer first, compute `header + 4 + count*16`, then form the record iterator and advance it by 16 until end, finally forward `(self, flags)` to `func_08076E0C`. E1C18 repeats that exact idiom for +0x1638/+0x163C and +0x1264/+0x1268.

Production gates `sh_mv1tdhtd_f6d172dc`, `sh_mv1ti83h_775675b1`, and final combined gate `sh_mv1tmtwc_532a9863` all end in `fomt.gba: OK`. Final SHA1 equals retail: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Inventory is regenerated at 85,108 code bytes, 854,928 assembly bytes and 2,085 unresolved linked functions. No commit or push occurred.

Earlier bounded target **E1C70..E1D54 (0xE4 bytes)**: focused REA/Ghidra confirmed its 16-byte record traversal and temporary draw-node insertion. The best two bounded natural-source candidates are nonmatching; v2 is 0xE8 vs retail 0xE4 with 164 differing linked bytes. Park its compiler/source-shape frontier. Preserve E1A70 assembly.

## Latest exact provider-wrapper follow-up and checkpoint

- **E1DBC..E1DC8**: `CheckMenuRangeProvider`, 12 exact linked bytes (0 differences), scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e1dbc.cc`.
- **E1DC8..E1DD4**: `ReleaseMenuRangeProvider`, 12 exact linked bytes (0 differences), scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e1dc8.cc`.
- Production source `src/menu_name_providers.cc`; exact assembler seam `asm/code_linkonce.s`; linker aliases and ordering `fomt.lds`. The tracked compiler and compatibility rules are unchanged.
- Forced full-ROM gate `sh_mv1vvcug_4f5b436a` completed exit 0, ending in `fomt.gba: OK`. Hash verification `sh_mv1vwj6i_97e16003` confirms both 8,388,608-byte ROMs have SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. `git diff --check` passed before the forced build.
- Inventory regeneration `sh_mv1vw9nr_01009c1c`: **85,132/940,036 code bytes (9.0562%)**, **854,904 assembly bytes**, **2,083 unresolved assembly functions**, **852,208 inferred range bytes**, **2,696 unattributed bytes**, overall **161,082/7,717,440 meaningful ROM bytes (2.0872%)**. The earlier 11-function / 756-byte provider batch remains intact.
- Focused REA trial/technique is documented in `docs/DECOMP_PLAYBOOK.md`. The two failed but behaviorally informed E1C70 source candidates and their exact linked-byte diffs live in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/`; best v2 0xE8/164 differences. Do not repeat blind code-shape variations or re-run completed REA evidence.
- **Next bounded target:** `func_080E1DD4` at **E1DD4..E1E28**, 0x54 bytes, recovering typed layout and lifetime/virtual-dispatch contract before exact comparison. Keep E1C70 and E1A70 assembly-owned. Current branch remains `main` tracking `ches/main`, published HEAD `8c74a0e`, intentionally dirty; do not reset, stash, or discard. No commit or push occurred. No command is pending.

## October 10 continuation: two exact owner destructors and two tree rotations

Production has advanced beyond the previous E1DBC/E1DC8 checkpoint. Four functions, 280 linked bytes in total (276 executable bytes plus four alignment bytes), are now natural source:

- `func_080E1DD4` / `DestroyMenuRangeOwnerE1DD4` at E1DD4..E1E28: **0x54 / 84 bytes exact**; recovered menu owner's record_count at +0x124, 8-byte record storage +0x128, provider vtable at +0xC, owned object at +0x8, indirect virtual destruction through owned+0x5B4, then base destruction via `func_080086BC`. Candidate v1 had 0x58/79 differing bytes; typed v2 fixed the register shape at 0x54/0 differences.
- `func_080E211C` / `DestroyMenuRangeOwnerE211C` at E211C..E2170: **0x54 / 84 bytes exact**, proven by the same typed template. Isolated proof 0 differences.
- `func_080E2170` / `RotateMenuTreeLeft` at E2170..E21A8: **0x36 executable bytes exact**, plus 2-byte alignment. Natural binary-tree left rotation.
- `func_080E21A8` / `RotateMenuTreeRight` at E21A8..E21E0: **0x36 executable bytes exact**, plus 2-byte alignment. Natural symmetric right rotation.

Scratch source and exact isolated compare reports:
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e1dd4-v2.cc`,
`e1dd4-e211c-pair.cc`, `e2170-e21a8-v1.cc`, and their `matching/*.mismatch.txt` files.
Production: `src/menu_range_owner_lifetime.cc`, `src/menu_tree_rotations.cc`, `fomt.lds`, and `asm/code_linkonce.s`. Retained all surrounding assembly, existing dirty state, and tracked compiler rules.

Two successive **forced full-ROM** gates passed, first after the destructor pair (`sh_mv1wd874_e6803447`) and then after the rotation pair (`sh_mv1wg639_fc4e54c2`), both exit 0 and ending in **`fomt.gba: OK`** at the retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. `git diff --check` passed before the second gate. Regenerated inventory (verified from `tools/ches/decomp_inventory.json`): **85,412 / 940,036 source code bytes = 9.0860%**; **854,624 assembly bytes; 2,079 unresolved linked functions**; **851,928 inferred function range bytes**, **2,696 unattributed**; **161,362 / 7,717,440 overall meaningful ROM bytes = 2.0909%**. The two 0x38 tree sections count their linker alignment in the inventory.

**Next exact bounded action:** inspect `func_080E21E0` at E21E0..E2294 and the recovered tree-node offsets, identify the balancing routine's state transitions, and try one focused natural C++ candidate. Only integrate on zero-difference linked comparison, followed by a full forced-ROM gate. Keep E1C70, E1A70 and F060 parked unless new compiler/type evidence appears. No commit or push authorized or performed; branch `main` remains intentionally dirty, tracking `ches/main`, latest published HEAD `8c74a0e`. No execution remains pending.

## October 10 exact menu-tree continuation, current checkpoint (supersedes earlier next-target lines)

Two exact functions / 240 linked bytes are integrated on intentionally dirty `main`:
- `func_080E21E0 = BalanceMenuTreeAfterInsert`, E21E0..E2294, **180 retail-exact bytes**, naturally reconstructed red-black tree insertion fixup in `src/menu_tree_balance.cc`. Scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e21e0-insert-balance-v1.cc` and `matching/e21e0-insert-v1.mismatch.txt` prove 0 differences on first candidate.
- `func_080E2354 = PreviousMenuTreeNode`, E2354..E2390, **60 retail-exact bytes**, tree predecessor traversal in `src/menu_tree_balance.cc`. Scratch `e2354-decrement-v1.cc` and `matching/e2354-decrement-v1.mismatch.txt` prove 0 differences on first candidate.
- Exact seams and aliases are integrated in `asm/code_linkonce.s` and `fomt.lds`. Compiler wrapper/rules unchanged. The first forced `make -B -j4 compare` execution `sh_mv1wnpf6_fd715fef` and second after predecessor integration `sh_mv1ws19d_9b9180a3` **both finished exit 0 with `fomt.gba: OK`**, retail SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
- Inventory regenerated: **85,652 / 940,036 code bytes = 9.1116%**; **854,384 assembly bytes; 2,077 linked unresolved functions**; **851,688 inferred-range bytes; 2,696 unattributed and 27 parked**; **161,602 / 7,717,440 meaningful ROM bytes = 2.0940%**. Current local menu continuation beyond 84,352 bytes is 19 exact functions and 1,300 linked bytes.
- The neighboring E2294..E2354 0xC0-byte tree-node insertion behavior is understood, but **not exact**: `e2294-insert-v1.cc` generated 0xC4 / 152 differing linked bytes, and `e2294-insert-v2.cc` generated 0xBC / 181 differing. Register lifetime/branch and pair-copy scheduling remain unresolved. Keep original asm and stop syntax roulette.
- E2B28..E2B5C successor/next-node traversal remains asm: `e2b28-next-v1.cc` and `e2b28-next-v2.cc` both generated 0x30 versus retail 0x34, 42 differing linked bytes. The retail extra pre-loop left-child test and variable/register lifetime differ.
- **Prepared but NOT integrated:** the two recursive tree-subtree release functions `func_080E2B5C` (E2B5C..E2B88) and `func_080E2B88` (E2B88..E2BB4). Natural source in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e2b28-tree-family-v1.cc` produced **0x2A executable bytes with 0 differing positions** for each, versus **0x2C linked ranges including 2 bytes alignment**. A production-shaped pair is newly saved as `e2b5c-e2b88-pair.cc`, but has NOT yet been pair-compiled or added to production. Do not count the 88 bytes until a fully exact linked compare and forced ROM build pass.

**Exact next actions:** compare `e2b5c-e2b88-pair.cc` with `compare-function.py` for symbols `ReleaseMenuTreeSubtreeA` at E2B5C..E2B86 body and `ReleaseMenuTreeSubtreeB` at E2B88..E2BB2 body; check 2-byte alignment at both tails. If both exact, add `src/menu_tree_lifetime.cc` with distinct sections, insert source-owned sections in `fomt.lds` after E2B28 asm and before E2BB4 asm, carefully split only E2B5C..E2BB4 in `asm/code_linkonce.s`, force `make -B -j4 compare`, regenerate inventory and update current docs. Park E2294/E2B28 unless type/ABI evidence changes. Preserve all previously dirty and untracked files and detached worktree. The latest published HEAD is still `8c74a0e`; no commit/push this turn and no build remains active.

## October 10 latest checkpoint: three menu subtree-release methods (supersedes older pending-release instructions)

Three previously assembly-owned recursive releases are now natural C++ in `src/menu_tree_lifetime.cc`, with **all linked bytes matching retail**:
- `func_080E2B5C = ReleaseMenuTreeSubtreeA`, **E2B5C..E2B88 = 44 linked bytes**, 42 executable plus two bytes trailing 4-byte alignment.
- `func_080E2B88 = ReleaseMenuTreeSubtreeB`, **E2B88..E2BB4 = 44 linked bytes**, 42 executable plus two bytes trailing alignment.
- `func_080E2E78 = ReleaseMenuTreeSubtreeC`, **E2E78..E2EA4 = 44 linked bytes**, 42 executable plus two bytes trailing alignment.
All three perform post-order right-subtree recursion, save the left child, free the current node, and iterate down the saved left child. The owner arg passes through unchanged. The third function must recurse to **its own** E2E78 address. A naïve direct reuse of `ReleaseMenuTreeSubtreeA` as a scratch symbol differed by two branch relocation bytes; the dedicated `ReleaseMenuTreeSubtreeC` candidate solved that semantically legitimate self-call.

Exact isolated proofs:
- `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/e2b5c-e2b88-pair.cc`
- `matching/e2b5c-pair.mismatch.txt` and `matching/e2b88-pair.mismatch.txt` (42 bytes, zero differences each).
- `e2e78-tree-release.cc` and `matching/e2e78-c.mismatch.txt` (42 bytes, zero differences).
- Compiled production selects three named `.text.menu_tree_release_{a_e2b5c,b_e2b88,c_e2e78}` sections from `src/menu_tree_lifetime.o`. `fomt.lds` adds aliases/ordering, and `asm/code_linkonce.s` splits only corresponding ranges, preserving all adjacent source/assembly and addresses.

Forced retail gates: `make -B -j4 compare` execution `sh_mv1x0omn_f8856f00` after the initial two integrations and `sh_mv1x36hw_d4f7c927` after the third, both exited 0 and ended in **`fomt.gba: OK`**. Retail ROM SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`; no tracked compiler compatibility changes. Earlier `git diff --check` passed before the first forced gate.

Regenerated inventory: **85,784 / 940,036 code bytes (9.1256%)**, **854,252 assembly bytes**, **2,074 linked unresolved functions**, **851,556 inferred function-range bytes**, **2,972 unattributed assembly bytes / 27 parked**, **161,734 / 7,717,440 overall meaningful ROM bytes (2.0957%)**. Compared with the previous checkpoint, **3 functions / 132 exact linked bytes** were promoted. The local menu continuation beyond the 84,352-byte base now totals **22 functions / 1,432 linked bytes**.

Closed/research-only: E2294 tree-node insertion and E2B28 successor still use assembly; earlier typed/natural candidates are in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/`. Do not retry compiler syntax variations without new type/ABI evidence. Also keep E1C70, E1A70, F060 parked.

**Next action:** from the same menu tree TU and the known node header/+4 parent/+8 left/+C right/+10 value layout, inspect the neighboring object/ownership or callback methods near E2DC8..E2F74 (or inspect normalized assembly family inventory for other identical subtree releases). Choose a bounded naturally typed method that promises a larger exact batch, compile and compare it in isolation, integrate only if exact, and run a forced full-ROM gate, inventory refresh and docs. Do not start by rescanning all docs or rerunning the three solved releases. The existing branch `main` tracking `ches/main` is intentionally dirty; latest published HEAD remains `8c74a0e`. All other dirty/untracked work and detached integration worktree must be preserved. **No commit/push was performed**, no background job is pending.

## Additional proven but NOT integrated recursive release siblings (October 10)

The recursive subtree-release family scan found two more identical 0x2A-byte function bodies, both proven in isolation at **0 differing linked bytes**:
- `func_080DC57C`, DC57C..DC5A8 (42 code bytes + 2 alignment); scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/dc57c-release.cc`, proof `matching/dc57c-proof.mismatch.txt`, natural name `ReleaseTreeSubtreeDC57C` section `.text.menu_tree_release_dc57c`.
- `func_080E54C4`, E54C4..E54F0 (42 code bytes + 2 alignment); scratch `.../fomt-rea-trial/e54c4-release.cc`, proof `matching/e54c4-proof.mismatch.txt`, natural name `ReleaseTreeSubtreeE54C4` section `.text.menu_tree_release_e54c4`.

**Not production-owned yet: do NOT count the additional 88 linked bytes or reduce unresolved count until integrated and a forced full-ROM gate passes.** The current verified production totals remain 85,784 source bytes (9.1256%), 2,074 unresolved linked assembly functions, ROM SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

**Next exact steps:** append the two natural function definitions to `src/menu_tree_lifetime.cc` (remove duplicate include/struct definitions), add `func_080DC57C` and `func_080E54C4` aliases to `fomt.lds`, and split the original assembly bodies carefully. For DC57C, `asm/code_linkonce.s` currently has `.text.after_owned_dtor_dc554` immediately before DC57C, then the embedded raw-byte block labelled `.L080DC5A8`. Preserve that block in a fresh `.text.after_tree_release_dc57c` section placed after the source-owned DC57C section. Its linker ordering is between `asm/code_linkonce.o(.text.after_owned_dtor_dc554)` and `src/entity_effect_dtor.o(.text)`. For E54C4, `asm/code_linkonce.s` currently has `.text.after_owned_dtor_e4210` before E54C4, then E54F0. Preserve the latter in a new `.text.after_tree_release_e54c4` section linked after the source-owned function and before the next rodata group. Check both natural section padding tails and all addresses, run `git diff --check`, `make -B -j4 compare`, retail SHA1, and regenerate the inventory. Only then update progress/hand-off again. Do not reset/stash/discard intentional dirty files or the other integration worktree. No commit or push has been done. No build is pending.

## October 10 latest verified throughput batch — 16 more functions / 688 linked bytes

**Current HEAD** `8c74a0e` on `main` tracking `ches/main`, intentionally dirty. No commit/push. The previous 85,784-byte checkpoint is superseded by **86,472 / 940,036 code bytes = 9.1988%**, **853,564 assembly bytes**, **2,058 remaining assembly functions**, **850,656 inferred range bytes**, **2,908 unattributed assembly bytes**, **27 parked**, overall **162,422 / 7,717,440 meaningful ROM bytes = 2.1046%**. The +212 unattributed-byte change arises because the existing raw `.L080DC5A8` area is no longer incorrectly counted inside the DC57C function; no raw content was deleted.

1. Two prior exact 44-byte tree releases (`func_080DC57C`, `func_080E54C4`) integrated in `src/menu_tree_lifetime.cc`, with named exact sections and original raw byte block kept. Forced build gate `sh_mv1xhjq1_8125a903`: **exit 0, `fomt.gba: OK`**.
2. Ten 44-byte menu emit wrappers (`func_080DD3A8`, `080DD434`, `080DD514`, `080DD5B8`, `080DD7B8`, `080DD890`, `080DDE98`, `080DDF3C`, `080DDFE0`, `080DE080`): all exact, source `src/menu_emit_wrappers.cc`, ten named linker text sections in `fomt.lds` and ten split asm regions in `asm/code_linkonce.s`. Each calls `func_08039F90(self,a,b,c, signed_short_at_0x54, signed_short_at_0x56, flags,2)`; DDF3C and DDFE0 use flag 8, the rest flag 0. The scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/individual-<address>.cc` and `matching/individual-<address>.mismatch.txt` prove zero differences for **each**. Gate `sh_mv1y5jum_34b26610`: **exit 0, `fomt.gba: OK`**.
3. Four 40-byte subobject initializers at `func_080E35E8`, `080E3628`, `080E3650`, `080E3734`, all exact natural C++ in `src/menu_subobject_initializers.cc` with named sections. They initialize subobject `self+0x1C8` via `func_08050DC8` and `func_08050E50`, with respective literal globals and configuration bytes `0x39,0x38,0x38,0x38`. Individually proven in `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/init-<address>.cc` and `matching/init-<address>.mismatch.txt`. Final gate `sh_mv1y9j5y_a099e747` **exit 0 and `fomt.gba: OK`**, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

**Important comparison-tool finding:** `tools/ches/compare-function.py --symbol` can give misleading comparisons when the scratch object contains multiple separately named `.text.*` sections: every section-local symbol appears at offset 0 in `nm`, so the tool may actually compare the first text section instead of the selected method. The apparent one-byte failures of two flag-8 emitters in `matching/batch-080ddf3c` and `batch-080ddfe0` were artifacts; **independent isolated compilations of each method all returned 0 differences**. Until fixed, verify each method via single-function candidate sources; don't trust sectioned combined-object proof.

**Research / next target:** ten 36-byte field-copy functions (`func_080DD410` and siblings) remain assembler. Natural `MenuRecordView` candidate in `menu44-36-trial.cc` compiles 32 bytes vs 36, due to retail signed bitmask `movs #16; negs` vs AGBCC folding `out->flags & -16` to immediate 240. The v1/v2 candidate/diffs are in `matching/menu36-v1/v2`. Park rather than syntax roulette until type/ABI evidence changes. A potential 18-member 72-byte helper family (`func_080DB394` etc.) uses complex smart-owner/new/virtual release ABI; recover the ownership type before batch-promoting. Read `AGENTS.md` throughput strategy and use normalized inventory to find coherent high-yield TU clusters. Preserve old assembly for any nonmatching candidate and keep custom/QoL work isolated.

## October 10 latest verified follow-up — three E65E0 entity destructors

Three more source-exact polymorphic teardown wrappers have been integrated on `main`:
- `func_080DCE94 = DestroyMenuEntity_080dce94`, DCE94..DCEC0, 44 exact linked bytes.
- `func_080DCEC0 = DestroyMenuEntity_080dcec0`, DCEC0..DCEEC, 44 exact linked bytes.
- `func_080DCF20 = DestroyMenuEntity_080dcf20`, DCF20..DCF4C, 44 exact linked bytes.

A shared natural view in `src/menu_entity_dtors.cc` uses an embedded subobject at +8, calls `func_080A47B4(subobject,2)`, restores `vtable_unk_080E65E0` at +4, and invokes `__builtin_delete(self)` when `mode & 1`. Scratch candidates `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/dtor-{080dce94,080dcec0,080dcf20}.cc` and corresponding `matching/dtor-<addr>.mismatch.txt` prove **44 bytes and 0 differing linked bytes each**. Production linker aliases/three subsection seams in `fomt.lds` and `asm/code_linkonce.s` preserve all adjacent functions/rodata.

Latest forced `make -B -j4 compare` execution `sh_mv1yihcx_ce1efbec` finished exit **0**, `fomt.gba: OK`, SHA1 equals retail `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`. Regenerated inventory **86,604 / 940,036 exact game-code bytes = 9.2128%**, **853,432 assembly bytes**, **2,055 unresolved functions**, **850,524 inferred asm function range bytes**, **2,908 unattributed asm bytes**, overall **162,554 / 7,717,440 meaningful ROM bytes = 2.1063%**. This continuation since earlier 85,784-byte checkpoint added **19 exact functions / 820 linked bytes** across four confirmed production gates.

One separate research-only experiment attempted to recover a representative of the 18-member 72-byte owner-transfer wrapper family at DB394. Scratch `db394-owned-v1.cc` compiles to **0x40 versus 0x48 retail (50 differing linked bytes)** and incorrectly destroys the returned owner instead of moving/relinquishing the temporary. Retail has 16-byte stack auto-pointer/reference proxy slots, clears `[sp]` before an optional destructor, and forwards the pointer to output. Do **not** promote this v1 or duplicate it across siblings; recover the actual smart-owner move/ownership layout before retrying.

Continue throughput-first with normalized similarity clusters, single-function proofs for separately-sectioned scratch candidates, preserving the retail exact full-ROM gate and all intentional dirty work. No commit or push.

## October 10 pending next exact batch — three 52-byte owner destructors (scratch proven; NOT integrated)

The following three 52-byte linked functions have each passed the isolated *single-function* comparator with **0 differing linked bytes**:
- `func_080DCE60`: DCE60..DCE94, scratch `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/owner-dtor-080dce60.cc`, proof `matching/owner-dtor-080dce60.mismatch.txt`.
- `func_080DCEEC`: DCEEC..DCF20, scratch `owner-dtor-080dceec.cc`, proof `matching/owner-dtor-080dceec.mismatch.txt`.
- `func_080E4510`: E4510..E4544, scratch `owner-dtor-080e4510.cc`, proof `matching/owner-dtor-080e4510.mismatch.txt`.

These exact natural C++ methods use an object prefix with a polymorphic-owned pointer at +0x10, vtable pointer at +0x14, set `self->vtable = __vt_7AEntity`, and if an owned pointer exists, dispatch its virtual slot at `*(owned+4)` +8 with flags 3, then optionally `__builtin_delete(self)` if `mode&1`. The exemplar is `dce60-owner-dtor.cc`. All three named proof candidates compile to 0x34 bytes. **Do NOT count these 156 bytes yet.** A preceding attempt to create `src/menu_owner_dtors.cc` did not complete; the file was subsequently verified ABSENT. No production gate has run for these three.

**Exact next steps:** Create one production TU `src/menu_owner_dtors.cc` with the shared typed view and three section-owned methods:
`.text.menu_owner_dtor_080dce60`, `.text.menu_owner_dtor_080dceec`, `.text.menu_owner_dtor_080e4510`; choose symbols `DestroyMenuOwner_080dce60`, `DestroyMenuOwner_080dceec`, `DestroyMenuOwner_080e4510`. In `asm/code_linkonce.s` replace only the three linked ranges including terminal alignment/literal word and leave every neighbor untouched; insert subsequent ASM sections `.text.after_menu_owner_dtor_<addr>` respectively. In `fomt.lds` add address aliases and place DCE60 source+following ASM after `asm/code_linkonce.o(.text.after_entity37008_dtor_thunks)` and before the existing `src/menu_entity_dtors.o(.text.menu_entity_dtor_080dce94)`; place DCEEC source+ASM after `asm/code_linkonce.o(.text.after_menu_dtor_080dcec0)` and before existing `src/menu_entity_dtors.o(.text.menu_entity_dtor_080dcf20)`; place E4510 source+ASM after `asm/code_linkonce.o(.text.after_owned_dtor_e4210)` and before `src/menu_tree_lifetime.o(.text.menu_tree_release_e54c4)`. Preserve existing literal pools, source subsections, all intentionally dirty changes and existing custom-game worktree. Run `git diff --check` and **forced `make -B -j4 compare`**, confirm original SHA1, regenerate inventory, update docs and record gate. No commit/push unless separately authorized.

The last fully verified production checkpoint remains **86,604/940,036 exact code bytes = 9.2128%**, **2,055 unresolved assembly functions**, **853,432 ASM bytes**, overall **162,554/7,717,440 meaningful ROM bytes = 2.1063%**, and latest forced gate `sh_mv1yihcx_ce1efbec` ended in `fomt.gba: OK`. The current turn has added 19 exact production functions / 820 linked bytes; next batch is pending only. Published HEAD remains `8c74a0e`, working tree intentionally dirty, and no build remains active.

## October 10 latest checkpoint: 18 exact source functions / 632 linked bytes (verified)

The October 10 continuation starting from the prior **86,604 code bytes / 2,055 unresolved functions** integrated four further coherent source clusters, all without modifying retail compiler or custom-game worktree. All individual scratch methods were byte-exact. All FOUR successive **forced** `make -B -j4 compare` production builds exited 0 and printed `fomt.gba: OK`; ROM SHA1 remains `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

1. **Three C++ owner destructors, 156 bytes exact**: `func_080DCE60`, `func_080DCEEC`, `func_080E4510`. New production `src/menu_owner_dtors.cc` shares `MenuOwnerDtorView` with owned polymorphic pointer at +0x10 and vtable +0x14; restore `__vt_7AEntity`; optionally dispatch owned object's vtable slot at +8 with mode 3, conditionally `__builtin_delete(self)` when incoming mode bit 0 is set. Three aliases and subsection seams added to `fomt.lds` / `asm/code_linkonce.s`. Isolated proofs: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/owner-dtor-080dce60.cc`, `owner-dtor-080dceec.cc`, `owner-dtor-080e4510.cc` and `matching/owner-dtor-*.mismatch.txt`, all 0x34 size / zero diff. Gate `sh_mv1z65ct_8e774db6` passed.
2. **Four C++ global-owner destructors, 160 exact bytes**: `func_080D7AAC`, `func_080D7B04`, `func_080E581C`, `func_080E5844`, each 40 bytes. New `src/menu_global_owner_dtors.cc`: set object vtable at +4, publish owned data pointer at +0 to appropriate global `gUnk_03000410` or `gUnk_03000414`, optional delete. Correct vtables `vtable_unk_080E5B54` and `vtable_unk_080E8594` chosen by address group. Scratch `global-dtor-<address>.cc` and `matching/global-dtor-<address>.mismatch.txt` all exact; full ROM gate `sh_mv1z8v52_19acc033` passed.
3. **Five C++ resource helpers, 124 exact bytes**: new `src/menu_resource_helpers.cc`. `func_080D7F60`, `080D7F74`, `080D7F88` each 20 bytes: if object resource pointer at +0xAC exists call respectively `func_08050E8C`, `func_08050E5C`, `func_08050E74`. Two 32-byte initializers `func_080D6F1C`, `func_080D6F5C`: initialize two subobjects (+0x10/+4 or +0x40/+4), then set flags `self[0]=0`, `self[1]=1`; compare at `matching/pair-080d6f1c.mismatch.txt` and `pair-080d6f5c.mismatch.txt` zero difference. All five formerly assembler-owned ranges now linker-owned natural source and the production gate `sh_mv1zdh6z_e0e0ec96` passed. Two neighboring initializers `080D6EAC`, `080D6EEC` are semantically understood but compiler-mismatching: each 0x20 generated / 7 differing bytes because retail preloads constants into r1/r0 before both flag stores, while natural source interleaves immediate moves and stores; **DO NOT promote** without better source-shape evidence.
4. **Six C++ simple vtable destructors, 192 exact bytes**: `func_080D3ED4`, `080DE220`, `080E103C`, `080E3D94`, `080E4190`, `080E4544`. New `src/menu_simple_dtors.cc`: store respective recovered vtable pointer at +0 and conditionally `__builtin_delete(self)` when mode&1. Correct literal values `vtable_unk_080E5A28`, `vtable_unk_080E76F8`, `vtable_unk_080E78F0`, `vtable_unk_080E61A0` vary by address. Isolated scratch `simple-dtor-<address>.cc` and `matching/simple-<address>.mismatch.txt` each show 0x20 exact bytes, 0 differences. `080DE220` had following **64-byte raw .L080DE240 region**; it was *preserved* in newly split assembly section rather than removed. Gate `sh_mv1zgcf1_407a2abd` completed exit 0, `fomt.gba: OK`.

**Inventory regenerated** by `python3 tools/ches/build_decomp_inventory.py`: **87,236 / 940,036 source-code bytes = 9.2801%**; **852,800 assembly code bytes**, **2,037 linked unresolved functions**, **849,828 inferred function-range assembly bytes**, **2,972 unattributed assembly bytes**, **27 explicitly parked**, **163,186 / 7,717,440 meaningful ROM bytes = 2.1145%**. Prior count of unattributed assembly was 2,908 bytes: the new +64 corresponds to original raw code/data after 080DE220, which remains byte-identical and is no longer incorrectly included in the preceding function's range.

**Closed/research-only**: v1/2 `db394-owned` attempts on the 18-member 72-byte owner-transfer wrapper family remain nonmatching: v1 0x40 vs retail 0x48 / 50 differences and incorrectly drops/misdeletes ownership; v2 zeroes temp but compiler shrinks to 0x2C / 49 differences. Need correct 16-byte stack smart-owner/move/ABI layout before one exemplar and batch; do not brute-force spellings. `e3610-flag-v1.cc` for E3610..E3628 was 0x14 vs 0x18 / 16 differences; paired E375C stays asm pending evidence. No source-promotions for these candidates. Ten 36-byte mask-sensitive menu field-copy siblings remain parked as before. Preserve scratch proof files and the prior failure ledger.

**Fastest next actions:** Read `AGENTS.md` throughput policy and current `tools/ches/decomp_inventory.json` normalized clusters, select a coherent type-anchored TU/repeated family for larger byte recovery. More worthwhile than compiler-shape roulette on tiny parked code: recover the shared ownership RAII transaction shape once for the 18 + 5 + 4 related 72-byte allocator/transfer wrappers, or pivot to a different typed byte-dense family if the exemplar is still hard. Exact natural C++ + individually section-correct linked comparison + full forced ROM + inventory are mandatory gates. `tools/ches/compare-function.py --symbol` can mis-target when candidates emit multiple distinct `.text.*` sections; keep single-function scratch proof until that tool bug is fixed. The intentionally dirty `main` tracking `ches/main` remains at published HEAD `8c74a0e`. No commits or pushes were performed. No build remains pending.

### Comparator multi-section safety note (experimental fix reverted)

A late exploratory edit to `tools/ches/compare-function.py` attempted to compare a named symbol from a multi-section scratch object. It failed both variants of the extraction strategy: linker merges named `.text.*` input sections into output `.text` (so extracting the original input-section name from linked ELF gives no bytes); `objcopy -j <selected-section>` on the relocatable object also failed while retaining unresolved symbols. **The experimental changes were reverted in full to the original tracked comparator**, SHA256-verified equal to `git show HEAD:tools/ches/compare-function.py`. Production matching functionality is preserved. Before implementing a better fix, research linker input-section mapping and ensure the selected function's PC-relative relocation is evaluated at the target address; add tests with the ten-function `menu_emit_ten.cc` and individual single-function candidates. Continue using isolated one-function scratch comparisons until this is proven. No new source was integrated during the aborted comparator experiment.
