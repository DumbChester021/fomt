# Current FoMT continuation - October 7, 2026

## Zero-context orientation

Workspace: /mnt/data/Github/gba/fomt
Retail branch: main, tracking ches/main
Run `git log -1` for the latest published checkpoint and `git status`
before work. This handoff belongs to the verified mine-floor initializer/accessor
checkpoint. Preserve any intentional dirty state rather than resetting to an
expected hash.

Read in order:

1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. START_HERE.md
4. docs/DECOMP_PLAYBOOK.md, especially "Fast-path operating method"
5. docs/MINE_FLOOR.md
6. this handoff
7. named failure/experiment records only when reopening an old family

No prior chat context is required.

## Required execution style

Use the proven Opus/Astra fast-path pattern now encoded in AGENTS/playbook:
trust saved facts, select one bounded coherent cluster, reuse existing types,
try one natural typed candidate quickly, classify first divergence before source
variants, check true body/alignment boundaries, use linker seams for exact
islands, prove the block, run isolated+production ROM gates, refresh inventory
and only changed docs once, publish, and move on.

Do not regress to broad rescanning, repeated rereading, syntax roulette, or
waiting for a difficult neighboring function when a clean section seam exists.

## Current exact state

- Code: 73,796 / 940,036 = 7.8503%
- Assembly remaining: 866,240 bytes
- Linked assembly functions: 2,316
- Inferred ranges: 865,076 / 866,240 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,526 / 7,717,440 = 1.9375%
- Free tail: 671,168 bytes
- Retail ROM: 8,388,608 bytes
- SHA1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963

## Completed MineFloor cluster

Persistent object: GameState+0x2E58, size 0x628.

Shared type: include/mine_floor.hh
Initializer/legacy source: src/mine_floor.cc
Accessor source: src/mine_floor_accessors.cc
Stable architecture: docs/MINE_FLOOR.md

Exact source now owns:

| Range/function | Result |
| --- | --- |
| CE8C initializer | 0xA8 / 0 |
| legacy CF34 after shared-header extraction | 0x234 / 0 |
| D8A0 | 0x04 / 0 |
| D8A4 true body | 0x12 / 0 |
| D8B8 true body | 0x1A / 0 |
| D8D4 | 0x14 / 0 |
| complete D8A0..D8E8 block | 0x48 / 0 |

D8A4 and D8B8 originally looked two bytes short only because the first compare
included trailing alignment. Mismatch positions were empty. Correct body bounds
matched immediately. Preserve this as a standard diagnostic rule.

The shared layout remains:

- +0x000 u32 layout/mode
- +0x004 28x28 two-byte MineTile array
- +0x624 32-bit progress word
- MineTile bits 0..3 type, 4..9 and 10..15 unresolved content/state fields
- progress bits 1..9 Kappa Jewel floors
- progress bits 13..21 Goddess Jewel floors
- bits 0/10/11/12 separate mine flags
- bits 22..31 preserved by initializer

Both detached and production make -B -j4 compare pass. Neighbor addresses and
retail SHA1/size remain exact. Inventory was regenerated after integration.

Ignored proof directory:
tools/ches/checkpoints/mine-floor-2026-10-07/

Detached proof worktree:
/tmp/fomt-mine-floor-integration

## Exact next action

Continue the MineFloor translation-unit cluster with func_0809D8E8 and
func_0809D9B4. These are the first consumers of the two six-bit MineTile fields
and both feed the mine-content path. Reuse include/mine_floor.hh and existing
consumer evidence.

Fast path:
1. inspect only D8E8/D9B4 and their immediate called content handler;
2. bound true bodies/padding;
3. write the obvious typed candidate using the 4/6/6 MineTile view;
4. compare immediately;
5. if a delta appears, classify boundary/layout/ABI/compiler before variants;
6. integrate exact islands with a section seam if needed;
7. block proof -> isolated ROM -> production ROM -> inventory/docs -> publish.

Do not reopen the whole save loader, CF34, resource-owner AB30/B128, 39E98,
39F90, 3A180, 3A394 or the Ball mover without new structural evidence.
