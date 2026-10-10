# Menu glyph cache

The menu glyph cache stores three rotating rows of rendered glyph canvases.
Four operational cache methods plus the concrete destructor/base-interface lifetime
family are exact source. The row-rotation method remains assembly with behavior
recovered and a bounded compiler/source-shape mismatch.

## Proven layout

MenuGlyphCacheEntry is **0x10 bytes**:
- +0x00: 4x2-tile canvas pointer.
- +0x04: UnkHandle resource handle.
- +0x0C: dirty byte.

MenuGlyphCacheRow is seven entries, **0x70 bytes** total.

MenuGlyphCache fields currently proven:
- +0x00: vtable pointer.
- +0x04: context pointer.
- +0x08/+0x0C/+0x10: three SmartPtr<MenuGlyphCacheRow> values.
- +0x14: u16 column, range 0..27.
- +0x16: u16 row, range 0..2.
- +0x18: u8 first row.
- +0x19: u8 rows-dirty.
- +0x1A: u8 dirty.
- +0x1B: u8 has-text.

The 0x70 row size and seven-entry geometry are independently confirmed by
the retail destructor func_080E105C, which walks the entries backward in
0x10-byte steps.

## Exact source boundaries

| Function | Retail range | Linked bytes |
| --- | --- | ---: |
| DrawCacheGlyph / func_0804EFAC | 0804EFAC..0804F058 | 172 |
| ResetCacheColumn / func_0804F058 | 0804F058..0804F060 | 8 |
| ClearGlyphCache / func_0804F0E0 | 0804F0E0..0804F15C | 124 |
| GetCacheRowsDirty / func_0804F15C | 0804F15C..0804F160 | 4 |

Total exact source in this batch: **308 linked bytes**.

DrawCacheGlyph maps (row + first_row) into one of the three physical rows,
uses column >> 2 to select one of seven entries, and uses column & 3 as
the horizontal slot within that entry's four-column canvas. The entry draws
through DrawMenuGlyph with a 4x2 MenuTextSize.

Glyph widths 1 and 2 advance the 28-position cursor; wider/zero results fail.
Character codes 0x20 and 0x8140 do not set has_text. A successful draw sets
the cache dirty flag.

ClearGlyphCache clears all 21 canvases through FillMenuText, sets each
entry dirty when its handle is present, resets row/column, sets rows-dirty and
dirty, and clears has-text.

## Remaining row rotation

NextCacheRow / func_0804F060 is 128 bytes at 0804F060..0804F0E0 and remains
assembly. Its behavior is recovered:
- rows 0 and 1 increment directly;
- advancing from row 2 increments/wraps first_row modulo three;
- the recycled physical row is cleared across all seven entries;
- each entry's dirty byte reflects handle presence;
- rows-dirty and dirty are set.

The saved cache-family-v8.cc is exact-size with 12 differing linked bytes.
Nine bounded candidate generations reached the same compiler/source-shape
frontier. Do not resume spelling permutations without new compiler/lifetime
evidence.

## Lifetime and owner evidence

func_080E105C is now exact source via the compiler-generated implicit destructor in `src/menu_glyph_cache_lifetime.cc`. It:
- iterates row smart pointers at +8/+C/+10 in reverse;
- for each nonnull 0x70 row, walks seven 0x10-byte entries backward;
- releases each entry handle via func_08007C28 and the UnkHandle destructor;
- deletes each owned canvas and then the row allocation;
- restores vtable_unk_080E7908;
- conditionally deletes self according to the destructor in-charge bit.

This proves MenuGlyphCacheEntry.canvas is owning SmartPtr-like storage, not a non-owning raw allocation. The lifetime-only structural TU models that ownership while the operational production header remains minimal.

The neighboring E10E0..E1148 interface/default-virtual family is also exact source. vtable_unk_080E7908 is the recovered base-interface vtable; retail vtables themselves remain owned by `asm/vtables.s`.

func_0804F69C calls E105C on an embedded cache at containing-object +0xD0. func_0805039C, func_08050424, and func_08050478 call ClearGlyphCache on the same +0xD0 object, supporting the cache ownership/layout without naming the larger containing class.

## Verification

Proof root:
tools/ches/checkpoints/menu-glyph-cache-2026-10-10/

final-block-proof.json proves two exact linked blocks:
- EFAC..F060 = 180 bytes.
- F0E0..F160 = 128 bytes.

The isolated forced full-ROM comparison and the production
make -B -j4 compare both pass with fomt.gba: OK.
ROM size is 8,388,608 bytes and SHA1 is
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.

Related renderer/font contracts: MENU_TEXT.md.
The production compiler is unchanged.

## Exact implicit destructor

func_080E105C at 080E105C..080E10E0 is 132 exact linked bytes from the
compiler-generated implicit destructor in src/menu_glyph_cache_lifetime.cc.

An explicit destructor inserts a concrete derived-vtable store before member
teardown and becomes 0x90 bytes. The implicit destructor is 0x84 bytes and
matches retail exactly: it destroys three row smart pointers in reverse order,
each row destroys seven entries in reverse order, each entry destroys
UnkHandle before deleting its owned canvas, then the destructor restores
vtable_unk_080E7908 and conditionally deletes this from the in-charge flag.

Only the implicit destructor linkonce section is linked. Generated vtables and
default-method support stay excluded because retail vtables remain owned by
asm/vtables.s.

Proof:
tools/ches/checkpoints/menu-glyph-cache-2026-10-10/cache-dtor-v11-section-proof/proof.txt
reports retail 0x84, candidate 0x84, zero differing linked bytes.
The production forced full-ROM comparison also passes.
