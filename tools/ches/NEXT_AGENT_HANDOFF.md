# FoMT Next Agent Handoff

Read AGENTS.md, the decompilation skill, START_HERE.md, DECOMP_PLAYBOOK.md,
DECOMP_PRIORITY_MAP.md and SESSION_STATUS.md. Disk is authoritative.
Workspace: /mnt/data/Github/gba/fomt.
Branch: main, tracking ches/main; menu unit began at 9d9c9df.
Run git log -1 and git status for the published checkpoint identity.
Exact-only production and checkpoint commit/push authorization remain active.

## Verified production

Code: 82,496 / 940,036 = 8.7758%.
Assembly: 857,540 bytes; 2,123 linked functions.
Inferred ranges: 854,844 / 857,540 = 99.6856%.
Unattributed: 2,696 bytes. Explicit parked queue entries: 20.
Data/assets: 75,554 / 6,777,404 = 1.1148%.
Overall: 158,446 / 7,717,440 = 2.0531%. Free tail: 671,168 bytes.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
ROM: 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Tracked compiler installation and all thirteen compatibility rules are unchanged.
Whole save loader and complete GameState/controller implementations are unfinished.

## Latest coherent unit

FillSequentialTileRect / func_0804E9F4, 0804E9F4..0804EA58, is exact source.
include/menu_tilemap.hh and src/menu_tilemap.cc own 100 linked bytes:
98-byte body plus two alignment bytes. The first natural candidate matches.
It fills consecutive u16 tile values across width/height, ORs palette << 12,
and advances row starts by a caller-supplied u16-element stride.
The tile value wraps as u16; zero width/height produce no stores.
Source .text.menu_tilemap_rectangle follows the assembly after_heart_event_days
prefix. Remaining assembly starts in .text.after_menu_tilemap_rectangle at 4EA58.
Only 4E9F4 leaves the inventory; all other address/size pairs are unchanged.

The queue now explicitly parks number drawer 4EDB4, offer builder 85640 and
the previously documented constructor 92570. Count 17 to 20 is metadata,
not additional source recovery.

Earlier exact units remain unchanged:
- Livestock controller: six functions / 548 bytes, catalog 11x20 = 220 bytes.
- Controller extent 0x43E0, base 0x6A4, 17 records of stride 0x304,
  FixedStr<127> title, FixedStr<99> message, 16 records of stride 0x84.
- Shared base ctor C7F58/dtor C8360 and opaque record interiors remain assembly.
- Scene lifetime: 74 functions / 4,108 bytes, all 25 Runs exact.
See docs/LIVESTOCK_SHOP.md, docs/MENU_TILEMAP.md and docs/SCENES.md.

## Proofs and working state

Ignored root: tools/ches/checkpoints/menu-tilemap-2026-10-09/.
- rect-v1.cc and rect-v1/: exact 0x64 / zero differing linked bytes.
- integration-inputs/, integration-manifest.json, production-before/, docs-before/.
- isolated-proof.json and production-proof.json: complete ROM equality,
  target and neighboring symbols, four identical build-input hashes.
- isolated-build.log, production-build.log, isolated-object-sections.txt.
- inventory-proof.json: one removed function, no changed address/size pairs,
  three parked-status updates. progress.txt holds the measured totals.
- number-v1..v5 candidates/results and status.json hold the parked source probes.
No build or compiler execution remains.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61 with intentional exact 881EC, both livestock units and
menu rectangle inputs applied. Do not reset/discard it.
All 244 tracked build inputs matched production before this integration.
Its compiler was installed by the tracked pinned installer.
Before reuse, audit current production build-input hashes again.
Fresh clones must supply baserom.gba and install the tracked compiler locally.
Ignored checkpoints and the integration worktree are not cloned automatically;
use the tracked handoff facts if those artifacts are absent. Missing ROM or
compiler inputs are environment failures, not candidate mismatches.
Production code, inventory and docs are reviewed exact work; commit/push this
coherent checkpoint if publication is still pending.

## Parked number drawer

