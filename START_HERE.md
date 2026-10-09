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

The latest verified checkpoint is Scenes: complex Run `func_080881EC`. Its complete 192-byte span is now exact source with the 20-byte frame and nested ownership transfers preserved. Fresh isolated and forced production full-ROM comparisons pass on October 9, 2026, using the unchanged tracked compiler. Run `git log -1` and `git status` before work; preserve intentional dirty files. The full loader and complete GameState type remain unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read the "Fast-path operating method" in docs/DECOMP_PLAYBOOK.md. NEXT_AGENT_HANDOFF.md includes first commands, exact next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **81,848 / 940,036 = 8.7069%**
- Assembly remaining: **858,188 bytes**
- Linked assembly functions: **2,130**
- Inferred ranges: **855,492 / 858,188 = 99.6858%**
- Unattributed assembly: **2,696 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **157,578 / 7,717,440 = 2.0418%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

Scenes: complex Run `881EC` adds **1 exact Run / 192 linked bytes**. The local move-copy/return-storage view preserves the inner clear and transfers the outer pointer directly through its proxy. Scratch, production-shaped and full-TU proofs, fresh isolated and forced production ROM comparisons all pass. See [SCENES.md](docs/SCENES.md).

The scene lifetime layer contains **74 source functions / 4,108 bytes**:
24 constructors, 25 destructors and all 25 Run entries. Only constructor
`92570` remains assembly; controller implementations remain incomplete.

## Next direction

Next: the bounded controller result/scaling helpers `func_08085EC4` and
`func_08085EEC`. Reuse the exact 881EC caller contract and audit the controller
+0x43D8 writers before naming its result field. The large 86A08 controller Run
is a separate task. Constructor `92570` stays parked at 0x54 / four r0/r1 bytes.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Current ignored proofs include `tools/ches/checkpoints/scene-large-constructors-2026-10-09/`, `tools/ches/checkpoints/scene-extra-input-constructors-2026-10-09/`, and `tools/ches/checkpoints/scene-constructors-2026-10-09/`.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
