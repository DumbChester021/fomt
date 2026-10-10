// GameState/menu action adapters and a packed persistent-state record.
// The state, target, and child layouts are independently confirmed by exact
// compiler matches, but the actionXX virtual slots have unknown semantics.
// Do not rename slots after assumed gameplay effects. See
// docs/GAME_STATE_MENU_ACTIONS.md for evidence and remaining assembly.

#include "prelude.h"

struct MenuActionTarget;
struct MenuActionChild;

struct MenuActionChildOps {
    u8 pad_00[0x6C];
    void (*action6C)(MenuActionChild *);
    void (*action70)(MenuActionChild *);
    void (*action74)(MenuActionChild *, u32);
    u8 pad_78[0x24];
    void (*action9C)(MenuActionChild *, u8);
    u8 pad_A0[8];
    void (*actionA8)(MenuActionChild *);
    void (*actionAC)(MenuActionChild *);
};

struct MenuActionChild {
    u8 pad_00[0x14];
    MenuActionChildOps *ops;
};

struct MenuActionVtable {
    u8 pad_00[0x40];
    MenuActionChild *(*getChild)(MenuActionTarget *, u32);
    u8 pad_44[0xB8];
    void (*actionFC)(MenuActionTarget *);
    void (*action100)(MenuActionTarget *);
    void (*action104)(MenuActionTarget *);
    u8 pad_108[4];
    void (*action10C)(MenuActionTarget *, u32);
    void (*action110)(MenuActionTarget *, u32);
    u8 pad_114[0x50];
    void (*action164)(MenuActionTarget *, u32);
};

struct MenuActionTarget {
    MenuActionVtable *vtable;
};

struct MenuActionState {
    u8 pad_00[0x9C];
    u32 status;
    u8 pad_A0[8];
    MenuActionTarget *target;
};

struct MenuActionProxy {
    u32 unused;
    MenuActionState *state;
};

EC void func_080387B8(MenuActionChild *);
EC void func_080387C8(MenuActionChild *);
EC void func_080387EC(MenuActionChild *);
EC void func_080387FC(MenuActionChild *);
EC void *gUnk_0300040C;

struct MenuRecord {
    u8 enabled;
    u8 pad_01[3];
    u32 index;
};

EC void func_08016BA4(MenuActionProxy *, u32 argument) SECTION(".text.game_state_actions_16ba4");
void func_08016BA4(MenuActionProxy *self, u32 argument)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->action10C(target, argument);
}

EC void func_08016BC0(MenuActionProxy *, u32 argument) SECTION(".text.game_state_actions_16ba4");
void func_08016BC0(MenuActionProxy *self, u32 argument)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->action110(target, argument);
}

EC void func_08016BDC(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016BDC(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->actionFC(target);
}

EC void func_08016BF4(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016BF4(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->action100(target);
}

EC void func_08016C10(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016C10(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->action104(target);
}

EC void func_08016C2C(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016C2C(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0x5D);
    func_080387B8(child);
}

EC void func_08016C48(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016C48(MenuActionProxy *self)
{
    MenuActionState *state = self->state;
    MenuActionTarget *target = state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0x5D);
    func_080387C8(child);
    state->status = 0x1C;
}

EC void func_08016C6C(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016C6C(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0x5D);
    func_080387EC(child);
}

EC void func_08016C88(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016C88(MenuActionProxy *self)
{
    MenuActionState *state = self->state;
    MenuActionTarget *target = state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0x5D);
    func_080387FC(child);
    state->status = 0x1B;
}

EC void func_08016CAC(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016CAC(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->actionA8(child);
}

EC void func_08016CCC(MenuActionProxy *) SECTION(".text.game_state_actions_16ba4");
void func_08016CCC(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->actionAC(child);
}

EC void func_08016D80() SECTION(".text.game_state_actions_16d80");
void func_08016D80()
{
    MenuRecord *record = (MenuRecord *)((u8 *)gUnk_0300040C + 0x36C);
    record->enabled = 0;
    record->index = 0x234;
}

EC u32 func_08016D9C() SECTION(".text.game_state_actions_16d80");
u32 func_08016D9C()
{
    MenuRecord *record = (MenuRecord *)((u8 *)gUnk_0300040C + 0x36C);
    return record->index;
}

EC void func_08016E7C(MenuActionProxy *) SECTION(".text.game_state_actions_16e7c");
void func_08016E7C(MenuActionProxy *self)
{
    MenuActionTarget *target = self->state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->action6C(child);
}

EC void func_08016E9C(MenuActionProxy *) SECTION(".text.game_state_actions_16e7c");
void func_08016E9C(MenuActionProxy *self)
{
    MenuActionState *state = self->state;
    MenuActionTarget *target = state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->action70(child);
    state->status = 0x19;
}

EC void func_08016EF0(MenuActionProxy *, u32 argument) SECTION(".text.game_state_actions_16ef0");
void func_08016EF0(MenuActionProxy *self, u32 argument)
{
    MenuActionTarget *target = self->state->target;
    target->vtable->action164(target, argument);
}

EC void func_08016F0C(MenuActionProxy *, u8 argument) SECTION(".text.game_state_actions_16ef0");
void func_08016F0C(MenuActionProxy *self, u8 argument)
{
    MenuActionState *state = self->state;
    MenuActionTarget *target = state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->action9C(child, argument);
}

EC void func_08016F34(MenuActionProxy *, u32 argument) SECTION(".text.game_state_actions_16ef0");
void func_08016F34(MenuActionProxy *self, u32 argument)
{
    MenuActionState *state = self->state;
    MenuActionTarget *target = state->target;
    MenuActionChild *child = target->vtable->getChild(target, 0);
    child->ops->action74(child, argument);
    state->status = 0x19;
}
