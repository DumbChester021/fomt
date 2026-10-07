# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty state.

## Exact production progress

- Code: 74,256 / 940,036 = 7.8993%
- Assembly remaining: 865,780 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,986 / 7,717,440 = 1.9435%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,312
- Inferred function bytes: 864,616 / 865,780 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Parked functions: 17
- Runtime/library functions: 33

## Latest verified integration

The mine-floor cluster now owns 700 exact source bytes:

- func_0809CE8C: 0xA8 / 0, persistent initializer
- D8A0..D8E8 accessor block: 0x48 / 0
- func_0809D9B4: 0x4C / 0, MineTile bits 4..9 consumer
- func_0809DF2C: 0x80 / 0, cursed-tool ownership check
- func_0809DFAC: 0x80 / 0, Goddess Jewel counter
- func_0809E02C: 0x80 / 0, Kappa Jewel counter
- complete DF2C..E0AC helper block: 0x180 / 0

Shared layout: `include/mine_floor.hh`
Initializer/legacy generation source: `src/mine_floor.cc`
Accessors: `src/mine_floor_accessors.cc`
D9B4: `src/mine_floor_content.cc`
New helper block: `src/mine_floor_helpers.cc`
Stable architecture: `docs/MINE_FLOOR.md`

Both detached and production `make -B -j4 compare` pass after the helper seam.
ROM remains 8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

Inventory removes exactly DF2C, DFAC and E02C from assembly ownership:
2,315 -> 2,312 linked assembly functions, 866,164 -> 865,780 asm bytes.

## Parked D8E8 frontier

`func_0809D8E8` behavior is understood but exact source is parked after bounded
natural-source attempts. Do not resume syntax roulette without new structural
evidence.

Saved candidates:
- content-consumers-v1.cc: 0xC0 vs retail 0xCC, 158 differing bytes
- content-consumers-v2.cc: 0xB8, 193 differences
- d8e8-v3.cc: 0xC2, 182 differences

The function consumes MineTile bits 10..15, calls DA00, changes tile type,
clears the consumed field, and on one result clears every tile whose same field
equals 1. The remaining problem is source shape/register allocation, not behavior.

## Parked DA00 frontier

`func_0809DA00` true bounds are 0x0809DA00..0x0809DF2C = 0x52C bytes.
Its behavior/case families are mapped, but exact source is parked after the
bounded natural-candidate pass.

Saved candidates:
- da00-v1.cc: 0x534 vs retail 0x52C, 905 differing linked bytes
- da00-v2.cc: 0x534, 883 differing linked bytes after forcing the persistent
  result/content value toward r8 and matching the first branch direction

The mismatch begins immediately in register allocation and jump-table layout.
That makes the current blocker compiler/source shape, not missing semantics.
Do not reopen DA00 variants without new structural/compiler evidence.

Mapped DA00 families:
- content 3: one-time mine progress flag selected by Farmer ActorLocation map
- content 4..9: six cursed tools; require free tool slot, eligibility state and
  absence from both rucksack and tool chest
- content 10: year/progress-gated reward plus free tool slot
- content 23: cursed-tool completion gate across all six families
- content 32: nine Goddess Jewel mine floors plus shelf/free-slot constraints
- content 33: nine Kappa Jewel mine floors plus shelf/free-slot constraints
- content 34: one standalone persistent progress flag

Proof/candidate directory:
`tools/ches/checkpoints/mine-floor-2026-10-07/`

## Operating strategy

Keep using the Opus/Astra fast path in AGENTS.md and DECOMP_PLAYBOOK.md:
bounded cluster, reuse structure, one natural candidate, classify mismatch,
use linker seams, prove isolated+production ROM, refresh inventory/docs once,
publish, then move on. Park compiler archaeology once behavior is understood.

## Exact next action

Continue from `func_0809E0AC` forward as the next bounded mine-floor helper
cluster. Prefer the smallest coherent adjacent functions that consume the now
named/understood MineFloor layout. Reuse `include/mine_floor.hh` and
`src/mine_floor_helpers.cc`; test natural typed source before any compiler
experiments.

Do not reopen DA00, D8E8, the whole save loader, CF34, AB30/B128 or other
parked compiler-sensitive families by inertia.

No build or compiler process is currently running.
