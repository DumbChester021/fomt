# Menu text: encoded streams, font decoding and canvas copies

Menu text renders encoded input into a tile graphics buffer. The stream
walkers, shared font lookup/decoder, canvas copy and unaligned stubs are exact
source. Aligned rendering and fill helpers remain assembly with recovered behavior.

## Exact source boundaries

| Function | Retail range | Linked bytes |
| --- | --- | ---: |
| DrawMenuText / func_0804E8F0 | 0804E8F0..0804E958 | 104 |
| DrawStyledMenuText / func_0804E958 | 0804E958..0804E9C8 | 112 |
| DrawUnalignedMenuGlyph / func_0804E9C8 | 0804E9C8..0804E9CC | 4 |
| DrawUnalignedStyledMenuGlyph / func_0804E9CC | 0804E9CC..0804E9D0 | 4 |
| CopyMenuText / func_0804E9D0 | 0804E9D0..0804E9F4 | 36 |
| GetMenuDoubleByteGlyphIndex / func_080D0CD4 | 080D0CD4..080D0D28 | 84 |
| DecodeMenuGlyph / func_080D0D28 | 080D0D28..080D0EBC | 404 |

include/menu_text.hh and src/menu_text.cc retain the stream aliases in
.text.menu_text_streams. Bodies occupy 102/110 bytes plus two alignment
bytes each. src/menu_text_canvas.cc owns the complete 44-byte canvas section.
include/menu_font.hh and src/menu_font.cc own .text.menu_font_decode:
82-byte index body plus two alignment bytes, then 404-byte decoder/table.
The stream, canvas and font sections total 748 exact linked bytes.

## Canvas and glyph records

MenuTextSize is four bytes: u16 width and height, both tile counts, passed
as a value in the first argument register. Destination holds four-bit-per-pixel
tile graphics, 32 bytes per tile. x/y are unsigned pixel coordinates.
MenuGlyphTiles is a 128-byte output record: four tiles, eight u32 words each,
laid out top-left, top-right, bottom-left and bottom-right.
The stream's horizontal limit is width*8; vertical clipping belongs to the
renderer. The stream does not wrap or change y.

## Encoded-byte and glyph-return protocol

Each stream caches the current byte and initializes a u32 code to zero.
While the byte is nonzero and x is below the limit, it ORs the byte into
the code and invokes its glyph renderer.

| Renderer result | Stream behavior |
| --- | --- |
| 0 | Keep code and x |
| 1 | Clear code and advance x eight pixels |
| 2 | Clear code and advance x sixteen pixels |
| Other | Return immediately |

After results zero through two it advances the input pointer, caches the
next byte and shifts code left eight bits, assembling bytes in big-endian order.
NUL or reaching the horizontal limit ends the stream. No explicit newline
interpretation or line wrapping appears here.
The styled stream forwards color1/color2 unchanged.

## Font lookup and decoding

GetMenuDoubleByteGlyphIndex rejects codes outside 16 bits. The low byte must
be 0x40..0xFC; the high byte must be 0x81..0x9F or 0xE0..0xEA.
It subtracts 0x81 or 0xC1 from the high byte and 0x40 from the low byte,
then returns high*189 + low. The low-byte range includes 0x7F; table contents
determine whether an individual entry is valid.

DecodeMenuGlyph uses signed i16 lookup entries:
positive codes up to 0xFF use gUnk_084FA7A0 and return width one;
larger positive codes up to 0xFFFF use the double-byte index and
gUnk_08523290, returning width two. Negative indices indicate missing glyphs.
Ordinary invalid input clears 128 destination bytes when destination is nonnull,
then returns zero. An ordinary null destination performs the width lookup only.

Fifteen special codes bypass those tables:

| Codes | Twelve-byte glyph records |
| --- | --- |
| B4 / B6 / B7 | 08117B20 / 08117B2C / 08117B38 |
| B1 / B2 / B3 | 08117B44 / 08117B50 / 08117B5C |
| BB / BC / BD | 08117B68 / 08117B74 / 08117B80 |
| BE / BF / C0 | 08117B8C / 08117B98 / 08117BA4 |
| C1 / C2 / C3 | 08117BB0 / 08117BBC / 08117BC8 |

Special cases always invoke the one-tile expander and return one; they do
not use the ordinary null-destination guard. Single-byte glyph records begin
at 084F90CC with stride 12; double-byte records at 084FA9A0 with stride 24.
The fixed IWRAM expanders at 0300085C/03000714 remain assembly, as do
the font lookup tables and compressed glyph records. Their typed references
do not count as regenerated data/assets.

## Canvas copy and unaligned paths

CopyMenuText takes size, destination and a source word pointer.
It copies width*height*32 bytes through CpuFastSet, using the unsigned,
masked word-count computation. No fill flag is set.
The previously anonymous E9D0 routine is a copy, correcting the earlier clear label.

Both unaligned glyph functions return zero without writing pixels.
The surrounding assembly renderers ignore this return value and still return
the decoded glyph width. Preserve that retail behavior.

## Bounded assembly and remaining work

| Routine | Retail range | Bytes / state |
| --- | --- | --- |
| DrawMenuGlyph / func_0804E4AC | 0804E4AC..0804E5AC | 256, parked assembly |
| DrawStyledMenuGlyph / func_0804E5AC | 0804E5AC..0804E7A0 | 500, parked assembly |
| Canvas fill / func_0804E7A0 | 0804E7A0..0804E7DC | 60, parked assembly |
| Rectangle fill / func_0804E7DC | 0804E7DC..0804E8F0 | 276, parked assembly |

Renderer paths decode into four tiles, clip against canvas dimensions and
copy aligned tiles. Styled copying applies packed pixel/color arithmetic.
Their original tile/address/helper lifetimes remain unresolved.
The separate cache/row family around EFAC/F060/F0E0 uses the recovered
width and canvas contracts; constructor/caller proof is the next task.

## Verification

All source bodies and their complete sections match retail. Forced isolated
and production full-ROM comparisons pass with original/neighboring addresses
preserved and the compiler unchanged.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Research artifacts and closed probes belong to NEXT_AGENT_HANDOFF.md.
Related decimal/rectangle callbacks: [MENU_TILEMAP.md](MENU_TILEMAP.md).
