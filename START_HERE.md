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

The latest verified checkpoint is Scenes: extended constructors. `func_0809A4D4` (68 bytes), `func_08083A7C` (112 bytes), and `func_08088168` (68 bytes) are now exact source, adding 248 linked bytes. The forced production ROM comparison passes on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; never reset a dirty tree merely to match an expected hash. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **81,488 / 940,036 = 8.6686%**
- Assembly remaining: **858,548 bytes**
- Linked assembly functions: **2,132**
- Inferred ranges: **855,852 / 858,548 = 99.6860%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **157,158 / 7,717,440 = 2.0364%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: extended constructors adds **3 exact constructors / 248 linked bytes**. `9A4D4` extends the proven continuation/context/u8 family; `83A7C` naturally forwards a u8 plus four u32 values and stores the extended owner fields; `88168` naturally forwards one u32 and stores its owner state. The forced production ROM comparison passes and the original entry aliases/vtables are preserved. See [SCENES.md](docs/SCENES.md).

The shared scene lifetime layer now contains **71 source functions / 3,688 bytes**: 24 constructors, 25 destructors and 22 Run entries. Only constructor `92570` and complex Runs `83B2C`, `881EC`, and `92604` remain assembly.

## Next direction

Next: `func_08092604` (60 bytes), the smallest remaining complex scene Run. Reuse the proven explicit aggregate-return/result-storage technique around controller helper `func_0809152C`. Constructor `92570` is behavior-complete at exact size 0x54 but parked at a four-byte r0/r1 codegen frontier after bounded variants v3-v7.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs include `tools/ches/checkpoints/scene-large-constructors-2026-10-09/`, `tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/`, and `tools/ches/checkpoints/scene-constructors-2026-10-09/`.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
