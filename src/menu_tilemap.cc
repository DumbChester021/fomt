#include "menu_tilemap.hh"

void FillSequentialTileRect(u16 * destination, u16 first_tile, u32 width,
                           u32 height, u16 palette, u32 stride)
{
    u16 * row = destination;
    for (u32 y = 0; y < height; ++y) {
        for (u32 x = 0; x < width; ++x) {
            *destination++ = first_tile++ | (palette << 12);
        }
        row += stride;
        destination = row;
    }
}
