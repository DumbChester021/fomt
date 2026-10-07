# Current FoMT continuation - October 7, 2026

## Zero-context orientation

Workspace: /mnt/data/Github/gba/fomt
Retail branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty
state. No prior chat context is required.

Read in order:
1. AGENTS.md
2. /mnt/data/Ches/codex-bridge-home/skills/decompilation/SKILL.md
3. START_HERE.md
4. docs/DECOMP_PLAYBOOK.md, especially "Fast-path operating method"
5. docs/MINE_FLOOR.md
6. this handoff
7. named failure/experiment records only when reopening an old family

## Required execution style

Use the proven Opus/Astra fast path:
- trust the saved handoff;
- select one bounded coherent cluster;
- reuse recovered types/layouts/candidates;
- try one natural typed candidate quickly;
- classify the first divergence before source variants;
- check true body/alignment and section seams first;
- prove exact islands with isolated + production ROM gates;
- refresh inventory/docs once, publish, and move on;
- park compiler archaeology once understanding is complete.

Do not regress to broad rescans, repeated rereading, or syntax roulette.

## Current exact state

- Code: 73,872 / 940,036 = 7.8584%
- Assembly remaining: 866,164 bytes
- Linked assembly functions: 2,315
- Inferred ranges: 865,000 / 866,164 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,602 / 7,717,440 = 1.9385%
- Free tail: 671,168 bytes
- Retail ROM: 8,388,608 bytes
- SHA1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963

## Completed MineFloor work

Persistent object: GameState+0x2E58, size 0x628.
Shared type: include/mine_floor.hh
Stable architecture: docs/MINE_FLOOR.md

Exact source owns:
- CE8C initializer: 0xA8 / 0
- legacy CF34 remains exact after shared-header extraction: 0x234 / 0
- D8A0: 0x04 / 0
- D8A4 true body: 0x12 / 0
- D8B8 true body: 0x1A / 0
- D8D4: 0x14 / 0
- complete D8A0..D8E8 block: 0x48 / 0
- D9B4: 0x4C / 0

D9B4 source: src/mine_floor_content.cc.
D9B4 linker seam leaves D8E8 in assembly and resumes assembly at DA00.
Both isolated and production full-ROM compares pass after this seam.

## D8E8 parked result

D8E8 behavior is complete but source-shape exactness is parked.

Candidates:
- tools/ches/checkpoints/mine-floor-2026-10-07/content-consumers-v1.cc
  0xC0 vs 0xCC, 158 differing bytes
- content-consumers-v2.cc
  0xB8, 193 differences
- d8e8-v3.cc
  0xC2, 182 differences

Known behavior:
- only acts when tile type is 0;
- passes MineTile bits 10..15 to DA00;
- result 1 changes current tile type to 2, resets return to 0, and clears that
  six-bit field on every active tile where it equals 1;
- other results change current tile type to 1;
- the current tile's consumed six-bit field is cleared before return.

Do not reopen D8E8 syntax variants without new structural evidence.

## D9B4 matching lesson

The exact v4 source required:
- x*2 and y*56 as separate temporaries, then one offset sum;
- tile base represented as a shifted MineFloor base so retail accesses are +4;
- low-nibble type extraction expressed as the retail left/right shift pair.

The obvious array/bitfield source was semantically correct but gave 61 diffs.
The legacy base-plus-+4 addressing reduced it to 13, a u8 nibble view to 7, and
the final explicit offset/shift shape matched 0x4C / 0.

## Exact next action

Assess `func_0809DA00` as a separate mine-content-handler unit.

Why:
- it is the sole handler called by both D8E8 and D9B4;
- it owns the content-code switch and persistent mine-progress side effects;
- understanding it can name the two currently-neutral six-bit MineTile fields
  and the remaining progress flags without reopening the whole save loader.

Fast path:
1. inspect DA00 true bounds and its switch cases only;
2. map case groups to existing item/article/progress evidence;
3. reuse MineFloor and existing item/tool/date types;
4. decide whether DA00 is a coherent natural exact candidate or should be split;
5. if exact, use the same seam -> isolated ROM -> production ROM -> inventory/docs;
6. if compiler-sensitive after bounded work, save the best candidate and move on.

Do not reopen the whole loader, D8E8, CF34, AB30/B128, 39E98, 39F90, 3A180,
3A394 or the Ball mover without genuinely new structural evidence.