func_0804EDB4 true body is 0804EDB4..0804EDF8, 0x44 / 68 bytes.
The inventory's 0x68 inferred range includes a separate anonymous 36-byte
routine at 0804EDF8..0804EE1C. Preserve it; never claim those bytes as padding.
Unsigned decimal digits draw right-to-left, using two vertically adjacent tiles
per digit, a palette and row stride. Zero draws one digit.
Best candidate: menu-tilemap-2026-10-09/number-v2.cc, 0x44 / eight differences.
Only the entry destination-copy scheduling differs. The complete loop matches.
v1 OR operand order: 0x44 / ten differences.
v3 palette caching and v4 widened parameters: same 0x44 / eight differences.
v5 modulo/division spelling: 0x50 / 74 differences, two separate libcalls.
Stop canonicalized spelling changes. Reopen only with structural source/ABI evidence.

## Parked offer builder

Target func_08085640: 08085640..0808586C, 0x22C / 556 bytes.
Ignored root: tools/ches/checkpoints/livestock-offer-builder-2026-10-09/.
- offers-v1.cc and v1/: 544 bytes / 514 differences, frame 0xEC.
- offers-v2.cc and v2/: BEST 528 bytes / 482 differences, frame 0xEC.
- offers-v3.cc: compiler failure (std::_Destroy undeclared); no valid comparison.
  Partial compiler output cannot establish optimizer behavior.
- frame-copy-evidence.md and status.json preserve the shared interface frontier.

Retail clears a capacity-40, 16-byte descriptor list at base +20/+24,
then iterates offer IDs from count/array +2A4/+2A8.
It copies LivestockShopEntry, constructs Article/Tool icons from gUnk_086678A0,
fills two-row entry tiles and draws prices for offer IDs <=6.
Existing SpriteFrameData POD omits the observed post-getter 32-byte memcpy;
the scratch copy-constructor probe is elided. Erase/destructor and sprite
lifetimes also remain unresolved. Global types, SmartPtr and compiler unchanged.
The assembly scan finds 98 _call_via_r3 sites with a following 32-byte memcpy
within 14 lines. This supports investigating a shared return/copy contract;
it does not authorize an ad hoc self-copy statement in this target.

## Exact next action

Recover PackedSpriteAnimationProvider frame getter func_0805E790:
0805E790..0805E81C, 0x8C / 140 bytes.
Preserve the anonymous eight-byte successor at 0805E81C..0805E824.
Read include/sprite_animation_provider.hh, include/resource_owners.hh,
include/entity_effect.hh and docs/MENU_TILEMAP.md / LIVESTOCK_SHOP.md.
Search the call238 experiment/failure ledgers for 5E790 before new probes;
the current search found no prior getter candidate.

Proven input/return contract: hidden result pointer r0, provider r1, frame ID r2.
The returned SpriteFrameData contains four GraphicsBlob pointer/u16-size pairs.
A valid frame ID is below counts[1]; pools[1] holds 16-byte records:
+0 parts count, +2 parts offset in eight-byte units;
+4 graphics count, +6 graphics offset in 32-byte units;
+8 palette count, +A palette offset in 32-byte units;
+C transform count, +E transform offset in eight-byte units.
Pointers use pools[2] parts, pools[3] graphics, pools[4] palettes,
pools[5] transforms. Invalid index clears each pointer/size field;
do not assume padding bytes are initialized.
Cross-check count-unit interpretation against the getter's shifts before naming
size semantics. Write one natural struct-return candidate immediately.

First commands:
rg -n 'func_0805E790|func_0805E824' asm/code_0803EE94.s
rg -n '5E790' tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md tools/ches/checkpoints/call238/FAILURE_LEDGER.md
python3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x0805E790 --end 0x0805E81C --out-dir <checkpoint>

Then use realistic object/ABI proof, isolated forced full-ROM proof,
production forced full-ROM proof, hash/size, inventory/progress, reviewed docs,
explicit stage, commit and push ches/main. Keep renderer 8586C (0x658),
description 85F08 (0x9A0), and Run 86A08 (0xD08) separately bounded.
Constructor 92570 remains exact size 0x54 / four r0/r1 differences.
The whole-loader, resource constructors/B128, twenty scene-change constructors,
mine-floor islands and other closed frontiers need new structural evidence.

Stable architecture: docs/MENU_TILEMAP.md, LIVESTOCK_SHOP.md and SCENES.md.
Compiler authority: tools/install_agbcp.sh and tools/agbcp_fomt_compat.patch.
Closed records: tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md,
FAILURES_AND_CLOSED_PATHS.md and FAILURE_LEDGER.md.
