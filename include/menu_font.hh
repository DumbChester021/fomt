#ifndef MENU_FONT_HH
#define MENU_FONT_HH

#include "prelude.h"

struct MenuGlyphTiles
{
    u32 tiles[4][8];
};

i32 GetMenuDoubleByteGlyphIndex(i32) asm("func_080D0CD4")
    SECTION(".text.menu_font_decode");
u32 DecodeMenuGlyph(MenuGlyphTiles *, i32) asm("func_080D0D28")
    SECTION(".text.menu_font_decode");

#endif // MENU_FONT_HH
