# Owned polymorphic destructor entries

The 39-entry family is exact source in `src/owned_polymorphic_dtors.cc`. It recovers **1,560 linked retail bytes** across existing code islands without changing gameplay or the compiler.

## Observed behavior and ABI

Every entry deletes one nullable owned polymorphic object through virtual destructor slot +8, using mode 3. It then calls the already reconstructed base destructor with the original owner pointer and its incoming mode. Keeping the incoming mode preserves conditional owner deallocation.

| Members | Owned pointer offset | Base destructor |
| ---: | ---: | --- |
| 33 | +4 | `func_0800080C`, scene-request interface |
| 3 | +8 | `func_0800080C`, scene-request interface |
| 3 | +4 | `func_080007EC`, scene interface |

The +8 entries are DB2EC, DC21C and DC474. The scene-base entries are DC404, E41E8 and E4210. The source lists every original symbol explicitly.

`PolymorphicOwner4` and `PolymorphicOwner8` describe only the used prefixes. `OwnedPolymorphicObject` describes the observed virtual-deletion interface; concrete owned types and complete owner layouts remain unresolved. These views do not assert shared runtime inheritance between the concrete classes.

The explicit two-argument assembler-bound base calls preserve the observed destructor entry ABI. A speculative natural derived destructor emitted an extra derived-vtable store absent from this family. No forced registers, inline assembly barriers, compiler changes or generated vtable data are needed.

## True boundaries

Every function has 38 instruction bytes plus two existing alignment bytes. DB3DC ends at DB404. Its inferred inventory range previously continued through DB630, swallowing 556 bytes of unnamed neighboring code. Those bytes remain identical assembly after the new seam and count as unattributed; they are not claimed as decompiled.

The matcher’s `--symbol` option slices ELF symbol size, which omits the alignment. The local batch proof separately compares each correctly linked 40-byte span, including alignment, against retail.

## Verification

- All 39 aligned 40-byte ranges: zero differing bytes.
- Isolated `make -B -j4 compare`: PASS with the previously freshly installed tracked compiler.
- Production `make -B -j4 compare progress`: PASS.
- All 39 original symbol addresses retained, each with a 38-byte symbol body.
- Reversing only the 39 bounded assembly replacements reproduces the original assembly file exactly.
- Inventory removes exactly these 39 functions; every other function address/status remains unchanged.
- ROM: 8,388,608 bytes, SHA1 `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

Local ignored proofs, manifest, candidate, full build logs and verification summaries are under `tools/ches/checkpoints/scene-change-2026-10-09/owned-dtors/`. The isolated worktree is `/mnt/waydroid-hdd/home-chester-waydroid/fomt-integrations/flag-setters-20261009`; it contains the verified flag-setter and new destructor integration inputs on its detached baseline.

## Adjacent work

The larger scene-change constructor/transfer family remains bounded but nonmatching. Its related DC1A0 cleanup entry is now source-owned.

The next 25-member two-owned-member cleanup family begins with `func_080521BC`. It writes a derived vtable, deletes the object at +8 through a +0-vtable interface, then deletes the object at +4 through that object's +4 vtable, and forwards mode to scene base 007EC. Audit its concrete prefixes and factories before batching. NEXT_AGENT_HANDOFF.md owns the exact continuation.
