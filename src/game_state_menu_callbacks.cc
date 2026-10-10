// Menu callbacks, child forwarding, and the proved coop-incubation call.
// Exact slot offsets and narrow argument/return types are ABI facts. Apart
// from BeginIncubation, gameplay meanings of actionXX slots are unresolved;
// neutral names are intentional until their callees can be characterized.
// See docs/GAME_STATE_MENU_CALLBACKS.md for the typed evidence.

#include "prelude.h"

struct GameMenuTarget;
struct GameMenuChild;

struct GameMenuChildOps {
    u8 pad_00[0x44];
    u32 (*action44)(GameMenuChild *);
    u8 pad_48[0x1C];
    void (*action64)(GameMenuChild *, u32, u32);
    void (*action68)(GameMenuChild *, u16);
    u8 pad_6C[0x0C];
    u32 (*action78)(GameMenuChild *);
    void (*action7C)(GameMenuChild *);
    void (*action80)(GameMenuChild *);
    u32 (*action84)(GameMenuChild *);
    u32 (*action88)(GameMenuChild *);
    u32 (*action8C)(GameMenuChild *);
};

struct GameMenuChild {
    u8 pad_00[0x14];
    GameMenuChildOps *ops;
};

struct GameMenuVtable {
    u8 pad_00[0x40];
    GameMenuChild *(*getChild)(GameMenuTarget *, u32);
    u8 pad_44[0x68];
    void (*actionAC)(GameMenuTarget *, u32);
    u8 pad_B0[0xA0];
    void (*action150)(GameMenuTarget *, u32);
    void (*action154)(GameMenuTarget *, u32);
};

struct GameMenuTarget { GameMenuVtable *vtable; };

struct GameMenuState {
    u8 pad_00[0x8C];
    u8 *saveState;
    u8 pad_90[0x0C];
    u32 status;
    u8 pad_A0[8];
    GameMenuTarget *target;
};

struct GameMenuProxy {
    u32 unused;
    GameMenuState *state;
};

EC void BeginIncubation__4CoopUi(void *, u32);

EC void * func_0801468C(GameMenuProxy *) SECTION(".text.game_menu_cb_1468c");
void * func_0801468C(GameMenuProxy *self)
{
    return (u8 *)self->state + 0xD0;
}

EC void func_08014694(GameMenuProxy *, u32) SECTION(".text.game_menu_cb_1468c");
void func_08014694(GameMenuProxy *self, u32 argument)
{
    GameMenuTarget *target = self->state->target;
    target->vtable->action150(target, argument);
}

EC void func_080146B0(GameMenuProxy *, u32) SECTION(".text.game_menu_cb_1468c");
void func_080146B0(GameMenuProxy *self, u32 argument)
{
    GameMenuTarget *target = self->state->target;
    target->vtable->action154(target, argument);
}

EC void func_080146CC(GameMenuProxy *, u32) SECTION(".text.game_menu_cb_1468c");
void func_080146CC(GameMenuProxy *self, u32 argument)
{
    GameMenuState *state = self->state;
    BeginIncubation__4CoopUi(state->saveState + 0x410, argument);
    GameMenuTarget *target = state->target;
    target->vtable->actionAC(target, argument);
}

EC void func_08014C0C(GameMenuProxy *, u32, u32) SECTION(".text.game_menu_cb_14c0c");
void func_08014C0C(GameMenuProxy *self, u32 first, u32 second)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    child->ops->action64(child, first, second);
}

EC u32 func_08014D5C(GameMenuProxy *) SECTION(".text.game_menu_cb_14d5c");
u32 func_08014D5C(GameMenuProxy *self)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    return child->ops->action78(child);
}

EC u32 func_08014D7C(GameMenuProxy *) SECTION(".text.game_menu_cb_14d5c");
u32 func_08014D7C(GameMenuProxy *self)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    return child->ops->action44(child);
}

EC void func_0801589C(GameMenuProxy *, u16) SECTION(".text.game_menu_cb_1589c");
void func_0801589C(GameMenuProxy *self, u16 argument)
{
    GameMenuState *state = self->state;
    GameMenuTarget *target = state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    child->ops->action68(child, argument);
    state->status = 0x19;
}

EC void func_080158CC(GameMenuProxy *) SECTION(".text.game_menu_cb_1589c");
void func_080158CC(GameMenuProxy *self)
{
    GameMenuState *state = self->state;
    GameMenuTarget *target = state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    child->ops->action80(child);
    state->status = 0x19;
}

EC void func_080158F8(GameMenuProxy *) SECTION(".text.game_menu_cb_1589c");
void func_080158F8(GameMenuProxy *self)
{
    GameMenuState *state = self->state;
    GameMenuTarget *target = state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    child->ops->action7C(child);
    state->status = 0x19;
}

EC u32 func_08015950(GameMenuProxy *) SECTION(".text.game_menu_cb_15950");
u32 func_08015950(GameMenuProxy *self)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    return child->ops->action84(child);
}

EC u32 func_08015970(GameMenuProxy *) SECTION(".text.game_menu_cb_15950");
u32 func_08015970(GameMenuProxy *self)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    return child->ops->action88(child);
}

EC u32 func_08015990(GameMenuProxy *) SECTION(".text.game_menu_cb_15950");
u32 func_08015990(GameMenuProxy *self)
{
    GameMenuTarget *target = self->state->target;
    GameMenuChild *child = target->vtable->getChild(target, 0);
    return child->ops->action8C(child);
}
