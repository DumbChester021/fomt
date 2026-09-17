#include "key_input.hh"

#include "gbaio.h"

EC unsigned int ReadHeldKeys()
{
    return KEY_INPUT_ALL & ~REG_KEYINPUT;
}

EC KeyInput * InitHeldKeys(KeyInput * self)
{
    self->held = ReadHeldKeys();
    return self;
}

EC KeyInput * SetHeldKeys(KeyInput * self, unsigned int keys)
{
    self->held = keys;
    return self;
}

EC unsigned int PollHeldKeys(KeyInput * self)
{
    unsigned int keys = ReadHeldKeys();
    self->held = keys;
    return keys;
}

EC KeyInput * InitKeyInput(KeyInput * self)
{
    InitHeldKeys(self);
    self->pressed = self->held;
    return self;
}

EC KeyInput * InitKeyInputWithKeys(KeyInput * self, unsigned int keys)
{
    SetHeldKeys(self, keys);
    self->pressed = self->held;
    return self;
}

EC unsigned int UpdateKeyInput(KeyInput * self)
{
    unsigned int previous = self->held;
    unsigned int pressed = PollHeldKeys(self) & ~previous;
    self->pressed = pressed;
    return pressed;
}

EC unsigned int func_0800912C() ALIAS(ReadHeldKeys);
EC KeyInput * func_08009140(KeyInput * self) ALIAS(InitHeldKeys);
EC KeyInput * func_08009154(KeyInput * self, unsigned int keys) ALIAS(SetHeldKeys);
EC unsigned int func_08009158(KeyInput * self) ALIAS(PollHeldKeys);
EC KeyInput * func_08009168(KeyInput * self) ALIAS(InitKeyInput);
EC KeyInput * func_0800917C(KeyInput * self, unsigned int keys) ALIAS(InitKeyInputWithKeys);
EC unsigned int func_08009190(KeyInput * self) ALIAS(UpdateKeyInput);
