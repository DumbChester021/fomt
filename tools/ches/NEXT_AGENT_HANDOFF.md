# FoMT Next Agent Handoff

## Current production authority

Workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main.
Starting pushed checkpoint: a714171 decompile packed sprite provider counts.
Run git log -1, git status and git rev-parse ches/main for the completed identity.
Standing authorization: review, commit and push exact checkpoints to public ches/main.
Current batch: fourteen menu drawing functions / 576 exact linked source bytes.

Code: 83,080 / 940,036 = 8.8380%.
Assembly: 856,956 bytes; 2,111 linked functions.
Inferred ranges: 854,260 / 856,956 = 99.6854%.
Unattributed: 2,696 bytes. Explicit parked entries: 23.
Data/assets: 75,554 / 6,777,404 = 1.1148%.
Overall: 159,030 / 7,717,440 = 2.0607%. Free tail: 671,168 bytes.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
Whitespace-only final source/seam alignment also passes both incremental gates.
Tracked compiler and thirteen compatibility rules remain unchanged.
Whole save loader, complete GameState and controller implementations remain unfinished.

## Latest exact family

include/menu_draw_nodes.hh / src/menu_draw_nodes.cc own twelve methods / 360
bytes. The first natural typed candidate matches every selected body.

| Source group | Retail range | Bytes |
| --- | --- | ---: |
| Rectangle initializer/cleanup | 0804EA58..0804EA94 | 60 |
| Wide initializer/cleanup | 0804ED7C..0804EDB4 | 56 |
| Tall initializer/cleanup | 0804EDF8..0804EE30 | 56 |
| Single initializer/cleanup and four draw callbacks | 0804EE64..0804EF20 | 188 |

TileRectDrawNode is 0x20 bytes: callback prefix +0, destination +C,
palette/first_tile +10/+12, width/height/stride +14/+18/+1C.
NumberDrawNode is 0x1C bytes: prefix +0, value +C, destination +10,
first_tile/palette +14/+16, stride +18. Allocation callers prove both extents.
These are shared storage views, not claimed original class identities.
Initializers clear list links and install the existing vtable. Cleanup forwards
flags to DestroyIntrusiveCallbackNode. Draw callbacks invoke the primitive and return zero.
include/menu_tilemap.hh now declares the three assembly decimal primitives.

Existing vtables 080E7838/48/58/68 retain Run +8 and cleanup +C:
EE9C/EE88, EEBC/EE1C, EEDC/EDA0, EEFC/EA80 respectively.
No duplicate vtable/linkonce/data bytes are generated.

include/menu_text.hh / src/menu_text.cc own 216 linked bytes:
DrawMenuText E8F0..E958 (102 body + two alignment) and
DrawStyledMenuText E958..E9C8 (110 body + two alignment).
MenuTextSize is two u16 tile dimensions, passed as a four-byte value.
Both cache the current byte and accumulate codes; backend result 0 accumulates,
1 clears code and advances x eight pixels, 2 sixteen; other results stop.
NUL or x >= width*8 stops too. Styled rendering forwards both colors.
text-stream-v1 re-read the byte: eighteen symbol-byte differences per routine.
text-stream-v2 caches it once: complete 216-byte block, zero binary differences.
Its disassembly-only trailing NOP difference is boundary presentation.

## Ownership and proofs

Twelve named assembly entries leave the inventory. Anonymous constructors
ED7C/EDF8 instead shrink surviving ED28/EDB4 ranges 120->84 and 104->68.
No other surviving address/size changes; unattributed bytes remain 2696.
Only EA94 gains parked metadata, 22->23. Data/assets are unchanged.
Link order: assembly through E8F0; text source through E9C8; stubs/clear
through E9F4; existing rectangle through EA58; rectangle-node source through EA94;
assembly through ED7C; wide-node source through EDB4; tall primitive through EDF8;
tall-node source through EE30; single primitive through EE64;
remaining node source through EF20; remaining assembly.
fomt.lds and asm/code_0803EE94.s own the reviewed section seams.

Ignored root: tools/ches/checkpoints/menu-graphics-batch-2026-10-09/.
- draw-nodes-v1.cc, nodes-v1-results.json and twelve nodes-* matcher directories.
- text-stream-v2.cc / text-stream-v2/: complete exact text block.
- before/, integration-inputs/, integration-manifest.json: seven build inputs.
- isolated-build.log, isolated-proof.json and object-section reports.
- production-build.log, production-proof.json: retail/isolated ROM equality,
  fourteen aliases/ranges, four vtables and input hashes.
- inventory-before.json, inventory-proof.json, progress.txt and status.json.
- isolated-formatting-compare.log / production-formatting-compare.log.
- docs-before/ and docs-manifest.json: consolidated documentation evidence.
No build or compiler execution is pending.

Integration worktree:
/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/scene-run-881ec-20261009.
Detached at 8174a61 with intentional exact scene, livestock, rectangle, provider and
current menu inputs applied. Do not reset, clean, stash or discard it.
Before integration 224 tracked build inputs agreed with production; afterward
all seven changed input hashes and complete ROMs agree. Compiler installed
using the tracked pinned installer. Audit current inputs again before reuse.
Fresh clones need baserom.gba and the tracked compiler; ignored proofs and
integration worktrees are not cloned. Missing inputs are environment failures.

