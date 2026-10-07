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
- Starting checkpoint for the fishing-record integration: **d9e95f5f4ebacc07d3b9f3aabae26f0809d63dd0**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Handoff readiness

Latest verified code commit: 98c6cd1e203ccc781e4f1a2669cb56a2477c5df5,
pushed to ches/main. Later documentation-only commits do not change its code
metrics or ROM proof. The full loader and complete GameState type remain
unfinished; retail subobject recovery is active and custom extension work is
deferred. No commands are pending.

For the proven techniques and recommended next approach, read
docs/DECOMP_PLAYBOOK.md, section "Recover persistent subobjects without blocking
on the whole loader". NEXT_AGENT_HANDOFF.md includes first commands, exact
next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **73,556 / 940,036 = 7.8248%**
- Assembly remaining: **866,480 bytes**
- Linked assembly functions: **2,321**
- Inferred ranges: **865,316 / 866,480 = 99.8657%**
- Unattributed assembly: **1,164 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **149,286 / 7,717,440 = 1.9344%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Eight fishing-record methods at 0809CD78..0809CE8C are now exact source,
adding 270 body bytes plus six alignment bytes, 276 linked bytes.
The shared type recovers the 472-byte persistent block at GameState+2C80:
59 catch-count/maximum-size pairs. Indices 0..7 are treasures/junk,
8..52 ordinary fish, and 53..58 Fish Kings.

Source: include/fishing_records.hh and src/fishing_records.cc.
Architecture: docs/FISHING_RECORDS.md and docs/SAVE_FORMAT.md.
All eight target bodies, complete block and isolated/production forced full-ROM
builds pass. Twelve symbol addresses, eight body sizes and input hashes pass.
Only those eight functions leave the regenerated inventory. Compiler unchanged.

The preceding four resource-owner methods (680 bytes) and map resolver
(652 bytes) remain complete. Do not repeat their integration.

## Next direction

Assess the adjacent persistent mine-floor initializer/layout around 0809CE8C,
using saved history and existing src/mine_floor.cc. The old map records
GameState+2E58..3480 (0x628 bytes). Existing mine-floor source contains private
incomplete types and legacy assembly-based reconstruction; do not copy those
techniques or change its ABI without exact proof. No new candidate exists yet.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Local ignored proofs are under tools/ches/checkpoints/fishing-records-2026-10-07/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
