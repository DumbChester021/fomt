# FoMT Next Agent Handoff

## Save-only priority — current user directive (October 10, 2026)

**Priority change:** The user will not resume customization until the entire retail save system has been decompiled and documented in **human-readable C++**. Stop unrelated menu/tree/resource/owner throughput. Both gates matter: readable evidence-based semantics and original-ROM-exact linked code. The previous 100+ attempts to match `func_08011650` are in `tools/ches/checkpoints/save-loader-08011650-2026-10-04/`; do not reopen compiler spelling or add forcing hacks without genuinely new evidence.

**Just verified this continuation:** `src/save_slot_header.cc` + `include/save_format.hh` now own **7 exact functions / 472 linked bytes**: `VerifySaveHeader` (002E0, 120), `InitializeSaveHeader` (00358, 72), `ReadValidSaveSlotMask` (003A0, 60), `MarkSaveSlotValid` (003E8, 68), `ClearSaveSlotValid` (formerly raw code 0042C, 68), `WriteSelectedSaveSlot` (00470, 24), and `ReadSelectedSaveSlot` (00488, 60). The existing `GetSaveSlotOffset` at 003DC stays exact. Complete contiguous header region `080002E0..080004C4` is now source-owned. Every new function isolated compare had zero differing bytes, including the formerly unlabeled raw clear-valid code. Forced `make -B -j4 compare` execution `sh_mv25lwpc_e4c43b4c` exit 0; `fomt.gba: OK`; retail SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**. New inventory: code **89,444 / 940,036 (9.5150%)**, remaining ASM **850,592 bytes / 1,975 functions**, inferred range **847,620**, unattributed **2,972**, assets **75,554**, meaningful ROM **165,394 / 7,717,440 (2.1431%)**.

**Scratch:** `/mnt/waydroid-hdd/home-chester-waydroid/fomt-save-priority-20261010/` holds independent `compare-function.py` proof/diff artifacts and four reversible linker/ASM integration scripts, including original backup copies. The verifier's first natural candidate did not match; initializing mask/selected locals immediately before each read matched all 120 bytes. Header initializer's successful read-error-result zero reuse gives original 72 bytes. **Readable subsystem documentation:** `docs/SAVE_LIFECYCLE.md`, `docs/SAVE_FORMAT.md`.

**Next save-only work:** (1) Read `docs/SAVE_LIFECYCLE.md` and 004–005 Oct loader checkpoint anti-rediscovery ledger. (2) Recover the SRAM read/write proxy `func_080006A4` and `func_080006E4` and their error contract in exact natural C++. (3) Recover the default initializer/type graph and 740-byte `func_08011650` loader as readable source, using a behaviorally readable, explicitly nonmatching scratch candidate where necessary. (4) Recover GUI `func_08003F9C` save, `func_080040A0` load and `func_080041DC` slot-screen flow, and all erase/copy/slot-mask mutations. (5) Finish type ownership and deterministic copied-save emulator tests. User will not customize until *complete*. Any compiler-only nonmatching code stays out of production `src/`; update docs and matching metrics after each exact batch.

## Current production authority — 2026-10-10

**This is the live handoff.** The former chronological handoff is preserved
byte-for-byte in [handoff history](checkpoints/menu-throughput-docs-2026-10-10/HANDOFF_HISTORY.md).
Superseded next-target claims in that history are not instructions.