Earlier exact units remain: provider counts eight bytes; rectangle 100;
livestock six functions/ 548 and catalog 220; scene 74/ 4,108 including all 25 Runs.
Stable contracts: MENU_TILEMAP.md, MENU_TEXT.md, LIVESTOCK_SHOP.md,
SPRITE_ANIMATOR.md and SCENES.md.

## Parked source contracts

OAM EA94: true 208 bytes, separate anonymous 288-byteEB64..EC84 successor.
Hidden r0 returns eight packed bytes; clears two words, enables bit 12 and adds
masked y/x/tile/palette/priority/shape/size fields. OamShadow remains opaque.
menu-graphics-batch-2026-10-09/oam-v1 native bitfields: 204/198;
oam-v2 word helpers: 100/201, zero propagation removes field accesses.
Close these shapes; reopen only with genuine record/lifetime evidence.

Frame 5E790: true 140 bytes, best packed-sprite-frame-2026-10-09/frame-v3: 140/34.
Old October 5 custom-expansion-2026-10-05/candidate-sprite-resource-lookup-v1
already reaches the same linked frontier; old explicit-local v2: 146/126.
Current v1 POD return: 136/138 with 32-byte copy; v2/v4/v5/v6: 140 with 55/64/58/59.
Retail computes graphics/palette addresses before loading counts; current
natural source loads index/count values earlier. Stop canonical spelling variants.
Stable provider/descriptor evidence: SPRITE_ANIMATOR.md and RESOURCE_OWNERS.md.

Integer 4EC84: 164 linked bytes. menu-numbers-2026-10-09/format-v3: 164/34
with wrong head test; v4/v5/v6: 160/97 coalesce retail loop-foot increment/copy.
v1/v2: 156/119 and 160/116. Reopen only on counter lifetime/type evidence.

Tall primitive EDB4: 68 bytes, now followed by exact source initializerEDF8.
menu-tilemap-2026-10-09/number-v2: 68/eight; v1: 68/ten; v3/v4 canonicalize;
separate modulo/division v5: 80/74. Numeric-address v1: 68/nine, v2: 68/eight.
Stop this family without a factual signature change. Behavior: MENU_TILEMAP.md.

Offer 85640: 556 retail bytes; livestock-offer-builder-2026-10-09/v2: 528/482,
frame 0xEC. v1: 544/514; v3 fails compilation. Capacity 40 list and frame-copy
lifetimes unresolved.98 _call_via_r3 sites followed by 32-byte memcpy support
a shared return/copy contract.8586C/85F08/86A08 are separately bounded.
Ctor 92570: 84/four. Whole loader, resource constructors/B128, twenty scene-change
constructors and mine-floor islands require new structural evidence.

## Exact next action: shared menu glyph renderers

DrawMenuGlyph / func_0804E4AC: 0804E4AC..0804E5AC, 256 bytes.
DrawStyledMenuGlyph / func_0804E5AC: 0804E5AC..0804E7A0, 500 bytes.
Treat the combined 756-byte family as one work unit. No earlier probes were
found in the Call238 records during this batch.

Both use MenuTextSize and a128-byte four-tile glyph buffer.
Shared decoder func_080D0D28 is404 bytes, calling _call_via_r2,
func_080D0CD4 and memset. Aligned paths copy eight words per tile.
Styled words use 0x11111111, color 1's low nibble and color 2-color 1 delta;
confirm remaining packed shadow/color semantics before further naming.
Preserve unaligned stubs E9C8/E9CC and anonymous clear helper E9D0..E9F4.
Adjacent E7A0 is only 60 bytes ending E7DC, not all intervening bytes through E8F0.

First commands:
rg -n 'func_0804E4AC|func_0804E5AC|func_0804E7A0|func_080D0D28' asm include src
rg -n '4E4AC|4E5AC|D0D28' tools/ches/checkpoints/call 238/EXPERIMENT_INDEX.md tools/ches/checkpoints/call 238/FAILURES_AND_CLOSED_PATHS.md tools/ches/checkpoints/call 238/FAILURE_LEDGER.md
python 3 tools/ches/compare-function.py <candidate.cc> <name> --start 0x0804E4AC --end 0x0804E5AC --out-dir <checkpoint>

Recover the shared record/ABI from both backends and callers. Compare the
first natural family candidate promptly, park hard neighbors, then run one
isolated/production forced gate pair and one inventory/docs/publication pass.
A fixed small function count is not the batch unit. No forced registers,
volatile/barriers, compiler changes or global SmartPtr changes.
Compiler authority: tools/install_agbcp.sh and tools/agbcp_fomt_compat.patch.
Closed records: tools/ches/checkpoints/call238/EXPERIMENT_INDEX.md,
FAILURES_AND_CLOSED_PATHS.md and FAILURE_LEDGER.md.
