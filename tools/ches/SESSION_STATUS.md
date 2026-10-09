# FoMT Session Status

Latest verified batch: October 9, 2026, shared font lookup/decoder and canvas copy.
Workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Starting pushed checkpoint: 87bd428.
Run git log -1 and git status for the completed checkpoint identity.

## Exact progress

- Code: **83,612 / 940,036 = 8.8946%**.
- Assembly: **856,424 bytes; 2,107 linked functions**.
- Inferred ranges: **853,728 / 856,424 = 99.6852%**.
- Unattributed: **2,696 bytes; 27 explicitly parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **159,562 / 7,717,440 = 2.0676%**.
- Free tail: **671,168 bytes**.

## Verified batch

GetMenuDoubleByteGlyphIndex / D0CD4 owns 84 linked bytes: 82 body plus two alignment.
DecodeMenuGlyph / D0D28 owns 404 bytes, including its dispatch table/literals.
Their complete 488-byte block matches in scratch and the realistic source section.
MenuGlyphTiles is a 128-byte four-tile record. Signed table entries, fifteen
special glyph mappings and the fixed IWRAM expansion ABI are recovered.

CopyMenuText / E9D0 owns 36 bytes; unaligned stubs E9C8/E9CC own four each.
The former anonymous helper copies the entire canvas; earlier clear naming was wrong.
The complete canvas section is 44 bytes. Total: **five functions / 532 bytes**.

Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
ROM equals baserom and isolated output: 8,388,608 bytes;
SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Seven integration-input hashes agree. All five aliases and neighboring
E958/E9F4/D0EBC addresses are preserved. New objects contain only the intended
488-/44-byte code sections; no extra code/data/linkonce output.
Tracked compiler and all thirteen compatibility rules remain unchanged.

Four named entries leave the inventory; the fifth was an anonymous successor.
No surviving address/size pair changes. Unattributed bytes stay 2,696.
Only E4AC/E5AC/E7A0/E7DC gain parked metadata: 23 to 27.
Data/assets and earlier exact menu, livestock, scene and save subobjects stay unchanged.
The whole save loader and complete GameState/controller implementations remain incomplete.
Proof root: tools/ches/checkpoints/menu-glyphs-2026-10-09/.
No build or compiler execution is pending.

## Closed probes and next family

Renderer/fill behavior is recovered, but original inline tile/address and
temporary lifetimes remain unresolved. Best plain v2 is 250/165;
styled v1 is 478/436. Typed tile-method v3 regresses; do not repeat it.
Fill v2/v3 is 60/30; rectangle v2/v3 is 292/266. Source shapes are parked.
Font v2 is exact after correcting signed extraction/unsigned comparisons,
direct case returns and the established fixed-IWRAM dispatch spelling.
No nonmatching source is promoted.

Next family: menu glyph cache/row helpers EFAC/F060/F0E0, using four-by-two
canvases and 16-byte records. Preserve the eight-byte F058..F060 neighbor.
NEXT_AGENT_HANDOFF.md owns bounds, saved candidates, commands and reopened-path criteria.