- Retail workspace: `/mnt/data/Github/gba/fomt`; branch `main` tracking `ches/main`; latest previously published source checkpoint **`9267e9a`** (save-readiness docs); this new **seven-function source-exact SRAM header** batch is ready for its own Git checkpoint. Confirm current published HEAD via `git log -1`. Keep new readability-only edits separate from production code progress. Check `git log -1` and `git status -sb` for any newer work.
- **The previously dirty verified retail source is committed as 1e522c9.** The retail branch was clean and even with its tracked remote at the start of the October 10 documentation audit; documentation-only edits may now be pending review. The separate custom-game worktree has independent uncommitted docs. Preserve both worktrees; never reset, clean or stash without review.
- Retail SHA1: **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**, ROM size **8,388,608**.
- Latest full forced comparison: `make -B -j4 compare` -> **`fomt.gba: OK`**; execution `sh_mv2471un_7d10991c`, exit 0. No background build pending.
- **Code 88,972 / 940,036 = 9.4647%**. Assembly: **851,064 bytes / 1,981 linked unresolved functions**; mapped inferred ranges **848,092** bytes, unattributed **2,972**, explicitly parked **27**.
- **Data/assets 75,554 / 6,777,404 = 1.1148%**; meaningful ROM **164,922 / 7,717,440 = 2.1370%**; free tail **671,168 bytes**.
- The thirteen-rule compiler compatibility layer is unchanged; see `docs/FOMT_COMPILER_FINGERPRINT.md`. The full save loader/GameState remains unfinished and parked.
- **Save expansion readiness (October 10):** retail SRAM header/slots, record length/checksum/writer, loader validation stages and 2,800 unused tail bytes per slot are established. The loader `func_08011650` (740 linked bytes) and higher-level save/load handlers `func_08003F9C`, `func_080040A0`, `func_080041DC` remain assembly, and full `GameState` is incomplete. The separate `custom-game` worktree contains *host-only* reference tooling (`tools/save_extension_reference.py`) and **16 passing synthetic tests**, plus `docs/SAVE_EXTENSION_READINESS.md`. There is **no on-ROM serializer/loader, migration, overwrite/erase hook, or proven end-to-end persistence**. Do not treat this as release-ready or mix custom behavior into retail `main`.
- Readability audit: `docs/SOURCE_READABILITY_AUDIT.md`; repeatable heuristic scan: `python3 tools/ches/audit_source_readability.py`. The code-percentage metric counts exact bytes, not semantically complete functions. The three recent GameState/menu units are structurally readable but have unresolved slot meanings and address-derived external names.
- The live machine-generated truth is `tools/ches/decomp_inventory.json` and `tools/ches/DECOMP_QUEUE.md`.

## Current save-system investigation (documentation/test-only)

Static proof and the existing `tools/ches/save_load_map.json` confirm: SRAM is exactly 0x8000; header 0x28; two 0x3FEC-byte slots; per-slot record 0x34FC (size 4, GameState payload 0x34F4, checksum 4) and unused tail 0xAF0. The verified writer makes three independent low-level writes, and the loader defaults the state before validating the record but has no migration step. Loading is only valid when its **error output** indicates success, not when it returns a nonnull state pointer. The reference codec is separate and does not change the retail ROM.

The offline extension design uses two 1,400-byte banks per slot, each a 32-byte header plus up to 1,368 bytes of TLV data, and it has 16 passing synthetic tests. It also **proves a compatibility blocker**: a new game replacing a slot with an identical retail payload can inherit the old extension unless an explicit invalidation hook is installed. Separately, a power failure between retail write and extension commit can discard extension state. Do not deploy persistent custom features until both are handled and emulator save/load/overwrite/copy/erase tests pass. Retail `docs/SAVE_FORMAT.md` and custom `docs/SAVE_EXTENSION_READINESS.md` are authoritative.

Next save-specific work: (1) finish auditing menu save/load/erase/copy/overwrite hooks and selected-slot/valid-mask mutations, (2) design explicit slot identity/reset and partial-write recovery, (3) implement on-device bounded SRAM access in **custom-game only**, (4) test a backed-up real SRAM file and emulator saves. REA may clarify a particular unresolved branch but is unnecessary to re-prove the already understood retail record and loader stages. **Do not return to unrelated throughput targets until the entire save lifecycle is readable and exact, or the user explicitly changes priority.**

## Latest verified exact integration: 2 functions / 48 bytes

`src/game_state_audio_callbacks.cc` replaces exactly `080167AC..080167DC` with two independently zero-difference C++ functions: a 32-byte child callback getter at `167AC` (child operation +0x90 still semantically unknown) and a 16-byte sound-player busy check at `167CC`. The latter uses the existing named `IsSoundPlayerBusy` ABI at `func_08008CD0`, cross-confirmed by `src/game_object_discard.cc` and `src/entity_unk_08038740.cc`.

