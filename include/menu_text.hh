#ifndef MENU_TEXT_HH
#define MENU_TEXT_HH

#include "menu_font.hh"

struct MenuTextSize
{
    u16 width;
    u16 height;
};

u32 DrawMenuGlyph(MenuTextSize, u8 *, u32, u32, u32) asm("func_0804E4AC");
u32 DrawStyledMenuGlyph(MenuTextSize, u8 *, u32, u32, u32, u32, u32)
    asm("func_0804E5AC");

void DrawMenuText(MenuTextSize, u8 *, u32, u32, u8 const *)
    asm("func_0804E8F0") SECTION(".text.menu_text_streams");
void DrawStyledMenuText(MenuTextSize, u8 *, u32, u32, u8 const *, u32, u32)
    asm("func_0804E958") SECTION(".text.menu_text_streams");

u32 DrawUnalignedMenuGlyph(MenuTextSize, u8 *, u32, u32, MenuGlyphTiles const *)
    asm("func_0804E9C8") SECTION(".text.menu_text_canvas");
u32 DrawUnalignedStyledMenuGlyph(MenuTextSize, u8 *, u32, u32,
                               MenuGlyphTiles const *, u32, u32)
    asm("func_0804E9CC") SECTION(".text.menu_text_canvas");
void CopyMenuText(MenuTextSize, u8 *, u32 const *)
    asm("func_0804E9D0") SECTION(".text.menu_text_canvas");

#endif // MENU_TEXT_HH
