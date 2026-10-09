# FoMT Next Agent Handoff

## Current production authority

Workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main.
Starting pushed checkpoint for this unit: 688a625 decompile menu tilemap rectangle drawing.
Run git log -1, git status and git rev-parse ches/main for the completed identity.
Current verified unit: sprite-provider sprite/animation count accessors.
Standing authorization: review, commit and push exact checkpoints to public ches/main.

Code: 82,504 / 940,036 = 8.7767%.
Assembly: 857,532 bytes; 2,123 linked functions.
Inferred ranges: 854,836 / 857,532 = 99.6856%.
Unattributed: 2,696 bytes. Explicit parked queue entries: 22.
Data/assets: 75,554 / 6,777,404 = 1.1148%.
Overall: 158,454 / 7,717,440 = 2.0532%.
Free tail: 671,168 bytes.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
Tracked compiler installation and all thirteen compatibility rules are unchanged.
Whole save loader and complete GameState/controller implementations are unfinished.

## Latest exact source

PackedSpriteAnimationProvider::GetSpriteCount / func_0805E81C returns counts[1].
GetAnimationCount / func_0805E820 returns counts[0].
Both four-byte bodies match retail at 0805E81C..0805E824.
The methods use .text.sprite_animation_provider_counts in the existing
include/sprite_animation_provider.hh / src/sprite_animation_provider.cc unit.
Link order: provider parser/animation lookup, assembly frame getter,
source count accessors, then the existing exact SpriteAnimator.
No vtable or frame-descriptor implementation changes.

These were anonymous assembly bytes included in the inferred 5E790 range.
That range shrinks from 148 to its true 140 bytes; no named assembly entry
leaves the inventory. Other address/size pairs and 2,696 unattributed bytes
are unchanged. 5E790 and 4EC84 now have explicit parked status: 20 to 22
is metadata, separate from the eight recovered code bytes.

Earlier exact units remain unchanged:
- Menu FillSequentialTileRect / 4E9F4..4EA58: 98 body + two alignment bytes.
- Livestock controller: six functions / 548 bytes, catalog 11x20 = 220 bytes.
- Controller extent 0x43E0, base 0x6A4, 17 records of stride 0x304,
  FixedStr<127> title, FixedStr<99> message, 16 records of stride 0x84.
- Shared base ctor C7F58/dtor C8360 and opaque record interiors remain assembly.
- Scene lifetime: 74 functions / 4,108 bytes, all 25 Runs exact.
Stable evidence: SPRITE_ANIMATOR.md, MENU_TILEMAP.md, LIVESTOCK_SHOP.md, SCENES.md.

## Proofs and working state

Ignored root: tools/ches/checkpoints/packed-sprite-frame-2026-10-09/.
- provider-counts-v1.cc and provider-counts-v1/: exact eight-byte comparison.
- counts-before/, counts-integration-proof.json: four reviewed integration inputs.
- counts-isolated-compare.log, counts-isolated-object-sections.txt,
  counts-isolated-proof.json and counts-production-compare.log.
- counts-production-proof.json: ROM equality with baserom and isolated build,
  unchanged target/neighbors, hashes, inventory ranges and parked-status changes.
- counts-progress.txt and counts-docs-before/ preserve reporting evidence.
- frame-v1..v6.cc, v1..v6/ and status.json hold the parked getter research.
Menu research: tools/ches/checkpoints/menu-numbers-2026-10-09/.
No build or compiler execution remains.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61 with intentional exact 881EC, both livestock units,
menu rectangle and provider count inputs applied. Do not reset/discard it.
Selected tracked build inputs agreed with production before this integration;
all four integration hashes and complete ROMs agree after it.
Its compiler was installed by the tracked pinned installer.
Before reuse, audit current production build-input hashes again.
Fresh clones must supply baserom.gba and install the tracked compiler locally.
Ignored checkpoints and the integration worktree are not cloned automatically.
Use these tracked facts if artifacts are absent; missing ROM/compiler inputs
are environment failures, not candidate mismatches.
If publication is still pending, commit/push the reviewed source, inventory and docs.

## Parked packed frame getter

func_0805E790: 0805E790..0805E81C, 0x8C / 140 bytes.
The old handoff missed prior October 5 candidates documented in SPRITE_ANIMATOR.md:
custom-expansion-2026-10-05/candidate-sprite-resource-lookup-v1.cc and v2.cc.
Saved matcher results: function-match-artifacts/sprite-resource-lookup-v1/v2 files.
Old v1 symbol 0x8A / 36 differences included an omitted alignment halfword;
full linked .text is 0x8C / 34 genuine middle-schedule differences.
Old explicit-local v2 is 0x92 / 126 and rejected. Do not repeat it.
Current best: packed-sprite-frame-2026-10-09/frame-v3.cc, 0x8C / 34.
It reproduces the old natural constructor-return frontier.

Closed current probes:
- v1 shared POD local return: 0x88 / 138, adds a 32-byte stack return copy.
- v2 widened constructor sizes: 0x8C / 55.
- v4 count scaling inside outer constructor: 0x8C / 64.
- v5 inline pointer helpers: 0x8C / 58.
- v6 inline numeric-address helpers: 0x8C / 59.
No compiler, global SmartPtr or production SpriteFrameData changes.
Stop scalar/constructor/helper spelling; reopen only with structural source,
aggregate/inline-lifetime or pass evidence that changes the middle schedule.

