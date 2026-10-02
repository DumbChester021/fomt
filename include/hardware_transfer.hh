#ifndef HARDWARE_TRANSFER_HH
#define HARDWARE_TRANSFER_HH

#include "prelude.h"

union GraphicsTransferSource
{
    void const * address;
    u32 value;
};

struct GraphicsTransfer
{
    enum Mode
    {
        MODE_COPY = 0,
        MODE_FILL = 1,
    };

    /* +00 */ u32 mode;
    /* +04 */ GraphicsTransferSource source;
    /* +08 */ void * destination;
    /* +0C */ u32 control;

    GraphicsTransfer(void const *, void *, u32) asm("func_08008F0C")
        SECTION(".text.hardware_transfer_setup");
    GraphicsTransfer(u32, void *, u32) asm("func_08008F60")
        SECTION(".text.hardware_transfer_setup");
};

struct GraphicsTransferVector
{
    GraphicsTransfer * begin;
    GraphicsTransfer * end;
    u32 unk_08;
    GraphicsTransfer * end_of_storage;
};

EC void DmaCopy(void const *, void *, u32) asm("func_08008E64")
    SECTION(".text.hardware_transfer_setup");
EC void DmaFill(u32, void *, u32) asm("func_08008EB8")
    SECTION(".text.hardware_transfer_setup");
EC void ExecuteDmaTransfers(GraphicsTransfer *, GraphicsTransfer *)
    asm("func_08008FE4") SECTION(".text.hardware_transfer_execute");

#endif // HARDWARE_TRANSFER_HH
