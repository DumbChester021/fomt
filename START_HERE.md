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

The latest verified checkpoint is Scenes: complex Run `func_08083B2C`. Its 168-byte body is now exact source with the original 24-byte stack frame and branch-local ownership-transfer cleanup preserved. The forced production ROM comparison passes on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **81,656 / 940,036 = 8.6865%**
- Assembly remaining: **858,380 bytes**
- Linked assembly functions: **2,131**
- Inferred ranges: **855,684 / 858,380 = 99.6859%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **157,386 / 7,717,440 = 2.0394%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: complex Run `83B2C` adds **1 exact Run / 168 linked bytes**. The decisive match came from preserving branch-local owner destruction before one common final return, rather than returning directly from each allocating branch. The forced production ROM comparison passes and the original entry/vtable binding is preserved. See [SCENES.md](docs/SCENES.md).

The shared scene lifetime layer now contains **73 source functions / 3,916 bytes**: 24 constructors, 25 destructors and 24 Run entries. Only constructor `92570` and complex Run `881EC` remain assembly.

## Next direction

Next: `func_080881EC`, the only remaining complex scene Run. Audit its controller status branches, 16-/20-byte request layouts, context +0x10 use, extra state, and ownership-transfer stack slots before writing source. Reuse the proven branch-local ownership pattern from `83B2C`. Constructor `92570` remains parked at its exact-size 0x54 / four-byte r0-r1 codegen frontier.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs include `tools/ches/checkpoints/scene-large-constructors-2026-10-09/`, `tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/`, and `tools/ches/checkpoints/scene-constructors-2026-10-09/`.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
