# Menu tilemaps: entry rectangles, prices and draw callbacks

Shop menus draw entry backgrounds and decimal prices into a u16 tilemap.
The rectangle helper and twelve callback-node methods are exact source.
Decimal primitives and signed integer formatting remain assembly with their
behavior recovered. Encoded glyph text is covered in [MENU_TEXT.md](MENU_TEXT.md).

## Boundaries

| Function | Retail range | Ownership |
| --- | --- | --- |
| FillSequentialTileRect / func_0804E9F4 | 0804E9F4..0804EA58 | 100 exact linked source bytes |
| Integer text formatter / func_0804EC84 | 0804EC84..0804ED28 | 164 linked assembly bytes |
| Wide decimal drawer / func_0804ED28 | 0804ED28..0804ED7C | 84-byte assembly body |
| InitWideNumberDrawNode | 0804ED7C..0804EDA0 | 36 exact source bytes |
| Decimal number drawer / func_0804EDB4 | 0804EDB4..0804EDF8 | 68-byte assembly body |
| InitTallNumberDrawNode | 0804EDF8..0804EE1C | 36 exact source bytes |
| Single decimal drawer / func_0804EE30 | 0804EE30..0804EE64 | 52 assembly bytes |

include/menu_tilemap.hh declares the rectangle and three decimal interfaces.
src/menu_tilemap.cc implements the rectangle with its original symbol:
98 body bytes plus two alignment bytes. ED7C/EDF8 are now separately
source-owned constructors; inferred primitive ranges are their true 84/68 bytes.

## Exact draw-node family

include/menu_draw_nodes.hh / src/menu_draw_nodes.cc own twelve methods,
360 linked bytes, retaining their original func_080xxxxx symbols.
Recovered storage views describe behavior without claiming original class names.

| Methods | Retail range | Bytes |
| --- | --- | ---: |
| Rectangle initializer/cleanup | 0804EA58..0804EA94 | 40 + 20 |
| Wide-number initializer/cleanup | 0804ED7C..0804EDB4 | 36 + 20 |
| Tall-number initializer/cleanup | 0804EDF8..0804EE30 | 36 + 20 |
| Single-number initializer/cleanup | 0804EE64..0804EE9C | 36 + 20 |
| Single draw callback | 0804EE9C..0804EEBC | 32 |
| Tall draw callback | 0804EEBC..0804EEDC | 32 |
| Wide draw callback | 0804EEDC..0804EEFC | 32 |
| Rectangle draw callback | 0804EEFC..0804EF20 | 36 |

Allocation callers prove both extents. Each record starts with the existing
12-byte IntrusiveCallbackNode: pprev+0, next+4 and vtable+8.

| Record | Offset | Field |
| --- | --- | --- |
| TileRectDrawNode, 0x20 bytes | +C | u16 destination pointer |
| Rectangle | +10 / +12 | u16 palette / first_tile |
| Rectangle | +14 / +18 / +1C | u32 width / height / row stride |
| NumberDrawNode, 0x1C bytes | +C / +10 | u32 value / u16 destination pointer |
| Decimal | +14 / +16 / +18 | u16 first_tile / palette, u32 row stride |

Initializers clear both list links, install the variant vtable and store
parameters. Cleanup installs the same vtable and forwards flags to
DestroyIntrusiveCallbackNode, which owns detachment and conditional deletion.
Callbacks invoke the matching primitive and return zero.

| Variant | Existing vtable | Run entry | Cleanup entry |
| --- | --- | --- | --- |
| Single, one tile per digit | 080E7838 | 0804EE9C | 0804EE88 |
| Tall, one-by-two tiles | 080E7848 | 0804EEBC | 0804EE1C |
| Wide, two-by-two tiles | 080E7858 | 0804EEDC | 0804EDA0 |
| Rectangle | 080E7868 | 0804EEFC | 0804EA80 |

Run is vtable+8 and cleanup+0xC. Stored table bases and Thumb slot pointers
remain unchanged readonly assembly data. No generated duplicate is emitted.
The single decimal primitive accepts the common stride argument but does not
use it; it emits first_tile+digit and moves left one element, including zero.

