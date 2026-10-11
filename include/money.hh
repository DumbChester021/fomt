#ifndef GUARD_MONEY_HH
#define GUARD_MONEY_HH

#include "types.h"

#include <memory>

struct MoneyRecord
{
    MoneyRecord()
        : income(0), spend(0)
    {
    }

    u32 income;
    u32 spend;
};

template <u32 Capacity>
struct MoneyHistory
{
    MoneyRecord * begin() { return records; }
    MoneyRecord const * begin() const { return records; }

    // Construct the active history after destination cleanup; preserve unused entries.
    void CopyConstructFrom(MoneyHistory const & source)
    {
        count = 0;
        u32 active_count = source.count;
        std::uninitialized_copy(source.begin(), source.begin() + active_count, begin());
        count = active_count;
    }

    bool empty() const
    {
        return count == 0;
    }

    void push_back(MoneyRecord const & value)
    {
        if (count < Capacity)
        {
            u32 offset = count * sizeof(MoneyRecord) + sizeof(u32);
            MoneyRecord * destination = reinterpret_cast<MoneyRecord *>(
                reinterpret_cast<u8 *>(this) + offset);
            new (destination) MoneyRecord(value);
            ++count;
        }
    }

    MoneyRecord & back()
    {
        u32 index = count;
        --index;
        return records[index];
    }

    u32 count;
    MoneyRecord records[Capacity];
};

struct MoneyState
{
    u32 balance;

    u8 flag_0 : 1;
    u8 flag_1 : 1;
    u8 flags_rest : 6;

    u8 pad_05[3];

    MoneyHistory<30> daily;
    MoneyHistory<4> seasonal;

    MoneyRecord max_daily;
    MoneyRecord max_seasonal;
};

extern "C" MoneyState * func_0809AB8C(MoneyState * money);
extern "C" void func_0809ABD8(MoneyState * money, u32 amount);
extern "C" bool func_0809ACC0(MoneyState * money, u32 amount);
extern "C" void func_0809ADA8(MoneyState * money);
extern "C" void func_0809AE6C(MoneyState * money);

#endif
