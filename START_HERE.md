# FoMT Zero-Context Start Here

This is the live dashboard for the US Harvest Moon: Friends of Mineral Town matching decompilation.

## Read this in order

1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. This file
4. docs/DECOMP_PLAYBOOK.md and docs/DECOMP_PRIORITY_MAP.md
5. tools/ches/NEXT_AGENT_HANDOFF.md
6. Only the subsystem docs and experiment/failure ledgers named by that handoff

## Active branch and build authority

- Retail branch: **main**, tracking **ches/main**. Run git log -1 for this checkpoint's commit.
- Starting checkpoint for the resource-owner integration: **5cc430c597d063f5e641c2b28943ba515b6353b8**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Current exact reconstruction

- Code: **73,280 / 940,036 = 7.7954%**
- Assembly remaining: **866,756 bytes**
- Linked assembly functions: **2,329**
- Inferred ranges: **865,592 / 866,756 = 99.8657%**
- Unattributed assembly: **1,164 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **149,010 / 7,717,440 = 1.9308%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Four rendering-resource-owner methods are integrated: AC78 destructor, ACD8
graphics update, AE58 renderer forwarding, and B0A8 sibling destructor.
They add **678 body bytes / 680 linked bytes including alignment**.

Source: include/resource_owners.hh, src/resource_owner_cached.cc and
src/resource_owner_variable.cc. Stable architecture: docs/RESOURCE_OWNERS.md.
All four final targets, a fresh isolated compiler/full-ROM build, and the
production forced full-ROM build pass. Eleven symbol checks and contribution
input hashes agree; only the four intended functions leave the assembly inventory.
Existing handle/container headers and the compiler are unchanged.

The prior 652-byte GetMapResourceId resolver and Entity38740-family helpers
remain complete. Do not repeat their matching or integration.

## Next direction

The user renewed the eventual save-structure recovery goal on October 7.
Use saved save-system research to select a coherent persistent-subobject/type
boundary, with initializer/consumer evidence and unchanged GameState offsets.
Start with the statistics-state cluster around 0809CD78, subject to its saved
history and current inventory. This can improve save-layout coverage without
reopening the parked loader's zero-identity/compiler puzzle.

The current loader error-code mapping was rechecked against assembly; stale
contradictory research text is corrected. See docs/SAVE_FORMAT.md and the handoff.

Resource-owner constructors remain assembly. AB30 is parked at 316/217 versus
328 expected; sibling B128 remains 382/2. Their failed source spellings are
closed. Resource-owner candidates/proofs live locally in the ignored
tools/ches/checkpoints/resource-owner-0803AB30-2026-10-07/ directory; a fresh
clone lacks those scratch artifacts but contains the integrated source.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
