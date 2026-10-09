#include "menu_font.hh"
#include <string.h>

EC u8 const gUnk_08117B20[], gUnk_08117B2C[], gUnk_08117B38[];
EC u8 const gUnk_08117B44[], gUnk_08117B50[], gUnk_08117B5C[];
EC u8 const gUnk_08117B68[], gUnk_08117B74[], gUnk_08117B80[];
EC u8 const gUnk_08117B8C[], gUnk_08117B98[], gUnk_08117BA4[];
EC u8 const gUnk_08117BB0[], gUnk_08117BBC[], gUnk_08117BC8[];
EC i16 const gUnk_084FA7A0[];
EC i16 const gUnk_08523290[];
EC u8 const gUnk_084F90CC[], gUnk_084FA9A0[];

typedef void (*ExpandMenuGlyph)(void const *, void *);

inline u32 DecodeSpecialMenuGlyph(u8 const * source, MenuGlyphTiles * destination)
{
    reinterpret_cast<ExpandMenuGlyph>(0x0300085C)(source, destination);
    return 1;
}

i32 GetMenuDoubleByteGlyphIndex(i32 code)
{
    if ((u32)code > 0xFFFF)
        return -1;
    u32 low = code & 0xFF;
    u32 high = (code & 0xFF00) >> 8;
    if ((u32)(low - 0x40) > 0xBC || high <= 0x80 || high > 0xEA ||
        (u32)(high - 0xA0) <= 0x3F)
        return -1;
    if (high <= 0x9F)
        high -= 0x81;
    else
        high -= 0xC1;
    low -= 0x40;
    return high * 189 + low;
}

u32 DecodeMenuGlyph(MenuGlyphTiles * destination, i32 code)
{
    u32 count = 0;
    i32 index = -1;
    switch (code)
    {
    case 0xB4: return DecodeSpecialMenuGlyph(gUnk_08117B20, destination);
    case 0xB6: return DecodeSpecialMenuGlyph(gUnk_08117B2C, destination);
    case 0xB7: return DecodeSpecialMenuGlyph(gUnk_08117B38, destination);
    case 0xB1: return DecodeSpecialMenuGlyph(gUnk_08117B44, destination);
    case 0xB2: return DecodeSpecialMenuGlyph(gUnk_08117B50, destination);
    case 0xB3: return DecodeSpecialMenuGlyph(gUnk_08117B5C, destination);
    case 0xBB: return DecodeSpecialMenuGlyph(gUnk_08117B68, destination);
    case 0xBC: return DecodeSpecialMenuGlyph(gUnk_08117B74, destination);
    case 0xBD: return DecodeSpecialMenuGlyph(gUnk_08117B80, destination);
    case 0xBE: return DecodeSpecialMenuGlyph(gUnk_08117B8C, destination);
    case 0xBF: return DecodeSpecialMenuGlyph(gUnk_08117B98, destination);
    case 0xC0: return DecodeSpecialMenuGlyph(gUnk_08117BA4, destination);
    case 0xC1: return DecodeSpecialMenuGlyph(gUnk_08117BB0, destination);
    case 0xC2: return DecodeSpecialMenuGlyph(gUnk_08117BBC, destination);
    case 0xC3: return DecodeSpecialMenuGlyph(gUnk_08117BC8, destination);
    }
    if (code > 0)
    {
        if (code <= 0xFF)
        {
            index = gUnk_084FA7A0[code];
            count = 1;
        }
        else if (code <= 0xFFFF)
        {
            i32 position = GetMenuDoubleByteGlyphIndex(code);
            if (position >= 0)
            {
                index = gUnk_08523290[position];
                count = 2;
            }
        }
    }
    if (destination != 0)
    {
        if (index >= 0)
        {
            if (count != 1)
                reinterpret_cast<ExpandMenuGlyph>(0x03000714)(gUnk_084FA9A0 + index * 24, destination);
            else
                reinterpret_cast<ExpandMenuGlyph>(0x0300085C)(gUnk_084F90CC + index * 12, destination);
        }
        else
            memset(destination, 0, 128);
    }
    u32 result = 0;
    if (index >= 0)
        result = count;
    return result;
}
