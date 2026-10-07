# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty state.

## Exact production progress

- Code: 73,872 / 940,036 = 7.8584%
- Assembly remaining: 866,164 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,602 / 7,717,440 = 1.9385%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,315
- Inferred function bytes: 865,000 / 866,164 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Parked functions: 17
- Runtime/library functions: 33

## Latest verified integration

The mine-floor cluster now owns 316 exact source bytes:

- func_0809CE8C: 0xA8 / 0, persistent initializer
- D8A0..D8E8 accessor block: 0x48 / 0
- func_0809D9B4: 0x4C / 0, consumes MineTile bits 4..9

Shared layout: `include/mine_floor.hh`
Initializer/legacy generation source: `src/mine_floor.cc`
Accessors: `src/mine_floor_accessors.cc`
D9B4: `src/mine_floor_content.cc`
Stable architecture: `docs/MINE_FLOOR.md`

D9B4 required two source-shape facts to match naturally:
1. compute x*2 and y*56 separately, then add them before the floor base;
2. extract the low tile-type nibble with the retail left/right shift pair.

Both detached and production `make -B -j4 compare` pass.
ROM size is 8,388,608 bytes and SHA1 remains
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.
Addresses remain D8E8=0809D8E8, D9B4=0809D9B4 and DA00=0809DA00.

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

Proof/candidate directory:
`tools/ches/checkpoints/mine-floor-2026-10-07/`

## Operating strategy

Keep using the Opus/Astra fast-path in AGENTS.md and DECOMP_PLAYBOOK.md:
bounded cluster, reuse structure, one natural candidate, classify mismatch,
use seams, prove isolated+production ROM, refresh docs/inventory once, publish,
then move on.

## Exact next action

Assess adjacent `func_0809DA00` as a separate high-leverage mine-content
handler. It is the sole callee used by both D8E8 and D9B4 and owns the content
codes that feed persistent mine progress. Start with semantics/case grouping and
existing saved evidence, then decide whether it is a natural exact source unit
or should be split/parked.

Do not reopen D8E8, the whole save loader, CF34, AB30/B128 or other parked
compiler-sensitive families by inertia.

No build or compiler process is currently running.
