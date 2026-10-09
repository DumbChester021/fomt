# FoMT Next Agent Handoff

## Current production authority

Workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main.
Starting pushed checkpoint: 87bd428 decompile menu drawing callbacks and text streams.
Run git log -1, git status and git rev-parse ches/main for completed identity.
Standing authorization: review, commit and push exact checkpoints to public ches/main.

Latest batch: five shared font/canvas functions / 532 exact linked bytes.
Code: 83,612 / 940,036 = 8.8946%.
Assembly: 856,424 bytes; 2,107 linked functions.
Inferred ranges: 853,728 / 856,424 = 99.6852%.
Unattributed: 2,696 bytes. Explicit parked entries: 27.
Data/assets: 75,554 / 6,777,404 = 1.1148%.
Overall: 159,562 / 7,717,440 = 2.0676%. Free tail: 671,168 bytes.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
Tracked compiler and thirteen compatibility rules remain unchanged.
Whole save loader, complete GameState and controller implementations remain unfinished.

## Latest exact source and ownership

include/menu_font.hh / src/menu_font.cc own the complete 488-byte block:
GetMenuDoubleByteGlyphIndex D0CD4..D0D28, 82 body plus two alignment;
DecodeMenuGlyph D0D28..D0EBC, 404 bytes with jump table/literals.
MenuGlyphTiles is four 32-byte tiles, each eight u32 words, total 128 bytes.
Index extraction starts from signed code, shifts the masked high byte
arithmetically, then compares unsigned bytes. Low-byte subtraction precedes
the 189-column row arithmetic. Font table entries are signed i16.

Decoder handles fifteen special codes with 12-byte glyph records and returns one.
Ordinary positive single-/double-byte codes use separate tables and expanders.
Invalid ordinary input clears 128 output bytes when destination is nonnull.
Null ordinary destination can query width; special dispatch has no such guard.
Numeric IWRAM calls at 0300085C/03000714 preserve the observed ARM function-pointer
ABI, following existing code_080A4A4C/resource_owner_cached/entity_effect style.
Casting extern code-array symbols instead generated direct BL veneers, so that
v1 source shape is closed. No compiler change or forced register is involved.

src/menu_text_canvas.cc owns E9C8..E9F4, 44 bytes:
two four-byte unaligned glyph stubs plus CopyMenuText E9D0, 36 bytes.
The formerly anonymous E9D0 helper copies a canvas from its third-argument
source pointer. It does not fill/clear. Width*height*32 bytes determine the
masked CpuFastSet word count. The stubs return zero without writing pixels.

Four named assembly entries leave the inventory; E9D0 was part of E9CC's
inferred 40-byte span. No surviving address/size pair changes.
Unattributed stays 2,696. Four parked metadata entries are added, 23->27.
Font tables and IWRAM expanders remain assembly; no data/assets bytes are added.
Link seams: text streams, source canvas section, existing rectangle;
water/terrain assembly prefix, source font section, assembly from D0EBC.

Earlier units remain exact: menu callbacks/streams 14 functions / 576 bytes;
rectangle 100; provider counts 8; livestock 6/548 and catalog 220;
scene 74/4,108 including all 25 Runs. Stable contracts are in MENU_TEXT.md,
MENU_TILEMAP.md, LIVESTOCK_SHOP.md, SPRITE_ANIMATOR.md and SCENES.md.

## Proofs and working state

Ignored root: tools/ches/checkpoints/menu-glyphs-2026-10-09/.
- font-family-v2.cc / font-v2-block/: exact complete 488-byte proof.
- font-index-v2.cc / font-index-v2-block/: exact 84-byte linked index proof.
- font-v2-decode/: exact 404-byte decoder body/table.
- glyph-family-v2.cc / v2-copy/: exact 36-byte canvas copy.
- v1-unaligned / v1-unaligned-styled: exact four-byte stubs.
- before/, integration-inputs/, integration-manifest.json: seven build inputs.
- isolated-build.log / isolated-proof.json and both object-section reports.
- production-build.log / production-proof.json: retail/isolated equality,
  input hashes, five aliases/ranges and neighbor preservation.
- inventory-before.json / inventory-proof.json, progress.txt and status.json.
- docs-before/ / docs-manifest.json preserve the consolidated documentation pass.
No build or compiler execution is pending.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61 with intentional exact prior scene/livestock/menu/provider and
current font/canvas inputs applied. Never reset, clean, stash or discard it.
Before this integration 228 tracked build inputs agreed with production;
seven changed inputs and complete ROMs agree afterward.
Objects are under build/src/, not src/. The section proof was recovered after
the first post-build object-path error without repeating the passing forced build.
Audit current build-input hashes before reuse. Fresh clones need baserom.gba
and the tracked compiler; ignored proofs/worktrees are not cloned automatically.

