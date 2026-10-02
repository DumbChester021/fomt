#include "hardware_transfer.hh"
#include "gbaio.h"

EC void func_080D0EBC(void const *, void *, u32, u32 volatile *);

static inline u32 MakeTransferControl(
    void const * source,
    void * destination,
    u32 size)
{
    u32 control;

    if (size != 0)
    {
        u32 alignment =
            reinterpret_cast<u32>(source)
            | reinterpret_cast<u32>(destination)
            | size;

        if ((alignment & 1) == 0)
        {
            if ((alignment & 3) == 0)
            {
                control = static_cast<u16>(size >> 2);
                control |= (DMA_ENABLE | DMA_32BIT) << 16;
            }
            else
            {
                control = static_cast<u16>(size >> 1);
                control |= DMA_ENABLE << 16;
            }
        }
        else
        {
            control = 0;
        }
    }
    else
    {
        control = 0;
    }

    return control;
}

void DmaCopy(void const * source, void * destination, u32 size)
{
    if (source == 0)
        return;
    if (destination == 0)
        return;

    void const * saved_source = source;
    u32 control = MakeTransferControl(saved_source, destination, size);
    func_080D0EBC(saved_source, destination, control, &REG_DMA3SAD);
}

void DmaFill(u32 value, void * destination, u32 size)
{
    if (destination == 0)
        return;

    u32 control =
        MakeTransferControl(0, destination, size)
        | (DMA_SRC_FIXED << 16);

    func_080D0EBC(&value, destination, control, &REG_DMA3SAD);
}

GraphicsTransfer::GraphicsTransfer(
    void const * source_,
    void * destination_,
    u32 size)
{
    u32 control_;

    if (source_ != 0 && destination_ != 0)
        control_ = MakeTransferControl(source_, destination_, size);
    else
        control_ = 0;

    mode = MODE_COPY;
    source.address = source_;
    destination = destination_;
    control = control_;
}

GraphicsTransfer::GraphicsTransfer(
    u32 value,
    void * destination_,
    u32 size)
{
    u32 control_;

    if (destination_ != 0)
    {
        size = MakeTransferControl(0, destination_, size);
        control_ = size | (DMA_SRC_FIXED << 16);
    }
    else
    {
        control_ = 0;
    }

    mode = MODE_FILL;
    source.value = value;
    destination = destination_;
    control = control_;
}

void ExecuteDmaTransfers(GraphicsTransfer * first, GraphicsTransfer * last)
{
    GraphicsTransfer * end = last;
    u32 volatile * dma = &REG_DMA3SAD;
    GraphicsTransfer * current = first;

    while (current != end)
    {
        void const * source = current->source.address;
        u32 value;

        if (current->mode == GraphicsTransfer::MODE_FILL)
        {
            value = current->source.value;
            source = &value;
        }

        func_080D0EBC(
            source,
            current->destination,
            current->control,
            dma);

        ++current;
    }
}
