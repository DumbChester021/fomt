#include "prelude.h"
#include "gbaio.h"

EC void func_080D0EBC(void const *, void *, u32, u32 volatile *);

struct UnkPair_080A5670
{
    u8 * source;
    u8 * destination;
};

struct Unk_080A5670
{
    STRUCT_PAD(0x00, 0x0C);
    UnkPair_080A5670 pairs[3];
    u16 stride;

    u32 Flush() asm("func_080A5670");
};

u32 Unk_080A5670::Flush()
{
    u32 source_step = stride * 2;
    u32 volatile * dma = &REG_DMA3SAD;

    for (u32 i = 0; i <= 2; ++i)
    {
        if (pairs[i].source != 0)
        {
            u8 * source = pairs[i].source;
            u8 * destination = pairs[i].destination;
            u8 * end = destination + 0x540;

            do
            {
                func_080D0EBC(source, destination, 0x8000001F, dma);
                source += source_step;
                destination += 0x40;
            } while (destination != end);
        }
    }

    return 0;
}