## Rectangle contract

Arguments are destination, first u16 tile value, unsigned width/height,
u16 palette and unsigned row stride measured in u16 elements.
Each store uses the current tile value OR palette << 12. The tile value
increments across columns and continues into the next row, wrapping as u16.
Rows begin one stride after the previous row start; they do not begin after
the last written column. Width or height zero produces no stores.
No tile-index mask, clipping or palette-range validation is performed.

## Decimal price contract

The assembly number drawer takes an unsigned value, destination, first digit
tile, palette and row stride. It extracts decimal digits with unsigned division
by ten and writes from right to left. A digit uses first_tile + digit * 2 in
the top row and the next tile in the lower row, with palette bits applied.
Zero emits one zero digit. There is no leading-zero field width or sign handling.

## Livestock menu use

Offer builder 85640 starts at row four and advances two rows per offer.
It fills a 12-by-2 rectangle at column two with first tile offer_id * 24 + 0xD0.
For offer IDs zero through six, it draws catalog unit_price at column 25,
using digit tile base 0xA0, then fills a 2-by-2 rectangle at column 26 from
tile 0x20. These calls use palette zero and a 32-element tilemap row stride.
See [LIVESTOCK_SHOP.md](LIVESTOCK_SHOP.md) for catalog and controller contracts.

## Verification and unresolved work

The rectangle and all twelve draw-node bodies match. Both forced isolated
and production full-ROM comparisons pass with the unchanged compiler.
All four vtables and original/neighboring addresses are preserved. ROM size is 8,388,608 bytes; SHA1 is
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963. Original and neighboring entry
addresses are retained. No compiler or shared pointer changes were needed.

The number drawer's entry scheduling and the offer builder's graphics-copy
and list-lifetime source contracts remain unresolved. Their candidates,
measured differences and reopening criteria belong to NEXT_AGENT_HANDOFF.md
and the ignored research ledgers.

## Signed integer text contract

The formatter takes a signed value, char destination and unsigned field width.
It extracts magnitude digits with signed division/modulus by ten into a reverse
stack buffer, stopping after at most ten digits. Zero emits one digit.
Width 0 uses the natural digit count. A smaller nonzero width keeps the
least-significant digits; a larger width adds spaces before the magnitude.
The minus sign is added after padding in the reverse buffer, so value -42,
width 4 produces "-  42". It reverses the selected characters into the caller's
destination and writes a terminating NUL.
The retail routine does not clamp width or special-case signed INT_MIN.

The 12-byte stack frame and output behavior are recovered, but the original
counter lifetime/type remains unresolved. The retail loop foot has two
increment/copy instructions that natural probes coalesce. Scalar counter
spellings have canonicalized; the function is parked and no source is promoted.

## Wide decimal tile contract

func_0804ED28 draws each unsigned digit into a 2x2 tile block, right to left.
For tile=first_tile+digit*4, destination points at the top-right tile:
top-left uses tile, top-right tile+1, bottom-left tile+2, bottom-right tile+3.
All four receive palette bits; the bottom row uses the supplied element stride.
Zero draws one digit and the destination moves left by two elements each time.
Its true 84-byte body ends at the exact source-owned wide initializer ED7C.

## Adjacent packed OAM factory

func_0804EA94 has a 208-byte body at 0804EA94..0804EB64, returning an eight-byte
packed record through a hidden result pointer. It starts with two zero words,
enables bit 12 and adds coordinates, tile, palette, priority, shape and size into
their bit fields. The parameter widths and bit 12 role still require caller
cross-checks before a typed source interface is promoted.
The inferred 496-byte range also contains the separate 288-byte routine at
0804EB64..0804EC84; those bytes are executable code and must be preserved.
The factory is parked after natural bitfield and word-helper candidates fail.
Shared font lookup/decoding and canvas copy are now exact; renderer/fill
methods are parked. Next assess the related cache/row family in [MENU_TEXT.md](MENU_TEXT.md).
