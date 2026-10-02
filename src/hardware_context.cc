#include "hardware.hh"

HardwareContext * Hardware::GetContext()
{
    return context;
}

GraphicsTransferVector * Hardware::GetTransferQueue()
{
    return &context->transfer_queue;
}

DisplayRegisterShadow * Hardware::GetDisplayRegisters()
{
    return &context->display_regs;
}

OamShadow * Hardware::GetOam()
{
    return &context->oam;
}

IntrusiveCallbackList * Hardware::GetVBlankCallbacks()
{
    return &context->vblank_callbacks;
}
