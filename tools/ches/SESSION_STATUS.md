# FoMT Session Status

## Authoritative current snapshot - October 8, 2026

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main
Run `git log -1` and `git status` before work. Preserve intentional dirty state.

## Exact production progress

- Code: 74,428 / 940,036 = 7.9176%
- Assembly remaining: 865,608 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 150,158 / 7,717,440 = 1.9457%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,307
- Inferred function bytes: 864,064 / 865,608 = 99.8216%
- Unattributed assembly: 1,544 bytes
- Parked functions: 17
- Runtime/library functions: 33

The rise in unattributed assembly from 1,164 to 1,544 is intentional structural
progress, not regression: exact source boundaries exposed 380 bytes that were
previously hidden inside inferred neighboring function ranges.

## Latest verified integration

The mine-floor cluster now owns 872 exact linked source bytes:

- CE8C initializer: 0xA8 / 0
- D8A0..D8E8 accessor block: 0x48 / 0
- D9B4 content consumer: 0x4C / 0
- DF2C..E0AC helper block: 0x180 / 0
- E0AC tile-resource lookup: true body 0x6A / 0, linked span 0x6C with alignment
- E174..E1B4 progress-flag getter block: 0x40 / 0

Newest sources:
- src/mine_floor_tile_resource.cc
- src/mine_floor_progress_flags.cc

Shared layout remains include/mine_floor.hh.
Stable architecture is docs/MINE_FLOOR.md.

Both detached and production `make -B -j4 compare` pass. Retail ROM remains
8,388,608 bytes with SHA1
`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

## E0AC matching lesson

Inventory originally inferred E0AC through E174, but the real function returns
at E116 and has two alignment bytes through E118.

Natural typed switch:
- v1: 0x6A vs apparent 0x6C, 32 differences
- retail-style y*56+4 then x*2 + halfword load: 6 differences
- fixed y-offset r3: 4 differences
- existing-project-style empty register barrier after the subtraction:
  true body 0x6A / 0

The caller at 0x080A6AC8 passes the returned pointer to func_080AA540 while
rendering each mine tile. E0AC maps tile types 0..4 to resource records
086DC3C4, 086DC3D0, 086DC3DC, 086DC3E8 and 086DC3F4.

## Progress flag getters

E174/E184/E194/E1A4 matched on the first typed candidate. They expose persistent
MineFloor progress bits 0, 10, 11 and 12 respectively.

## Newly exposed unlabeled code

Exact boundary recovery exposed two real code islands that have no current
function symbols in the assembly source:

- 0x0809E118..0x0809E174 = 0x5C bytes
- 0x0809E1B4..0x0809E2D4 = 0x120 bytes

Together they are 380 bytes and exactly explain the inventory's new unattributed
assembly increase.

Do not merge these ranges back into E0AC or E1A4. Their code is preserved as raw
.byte sequences between the new linker seams.

## Parked frontiers

D8E8 remains behavior-complete but source-shape parked:
- v1 0xC0 / 158 differences
- v2 0xB8 / 193
- v3 0xC2 / 182

DA00 remains behavior-mapped but source-shape parked:
- v1 0x534 vs retail 0x52C / 905 differences
- v2 0x534 / 883 differences

Do not resume either family without new structural/compiler evidence.

## Operating strategy

Keep using the Opus/Astra fast path in AGENTS.md and DECOMP_PLAYBOOK.md:
bounded cluster, reuse structure, natural candidate first, classify boundaries
before syntax changes, exploit linker seams, run detached+production ROM gates,
refresh inventory/docs once, publish, then move on.

## Exact next action

Research the newly exposed unlabeled mine-floor code islands:

1. E118..E174 (0x5C) first, because it is small.
2. Determine real function boundary/callers/semantics from the raw Thumb code.
3. If coherent, give it a durable internal identity/candidate and try natural
   source immediately.
4. Then assess E1B4..E2D4 (0x120) the same way.
5. Do not let the absence of existing symbols force these bytes back into
   neighboring functions.

Do not reopen DA00, D8E8, the whole save loader, CF34, AB30/B128 or other parked
compiler-sensitive families by inertia.

No build or compiler process is currently running.
