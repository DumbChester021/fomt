# FoMT Next Agent Handoff

Read AGENTS.md, the decompilation skill, START_HERE.md, DECOMP_PLAYBOOK.md,
DECOMP_PRIORITY_MAP.md and SESSION_STATUS.md. Disk is authoritative.
Workspace: /mnt/data/Github/gba/fomt.
Branch: main, tracking ches/main; lifecycle unit began at 51fc24d.
Run git log -1 and git status for the published checkpoint identity.
Exact-only production and checkpoint commit/push authorization remain active.

## Verified production

Code: 82,396 / 940,036 = 8.7652%.
Assembly: 857,640 bytes; 2,124 linked functions.
Inferred ranges: 854,944 / 857,640 = 99.6856%.
Unattributed: 2,696 bytes. Parked functions: 17.
Data/assets: 75,554 / 6,777,404 = 1.1148%.
Overall: 158,346 / 7,717,440 = 2.0518%. Free tail: 671,168 bytes.
Both isolated and forced production make -B -j4 compare pass: fomt.gba: OK.
ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Tracked compiler installation and all thirteen compatibility rules are unchanged.
Whole save loader and complete GameState/controller implementations remain unfinished.

## Latest coherent unit

LivestockController ctor 85584 (08085584..0808562C, 168 bytes) and dtor
8562C (0808562C..08085640, 20 bytes) are natural, exact C++.
The complete 188-byte block and all six lifecycle/helper bodies in the combined
TU match. Controller source now owns 548 linked bytes; the eleven-entry
catalog owns 220 data bytes. Four earlier helpers remain exact: hearts,
purchased cow/sheep type, sale pricing and pregnant-livestock count.
Scene ownership remains 74 functions / 4,108 bytes: all 25 Runs exact.

Recovered layout in include/livestock_controller.hh:
- ControllerC7F58: SceneController deletion prefix, context +8, extent 0x6A4;
  base ctor C7F58 and dtor C8360 remain assembly, other fields opaque.
- +6A4 state maps input 0/1/other to 0/5/6; byte +6A8 and word +72C clear.
- +770: 17 menu records, stride 0x304; empty default constructors reproduce
  retail's loop from 16 down through -1. Record +4 data extent is 0x300.
- +3AB4: FixedStr<127> initialized from gUnk_080FFC6C.
- +3B34: FixedStr<99> default initialized; 99-character bound is proven by
  the description concatenation code, giving exactly 100 bytes.
- +3B98: 16 records, stride 0x84, word +0 and FixedStr<127> at +4.
  Only each string's first byte clears; record words remain uninitialized.
- +43D8/+43DC: purchased type/slot, untouched by this constructor.
  Cow is 0, sheep 1, otherwise getter returns 999. This numbering differs from
  Barn::Ent::Kind and catalog service IDs.
- Context +5F0 uses existing Barn; context is a partial view, not GameState.

Natural initializer predicate matches the retail branch order:
state(value == 0 ? 0 : value != 1 ? 6 : 5).
Normal ctor/dtor ABI plus fomt.lds aliases preserve original entry labels and
vtable 080E7D30 without duplicate emitted vtables.
Source lifecycle section follows scene Run 85568; remaining assembly starts
in .text.after_livestock_controller_lifecycle at 85640.
Both original helper section sizes, catalog, vtable and next-function addresses
are unchanged. Only 85584 and 8562C leave the inventory; no other ranges shift.

## Proofs, failed paths and working state

Ignored root: tools/ches/checkpoints/livestock-controller-lifecycle-2026-10-09/.
- lifecycle-v3.cc/.hh and v3/: exact 188-byte block, zero differences.
- full-tu-proof.json: all six realistic source bodies exact.
- integration-manifest.json and integration-inputs/: reviewed four build inputs.
- isolated-proof.json, production-proof.json, inventory-proof.json and progress.txt.
- production-before/ and docs-before/: original contents preserved.
- production-object-nm.txt: derived vtable is external, no duplicate definition.
- candidate-status.json and integration-failures.md: rejected source/link probes.
v1 equal nested predicate differs in three branch bytes; numeric raw aliases
also add interworking thunks. v2 switch helper merges stores and does not match.
Use aliases to existing typed ELF function symbols; odd raw numeric addresses
still lose the ELF Thumb symbol type. No compiler mutation or padding tricks.
No background execution remains.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61, with intentional exact 881EC and both livestock units
applied. Do not reset/discard it. Its compiler was installed from the tracked
pinned installer; production build inputs were hash-audited equal before reuse.
Production changes are reviewed exact code/data, inventory and canonical docs;
commit/push this coherent unit if publication is still pending.

## Exact next action

Next bounded unit: offer-list builder func_08085640,
08085640..0808586C, 0x22C / 556 bytes.
Retail resets the base's 16-byte descriptor list at +20/+24, iterates offer IDs
from the count/list at +2A4/+2A8, copies existing LivestockShopEntry records,
builds Article/Tool icons, renders entries and prices, and registers descriptors.
Reuse the recovered catalog and controller extent immediately.
Audit existing graphics/resource/descriptor types and base list geometry;
write one natural typed candidate in an ignored checkpoint, then compare.

First commands:
rg -n 'func_08085640|func_0808586C|func_0805E6CC|func_0805E824|func_0804E9F4|func_0804EDB4' asm/code_0803EE94.s
rg -n '0805E6CC|0805E824|0804E9F4|0804EDB4' include src
Search EXPERIMENT_INDEX.md and the failure ledgers for those symbols before probes.
python3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x08085640 --end 0x0808586C --out-dir <checkpoint>

Keep renderer 8586C (0x658), description 85F08 (0x9A0), and controller
Run 86A08 (0xD08) separate until their shared types are ready.
Preserve the seam at 8586C. Do not reopen lifetime or constructor syntax roulette.
Use complete block proof, isolated full-ROM proof, production full-ROM proof,
ROM hash/size, inventory/progress, reviewed docs, explicit stage, commit/push.

## Parked boundaries

Constructor 92570 stays at 0x54 / four r0/r1 differences.
The whole save loader, resource-owner constructor/B128 frontiers, twenty
scene-change constructors, mine-floor and other compiler islands remain parked
until new structural evidence changes their leverage. Save layout recovery and
whole-loader matching are distinct, incomplete results.

Stable architecture: docs/LIVESTOCK_SHOP.md and docs/SCENES.md.
Compiler authority: tools/install_agbcp.sh and tools/agbcp_fomt_compat.patch.
Closed records: tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md,
FAILURES_AND_CLOSED_PATHS.md and FAILURE_LEDGER.md.