ABI: hidden result r0, provider r1, sprite ID r2.
Valid index < counts[1]; pools[1] holds 16-byte index records:
+0 parts count, +2 first part in eight-byte units;
+4 tile count, +6 first tile in 32-byte units;
+8 palette count, +A first palette in 32-byte units;
+C fourth-span count, +E first fourth-span record in eight-byte units.
Return spans use pools[2..5], with pointer and u16 size/count per eight-byte span.
Parts/fourth counts remain record counts; graphics/palette sizes are counts*32,
truncated to u16. The fourth span's transform meaning remains a hypothesis.
Invalid index clears each pointer/size, not the two-byte span padding.
Retail computes graphics/palette addresses before loading their counts;
v3 loads all index/count values and computes addresses later.

## Parked integer text formatter

func_0804EC84: 0804EC84..0804ED28, 0xA4 / 164 linked bytes.
Root: menu-numbers-2026-10-09/, format-v1..v6.cc and result directories.
Signed value, char destination, unsigned field width; reverse decimal buffer,
signed modulus/division by ten, at most ten digits, optional left padding,
sign prepended after padding, then output reversal and NUL.
Width zero uses natural length; smaller width keeps least-significant digits.
The routine has no width clamp or special INT_MIN handling.
See MENU_TILEMAP.md for behavior; no source was promoted.

v1: 0x9C / 119; v2: 0xA0 / 116.
v3: 0xA4 / 34, but places the limit test at the loop head.
Best retail control-flow shape v4: 0xA0 / 97.
v5 ordinal=count+1 and v6 signed reverse index canonicalize to v4.
Retail emits adds r0,r4,#1; adds r6,r0,#0; cmp r6,#10 at the loop foot.
The candidates coalesce the first two instructions into adds r6,r4,#1.
The missing copy shifts otherwise matching code and final alignment.
Do not force registers, add fake padding, or repeat scalar counter spellings.
Reopen on evidence for the actual counter lifetime/type or allocator input.

## Parked decimal tile drawer

func_0804EDB4 true body: 0804EDB4..0804EDF8, 0x44 / 68 bytes.
Its inferred inventory range also includes an anonymous 36-byte executable
routine at 0804EDF8..0804EE1C. Preserve it.
Best menu-tilemap-2026-10-09/number-v2.cc: 0x44 / eight entry-scheduling differences.
Complete right-to-left two-row digit loop matches; zero draws one digit.
v1 OR order: ten differences; v3 palette caching and v4 widened parameters
canonicalize to eight; v5 modulo/division separates libcalls: 0x50 / 74.
Current number-address-v1: 0x44 / nine, with changed register allocation.
number-address-v2: 0x44 / eight, canonicalizes to the prior entry mismatch.
Numeric-address spelling supplies no factual signature change. Stop this family.

## Parked offer builder and other frontiers

85640: 08085640..0808586C, 556 retail bytes.
Root: livestock-offer-builder-2026-10-09/.
offers-v1: 544 / 514, frame 0xEC; best v2: 528 / 482, frame 0xEC.
v3 fails compilation (_Destroy undeclared); partial output proves no match.
Retail clears a capacity-40 16-byte descriptor list at base +20/+24,
iterates IDs from +2A4/+2A8, builds Article/Tool icons and two-row entry tiles,
and draws prices for IDs <=6. Shared frame-copy/list lifetimes remain unresolved.
There are 98 _call_via_r3 sites with a following 32-byte memcpy within 14 lines.
This supports a shared return/copy contract, not an ad hoc target self-copy.
Renderer 8586C (0x658), description 85F08 (0x9A0) and Run 86A08 (0xD08)
are separately bounded. Constructor 92570 stays at 0x54 / four r0/r1 differences.
Whole loader, resource constructors/B128, twenty scene-change constructors,
mine-floor islands and other closed frontiers require new structural evidence.

## Exact next action

Recover the adjacent menu OAM descriptor factory func_0804EA94.
True body: 0804EA94..0804EB64, 0xD0 / 208 bytes.
The inferred inventory range is 496 bytes because it also includes the separate
anonymous string/glyph routine at 0804EB64..0804EC84, 288 bytes. Preserve it.
Inventory finds 18 direct calls from 12 callers across 3 assembly files.
No earlier factory probes were found in the Call238 ledgers.
There is no existing typed OAM attribute record in include/; OamShadow is opaque.

First read the body, several callers and packed_sprite_bank.py's OBJ decoding.
The factory returns an eight-byte packed value through hidden r0.
It zeroes both words, enables bit 12, then adds y, x, tile, palette, priority,
shape and size into their masked fields. Confirm explicit parameter widths,
stack order and the bit 12 role against consumers before semantic naming.
Use a credible packed record/helper source; test one natural candidate promptly.
Do not transcribe masks merely to force scheduling. If the same old compiler
frontier appears, record it and rank a different typed menu/graphics boundary.

First commands:
rg -n 'func_0804EA94|L0804EB64|func_0804EC84' asm/code_0803EE94.s
rg -n '4EA94|OAM' tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md tools/ches/checkpoints/call238/FAILURE_LEDGER.md
python3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x0804EA94 --end 0x0804EB64 --out-dir <checkpoint>

Then realistic object/ABI proof, isolated forced ROM, production forced ROM,
hash/size, inventory/progress, reviewed docs, explicit stage, commit/push ches/main.
Compiler authority: tools/install_agbcp.sh and tools/agbcp_fomt_compat.patch.
Closed records: tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md,
FAILURES_AND_CLOSED_PATHS.md and FAILURE_LEDGER.md.
