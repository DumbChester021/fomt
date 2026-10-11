#include "money.hh"
#include "prelude.h"

// Records are returned newest-first. An out-of-range index returns the
// first stored record, matching the original behavior.
EC MoneyRecord * GetDailyHistoryFromNewest(MoneyState * money, u32 index)
    SECTION(".text.money_history_lookups");
EC MoneyRecord * GetDailyHistoryFromNewest(MoneyState * money, u32 index)
{
    MoneyHistory<30> * history = &money->daily;
    MoneyRecord * result;
    if (index >= history->count)
        result = history->records;
    else
        result = &history->records[history->count - (index + 1)];
    return result;
}
EC MoneyRecord * func_0809B018(MoneyState * money, u32 index)
    ALIAS(GetDailyHistoryFromNewest);

EC MoneyRecord * GetSeasonalHistoryFromNewest(MoneyState * money, u32 index)
    SECTION(".text.money_history_lookups");
EC MoneyRecord * GetSeasonalHistoryFromNewest(MoneyState * money, u32 index)
{
    MoneyHistory<4> * history = &money->seasonal;
    MoneyRecord * result;
    if (index >= history->count)
        result = history->records;
    else
        result = &history->records[history->count - (index + 1)];
    return result;
}
EC MoneyRecord * func_0809B038(MoneyState * money, u32 index)
    ALIAS(GetSeasonalHistoryFromNewest);
