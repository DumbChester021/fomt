#include "prelude.h"

struct MenuDispatchTarget;
struct MenuDispatchChild;

struct MenuDispatchChildOps {
    u8 pad_00[0x40];
    u32 (*read)(MenuDispatchChild *);
    u8 pad_44[0x08];
    void (*action4C)(MenuDispatchChild *);
    void (*action50)(MenuDispatchChild *);
    void (*action54)(MenuDispatchChild *);
    u8 pad_58[0x08];
    void (*action60)(MenuDispatchChild *);
};
struct MenuDispatchChild {
    u8 pad_00[0x14];
    MenuDispatchChildOps *ops;
};
struct MenuDispatchTable {
    u8 pad_00[0x40];
    MenuDispatchChild *(*getChild)(MenuDispatchTarget *, u32);
    u8 pad_44[0x3C];
    void (*action80)(MenuDispatchTarget *);
    void (*action84)(MenuDispatchTarget *);
    void (*action88)(MenuDispatchTarget *);
    void (*action8C)(MenuDispatchTarget *);
    void (*action90)(MenuDispatchTarget *);
    void (*action94)(MenuDispatchTarget *);
    void (*action98)(MenuDispatchTarget *);
    void (*action9C)(MenuDispatchTarget *, u32);
    void (*actionA0)(MenuDispatchTarget *, u32);
    u32 (*actionA4)(MenuDispatchTarget *);
    u32 (*actionA8)(MenuDispatchTarget *, u32);
    u8 pad_AC[0x6C];
    void (*action118)(MenuDispatchTarget *, u32);
    void (*action11C)(MenuDispatchTarget *);
};
struct MenuDispatchTarget { MenuDispatchTable *vtable; };
struct MenuDispatchState {
    u8 pad_00[0x8C];
    u8 *saveState;
    u8 pad_90[0x0C];
    u32 status;
    u8 pad_A0[8];
    MenuDispatchTarget *target;
};
struct MenuDispatchProxy { u32 unused; MenuDispatchState *state; };

EC void func_08014034(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_08014034(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action84(target);
}

EC void func_0801404C(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_0801404C(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action88(target);
}

EC void func_08014064(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_08014064(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action8C(target);
}

EC void func_0801407C(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_0801407C(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action90(target);
}

EC void func_08014094(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_08014094(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action94(target);
}

EC void func_080140AC(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_080140AC(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action98(target);
}

EC void func_080140C4(MenuDispatchProxy *, u32) SECTION(".text.game_state_dispatch_08014034");
void func_080140C4(MenuDispatchProxy *self, u32 argument)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action9C(target, argument);
}

EC void func_080140DC(MenuDispatchProxy *, u32) SECTION(".text.game_state_dispatch_08014034");
void func_080140DC(MenuDispatchProxy *self, u32 argument)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->actionA0(target, argument);
}

EC void func_080140F4(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
void func_080140F4(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action80(target);
}

EC u32 func_0801410C(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014034");
u32 func_0801410C(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    MenuDispatchChild *child = target->vtable->getChild(target, 0);
    return child->ops->read(child);
}

EC u32 func_08014198(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014198");
u32 func_08014198(MenuDispatchProxy *self)
{
    MenuDispatchState *state = self->state;
    MenuDispatchTarget *target = state->target;
    MenuDispatchChild *child = target->vtable->getChild(target, 0);
    child->ops->action60(child);
    state->status = 0x19;
    return 1;
}

EC void func_080141C4(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014198");
void func_080141C4(MenuDispatchProxy *self)
{
    MenuDispatchState *state = self->state;
    MenuDispatchTarget *target = state->target;
    MenuDispatchChild *child = target->vtable->getChild(target, 0);
    child->ops->action4C(child);
    state->status = 0x19;

}

EC void func_080141EC(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014198");
void func_080141EC(MenuDispatchProxy *self)
{
    MenuDispatchState *state = self->state;
    MenuDispatchTarget *target = state->target;
    MenuDispatchChild *child = target->vtable->getChild(target, 0);
    child->ops->action50(child);
    state->status = 0x19;

}

EC void func_08014214(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014198");
void func_08014214(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    MenuDispatchChild *child = target->vtable->getChild(target, 0);
    child->ops->action54(child);


}

EC u32 func_08014234(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_08014198");
u32 func_08014234(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    return target->vtable->actionA4(target);
}

EC u32 func_0801424C(MenuDispatchProxy *, u32) SECTION(".text.game_state_dispatch_08014198");
u32 func_0801424C(MenuDispatchProxy *self, u32 argument)
{
    MenuDispatchTarget *target = self->state->target;
    return target->vtable->actionA8(target, argument);
}

EC void func_080142B8(MenuDispatchProxy *, u32) SECTION(".text.game_state_dispatch_080142b8");
void func_080142B8(MenuDispatchProxy *self, u32 argument)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action118(target, argument);
}

EC void func_080142D4(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_080142b8");
void func_080142D4(MenuDispatchProxy *self)
{
    MenuDispatchTarget *target = self->state->target;
    target->vtable->action11C(target);
}

EC void func_080142F0(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_080142b8");
void func_080142F0(MenuDispatchProxy *self)
{
    self->state->saveState[0x34C4] = 1;
}

EC void func_08014304(MenuDispatchProxy *) SECTION(".text.game_state_dispatch_080142b8");
void func_08014304(MenuDispatchProxy *self)
{
    self->state->saveState[0x34C4] = 0;
}
