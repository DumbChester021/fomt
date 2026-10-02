#ifndef HARDWARE_HH
#define HARDWARE_HH

#include "prelude.h"
#include "hardware_transfer.hh"
#include "intrusive_callback_list.hh"

struct DisplayRegisterShadow
{
    u8 data[0x58];
};

struct OamShadow
{
    u8 data[0x404];
};

struct HardwareSchedulerHandle
{
    u8 data[0x04];
};

struct HardwareContext
{
    /* +000 */ u8 input_state[0x24];
    /* +024 */ GraphicsTransferVector transfer_queue;
    /* +034 */ DisplayRegisterShadow display_regs;
    /* +08C */ OamShadow oam;
    /* +490 */ HardwareSchedulerHandle scheduler;
    /* +494 */ IntrusiveCallbackList vblank_callbacks;
};

struct Hardware
{
    /* +00 */ HardwareContext * context;
    /* +04 */ STRUCT_PAD(0x04, 0x08);

    HardwareContext * GetContext() asm("func_080088DC") SECTION(".text.hardware_get_context");
    GraphicsTransferVector * GetTransferQueue() asm("func_08008910") SECTION(".text.hardware_accessors");
    DisplayRegisterShadow * GetDisplayRegisters() asm("func_08008918") SECTION(".text.hardware_accessors");
    OamShadow * GetOam() asm("func_08008920") SECTION(".text.hardware_accessors");
    IntrusiveCallbackList * GetVBlankCallbacks() asm("func_08008940") SECTION(".text.hardware_vblank_callbacks");
};

#endif // HARDWARE_HH
