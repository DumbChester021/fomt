#include "prelude.h"

// Exact menu/audio state callbacks. The second callback's gameplay purpose is
// still unknown: its +0x90 vtable slot is a verified ABI offset, not a name.
struct GameMenuAudioTarget;
struct GameMenuAudioChild {
    u8 pad_00[0x14];
    void *operations;
};

struct GameMenuAudioChildOps {
    u8 pad_00[0x90];
    u32 (*read)(GameMenuAudioChild *);
};

struct GameMenuAudioTargetOps {
    u8 pad_00[0x40];
    GameMenuAudioChild *(*getChild)(GameMenuAudioTarget *, u32);
};

struct GameMenuAudioTarget {
    GameMenuAudioTargetOps *operations;
};

struct GameMenuAudioState {
    u8 pad_00[0xA8];
    GameMenuAudioTarget *target;
};

struct GameMenuAudioProxy {
    u32 unused;
    GameMenuAudioState *state;
};

struct SoundPlayer;
extern "C" bool IsSoundPlayerBusy(SoundPlayer *) asm("func_08008CD0");

EC u32 func_080167AC(GameMenuAudioProxy *) SECTION(".text.game_state_audio_167ac");
u32 func_080167AC(GameMenuAudioProxy *self)
{
    GameMenuAudioTarget *target = self->state->target;
    GameMenuAudioChild *child = target->operations->getChild(target, 0);
    return ((GameMenuAudioChildOps *)child->operations)->read(child);
}

EC bool func_080167CC(GameMenuAudioProxy *) SECTION(".text.game_state_audio_167ac");
bool func_080167CC(GameMenuAudioProxy *self)
{
    return IsSoundPlayerBusy((SoundPlayer *)((u8 *)self->state + 0xBC));
}
