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

The latest verified checkpoint is Scenes: constructors with additional inputs. Three natural 68-byte constructors, `func_08057DD8`, `func_0805CEB8` and `func_08069E14`, add 204 exact linked source bytes using a proven extra `u8` controller input. The forced production ROM comparison passes on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **81,180 / 940,036 = 8.6358%**
- Assembly remaining: **858,856 bytes**
- Linked assembly functions: **2,136**
- Inferred ranges: **856,160 / 858,856 = 99.6861%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **156,910 / 7,717,440 = 2.0332%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: constructors with additional inputs adds **3 natural constructors / 204 linked bytes** in `include/scene_owners.hh` and `src/scene_owners.cc`. Each takes the existing continuation/context pair plus a proven `u8` forwarded to its original controller constructor. The forced production ROM comparison passes; original symbols and vtable slots remain preserved. See [SCENES.md](docs/SCENES.md).

The shared scene lifetime layer now contains **68 source functions / 3,440 bytes**: 21 constructors, 25 destructors and 22 Run entries. Controller logic, four constructors and three complex Runs remain assembly.

## Next direction

Next: audit `func_0809A4D4` separately. It is the remaining ordinary-looking scene constructor that was deliberately not grouped with the recovered extra-`u8` trio. Establish its caller/controller inputs and natural source shape before claiming family membership. NEXT_AGENT_HANDOFF.md owns the exact continuation. Keep C6BC and A1EA8 parked.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs are under `tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/` and `tools/ches/checkpoints/scene-constructors-2026-10-09/`.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
