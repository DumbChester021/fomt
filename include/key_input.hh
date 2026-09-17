#ifndef KEY_INPUT_HH
#define KEY_INPUT_HH

#include "prelude.h"

enum KeyInputButton
{
    KEY_INPUT_A = 1 << 0,
    KEY_INPUT_B = 1 << 1,
    KEY_INPUT_SELECT = 1 << 2,
    KEY_INPUT_START = 1 << 3,
    KEY_INPUT_RIGHT = 1 << 4,
    KEY_INPUT_LEFT = 1 << 5,
    KEY_INPUT_UP = 1 << 6,
    KEY_INPUT_DOWN = 1 << 7,
    KEY_INPUT_R = 1 << 8,
    KEY_INPUT_L = 1 << 9,
    KEY_INPUT_ALL = 0x03FF,
};

struct KeyInput
{
    u16 held;
    STRUCT_PAD(0x02, 0x04);
    u16 pressed;
    STRUCT_PAD(0x06, 0x08);
};

EC unsigned int ReadHeldKeys();
EC KeyInput * InitHeldKeys(KeyInput * self);
EC KeyInput * SetHeldKeys(KeyInput * self, unsigned int keys);
EC unsigned int PollHeldKeys(KeyInput * self);
EC KeyInput * InitKeyInput(KeyInput * self);
EC KeyInput * InitKeyInputWithKeys(KeyInput * self, unsigned int keys);
EC unsigned int UpdateKeyInput(KeyInput * self);

#endif
