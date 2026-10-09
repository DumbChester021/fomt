# Current FoMT continuation - October 9, 2026

## Latest verified checkpoint: Livestock shop helpers and catalog

Workspace: /mnt/data/Github/gba/fomt
Public retail branch: main, tracking ches/main.
Starting checkpoint for this unit: 09fd78a.
Run git log -1 and git status for the completed checkpoint identity;
preserve intentional dirty files.

Four helpers in include/livestock_controller.hh and src/livestock_controller.cc
now own **356 body bytes / 360 linked bytes**. The eleven-entry livestock shop
catalog in include/shop_catalog.hh and src/data_shop_catalog.cc owns **220 bytes**.

- Code: **82,208 / 940,036 = 8.7452%**.
- Assembly: **857,828 bytes; 2,126 linked functions**.
- Inferred ranges: **855,132 / 857,828 = 99.6857%**.
- Unattributed assembly: **2,696 bytes; 17 parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,158 / 7,717,440 = 2.0494%**.
- Free tail: **671,168 bytes**.

## Proven behavior and layouts

- 85EC4: min(10, unsigned affection / 25). Both audited callers in 8586C
  pass Animal::GetAffection results before drawing repeated icons.
- 85EEC: purchased animal type at controller +0x43D8; return 0 (cow) or
  1 (sheep), otherwise 999. Successful Barn insertion paths prove the types
  and write the returned barn slot at +0x43DC.
- 868E4: sale price by type and Livestock::GetProductRank. Cow ranks 0..4
  yield 3000/4000/5000/6000/7000; sheep yield 2000/2500/3000/4000/5000.
  Unhandled type/rank retains the default 3000. Requires a valid slot.
- 869A0: count pregnant livestock across Barn capacity. Test cow first, then
  sheep; repeat the successful getter before IsPregnant, as retail does.
- Controller +8 points to context whose Barn is at +0x5F0. Local ABI views
  use existing Barn/Cow/Sheep types; complete GameState/controller layouts
  and virtual hierarchy remain unclaimed.
- Catalog 080FFB90..080FFC6C has eleven 20-byte entries: ID +0, name +4,
  price +8, description +0xC, kind +0x10. Kinds: article, purchase, tool,
  sale, animal info. Service IDs differ from result types and Barn::Ent::Kind.
- The original label bundle 080FFB60..080FFB90 remains assembly.
  Table pointers retain empty/Buy Cow/Buy Sheep/Sell Cow/Sell Sheep offsets.
- Run 881EC now calls GetPurchasedAnimalType by its semantic name. Its exact
  192 bytes and both nested-request ownership transfers are preserved.

Scene lifetime remains 74 functions / 4,108 bytes: 24 constructors,
25 destructors, all 25 Runs. Controller helpers are counted separately.

## Verification and closed integration issues

- Result block 08085EC4..08085F08: 68 linked bytes / 0 differences.
- Sale/pregnancy block 080868E4..08086A08: 292 linked bytes / 0 differences.
- Four complete-TU symbol slices: 0 differences.
- Catalog target: 220 bytes / 0 differences, including relocated pointers.
- Reused the fresh pinned compiler installation from the prior 881EC proof.
  No compiler, global SmartPtr, register forcing or volatile/barrier change.
- Final isolated and production make -B -j4 compare: fomt.gba: OK.
- ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963;
  production is byte-for-byte equal to baserom.gba.
- Target/neighbor addresses preserved. Inventory removes only the four helpers;
  every other remaining assembly address/size is unchanged.
- Closed issues: compilation caught an incomplete scene-local rename; the first
  catalog linker placement used .rodata rather than its actual owning
  .rodata.after_record_article_catalog section. Source was already exact.
  The corrected seam passes; do not reopen source spelling for that failure.
- Symbol sizes omit two alignment bytes after 85EC4 and 869A0. Validate blocks.

Proof root: tools/ches/checkpoints/scene-controller-85584-2026-10-09/.
Key files: exact-candidate-proof.json, full-tu-proof.json,
catalog-target-proof.json, isolated-proof.json, production-proof.json,
integration-manifest.json and integration-failures.md.
Pre-update canonical docs are preserved under docs-before/.
Ignored proofs can be absent in a fresh clone; tracked source,
LIVESTOCK_SHOP.md and SCENES.md carry stable facts.
No background execution remains.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61 with reviewed 881EC and livestock inputs applied;
do not reset or discard those intentional changes. Its compiler was installed
from the tracked pinned installer, not copied from another worktree.

## Exact next action

Next bounded unit: controller construction and cleanup,
func_08085584 (08085584..0808562C, 168 bytes) and
func_0808562C (0808562C..08085640, 20 bytes).
Allocation is 0x43E0; derived vtable 080E7D30 is at +4.
Constructor calls base 080C7F58, maps input 0/1/other to state 0/5/6 at
+0x6A4, clears byte +0x6A8 and word +0x72C, initializes text at +0x3AB4
and +0x3B34, and clears byte +4 in 16 records of stride 0x84 at +0x3B98.
Those records end at +0x43D8, the recovered result tail.
Inspect include/utility/fixed_str.hh and the base ABI before claiming a complete class.
The 20-byte destructor installs the derived vtable and forwards the incoming
mode to base 080C8360. Preserve the separate seam at 08085640.

First command:
rg -n 'func_08085584|func_0808562C|func_080C7F58|func_080C8360' asm/code_0803EE94.s asm/code_809E804.s

After auditing shared layouts, write the natural candidate in an ignored
checkpoint and compare immediately:
python3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x08085584 --end 0x0808562C --out-dir <checkpoint>

Keep the large 86A08 controller Run (0xD08 bytes), 8586C renderer (0x658)
and 85F08 description routine (0x9A0) separate until their types are ready.

## Parked boundaries

Constructor 92570 remains exact-size 0x54 with four r0/r1 differences.
Do not reopen it without new structural evidence. Keep the whole save loader,
resource-owner constructor/B128 frontiers, twenty scene-change constructors
and other recorded compiler islands parked. Save layout recovery and
whole-loader matching remain separate, incomplete results.

Stable architecture: docs/LIVESTOCK_SHOP.md and docs/SCENES.md.
Compiler authority: tools/install_agbcp.sh and the thirteen-rule
tools/agbcp_fomt_compat.patch, unchanged.
