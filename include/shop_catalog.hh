#ifndef GUARD_SHOP_CATALOG_HH
#define GUARD_SHOP_CATALOG_HH

#include "types.h"

struct ShopItemEntry
{
    u32 item_or_service_id;
    u32 unit_price;
};

enum
{
    SHOP_SPECIAL_RECORD_PLAYER = 0x0A,
};

extern "C" ShopItemEntry const gUnk_080FDDD8[13];
extern "C" ShopItemEntry const gUnk_080FDFA4[8];
extern "C" ShopItemEntry const gUnk_080FE050[4];
extern "C" ShopItemEntry const gUnk_080FE484[10];
extern "C" ShopItemEntry const gUnk_080FE740[2];
extern "C" ShopItemEntry const gUnk_080FE8FC[15];

#endif
