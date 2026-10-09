# FoMT Zero-Context Start Here

This is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Read this in order

1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. This file
4. docs/DECOMP_PLAYBOOK.md and docs/DECOMP_PRIORITY_MAP.md
5. tools/ches/NEXT_AGENT_HANDOFF.md
6. Only subsystem docs and experiment/failure ledgers named by that handoff

## Active branch and build authority

- Retail branch: **main**, tracking **ches/main**. Run git log -1 for this checkpoint's commit.
- Starting checkpoint for the livestock shop unit: **09fd78a**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Handoff readiness

Latest verified checkpoint: Livestock shop helpers and catalog, four helpers /
360 linked code bytes and eleven typed catalog entries / 220 data bytes.
Isolated and forced production full-ROM comparisons pass on October 9, 2026.
Run git log -1 and git status before work; preserve intentional dirty files.
The full loader and complete GameState type remain unfinished.
No build or compiler command is pending.

Read the Fast-path operating method in docs/DECOMP_PLAYBOOK.md.
NEXT_AGENT_HANDOFF.md owns exact bounds, first commands and closed paths.

## Current exact reconstruction

- Code: **82,208 / 940,036 = 8.7452%**.
- Assembly: **857,828 bytes; 2,126 linked functions**.
- Inferred ranges: **855,132 / 857,828 = 99.6857%**.
- Unattributed assembly: **2,696 bytes; 17 parked functions**.
- Data/assets: **75,554 / 6,777,404 = 1.1148%**.
- Overall meaningful ROM: **158,158 / 7,717,440 = 2.0494%**.
- Free tail: **671,168 bytes**.

## Latest completed unit

Livestock shop: animal affection hearts, purchased species, sale pricing and
pregnant-animal count are exact source. The typed catalog covers fodder,
cow/sheep purchases, Miracle Potions, medicine, bell, sales and animal info.
Original symbols and retail pointer values are preserved.
See [LIVESTOCK_SHOP.md](docs/LIVESTOCK_SHOP.md).

Scene lifetime remains **74 source functions / 4,108 bytes**:
24 constructors, 25 destructors and all 25 Runs. Constructor 92570 and most
controller logic remain assembly. See [SCENES.md](docs/SCENES.md).

## Next direction

Next: controller constructor 85584 (168 bytes) and destructor 8562C (20 bytes),
anchored by the proven result tail, catalog and Barn context. Audit base ABI
and existing fixed-string types before promoting source. Preserve seam 85640.
The large 86A08 Run is separate. Constructor 92570 stays parked at 0x54 /
four r0/r1 bytes.

The loader, resource-owner constructors and B128 remain parked.
Current ignored proofs: tools/ches/checkpoints/scene-controller-85584-2026-10-09/.
The canonical handoff supplies prior failure limits and fresh-clone limitations.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. NEXT_AGENT_HANDOFF.md owns next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
