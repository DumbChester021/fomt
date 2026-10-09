#ifndef MENU_TILEMAP_HH
#define MENU_TILEMAP_HH

#include "prelude.h"

void FillSequentialTileRect(u16 * destination, u16 first_tile, u32 width,
                           u32 height, u16 palette, u32 stride)
    asm("func_0804E9F4") SECTION(".text.menu_tilemap_rectangle");

void DrawSingleTileNumber(u32 value, u16 * destination, u16 first_tile,
                          u16 palette, u32 stride) asm("func_0804EE30");
void DrawTallTileNumber(u32 value, u16 * destination, u16 first_tile,
                        u16 palette, u32 stride) asm("func_0804EDB4");
void DrawWideTileNumber(u32 value, u16 * destination, u16 first_tile,
                        u16 palette, u32 stride) asm("func_0804ED28");

#endif // MENU_TILEMAP_HH
