# FoMT Session Status

Latest verified unit: October 9, 2026, packed sprite-provider count accessors.
Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Starting pushed checkpoint: 688a625.
Run git log -1 and git status for the completed checkpoint identity.

## Exact progress

- Code: **82,504 / 940,036 = 8.7767%**.
- Assembly: **857,532 bytes; 2,123 linked functions**.
- Inferred ranges: **854,836 / 857,532 = 99.6856%**.
- Unattributed assembly: **2,696 bytes; 22 explicitly parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,454 / 7,717,440 = 2.0532%**.
- Free tail: **671,168 bytes**.

## Verification

GetSpriteCount / 0805E81C and GetAnimationCount / 0805E820 are exact:
four bytes each, returning provider counts[1] and counts[0].
The combined eight-byte matcher and realistic source section match.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
ROM equals baserom and isolated output: 8,388,608 bytes;
SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
All four integration-input hashes agree; neighboring symbols are preserved.
No named assembly function leaves the inventory. Only 5E790's inferred range
shrinks 148 to 140 bytes as the two anonymous accessors become source.
Other address/size pairs and unattributed bytes are unchanged.
5E790/4EC84 gain parked status: 20 to 22 entries is metadata.
Tracked compiler and thirteen compatibility rules are unchanged.

Menu rectangle remains 100 exact linked bytes.
Livestock controller remains six exact functions / 548 bytes, catalog 220.
Scene lifetime remains 74 exact functions / 4,108 bytes, including all 25 Runs.
Whole save loader, GameState and controller implementations remain incomplete.
Stable evidence: SPRITE_ANIMATOR.md, MENU_TILEMAP.md, LIVESTOCK_SHOP.md.
Proof root: tools/ches/checkpoints/packed-sprite-frame-2026-10-09/.
No build or compiler execution is pending.

## Parked research and next action

The handoff's claimed lack of old frame-getter probes was incomplete.
October 5 candidates were found via SPRITE_ANIMATOR.md and preserved.
Current frame-v3 reproduces the historical 140-byte / 34-difference middle
evaluation schedule. Direct POD return and wider/helper variants regress.
Formatter 4EC84 v3 is 164 / 34 with the wrong loop-test placement; v4/v5/v6
are 160 / 97 with the retail loop shape but one coalesced counter copy.
Counter spellings have canonicalized; both families are parked.
Number drawer 4EDB4 stays 68/eight, builder 85640 stays 528 / 482.
No nonmatching candidate is promoted.

Next bounded unit: menu OAM descriptor factory 4EA94..4EB64, 208 bytes.
Preserve its anonymous 288-byte successor 4EB64..4EC84.
Recover the packed eight-byte record and caller contract before one natural
source probe. NEXT_AGENT_HANDOFF.md owns commands, proof paths and closed probes.
