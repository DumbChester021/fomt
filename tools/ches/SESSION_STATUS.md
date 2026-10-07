# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Retail workspace: /mnt/data/Github/gba/fomt
Branch: main, tracking ches/main
Run `git log -1` for the published checkpoint and `git status` before
work. Preserve any intentional dirty state rather than resetting to an expected
hash. Custom-game was not modified.

## Exact production progress

- Code: 73,796 / 940,036 = 7.8503%
- Assembly remaining: 866,240 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,526 / 7,717,440 = 1.9375%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,316
- Inferred function bytes: 865,076 / 866,240 = 99.8656%
- Unattributed assembly: 1,164 bytes
- Parked functions: 17
- Runtime/library functions: 33

## Latest verified integration

The mine-floor save cluster now owns 240 exact source bytes:

- func_0809CE8C: 0xA8 / 0, persistent initializer
- func_0809D8A0: 0x04 / 0, layout getter
- func_0809D8A4: true body 0x12 / 0, width-like dimension helper
- func_0809D8B8: true body 0x1A / 0, height-like dimension helper
- func_0809D8D4: 0x14 / 0, tile-type getter
- complete D8A0..D8E8 linked block: 0x48 / 0 including alignment

The shared 0x628-byte type is now in include/mine_floor.hh. Initializer/legacy
generation source remains in src/mine_floor.cc; the four accessors are in
src/mine_floor_accessors.cc.

Important lesson: the first D8A4/D8B8 reports were 2 bytes short with zero
differing positions. Their source was already exact; the two bytes were normal
trailing alignment. This is now part of the project fast-path method.

Verification:

- CE8C still 0xA8 / 0 after shared-header extraction
- legacy CF34 still 0x234 / 0
- accessor block D8A0..D8E8: 0x48 / 0
- detached full-ROM compare: PASS
- production full-ROM compare: PASS
- ROM size: 8,388,608 bytes
- SHA1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963
- addresses D8A0/D8A4/D8B8/D8D4/D8E8 unchanged
- regenerated inventory removes exactly four more assembly functions

## Operating strategy

AGENTS.md and docs/DECOMP_PLAYBOOK.md now carry the successful Opus/Astra
fast-path pattern as the default model-agnostic workflow: trust the handoff,
reuse recovered structure, try one natural typed candidate, classify mismatches
before editing source, check body/alignment boundaries first, use linker seams,
prove the block, run isolated+production gates, refresh inventory/docs once,
publish, then move directly to the next bounded cluster.

## Exact next action

Stay in the same MineFloor cluster. Assess func_0809D8E8 and func_0809D9B4,
which consume the two proven six-bit MineTile content/state fields and feed the
mine-content handler. Reuse include/mine_floor.hh. Start with the smallest
natural typed source and compare immediately.

Do not reopen the whole save loader, CF34 refactoring, or parked compiler
families by inertia.

No build or compiler process is currently running.
