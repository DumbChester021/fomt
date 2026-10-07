#include "resource_owners.hh"
#include <stdlib.h>

Unk_0803AB30::~Unk_0803AB30()
{
    ResourceOwnerProvider * current = provider;
    current->vtable->release_value(current, values[0]);
}

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


void Unk_0803AB30::Update(GraphicsTransferVector * queue)
{
    for (u32 i = 0; i < 3; ++i)
    {
        SpriteFrameData * frame = &records[i].frame;
        GraphicsBlob const * graphics = &frame->graphics;
        void const * data = graphics->data;
        u32 start = records[i].handle.GetStart();
        void const * current_data = graphics->data;
        u32 size = 0;
        if (current_data != 0)
            size = graphics->size;

        GraphicsTransfer transfer(
            data, reinterpret_cast<void *>(0x06010000 + (start << 5)), size);
        PushGraphicsTransfer(queue, transfer);
    }

    ResourceOwnerProvider * current = provider;
    current->vtable->queue_chunks(current, records[0].frame.palettes.data, values[0], 1);
}

void Unk_0803AB30::Draw(void * renderer, i32 x, i32 y, u32 index)
{
    ResourceOwnerRecord * record = &records[index];
    u16 start = record->tile_start;
    u32 flags = 0x8000;
    ResourceOwnerProvider * current = provider;
    FixedVec<u8, 16> * current_values = &values;
    typedef int (*RenderCall)(
        void *, i32, i32, u32, i32, SpriteFrameData *,
        ResourceOwnerProvider *, u16, FixedVec<u8, 16> *);
    reinterpret_cast<RenderCall>(0x030004DC)(
        renderer, x, y, 0xAA, flags, &record->frame, current, start, current_values);
}
