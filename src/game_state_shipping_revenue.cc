#include "prelude.h"
#include "money.hh"
#include "shipping_bin.hh"

// Move today's shipped value into the saved money totals, then clear the bin.
EC unsigned int ApplyDailyShippingRevenue(u8 * state)
    SECTION(".text.game_state_shipping_revenue");
EC unsigned int ApplyDailyShippingRevenue(u8 * state)
{
    ShippingBin * shipping = reinterpret_cast<ShippingBin *>(state + 0x54);
    unsigned int amount = shipping->GetValueShipped();
    MoneyState * money = reinterpret_cast<MoneyState *>(state + 0x1AA8);
    func_0809ABD8(money, amount);

    // The flag's gameplay trigger is not yet identified. When set, retail
    // credits the same amount a second time and clears the flag.
    u8 * extraPayoutFlag = state + 0x34C5;
    if (*extraPayoutFlag != 0)
    {
        func_0809ABD8(money, amount);
        *extraPayoutFlag = 0;
    }

    shipping->ResetValueShipped();
    // The original returns a branchless 0/1 test of the full 32-bit amount.
    return (amount | (0u - amount)) >> 31;
}
EC unsigned int func_0801140C(u8 * state) ALIAS(ApplyDailyShippingRevenue);
