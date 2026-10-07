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
persistent type, D8A0..D8D4 accessor block, and exact D9B4 content consumer. Run `git log -1` for the
published commit and `git status` before work; never reset a dirty tree merely
to match an expected hash. The full loader and complete GameState type remain
unfinished. No build or compiler command is pending.

For the proven techniques and recommended next approach, read
docs/DECOMP_PLAYBOOK.md, section "Recover persistent subobjects without blocking
on the whole loader". NEXT_AGENT_HANDOFF.md includes first commands, exact
next deliverable, closed paths and fresh-clone artifact limitations.

## Current exact reconstruction

- Code: **74,428 / 940,036 = 7.9176%**
- Assembly remaining: **865,608 bytes**
- Linked assembly functions: **2,307**
- Inferred ranges: **864,064 / 865,608 = 99.8216%**
- Unattributed assembly: **1,544 bytes**
- Generated parked functions: **17**
- Data/assets: **75,334 / 6,777,404 = 1.1115%**
- Overall meaningful ROM: **150,158 / 7,717,440 = 1.9457%**
- Contiguous free tail: **671,168 bytes = 655.44 KiB**

## Latest completed unit

The mine-floor save cluster now owns **872 exact linked source bytes**:
initializer `func_0809CE8C` (168), the D8A0..D8E8 accessor block (72),
D9B4 (76), DF2C..E0AC helpers (384), tile-resource lookup E0AC (0x6A body
plus 2 linked alignment bytes), and the E174..E1B4 progress-flag block (64).
The shared layout is in `include/mine_floor.hh`; the two newest source files
are `src/mine_floor_tile_resource.cc` and
`src/mine_floor_progress_flags.cc`.

Architecture: docs/MINE_FLOOR.md and docs/SAVE_FORMAT.md. E0AC is exact at its
true **0x6A / 0** body bound, and E174..E1B4 is **0x40 / 0**. Detached and
production full-ROM builds pass; ROM size/SHA1 remain retail-exact.

The preceding fishing-record block (276 linked bytes), four resource-owner
methods (680 bytes), and map resolver (652 bytes) remain complete. Do not
repeat their integration.

## Next direction

The two unlabeled mine-floor islands exposed by the E0AC/E1A4 boundary work
are now behavior-recovered and deliberately parked after bounded natural-source
attempts. E118..E174 is a 92-byte two-field histogram helper; E1B4..E2D4 is a
288-byte location-dependent mine table-copy helper. Neither has a direct BL or
ROM function-pointer reference, and both remain compiler/source-shape sensitive.

The adjacent persistent block at `GameState+0x3480` is now a proven typed
`CursedToolState`: 18 meaningful bytes plus 2 padding bytes, ending exactly
before the next initialized block at +0x3494. Continue with the bounded
`+0x3494..+0x34C4` persistent block, whose initializer already exposes three
0x10-stride records. DA00 and D8E8 remain parked source-shape/compiler frontiers.

The loader remains parked. Resource-owner constructors and B128 remain parked.
Local ignored proofs are under tools/ches/checkpoints/mine-floor-2026-10-07/.
The canonical handoff supplies the exact continuation and prior failure limits.

## Parked work and documentation

Do not reopen the loader, 3A180, 3A394, 39F90, 39E98, the Ball mover or other
parked entries without new structural evidence. Queue scores do not override
closed paths. The handoff owns exact next actions; SESSION_STATUS.md owns
verification state; dated checkpoints, ledgers and Git own chronology.
