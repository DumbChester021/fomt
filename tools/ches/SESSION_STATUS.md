# FoMT Session Status

Latest verified batch: October 9, 2026, menu drawing callbacks and text streams.
Workspace: /mnt/data/Github/gba/fomt. Branch: main, tracking ches/main.
Starting checkpoint: a714171. Run git log -1 and git status for completed identity.

## Exact progress

- Code: **83,080 / 940,036 = 8.8380%**.
- Assembly: **856,956 bytes; 2,111 linked functions**.
- Inferred ranges: **854,260 / 856,956 = 99.6854%**.
- Unattributed: **2,696 bytes; 23 explicitly parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **159,030 / 7,717,440 = 2.0607%**.
- Free tail: **671,168 bytes**.

## Verified batch

Twelve draw-node methods own 360 exact bytes: four initializers, four cleanup
methods and four callbacks. Callers prove 0x20 rectangle and 0x1C decimal
records. All four existing vtables and callback/destructor slots are unchanged.
Two encoded stream walkers E8F0/E958 own 216 bytes, including four alignment
bytes. They share MenuTextSize, a cached input byte and glyph-return protocol.
Total: **14 functions / 576 additional exact linked bytes**.

Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
Final whitespace-only source/seam alignment passes both incremental gates too.
ROM equals baserom and isolated output: 8,388,608 bytes;
SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Seven integration-input hashes agree; all fourteen aliases/neighbors are preserved.
Source objects contain only intended code sections. Compiler remains unchanged.

Twelve named entries leave the inventory. Formerly anonymous ED7C/EDF8
constructors instead shrink ED28/EDB4 ranges 120->84 and 104->68.
Other surviving ranges and unattributed bytes remain unchanged.
EA94 gains parked metadata 22->23; data/assets are unchanged.

Earlier units remain exact: provider counts 8; rectangle 100; livestock 6/ 548
and catalog 220; scene 74/ 4,108 including all 25 Runs.
Whole save loader, complete GameState and controller bodies remain incomplete.
Stable evidence: MENU_TILEMAP.md, MENU_TEXT.md, LIVESTOCK_SHOP.md, SCENES.md.
Proof root: tools/ches/checkpoints/menu-graphics-batch-2026-10-09/.
No build or compiler execution is pending.

## Parked research and next family

OAM EA94: true 208 bytes, separate anonymous 288-byte successor preserved.
Natural bitfield v1: 204/198; word-helper v2: 100/201, folding field accesses away.
Both source shapes parked. Frame getter 5E790: 140/34; formatter 4EC84 remains
a counter-copy/loop-placement frontier; tall decimal EDB4: 68/eight;
offer builder: 528/482. No nonmatching source is promoted.

Next coherent family: shared glyph backends E4AC (256)/E5AC (500), combined 756 bytes.
Recover their four-tile buffer and decoder around MenuTextSize. Preserve
unaligned stubs and anonymous clear helper. NEXT_AGENT_HANDOFF.md owns exact
commands, evidence and closed paths. Use one integration, inventory/docs and
publication pass per coherent family; fixed small function counts are not units.
