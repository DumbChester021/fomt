# FoMT Compiler Fingerprint

This is the compact current reference for the FoMT retail compatibility compiler. Use docs/FOMT_COMPILER_RESEARCH.md for the full experiment history and provenance.

## Current authority

- Base: notyourav/agbcc, pinned commit 1caa6becde5e4676b59c31c74d68f45ced79557c.
- Installer: tools/install_agbcp.sh.
- Patch: tools/agbcp_fomt_compat.patch.
- Patch SHA256: aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256.
- Patched compiler files: g++/calls.c, combine.c, cse.c, flow.c, global.c, local-alloc.c, toplev.c.
- The normal agbcp wrapper enables all 13 reconstructed behaviors below.
- These behaviors are a validated FoMT compatibility reconstruction. They are not proof that this is the original Nintendo compiler source.

Current retail state: 88,924 / 940,036 source code bytes = 9.4596%; 851,112 assembly bytes and 1,983 linked assembly functions remain. Full make -B -j4 compare passes fomt.gba: OK at retail SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.

## The 13 adopted behaviors

| Switch | Compiler area | Reconstructed behavior |
| --- | --- | --- |
| AGBCC_PRESERVE_USERVAR_COPIES | cse.c + combine.c | Preserve specific source user-variable copy chains instead of canonicalizing them away before later allocation. |
| AGBCC_RESTORE_COMBINE_COPY_REFS | combine.c | Restore weighted reference information from eliminated user-variable copies when the copy fed a later self-dependent value. |
| AGBCC_PRESERVE_LITERAL_POOL_COPY | cse.c | Preserve a user-variable copy fed from literal-pool MEM/SYMBOL_REF. |
| AGBCC_CSE_HOIST_LITERAL_AFTER_BITFIELD_LOAD | cse.c | Keep an independent literal-address load beside the halfword load feeding a shift-pair bitfield extraction. |
| AGBCC_NO_CONST_STEP_SELF_MOD_SET_LIVE | flow.c | Suppress the extra modified-SET live-length unit for reg = reg + constant when there is no REG_INC note. |
| AGBCC_EXTEND_CALL_RESULT_LIFETIME | local-alloc.c | Extend a structurally identified call-result copy interval so it conflicts with the same neighbor as retail. |
| AGBCC_PRESERVE_INTEGRATED_RETURN_BRIDGE | cse.c + combine.c | Preserve an integrated return-value bridge copy that otherwise disappears before allocation. |
| AGBCC_DELAY_CONST_INDIRECT_CALL_ADDRESS | calls.c | Delay a constant indirect call address until after register-argument loads. |
| AGBCC_DELAY_MULTI_INDIRECT_CALL_ADDRESS | calls.c | Delay matching inline multi-argument non-symbol/non-constant indirect call addresses until after register-argument loads. |
| AGBCC_HOIST_ZERO_AFTER_DEAD_COPY | toplev.c | Preserve observed ordering of an independent zero initialization relative to a deferred pointer user-variable copy after dead-code cleanup. |
| AGBCC_PRESERVE_INTEGRATED_NARROW_ZERO | cse.c | Preserve a QI zero view whose SImode quantity is a multi-set source variable inside integrated code. |
| AGBCC_PREFER_POINTER_ALLOC_TIE | global.c | After normal priorities are equal, prefer the pseudo carrying pointer metadata. |
| AGBCC_THREAD_JUMPS_AFTER_RELOAD | toplev.c | Re-run the existing thread_jumps pass after reload when intervening copies have disappeared. |

None of the adopted rules is keyed to a FoMT function name, ROM address, symbol, pseudo number, instruction UID, or requested hard register.

## How to compare a newly found compiler

Compare implementation, not version banners. Check these areas first:

1. calls.c: indirect call-address preparation relative to register-argument loads.
2. combine.c: eliminated user-variable copy accounting and integrated return bridges.
3. cse.c: user-variable and literal copies, narrow zero quantities, and literal-load scheduling around bitfield extraction.
4. flow.c: reference/live-length accounting for modified SET destinations.
5. global.c: allocation priority and tie ordering, especially pointer metadata.
6. local-alloc.c: birth/death treatment of call-result copies.
7. toplev.c: post-reload pass order, second jump threading, and post-CSE cleanup order.

Then compile the saved natural-source hard targets and compare linked bytes. A matching version string is not enough.

## Historical compiler fingerprint

