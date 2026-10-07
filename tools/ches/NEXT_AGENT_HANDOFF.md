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

- Code: 74,256 / 940,036 = 7.8993%
- Assembly remaining: 865,780 bytes
- Linked assembly functions: 2,312
- Inferred ranges: 864,616 / 865,780 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,986 / 7,717,440 = 1.9435%
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
- complete D8A0..D8E8 accessor block: 0x48 / 0
- D9B4: 0x4C / 0
- DF2C: 0x80 / 0
- DFAC: 0x80 / 0
- E02C: 0x80 / 0
- complete DF2C..E0AC helper block: 0x180 / 0

Total mine-floor source-owned exact bytes from these integrated units: 700.

Sources:
- src/mine_floor.cc
- src/mine_floor_accessors.cc
- src/mine_floor_content.cc
- src/mine_floor_helpers.cc

The helper seam resumes assembly at E0AC.
Both isolated and production forced full-ROM compares pass.

## Newly recovered helper semantics

### DF2C
Maps content ids 4..9 to the six cursed tool ids:
5, 13, 21, 29, 37, 45. Returns true if the mapped cursed tool is already
present in either the player's Rucksack or ToolChest. The natural typed source
was 1 byte from exact only because TOOL_NONE made the comparison unsigned;
changing the local tool_id to signed int produced 0x80 / 0.

### DFAC
Counts the nine Goddess Jewel floor flags:
60, 102, 123, 152, 155, 171, 190, 202, 222.
Natural typed source matched 0x80 / 0 on the first candidate.

### E02C
Counts the nine Kappa Jewel floor flags:
0, 40, 60, 80, 120, 140, 160, 180, 255.
Natural typed source matched 0x80 / 0 on the first candidate.

## D8E8 parked result

Behavior is complete but source-shape exactness is parked.

Candidates:
- tools/ches/checkpoints/mine-floor-2026-10-07/content-consumers-v1.cc
  0xC0 vs 0xCC, 158 differing bytes
- content-consumers-v2.cc
  0xB8, 193 differences
- d8e8-v3.cc
  0xC2, 182 differences

Do not reopen D8E8 syntax variants without new structural evidence.

## DA00 parked result

True bounds: 0x0809DA00..0x0809DF2C = 0x52C bytes.

Behavior is mapped across its meaningful cases:
- 3: one-time mine/location progress flag
- 4..9: cursed-tool reward family
- 10: year/progress-gated reward
- 23: all-six cursed-tool completion gate
- 32: Goddess Jewel floor family
- 33: Kappa Jewel floor family
- 34: standalone progress flag

Saved candidates:
- da00-v1.cc: 0x534, 905 differing bytes
- da00-v2.cc: 0x534, 883 differing bytes

v2 tried the one high-leverage source-shape clue: keeping result/content in r8
and matching the first branch order. It helped only slightly. The remaining
mismatch begins at function entry/jump-table register allocation, so this is
now a compiler/source-shape frontier, not a semantic frontier.

Do not resume DA00 syntax variants without new structural/compiler evidence.

## Exact next action

Start at `func_0809E0AC` and assess the next small coherent adjacent mine-floor
helper cluster.

Fast path:
1. inspect E0AC true bounds and the next few neighboring helpers only;
2. reuse MineFloor and the now-proven Jewel/cursed-tool semantics;
3. try natural typed source for the smallest coherent batch;
4. compare true bodies/complete contiguous block;
5. if exact, seam -> detached full ROM -> production full ROM -> inventory/docs;
6. if compiler-sensitive after bounded work, save the candidate and move on.

Do not reopen the whole loader, DA00, D8E8, CF34, AB30/B128, 39E98, 39F90,
3A180, 3A394 or the Ball mover without genuinely new structural evidence.
