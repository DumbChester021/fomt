# FoMT Session Status

Latest verified unit: October 9, 2026, Livestock shop helpers and catalog.
Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main. Starting checkpoint: 09fd78a.
Run git log -1 and git status for the completed checkpoint identity.

## Exact progress

- Code: **82,208 / 940,036 = 8.7452%**.
- Assembly: **857,828 bytes; 2,126 linked functions**.
- Inferred ranges: **855,132 / 857,828 = 99.6857%**.
- Unattributed assembly: **2,696 bytes; 17 parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,158 / 7,717,440 = 2.0494%**.
- Free tail: **671,168 bytes**.

## Verification

Four helpers add 360 linked code bytes: animal hearts, purchased animal type,
sale pricing and pregnant-livestock count. The eleven-entry catalog adds
220 typed data bytes. Individual bodies, complete blocks, complete-TU symbol
slices and relocated catalog pointers match retail.

Isolated and production forced full-ROM comparisons pass: fomt.gba: OK.
ROM is 8,388,608 bytes, SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963,
and exactly equals baserom.gba. No compiler or global SmartPtr change.
Target/neighbor addresses remain correct. Inventory removes only four helpers;
all other remaining assembly addresses/sizes are unchanged.

Scene lifetime remains 74 exact functions / 4,108 bytes, including all 25 Runs.
The livestock controller prefix/hierarchy and complete implementation remain
incomplete; result tail and context-to-Barn link are proven local ABI views.

Proof root: tools/ches/checkpoints/scene-controller-85584-2026-10-09/.
No build or compiler command is pending.

## Remaining frontier and next action

Next: controller ctor 85584 (168 bytes) and dtor 8562C (20 bytes).
Audit base ABI and existing fixed-string/record types, then compare a natural
candidate. Preserve the next seam at 85640; large controller/render routines
remain separate. NEXT_AGENT_HANDOFF.md owns exact bounds and first commands.

Constructor 92570 remains parked at 0x54 / four r0/r1 differences.
Whole-loader matching and other recorded compiler islands remain parked.
Stable architecture: docs/LIVESTOCK_SHOP.md and docs/SCENES.md.