- GCC 2.96 20000731 was rebuilt and rejected because it regresses exact FoMT C++ and collapses the water target.
- EGCS 1.1.2 has relevant modified-SET/ref/live ancestry, but its older liveness infrastructure does not reproduce the hard targets.
- GCC 2.7.2.3 already contains the basic weighted-reference, modified-SET and allocator-priority ideas, so simply using an older stock GCC does not explain FoMT.
- A coherent May-2000 arm-000512 C++ compiler and the exact October-3-2003 Nintendo/Cygnus THUMB compiler are codegen-equivalent on the hard candidates tested.
- The examined 2002 source-patch archive has byte-identical relevant compiler files to the May-2000 source family.

A newly discovered compiler becomes interesting if one of the seven implementation areas above differs in a way that naturally reproduces our remaining source-shape debt.

## Production source-coercion audit, October 10, 2026

Audit rule: if removing a matching coercion remains byte-exact under the tracked compiler, remove it. If natural source changes linked bytes, keep the exact source temporarily and classify it as compiler/source-shape debt. Never move target-specific forcing from C++ into the compiler.

### Removed as obsolete

| Target | Removed coercion | Natural result |
| --- | --- | --- |
| func_0809C3E0 | result forced to r5 | 0x40 / 0 differences |
| func_0809C600 | seven locals forced to r0/r1/r2/r3/r4 | 0x44 / 0 differences |

Both changes are now in production source. A forced full-ROM rebuild still passes fomt.gba: OK.

### Still required under the current compiler

| Target or area | Naturalized result | Debt |
| --- | --- | --- |
| ToolChest::GetLastFreeSlot | 0x42 vs retail 0x44, 10 differences | reverse-iterator dummy locals still matter |
| Fridge::GetLastFreeSlot | 0x46 vs retail 0x48, 10 differences | same |
| Shelf::GetLastFreeSlot | 0x42 vs retail 0x44, 10 differences | same |
| Rucksack::GetLastFreeItemSlot | 0x4A vs retail 0x4C, 10 differences | reverse-iterator dummy locals still matter |
| Rucksack::GetLastFreeToolSlot | exact 0x4C size, 8 differences | same reverse-iterator source-shape debt |
| func_0809E0AC | exact 0x6A size, 4 differences | forced r3 and empty barrier still bridge a compiler/source gap |
| func_080A46AC | 0x88 vs retail 0x94, 137 differences | fake volatile zero still affects lifetime/identity |
| func_080A4740 | 0x64 vs retail 0x74, 104 differences | same zero-identity debt |
| GetCharacterBirthday | 0x1C4 vs retail 0x1BC, 263 differences | fixed-register lifetime shape still matters |
| GetCharacterNpc | exact 0x1C8 size, 68 differences | fixed-register switch/address shape still matters |
| func_080A03A4 | exact 0x14 size, 7 differences | register homes/barrier still matter |
| func_080A06B0 | exact 0x1C8 size, 68 differences | social/NPC resolver register-shape debt |
| FarmerEntity::ClassifyHeldItemAction | exact 0x2A4 size, 10 differences | fixed-register source still matters |
| WriteSaveSlotRecord | exact 0xA0 size, 153 differences | save-writer register homes still matter |
| func_0809C510 | exact 0xA4 size, 8 differences | data/x/y register homes still matter |
| func_0809C644 | 0x4E vs retail 0x50, 2 differences | part of fixed-register/barrier shape still matters |

Scratch proof is under tools/ches/checkpoints/source-hygiene-audit-2026-10-10/.

## Reviewed categories that are not automatically hacks

- src/raw_abi_thunks.cc uses ordinary C++ wrappers for observed ABI/name seams. It has no fixed-register or inline-asm coercion.
- src/owned_polymorphic_dtors.cc uses explicit ABI destructor boundaries, not hard-register forcing. All 39 entries remain exact. E105C gives new reason to retest one representative with an implicit-destructor/member-ownership model later, but not enough evidence to rewrite the family now.
- Hardware/audio volatile accesses are MMIO semantics.
- asm symbol names and SECTION attributes usually encode recovered symbol/section ownership and need linker-semantic review, not blanket removal.
- src/mine_floor.cc remains known legacy source-shape debt with extensive fixed registers and inline assembly. docs/MINE_FLOOR.md already warns not to copy that style into new work.

Repeat this audit whenever the compiler reconstruction changes. The still-required table is the first cleanup queue after any compiler improvement.
