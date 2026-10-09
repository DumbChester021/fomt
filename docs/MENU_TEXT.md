# Menu text: encoded streams and glyph rendering

Menu text renders encoded input bytes into a tile graphics buffer.
The plain/styled stream walkers are exact source; their shared glyph backends
and decoder remain assembly with bounded interfaces.

## Exact source boundaries

| Function | Retail range | Linked bytes |
| --- | --- | ---: |
| DrawMenuText / func_0804E8F0 | 0804E8F0..0804E958 | 104 |
| DrawStyledMenuText / func_0804E958 | 0804E958..0804E9C8 | 112 |

include/menu_text.hh / src/menu_text.cc retain original symbols in
.text.menu_text_streams. Bodies occupy 102/110 bytes with two alignment bytes
each; the complete 216-byte block matches retail.

## Size and coordinates

MenuTextSize is a four-byte value: u16 width and height, both tile counts.
Its by-value ABI occupies the first argument register.
Destination points at four-bit-per-pixel tile graphics,32 bytes per tile.
x/y are unsigned pixel coordinates. The stream's horizontal limit is width*8;
vertical clipping belongs to the glyph backend. The stream does not wrap or change y.

## Encoded-byte and glyph-return protocol

The stream caches its current byte and initializes a u32 code to zero.
While the byte is nonzero and x is below the limit, it ORs that byte into
the code and invokes the glyph backend.

| Backend result | Stream behavior |
| --- | --- |
| 0 | Keep code and x |
| 1 | Clear code and advance x eight pixels |
| 2 | Clear code and advance x sixteen pixels |
| Other | Return immediately |

For results zero through two, it advances the input pointer, caches the
next byte and shifts code left eight bits. This assembles successive bytes
in big-endian order until a completed glyph consumes the code.
Input NUL or reaching the horizontal limit ends the stream. No explicit
newline interpretation or line wrapping appears in these routines.
The styled stream follows the same protocol and forwards color 1/color 2
unchanged. Their packed-pixel meanings remain a backend recovery task.

## Shared assembly boundaries

| Routine | Retail range | Bytes / state |
| --- | --- | --- |
| DrawMenuGlyph / func_0804E4AC | 0804E4AC..0804E5AC | 256, assembly |
| DrawStyledMenuGlyph / func_0804E5AC | 0804E5AC..0804E7A0 | 500, assembly |
| Adjacent helper / func_0804E7A0 | 0804E7A0..0804E7DC | 60, assembly |
| Unaligned copy stubs | 0804E9C8 and 0804E9CC | Return zero, assembly |
| Anonymous clear helper | 0804E9D0..0804E9F4 | 36, assembly |

Both backends use a128-byte four-tile glyph scratch buffer and decoder
func_080D0D28. Aligned copying operates on eight words per tile.
The styled path transforms packed pixel words using color arguments;
complete scratch-buffer, color and shadow ownership remains unreconstructed.
Intervening code after E7DC is not part of func_0804E7A0.
Preserve all separately bounded helpers during backend integration.

The256-/500-byte backends form the next coherent 756-byte recovery family;
MenuTextSize and the exact stream interfaces already constrain their ABI.

## Verification

Both bodies and the complete block match retail. Forced isolated and production
full-ROM comparisons pass with original/neighboring addresses preserved.
Compiler unchanged; ROM 8,388,608 bytes;
SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.
Research artifacts/reopening criteria belong to NEXT_AGENT_HANDOFF.md.
Related decimal/rectangle nodes: [MENU_TILEMAP.md](MENU_TILEMAP.md).
