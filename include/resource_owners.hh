#ifndef RESOURCE_OWNERS_HH
#define RESOURCE_OWNERS_HH

#include "entity_effect.hh"
#include "resource_handle.hh"
#include "utility/fixed_vec.hh"

#pragma interface

struct SpriteFrameData
{
    GraphicsBlob parts;
    GraphicsBlob graphics;
    GraphicsBlob palettes;
    GraphicsBlob transforms;
};

struct ResourceSpriteProvider : public SpriteAnimationProvider
{
    virtual SpriteFrameData GetFrameData(u32);
};

struct ResourceOwnerProviderVtable
{
    void * unk_00[18];
    u8 (*get_value)(void *, u32);
    void (*release_value)(void *, u8);
    void * unk_50;
    void (*queue_chunks)(void *, void const *, u8, u8);
    void * unk_58[4];
    ResourceSpriteProvider * (*get_sprite_provider)(void *);
};

struct ResourceOwnerProvider
{
    ResourceOwnerProviderVtable * vtable;
};

struct ResourceOwnerRecord
{
    SpriteFrameData frame;
    UnkHandle handle;
    u16 tile_start;
};

struct Unk_0803AB30
{
    ResourceOwnerProvider * provider;
    ResourceOwnerRecord records[3];
    FixedVec<u8, 16> values;
    bool enabled;

    Unk_0803AB30(ResourceOwnerProvider *);
    ~Unk_0803AB30();
    void Update(GraphicsTransferVector *) asm("func_0803ACD8");
    void Draw(void *, i32, i32, u32) asm("func_0803AE58");
};

struct ResourceOwnerUncachedRecord
{
    SpriteFrameData frame;
    UnkHandle handle;
};

struct ResourceAnimationEntry
{
    SpriteAnimator animator;
    u32 unk_14;
    u32 unk_18;
};

struct Unk_0803AEA0
{
    ResourceOwnerProvider * provider;
    FixedVec<ResourceOwnerUncachedRecord, 5> records;
    FixedVec<u8, 16> values;
    u8 unk_E4;
    bool dirty;
    u8 unk_E6;
    FixedVec<ResourceAnimationEntry, 32> animations;

    ~Unk_0803AEA0();
    void Update(GraphicsTransferVector *) asm("func_0803B128");
};

#endif // RESOURCE_OWNERS_HH
