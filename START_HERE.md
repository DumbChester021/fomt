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

The latest verified checkpoint recovers four GameState flag setters at 0x08010F24..0x08010F54. Fresh production and detached forced ROM comparisons passed on October 9, 2026, using the tracked compiler installer. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **76,180 / 940,036 = 8.1039%**
- Assembly remaining: **863,856 bytes**
- Linked assembly functions: **2,243**
- Inferred ranges: **862,312 / 863,856 = 99.8213%**
- Unattributed assembly: **1,544 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **151,910 / 7,717,440 = 1.9684%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

The four-function flag-setter quartet at `0x08010F24..0x08010F54` is now exact source in `src/game_state_flag_setters.cc`, adding **48 linked bytes**. The natural old-GCC source is simply `*state |= 1/2/4/8`, producing four 10-byte bodies plus 2-byte alignment. Production and detached forced ROM comparisons both pass.

## Next direction

The +0x34D8 four-byte map-stamp mask and +0x34DC 24-byte actor state are already source-owned. Continue with the repeated-small-function fast path from the ranked queue; keep C6BC parked.
A1EA8 is source-shape parked; follow the Opus/Astra bounded fast path.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Local ignored proofs are under tools/ches/checkpoints/mine-floor-2026-10-07/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
