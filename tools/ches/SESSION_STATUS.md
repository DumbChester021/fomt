# FoMT Session Status

Latest verified unit: October 9, 2026, Menu tilemap rectangle drawing.
Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Starting checkpoint: 9d9c9df.
Run git log -1 and git status for the completed checkpoint identity.

## Exact progress

- Code: **82,496 / 940,036 = 8.7758%**.
- Assembly: **857,540 bytes; 2,123 linked functions**.
- Inferred ranges: **854,844 / 857,540 = 99.6856%**.
- Unattributed assembly: **2,696 bytes; 20 explicitly parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,446 / 7,717,440 = 2.0531%**.
- Free tail: **671,168 bytes**.

## Verification

FillSequentialTileRect at 0804E9F4..0804EA58 matches the first natural candidate.
Its body is 98 bytes; the complete linked section is 100 bytes including alignment.
The original symbol and next seam at 4EA58 are preserved.
Both forced isolated and production make -B -j4 compare pass: fomt.gba: OK.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
All four integration input hashes agree across scratch, isolated and production.
Only 4E9F4 leaves the inventory; all other address/size pairs remain unchanged.
Number drawer 4EDB4, builder 85640 and the already-documented constructor 92570
now have explicit parked queue status, raising that metadata count from 17 to 20.
Tracked compiler and thirteen compatibility rules are unchanged.

Livestock controller remains six exact functions / 548 linked bytes, catalog 220.
Scene lifetime remains 74 exact functions / 4,108 bytes, including all 25 Runs.
Whole save loader, GameState and controller implementations remain incomplete.
Stable evidence: docs/MENU_TILEMAP.md and docs/LIVESTOCK_SHOP.md.
Proof root: tools/ches/checkpoints/menu-tilemap-2026-10-09/.
No build or compiler execution is pending.

## Remaining frontier and next action

Recover packed sprite frame getter 0805E790..0805E81C, 140 bytes, using existing
SpriteFrameData and PackedSpriteAnimationProvider. Preserve the separate
anonymous eight-byte successor. Then revisit the offer builder only with
stronger frame-copy/list-lifetime evidence.
Builder best v2 is 528 bytes / 482 differences against 556 retail bytes.
Number drawer best v2 is 68 bytes / eight entry-scheduling differences.
NEXT_AGENT_HANDOFF.md owns commands, proof paths, closed probes and publication.
