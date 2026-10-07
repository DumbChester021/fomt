# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Current state only. Chronology belongs in Git and dated checkpoints.

### Repository and authority

- Retail branch **`main`**, tracking **`ches/main`**.
- Published production/research base **70a1d4bbb69120e1353b5946537e0fe7315fcf60**; latest exact source **45dfb3f06eb800a152e967daa3f1a2a0efd2a561** (`decompile logical map resource resolver`). This wrap changes documentation only; its commit is `git log -1`.
- ROM **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**. Existing ROM equality and unchanged build inputs rechecked for the wrap.
- Compiler unchanged: tracked installer/thirteen-rule patch; function matcher defaults to the tracked wrapper.
- Custom-game worktree at `60eacca`; original four dirty documentation files preserved.

### Exact production progress

- code **72,600 / 940,036 = 7.7231%**; assembly **867,436 bytes**
- data/assets **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM **148,330 / 7,717,440 = 1.9220%**
- free tail **671,168 bytes**
- linked assembly functions **2,333**; inferred ranges **866,272 / 867,436 = 99.8658%**; unattributed **1,164**
- generated parked **17**; runtime/library retained **33**
- shape clusters **184**, members **864**; exact normalized clusters **176**

The latest generated inventory removed only `func_0803A8A4`; all other
addresses/sizes and NPC class-map outputs are unchanged. Scratch results do not
change these metrics or generated statuses.

### Latest integrated source and verification

`GetMapResourceId` owns the 652-byte logical map resolver. Shared interface,
renderer caller and source/assembly/linker seam are exact; architecture is in
`docs/MAP_DATA.md`. Isolated fresh-install and production forced full-ROM
comparisons, whole-ROM equality, six symbol/input-hash checks and progress all
pass. The map-resolver checkpoint holds those proofs.

### Saved research frontier

The user requested a documentation wrap; experiments and integration are stopped.
Resource-owner production source, headers, compiler, assembly and linker inputs
remain unchanged. All launched comparison sessions finished.

Local ignored checkpoint `resource-owner-0803AB30-2026-10-07/` preserves four
target-exact methods: **AC78 96/0, ACD8 382/0, AE58 72/0, B0A8 128/0**.
Sibling update **B128 382/2** is not exact; V8's commuted addition is identical
to V7. Constructor **AB30 316/217 vs 328** is parked pending new structural
evidence; sibling constructor AEA0 has no new candidate proof.

All remain assembly. No final shared-header combined-source or new full-ROM
integration proof exists. Next extract/reprove the four exact methods with
unchanged production headers, then integrate through both full-ROM gates.
`NEXT_AGENT_HANDOFF.md` owns bounds, symbols, failures and ordered commands;
`docs/RESOURCE_OWNERS.md` owns recovered layouts. Checkpoint `results.json`
indexes 15 comparisons and artifact hashes. A fresh clone lacks ignored scratch
artifacts; the tracked handoff and architecture retain the current decisions.
