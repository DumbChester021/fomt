#include "money.hh"

#include "unknown_inlines.hh"

static inline u32 GetBalanceInl(MoneyState const & money)
{
    return money.balance;
}

MoneyState * func_0809AB8C(MoneyState * money)
{
    money->balance = 500;
    money->flag_0 = 0;
    money->flag_1 = 0;
    money->daily.count = 0;
    money->seasonal.count = 0;
    money->max_daily_income = 0;
    money->max_daily_spend = 0;
    money->max_seasonal_income = 0;
    money->max_seasonal_spend = 0;

    func_0809AE6C(money);

    return money;
}

void func_0809ABD8(MoneyState * money, u32 amount)
{
    if (money->seasonal.empty())
        money->seasonal.push_back(MoneyRecord());

    if (money->daily.empty())
        money->daily.push_back(MoneyRecord());

    u32 old_balance = GetBalanceInl(*money);
    money->balance = old_balance + min_inl<u32>(1000000000 - old_balance, amount);

    if (money->balance > 99999999)
        money->flag_1 = 1;

    MoneyRecord & daily = money->daily.back();
    MoneyRecord & seasonal = money->seasonal.back();

    u32 old_daily_income = daily.income;
    daily.income = old_daily_income + min_inl<u32>(1000000000 - old_daily_income, amount);

    u32 old_seasonal_income = seasonal.income;
    seasonal.income = old_seasonal_income + min_inl<u32>(1000000000 - old_seasonal_income, amount);

    if (daily.income > 99999)
        money->flag_0 = 1;
}

bool func_0809ACC0(MoneyState * money, u32 amount)
{
    if (money->seasonal.empty())
        money->seasonal.push_back(MoneyRecord());

    if (money->daily.empty())
        money->daily.push_back(MoneyRecord());

    if (amount > money->balance)
        return false;

    u32 old_balance = GetBalanceInl(*money);
    money->balance = old_balance - min_inl<u32>(old_balance, amount);

    MoneyRecord & daily = money->daily.back();
    MoneyRecord & seasonal = money->seasonal.back();

    u32 old_daily_spend = daily.spend;
    daily.spend = old_daily_spend + min_inl<u32>(1000000000 - old_daily_spend, amount);

    u32 old_seasonal_spend = seasonal.spend;
    seasonal.spend = old_seasonal_spend + min_inl<u32>(1000000000 - old_seasonal_spend, amount);

    if (daily.spend > 99999)
        money->flag_0 = 1;

    return true;
}
