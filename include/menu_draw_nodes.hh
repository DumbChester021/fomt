#ifndef MENU_DRAW_NODES_HH
#define MENU_DRAW_NODES_HH

#include "intrusive_callback_list.hh"

struct TileRectDrawNode
{
    /* +00 */ IntrusiveCallbackNode node;
    /* +0C */ u16 * destination;
    /* +10 */ u16 palette;
    /* +12 */ u16 first_tile;
    /* +14 */ u32 width;
    /* +18 */ u32 height;
    /* +1C */ u32 stride;
};

struct NumberDrawNode
{
    /* +00 */ IntrusiveCallbackNode node;
    /* +0C */ u32 value;
    /* +10 */ u16 * destination;
    /* +14 */ u16 first_tile;
    /* +16 */ u16 palette;
    /* +18 */ u32 stride;
};

TileRectDrawNode * InitTileRectDrawNode(TileRectDrawNode *, u16 *, u16,
                                      u32, u32, u16, u32)
    asm("func_0804EA58") SECTION(".text.menu_tilemap_rect_node");
void DestroyTileRectDrawNode(TileRectDrawNode *, u32)
    asm("func_0804EA80") SECTION(".text.menu_tilemap_rect_node");

NumberDrawNode * InitWideNumberDrawNode(NumberDrawNode *, u32, u16 *, u16, u16, u32)
    asm("func_0804ED7C") SECTION(".text.menu_tilemap_wide_node");
void DestroyWideNumberDrawNode(NumberDrawNode *, u32)
    asm("func_0804EDA0") SECTION(".text.menu_tilemap_wide_node");

NumberDrawNode * InitTallNumberDrawNode(NumberDrawNode *, u32, u16 *, u16, u16, u32)
    asm("func_0804EDF8") SECTION(".text.menu_tilemap_tall_node");
void DestroyTallNumberDrawNode(NumberDrawNode *, u32)
    asm("func_0804EE1C") SECTION(".text.menu_tilemap_tall_node");

NumberDrawNode * InitSingleNumberDrawNode(NumberDrawNode *, u32, u16 *, u16, u16, u32)
    asm("func_0804EE64") SECTION(".text.menu_tilemap_draw_nodes");
void DestroySingleNumberDrawNode(NumberDrawNode *, u32)
    asm("func_0804EE88") SECTION(".text.menu_tilemap_draw_nodes");
u32 DrawSingleNumberNode(NumberDrawNode *)
    asm("func_0804EE9C") SECTION(".text.menu_tilemap_draw_nodes");
u32 DrawTallNumberNode(NumberDrawNode *)
    asm("func_0804EEBC") SECTION(".text.menu_tilemap_draw_nodes");
u32 DrawWideNumberNode(NumberDrawNode *)
    asm("func_0804EEDC") SECTION(".text.menu_tilemap_draw_nodes");
u32 DrawTileRectNode(TileRectDrawNode *)
    asm("func_0804EEFC") SECTION(".text.menu_tilemap_draw_nodes");

#endif // MENU_DRAW_NODES_HH
