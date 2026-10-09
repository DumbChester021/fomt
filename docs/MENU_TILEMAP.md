# Menu tilemaps: entry rectangles and prices

Shop menus draw entry backgrounds and decimal prices into a u16 tilemap.
The shared rectangle helper is exact source. The price-number drawer remains
assembly with its behavior understood.

## Boundaries

| Function | Retail range | Ownership |
| --- | --- | --- |
| FillSequentialTileRect / func_0804E9F4 | 0804E9F4..0804EA58 | 100 exact linked source bytes |
| Decimal number drawer / func_0804EDB4 | 0804EDB4..0804EDF8 | 68-byte assembly body |
| Anonymous successor | 0804EDF8..0804EE1C | Separate 36-byte assembly routine |

include/menu_tilemap.hh declares the rectangle interface; src/menu_tilemap.cc
implements it while retaining the original symbol. Its body occupies 98 bytes,
followed by two alignment bytes. The number drawer's inferred inventory span
also includes the anonymous successor; those extra bytes are executable code.

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

The first natural rectangle candidate, realistic section and both forced
full-ROM comparisons match. ROM size is 8,388,608 bytes; SHA1 is
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963. Original and neighboring entry
addresses are retained. No compiler or shared pointer changes were needed.

The number drawer's entry scheduling and the offer builder's graphics-copy
and list-lifetime source contracts remain unresolved. Their candidates,
measured differences and reopening criteria belong to NEXT_AGENT_HANDOFF.md
and the ignored research ledgers.