## Parked renderer/fill source contracts

Retail renderer spans: E4AC..E5AC (256), E5AC..E7A0 (500) bytes.
glyph-family-v1: plain 234/211, styled 478/436.
v2 introduces credible inline alignment and cached dimensions:
plain 250/165, styled 478/441.
v3 typed tile CopyTo/DrawTo methods: plain 252/182, styled 514/466.
Plain v2 matches the broad CFG/alignment behavior but has frame 0x88 vs retail0x8C,
different tile-x spill, register allocation and address evaluation around copies.
Styled copies already implement the exact packed-word transform, but pointer/
iterator/base-color lifetimes allocate differently. Do not repeat v3 methods.

Fill E7A0 true 60 bytes: v1 60/31; v2/v3 60/30; v4 60/33.
Natural size expressions combine width extraction with its 32-byte shift;
retail extracts width separately and scales height before multiplication.
Rect E7DC true 276 bytes: v1 232/253; v2/v3 292/266; v4 296/279.
Alignment predicates and inline fill-temporary lifetimes remain different.
Close scalar/parenthesization/helper roulette. Reopen only with actual
original buffer/size/helper or lifetime evidence, not forced registers,
volatile/barriers, padding, compiler changes or global SmartPtr changes.

Font v1: index82/18, decoder398/114. Index signedness and low subtraction
fixed in v2; symbol 82 versus linked 84 is only two alignment bytes.
Decoder v2 direct special-case returns, numeric IWRAM dispatch and a
zero-initialized result are exact. Complete 488-byte proof is authoritative.

## Other preserved frontiers

OAM EA94 true 208 bytes plus separate 288-byte EB64..EC84 successor:
menu-graphics-batch-2026-10-09/oam-v1 204/198; v2 100/201. Closed.
Frame 5E790 best 140/34, reproducing old October 5 probes; root packed-sprite-frame.
Integer 4EC84 v3 164/34 wrong head test; v4/v5/v6 160/97 counter-copy frontier;
root menu-numbers-2026-10-09. Tall EDB4 68/eight, now followed by exact EDF8.
Offer 85640 best 528/482, frame 0xEC, shared list/frame-copy contract unresolved;
root livestock-offer-builder-2026-10-09. Ctor 92570 remains 84/four.
Whole loader, resource constructors/B128, twenty scene-change constructors
and mine-floor islands remain parked. Earlier handoff/Git and Call238 ledgers
preserve detailed rejected variants; do not rediscover them.

## Exact next action: menu glyph cache/row family

Assess the owning record and three helpers using the new font/canvas API:
EFAC..F058: 172-byte body, separate F058..F060: 8-byte anonymous neighbor;
F060..F0E0: 128 bytes; F0E0..F15C: 124 bytes.
Three bodies total 424 bytes; their inferred contiguous span is 432.
Preserve the anonymous neighbor unless independently reconstructed.

Observed consumers use three buffer pointers at +8/+C/+10, seven records per
buffer at stride 16, four-by-two tile canvases and a 28-position glyph cursor.
EFAC invokes DrawMenuGlyph and stores returned width; F060 rotates/clears a
row; F0E0 clears all three sets. Exact meanings of flags and owning class identity
need constructor/caller proof. Related EF20 is a separate 140-byte tile-transfer
callback; do not fold it into the cache type by adjacency alone.

First commands:
rg -n 'func_0804EFAC|func_0804F060|func_0804F0E0|L0804F058' asm/code_0803EE94.s
rg -n '4EFAC|4F060|4F0E0' tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md tools/ches/checkpoints/call238/FAILURES_AND_CLOSED_PATHS.md tools/ches/checkpoints/call238/FAILURE_LEDGER.md
python3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x0804EFAC --end 0x0804F058 --out-dir <checkpoint>

Recover the shared layout from construction/consumers, test the first natural
family candidate promptly, and include confirmed sibling lifetime methods.
Use one forced isolated/production gate pair, one inventory/docs pass and one
commit/push per coherent batch. A fixed small function count is not the unit.
Compiler authority: tools/install_agbcp.sh and tools/agbcp_fomt_compat.patch.