Neighbor `func_08016784` is behavior-understood (checks sound player and fades out over 5) but **remains assembly**: a natural 40-byte source differs by 15 linked bytes (branch orientation), a local-result variant by 27. Saved scratch and diff proofs: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-audio-menu-20261010/`.

**Important integration seam:** `asm/game_state.s` source order puts `167AC..167DC` between `.text.after_gmcb_15950` and `.text.game_state_actions_16ba4`. The first integration erroneously inserted the new object after the later `16EF0` section and failed the ROM gate; correcting `fomt.lds` to the actual retail order restored exactness. Forced `make -B -j4 compare` execution `sh_mv2471un_7d10991c` exited 0 with `fomt.gba: OK` and exact SHA1.

**Live inventory:** exact code **88,972 / 940,036 = 9.4647%**; remaining ASM **851,064 bytes / 1,981 linked functions**, inferred ranges **848,092**, unattributed **2,972**, parked **27**; meaningful ROM **164,922 / 7,717,440 = 2.1370%**; assets/data unchanged at **75,554**. Since the three earlier GameState/menu batches, cumulative continuation is **56 exact functions / 1,736 linked bytes**.

**Separate readability finding:** matching does not guarantee maintainable semantic C++. The reproducible `tools/ches/audit_source_readability.py` scans 136 C++ units / 19,919 lines and flags 135 address-named function definitions in 16 files, numeric child callback slots, layout padding and register-constrained code. These indicators are not a semantic completion percentage. Manual audit rubric and urgent debt: `docs/SOURCE_READABILITY_AUDIT.md`. The three recent GameState/menu source units have now been formatted/commented to describe proven offsets and unknown names. Do not speculate about missing gameplay names.

See `docs/GAME_STATE_AUDIO_CALLBACKS.md` for the stable audio/child ABI and proof location. Next pursue a coherent higher-byte and more semantically understandable family. If continuing nearby, recover callers of `16F60`, `16784`, and `167DC` using saved types; do not repeat source-shape puzzles. The existing 18-member ownership-transfer and 3-member tree insertion families remain in the prioritized queue but are codegen-sensitive.

## Previous verified exact integration: 13 functions / 444 bytes


Thirteen GameState/menu callback and incubation methods now have byte-exact natural C++ in `src/game_state_menu_callbacks.cc`, linked in five source/ASM islands. Each method independently matched its retail size and linked bytes; the forced clean `make -B -j4 compare` passed (`sh_mv22yrzy_255645e2`, exit 0, `fomt.gba: OK`).

| Address range | Functions | Linked bytes |
| --- | ---: | ---: |
| `0801468C..080146FC` | 4 | 112 |
| `08014C0C..08014C34` | 1 | 40 |
| `08014D5C..08014D9C` | 2 | 64 |
| `0801589C..08015920` | 3 | 132 |
| `08015950..080159B0` | 3 | 96 |
| **Total** | **13** | **444** |

The state holds a save pointer at +0x8C, status +0x9C and target +0xA8. Incubation wrapper `func_080146CC` calls `BeginIncubation__4CoopUi(saveState+0x410, argument)` and forwards that argument through target virtual slot +0xAC; two related forwarders use target slots +0x150 and +0x154. Children obtained from target slot +0x40 expose operations slots +0x44, +0x64, +0x68, +0x78, +0x7C, +0x80, +0x84, +0x88 and +0x8C. Selected callbacks set status to 0x19, and +0x68 narrows to `u16`. `func_0801468C` returns state+0xD0.

`func_08014BD8` remains untouched assembly: a readable loop candidate compiles to the right 52-byte size but has 5 differing linked bytes at best (loop v2; v1 has 9, v3 has 6). Preserve the closed register-lifetime frontier; do not repeat spelling-only compiler attempts. Other untouched complex neighbors include 14C34, 14D30 and 15920.

Scratch sources and individual diff/mismatch proofs are under `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch3/`, together with `probe.py`, the loop alternatives, `incubation_v1.cc`, `integrate.py`, and the exact original ASM/linker backups. Stable subsystem doc: `docs/GAME_STATE_MENU_CALLBACKS.md`. No REA or custom compiler work was required for this matching batch.

At this previous checkpoint, the three GameState/menu batches had recovered **54 functions / 1,688 bytes**, all retail-exact. The newer 2-function audio integration and current inventory are authoritative at the top of this handoff.

## Earlier verified exact integration: 18 functions / 560 bytes


`src/game_state_menu_actions.cc` provides 18 natural, independently zero-difference C++ routines replacing four carefully bounded source/assembly regions. The full forced `make -B -j4 compare` passed (`sh_mv22h75z_27840b97`, exit 0, `fomt.gba: OK`), retail SHA1 unchanged.

| Retail range | Functions | Exact linked bytes |
| --- | ---: | ---: |
| `08016BA4..08016CEC` | 11 | 328 |
| `08016D80..08016DB0` | 2 | 48 |
| `08016E7C..08016EC4` | 2 | 72 |
| `08016EF0..08016F60` | 3 | 112 |
| **Total** | **18** | **560** |

Evidence: menu proxy -> state pointer at +4, target at state +0xA8, status at +0x9C, target vtable slots +0xFC/+0x100/+0x104/+0x10C/+0x110/+0x164. The latter three pass through a second incoming argument and naturally use the retail r2 indirect call. Factory slot +0x40 returns the child, and the 0x5D selector is forwarded to four helper wrappers; additional child callback slots are +0x6C/+0x70/+0x74/+0x9C/+0xA8/+0xAC. Status values include 0x1B/0x1C/0x19. Two exact helpers access an enabled byte and a 32-bit value at `gUnk_0300040C + 0x36C`, setting value 0x234 or reading the field.

All per-function sources, mismatch proofs, `probe_batch.py`, `probe_more.py`, `probe_fix.py`, integration script, and pre-mutation assembly/linker backups are preserved at `/mnt/waydroid-hdd/home-chester-waydroid/fomt-menu-dispatch-batch2/`. The still-ASM functions around this region include 16CEC, 16D48, 16DB0, 16EC4, and 16F60, alongside larger owner/allocation functions. Reopen only with new natural structural evidence.

At this earlier 18-function checkpoint, the prior 23-function dispatch unit in `0bef5b7` contributed another 684 bytes, totaling 41 exact functions / 1,244 bytes across those two batches. The authoritative newer inventory and next actions are at the top of this handoff.

REA was unnecessary here: original assembly, ABI/struct offsets and per-function compiler matches were decisive. See `docs/GAME_STATE_MENU_ACTIONS.md` for the stable subsystem account.

## Earlier verified exact integration: 23 functions / 684 bytes


New natural source in `src/game_state_menu_dispatch.cc` owns 23 GameState/menu forwarding and saved-state flag functions. Every function independently matched its exact retail linked bytes. The combined source and linker/assembly seams passed a forced full-ROM comparison for each integration stage (`make -B -j4 compare`, latest execution `sh_mv21rcv0_8fb063b4`, exit 0, `fomt.gba: OK`).

| Original source island | Exact functions | Linked bytes |
| --- | ---: | ---: |
| `08014034..0801412C` | 10 | 248 |
| `08014164..08014198` | 1 | 52 |
| `08014198..08014264` | 6 | 204 |
| `08014264..080142B8` | 2 | 84 |
| `080142B8..08014318` | 4 | 96 |
| **Total** | **23** | **684** |

Only `func_0801412C` remains assembly. `14164`, `14264`, and `14290` were independently proved exact and integrated as a second incremental batch (+136 linked bytes); their forced clean ROM gate passed (`sh_mv21rcv0_8fb063b4`, exit 0). The first, 1412C, has behavior-recovered but nonmatching 56-byte v1 (14 differing bytes, branch orientation) and v2 (29 differences) in scratch. Revisit only with fresh ABI/control-flow evidence; do not repeat compiler spelling variations.

Recovered ABI facts: target pointer at state +0xA8, status +0x9C, saved-state pointer +0x8C; virtual table slots +0x80 through +0xA8 and +0x118/+0x11C. Two forwarding wrappers preserve an incoming second argument (the retail `r2` call register), and the chained callback at 1410C returns `u32` through r0. Child callback table slots +0x38, +0x40, +0x4C, +0x50, +0x54, +0x5C and +0x60 are anchored by exact source. Two flag setters write the saved-state byte at +0x34C4. Stable details: `docs/GAME_STATE_MENU_DISPATCH.md`.

Scratch candidates, exact per-function comparison output, integration dry run, and original assembly/linker backups: `/mnt/waydroid-hdd/home-chester-waydroid/fomt-virtual-dispatch-20261010/`. One shared callback-table padding error initially produced only five ROM differences; after correcting the four-byte offset, the entire 8 MiB ROM matches. REA was unnecessary for this family.

At the prior 23-function checkpoint, the inventory was lower; the authoritative current inventory is in the latest 18-function section above. Data/assets and unattributed ASM remain unchanged.

## Prior menu/owner integration — 18 functions / 632 bytes
All four independent source families were isolated, proven byte-exact, integrated
with original linker/assembly seams, and followed by a successful forced retail
ROM gate. Scratch proofs are under
`/mnt/waydroid-hdd/home-chester-waydroid/fomt-rea-trial/`,
including `matching/*.mismatch.txt`.

| Family | Exact function addresses | Production source | Recovered |
| --- | --- | --- | ---: |
| Polymorphic owner destructors | DCE60, DCEEC, E4510 | `src/menu_owner_dtors.cc` | 3 / 156 bytes |
| Global-owner destructors | D7AAC, D7B04, E581C, E5844 | `src/menu_global_owner_dtors.cc` | 4 / 160 bytes |
| Resource checks and two initializers | D7F60, D7F74, D7F88, D6F1C, D6F5C | `src/menu_resource_helpers.cc` | 5 / 124 bytes |
| Vtable-only destructors | D3ED4, DE220, E103C, E3D94, E4190, E4544 | `src/menu_simple_dtors.cc` | 6 / 192 bytes |

Forced ROM execution IDs, in sequence: `sh_mv1z65ct_8e774db6`,
`sh_mv1z8v52_19acc033`, `sh_mv1zdh6z_e0e0ec96`,
`sh_mv1zgcf1_407a2abd`. All exited 0 and ended with `fomt.gba: OK`.
The **64 bytes** of raw code/data following `DE220` remain in assembly; they
were reclassified as unattributed, increasing this subtotal from 2,908 to
2,972 bytes. They were neither reconstructed nor removed.

Earlier October 10 integrations included glyph-cache/provider/canvas methods,
range cleanups, tree rotations/balancing/release methods, ten menu emitters,
four subobject initializers and entity destructors. Their original experiments
are preserved in the archived history, corresponding subsystem pages, and
local matching workspace. Do not repeat already exact work.

## Highest-leverage next work

The three newest GameState/menu clusters total 54 exact functions / 1,688 bytes. `1412C` and nearby larger allocators/complex routines remain assembly. Rank coherent families after the regenerated inventory; do not return to compiler-only puzzles without structural evidence.

Re-rank coherent TUs/families by source-byte payoff, downstream type leverage,
existing structural evidence and compiler difficulty. The inventory queue is
a heuristic, **not** automatically an execution order.

1. **Ownership-transfer wrapper cluster:** 18 similar methods of **72 linked
   bytes each** (potential 1,296 bytes), including `func_080DB394`. Retail
   moves a temporary owned pointer into output and only conditionally releases.
   Scratch `db394-owned-v1.cc` is **0x40 versus 0x48 / 50 differing bytes**
   and semantically releases the result incorrectly. `db394-owned-v2.cc`
   zeroes a temp, but compiles to **0x2C versus 0x48 / 49 differences**.
   Recover the 16-byte stack smart-owner/move layout and destructor/allocator
   ABI *before* using one exemplar across siblings. Park if codegen archaeology
   dominates; never integrate nonmatching candidates.
2. **Typed tree-insertion family:** three ~192-byte siblings at `E2294`,
   `E27FC`, `E54F0`; layout and left/right rotations are source-exact,
   plus the `E21E0` balancer. E2294 scratch v1/v2 is behavior-recovered but
   nonmatching. Require new allocator/pointer-lifetime/type evidence.
3. **Other compiler-sensitive parked work:** two D6EAC/D6EEC pair initializers
   have correct 32-byte size but 7 mismatching linked bytes due to flag-store
   register order; E3610/E375C bit predicates, ten 36-byte DD410 field-copy
   helpers, F060 glyph-row rotation, E1C70, and the save loader remain parked
   until new structure provides leverage.

## Verification and continuation rules

- Read `AGENTS.md`, `START_HERE.md`, the fast path in
  `docs/DECOMP_PLAYBOOK.md` and the current ranked inventory. Reuse source
  types and saved scratch proofs; do not re-run completed experiments.
- Compare **single-function scratch sources** using
  `python3 tools/ches/compare-function.py scratch.cc name --start 0x08... --end 0x08... --out-dir <dir>`.
  The existing `--symbol` comparator is unreliable when one scratch object
  contains multiple independently named `.text.*` sections. An experimental
  fix failed and was reverted byte-for-byte to tracked HEAD; do not rely on
  multi-section proofs without a proper regression-tested fix.
- Check exact body, trailing alignment, literals, relocations and ABI before
  production. Split only the proven ranges in the applicable assembly file and
  `fomt.lds`. Preserve all neighboring ASM and raw literal/data islands.
- Force `make -B -j4 compare`, verify ROM SHA1, regenerate inventory with
  `python3 tools/ches/build_decomp_inventory.py`, run `git diff --check`,
  update the live dashboard/status/handoff and relevant stable subsystem page
  **once per coherent batch**.
- Keep custom-game edits isolated. Exact retail source is committed in
  **`1e522c9`**; inventory/handoff docs followed in **`38718be`**.
  Subsequent documentation alignment was published in **`98e093a`**, and the newer exact GameState/menu batch supersedes the old 18-function status. Verify current HEAD before further publication. Verify live state with
  `git status -sb` and `git log -1` before resuming.
