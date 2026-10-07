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

The latest verified checkpoint includes the mine-floor initializer, shared
persistent type, and D8A0..D8D4 accessor block. Run `git log -1` for the
published commit and `git status` before work; never reset a dirty tree merely
to match an expected hash. The full loader and complete GameState type remain
unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read
docs/DECOMP_PLAYBOOK.md, section "Recover persistent subobjects without blocking
on the whole loader". NEXT_AGENT_HANDOFF.md includes first commands, exact
next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **73,796 / 940,036 = 7.8503%**
- Assembly remaining: **866,240 bytes**
- Linked assembly functions: **2,316**
- Inferred ranges: **865,076 / 866,240 = 99.8656%**
- Unattributed assembly: **1,164 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **149,526 / 7,717,440 = 1.9375%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

The mine-floor save cluster now owns **240 exact source bytes**: initializer
`func_0809CE8C` (168 bytes) plus accessors `D8A0/D8A4/D8B8/D8D4`
(72-byte linked block including alignment). The shared layout is now in
`include/mine_floor.hh`; accessors are in `src/mine_floor_accessors.cc`.

Architecture: docs/MINE_FLOOR.md and docs/SAVE_FORMAT.md. CE8C remains
0xA8 / 0, legacy CF34 remains 0x234 / 0 after the shared-header extraction,
and the full D8A0..D8E8 accessor block is 0x48 / 0. Isolated and production
full-ROM builds pass; ROM size/SHA1 and neighbor addresses remain retail-exact.
The regenerated inventory removes exactly CE8C plus the four accessors from
assembly ownership.

The preceding fishing-record block (276 linked bytes), four resource-owner
methods (680 bytes), and map resolver (652 bytes) remain complete. Do not
repeat their integration.

## Next direction

Continue the same mine-floor translation-unit cluster with
`func_0809D8E8` and `func_0809D9B4`, which consume the two proven six-bit
MineTile content/state fields. Use their shared structure/calls into the mine
content handler as the next bounded typed cluster. Do not reopen the legacy
loader or refactor CF34 merely by association.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Local ignored proofs are under tools/ches/checkpoints/mine-floor-2026-10-07/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
