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
- Starting checkpoint for the mine-floor integration: **0d2ec08a9f52c397ccaee89fc3bfcb53caf6daed**.
- Custom gameplay stays in the separate custom-game worktree.
- ROM: **8,388,608 bytes**, SHA1 **a2fc3574f0a65a4fcf7682fb274b9d7eebdef963**.
- Full gate: make -B -j4 compare, ending in **fomt.gba: OK**.
- Compiler: tracked tools/install_agbcp.sh plus tools/agbcp_fomt_compat.patch; unchanged thirteen-rule wrapper at tools/agbcc/bin/agbcp.

## Handoff readiness

The latest verified checkpoint recovers 39 owned-polymorphic destructor entries, adding 1,560 linked source bytes. Production and isolated forced ROM comparisons passed on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **77,740 / 940,036 = 8.2699%**
- Assembly remaining: **862,296 bytes**
- Linked assembly functions: **2,204**
- Inferred ranges: **860,196 / 862,296 = 99.7565%**
- Unattributed assembly: **2,100 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **153,470 / 7,717,440 = 1.9886%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

The 39-function cleanup family is exact source in `src/owned_polymorphic_dtors.cc`, adding **1,560 linked bytes**. Each entry deletes one nullable owned polymorphic member at +4 or +8 and forwards the original object and incoming destructor mode to the scene or scene-request base. Every 38-byte body plus 2-byte alignment matches retail; both full-ROM builds pass. See [POLYMORPHIC_OWNERS.md](docs/POLYMORPHIC_OWNERS.md).

The DB3DC seam exposes 556 bytes of previously swallowed neighboring code at DB404..DB630. Those bytes remain assembly and now count as unattributed, so the inventory does not inflate source progress.

## Next direction

The +0x34D8 four-byte map-stamp mask and +0x34DC 24-byte actor state are already source-owned. The 20-member scene-change family remains bounded but nonmatching. Its simpler owned-member destructor ABI is now exact. Next audit the 25-member two-owned-member cleanup family beginning with func_080521BC, following NEXT_AGENT_HANDOFF.md. Keep C6BC and A1EA8 parked.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Local ignored proofs are under tools/ches/checkpoints/mine-floor-2026-10-07/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
