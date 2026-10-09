#include "menu_text.hh"

void DrawMenuText(MenuTextSize size, u8 * destination, u32 x, u32 y, u8 const * text)
{
    u32 end = size.width * 8;
    u32 code = 0;
    u32 character = *text;
    while (character != 0 && x < end)
    {
        code |= character;
        switch (DrawMenuGlyph(size, destination, x, y, code))
        {
        case 0:
            break;
        case 1:
            code = 0;
            x += 8;
            break;
        case 2:
            code = 0;
            x += 16;
            break;
        default:
            return;
        }
        ++text;
        character = *text;
        code <<= 8;
    }
}

void DrawStyledMenuText(MenuTextSize size, u8 * destination, u32 x, u32 y,
                        u8 const * text, u32 color1, u32 color2)
{
    u32 end = size.width * 8;
    u32 code = 0;
    u32 character = *text;
    while (character != 0 && x < end)
    {
        code |= character;
        switch (DrawStyledMenuGlyph(size, destination, x, y, code, color1, color2))
        {
        case 0:
            break;
        case 1:
            code = 0;
            x += 8;
            break;
        case 2:
            code = 0;
            x += 16;
            break;
        default:
            return;
        }
        ++text;
        character = *text;
        code <<= 8;
    }
}
