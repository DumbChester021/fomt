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

The latest verified checkpoint is Scenes: cleanup and continuation transfer, recovering 47 functions and 2,360 linked source bytes. Production and isolated forced ROM comparisons passed on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **80,100 / 940,036 = 8.5210%**
- Assembly remaining: **859,936 bytes**
- Linked assembly functions: **2,157**
- Inferred ranges: **857,240 / 859,936 = 99.6865%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **155,830 / 7,717,440 = 2.0192%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: cleanup and continuation transfer is exact source in `include/scene_owners.hh` and `src/scene_owners.cc`, adding **47 functions / 2,360 linked bytes**. It recovers 25 natural destructors and 22 controller/continuation Run entries. Both forced full-ROM builds pass; original symbols and vtable slots are preserved. See [SCENES.md](docs/SCENES.md).

Six Run seams expose 596 bytes of unchanged unnamed neighboring code. Those bytes remain assembly and count as unattributed; only the true bodies count as source. The prior 39 single-owned-member destructors remain exact.

## Next direction

Next: Scenes, constructors and controller creation. Audit the 48-byte func_0807DD38 and its factory callers using the now-exact SceneOwner7DD68 ownership layout, following NEXT_AGENT_HANDOFF.md. Three complex Runs and the larger 20-member scene-change family remain assembly. Keep C6BC and A1EA8 parked.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs are under tools/ches/checkpoints/scene-owners-2026-10-09/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
