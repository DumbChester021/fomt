#pragma once

#include "prelude.h"

struct CursedToolState
{
    u8 active[6];
    u8 completed[6];
    u8 count[6];
    u8 padding[2];
};

EC CursedToolState * func_0809C144(CursedToolState * self);
