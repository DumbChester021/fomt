#include "prelude.h"
#include "money.hh"
#include <memory>

EC MoneyState * CopySavedMoneyState(MoneyState *dest, MoneyState const *src)
    SECTION(".text.save_money_copy");
EC MoneyState * CopySavedMoneyState(MoneyState *dest, MoneyState const *src)
{
    dest->balance = src->balance;
    dest->flag_0 = src->flag_0;
    dest->flag_1 = src->flag_1;
    dest->daily.CopyConstructFrom(src->daily);
    dest->seasonal.CopyConstructFrom(src->seasonal);
    dest->max_daily = src->max_daily;
    dest->max_seasonal = src->max_seasonal;
    return dest;
}
EC MoneyState * func_080D6B40(MoneyState *dest, MoneyState const *src)
    ALIAS(CopySavedMoneyState);
