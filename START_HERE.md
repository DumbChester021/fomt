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

The latest verified checkpoint is Scenes: constructors and controller creation, recovering 18 functions and 876 linked source bytes. Production and isolated forced ROM comparisons passed on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **80,976 / 940,036 = 8.6141%**
- Assembly remaining: **859,060 bytes**
- Linked assembly functions: **2,139**
- Inferred ranges: **856,364 / 859,060 = 99.6862%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **156,706 / 7,717,440 = 2.0305%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: constructors and controller creation adds **18 natural constructors / 876 linked bytes** in `include/scene_owners.hh` and `src/scene_owners.cc`. They allocate their controllers and move the incoming continuation into the scene. Both expanded forced full-ROM builds pass; symbols and existing vtable slots are preserved. See [SCENES.md](docs/SCENES.md).

The shared scene lifetime layer now contains **65 source functions / 3,236 bytes**, including the prior 25 destructors and 22 Run entries. Controller logic, seven constructors and three complex Runs remain assembly.

## Next direction

Next: Scenes, constructors with additional inputs. Audit the 68-byte func_08057DD8, its DB96C factory and controller 522F8, then try the proven natural initializer shape with its extra unsigned byte parameter. NEXT_AGENT_HANDOFF.md owns the exact continuation. Keep C6BC and A1EA8 parked.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs are under tools/ches/checkpoints/scene-constructors-2026-10-09/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
