#include "prelude.h"
#include "hardware_transfer.hh"
#include "entity_effect.hh"
#include <stdlib.h>

EC int func_08007D4C(void *, u32);
EC GraphicsTransfer * func_080D3BC0(u32);

static inline u32 const & MaxU32(u32 const & a, u32 const & b)
{
    return a < b ? b : a;
}

static inline void ConstructTransfer(
    GraphicsTransfer * destination,
    GraphicsTransfer const & source)
{
    if (destination != 0)
        *destination = source;
}

static inline GraphicsTransfer * UninitializedCopyTransfers(
    GraphicsTransfer * first,
    GraphicsTransfer * last,
    GraphicsTransfer * result)
{
    while (first != last)
    {
        ConstructTransfer(result, *first);
        ++first;
        ++result;
    }
    return result;
}

static inline GraphicsTransfer * UninitializedFillTransfers(
    GraphicsTransfer * result,
    u32 count,
    GraphicsTransfer const & value)
{
    if (count == 1)
    {
        ConstructTransfer(result, value);
        return result + 1;
    }

    u32 remaining = count;
    GraphicsTransfer * current = result;
    while (remaining != 0)
    {
        ConstructTransfer(current, value);
        --remaining;
        ++current;
    }
    return current;
}

static inline void DestroyTransfer(GraphicsTransfer *)
{
}

static inline void DestroyTransfersAux(
    GraphicsTransfer * first,
    GraphicsTransfer * last)
{
    for (; first != last; ++first)
        DestroyTransfer(first);
}

static inline void DestroyTransfers(
    GraphicsTransfer * first,
    GraphicsTransfer * last)
{
    DestroyTransfersAux(first, last);
}

static inline void * MallocAllocate(u32 bytes)
{
    void * result = malloc(bytes);
    if (result == 0)
        result = func_080D3BC0(bytes);
    return result;
}

static inline GraphicsTransfer * SimpleAllocateTransfers(u32 count)
{
    return count == 0
        ? 0
        : static_cast<GraphicsTransfer *>(MallocAllocate(count << 4));
}

static inline GraphicsTransfer * AllocateTransfers(u32 count)
{
    return SimpleAllocateTransfers(count);
}

static inline void PushGraphicsTransfer(
    GraphicsTransferVector * queue,
    GraphicsTransfer const & value)
{
    if (queue->end != queue->end_of_storage)
    {
        ConstructTransfer(queue->end, value);
        ++queue->end;
        return;
    }

    GraphicsTransfer * old_end = queue->end;
    u32 count = 1;
    u32 old_size = old_end - queue->begin;
    u32 new_count = old_size + MaxU32(old_size, count);
    GraphicsTransfer * new_begin = AllocateTransfers(new_count);

    GraphicsTransfer * new_end =
        UninitializedCopyTransfers(queue->begin, old_end, new_begin);
    new_end = UninitializedFillTransfers(new_end, count, value);

    DestroyTransfers(queue->begin, queue->end);

    if (queue->begin != 0)
        free(queue->begin);

    GraphicsTransfer * new_end_of_storage = new_begin + new_count;
    queue->begin = new_begin;
    queue->end = new_end;
    queue->end_of_storage = new_end_of_storage;
}

struct EffectGameObjectVtable
{
    STRUCT_PAD(0x00, 0x54);
    void (*func_54)(void *, void const *, u8, u8);
};

struct EffectGameObjectView
{
    EffectGameObjectVtable * vtable;
};

void EffectBase::QueueGraphicsTransfer(
    GraphicsTransferVector * queue,
    GraphicsBlob const * graphics)
{
    void const * data = graphics->data;
    u32 size = 0;
    if (data != 0)
        size = graphics->size;

    if (size == 0)
        return;

    EffectHandle * current_handle = &handle;
    int slot = func_08007D4C(current_handle, current_handle->value);
    GraphicsTransfer transfer(
        data,
        reinterpret_cast<void *>(0x06010000 + (slot << 5)),
        size);

    PushGraphicsTransfer(queue, transfer);
}


void EffectBase::QueueGraphicsChunks(GraphicsBlob const * graphics, u8 flag)
{
    void const * data = graphics->data;
    u32 size = 0;
    if (data != 0)
        size = graphics->size;

    if (size == 0)
        return;

    EffectGameObjectView * object = reinterpret_cast<EffectGameObjectView *>(game_object);
    u32 count = size >> 5;
    u8 const * chunk = reinterpret_cast<u8 const *>(data);
    u32 i = 0;

    if (i < count)
    {
        u8 const * value = values;
        do
        {
            object->vtable->func_54(object, chunk, *value, flag);
            ++value;
            ++i;
            chunk += 0x20;
        }
        while (i < count);
    }
}

EC void func_080A46AC(void *, void *, u32, u32 const *, u32);
EC void func_080A4740(void *, void *, u32, u32);
EC void * func_0805E824(void *, void *, u32, u32);
EC u8 vtable_unk_080E681C[];

struct DiscardEffect
{
    EffectBase base;
    u8 animation[0x14];
    u8 active;
    u8 refresh_sprite_parts_each_update;
    u8 unk_3E;

    DiscardEffect(void *, u32, void *, u32, u32 const *, u32, bool)
        asm("func_080A49A0");
    DiscardEffect(void *, u32, void *, u32, u32, bool)
        asm("func_080A4A00");
};

DiscardEffect::DiscardEffect(
    void * effect_context,
    u32 resource_id,
    void * provider,
    u32 value,
    u32 const * args,
    u32 count,
    bool refresh)
{
    func_080A46AC(&base, provider, value, args, count);
    base.vtable = vtable_unk_080E681C;
    func_0805E824(animation, effect_context, resource_id, 0x100);
    active = 1;
    refresh_sprite_parts_each_update = refresh;
    unk_3E = 0;
}

DiscardEffect::DiscardEffect(
    void * effect_context,
    u32 resource_id,
    void * provider,
    u32 value,
    u32 arg,
    bool refresh)
{
    func_080A4740(&base, provider, value, arg);
    base.vtable = vtable_unk_080E681C;
    func_0805E824(animation, effect_context, resource_id, 0x100);
    active = 1;
    refresh_sprite_parts_each_update = refresh;
    unk_3E = 0;
}
