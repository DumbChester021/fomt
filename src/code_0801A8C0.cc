#include "prelude.h"

EC u32 func_0801A8C0(void *, u32 hour)
{
    if (hour <= 5)
        return 3;

    if (hour <= 11)
        return 0;

    if (hour > 17)
        return 2;

    return 1;
}
