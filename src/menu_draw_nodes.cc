#include "menu_draw_nodes.hh"
#include "menu_tilemap.hh"

EC u8 vtable_unk_080E7868[];
EC u8 vtable_unk_080E7858[];
EC u8 vtable_unk_080E7848[];
EC u8 vtable_unk_080E7838[];

TileRectDrawNode * InitTileRectDrawNode(TileRectDrawNode * self, u16 * destination,
                                        u16 first_tile, u32 width, u32 height, u16 palette,
                                        u32 stride)
{
    self->node.pprev = 0;
    self->node.next = 0;
    self->node.vtable = vtable_unk_080E7868;
    self->destination = destination;
    self->first_tile = first_tile;
    self->width = width;
    self->height = height;
    self->palette = palette;
    self->stride = stride;
    return self;
}

void DestroyTileRectDrawNode(TileRectDrawNode * self, u32 flags)
{
    self->node.vtable = vtable_unk_080E7868;
    DestroyIntrusiveCallbackNode(&self->node, flags);
}

NumberDrawNode * InitWideNumberDrawNode(NumberDrawNode * self, u32 value, u16 * destination,
                                        u16 first_tile, u16 palette, u32 stride)
{
    self->node.pprev = 0;
    self->node.next = 0;
    self->node.vtable = vtable_unk_080E7858;
    self->value = value;
    self->destination = destination;
    self->first_tile = first_tile;
    self->palette = palette;
    self->stride = stride;
    return self;
}

void DestroyWideNumberDrawNode(NumberDrawNode * self, u32 flags)
{
    self->node.vtable = vtable_unk_080E7858;
    DestroyIntrusiveCallbackNode(&self->node, flags);
}

NumberDrawNode * InitTallNumberDrawNode(NumberDrawNode * self, u32 value, u16 * destination,
                                        u16 first_tile, u16 palette, u32 stride)
{
    self->node.pprev = 0;
    self->node.next = 0;
    self->node.vtable = vtable_unk_080E7848;
    self->value = value;
    self->destination = destination;
    self->first_tile = first_tile;
    self->palette = palette;
    self->stride = stride;
    return self;
}

void DestroyTallNumberDrawNode(NumberDrawNode * self, u32 flags)
{
    self->node.vtable = vtable_unk_080E7848;
    DestroyIntrusiveCallbackNode(&self->node, flags);
}

NumberDrawNode * InitSingleNumberDrawNode(NumberDrawNode * self, u32 value, u16 * destination,
                                          u16 first_tile, u16 palette, u32 stride)
{
    self->node.pprev = 0;
    self->node.next = 0;
    self->node.vtable = vtable_unk_080E7838;
    self->value = value;
    self->destination = destination;
    self->first_tile = first_tile;
    self->palette = palette;
    self->stride = stride;
    return self;
}

void DestroySingleNumberDrawNode(NumberDrawNode * self, u32 flags)
{
    self->node.vtable = vtable_unk_080E7838;
    DestroyIntrusiveCallbackNode(&self->node, flags);
}

u32 DrawSingleNumberNode(NumberDrawNode * self)
{
    DrawSingleTileNumber(self->value, self->destination, self->first_tile,
                         self->palette, self->stride);
    return 0;
}

u32 DrawTallNumberNode(NumberDrawNode * self)
{
    DrawTallTileNumber(self->value, self->destination, self->first_tile,
                       self->palette, self->stride);
    return 0;
}

u32 DrawWideNumberNode(NumberDrawNode * self)
{
    DrawWideTileNumber(self->value, self->destination, self->first_tile,
                       self->palette, self->stride);
    return 0;
}

u32 DrawTileRectNode(TileRectDrawNode * self)
{
    FillSequentialTileRect(self->destination, self->first_tile, self->width,
                           self->height, self->palette, self->stride);
    return 0;
}
