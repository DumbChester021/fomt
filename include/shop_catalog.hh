#ifndef GUARD_SHOP_CATALOG_HH
#define GUARD_SHOP_CATALOG_HH

#include "types.h"

struct ShopItemEntry
{
    u32 item_or_service_id;
    u32 unit_price;
};

struct LivestockShopEntry
{
    /* +00 */ u32 item_or_service_id;
    /* +04 */ const char * name;
    /* +08 */ u32 unit_price;
    /* +0C */ const char * description;
    /* +10 */ u32 kind;
};

enum
{
    LIVESTOCK_SHOP_ARTICLE,
    LIVESTOCK_SHOP_BUY_ANIMAL,
    LIVESTOCK_SHOP_TOOL,
    LIVESTOCK_SHOP_SELL_ANIMAL,
    LIVESTOCK_SHOP_ANIMAL_INFO,
};

enum
{
    LIVESTOCK_SHOP_BUY_COW = 1,
    LIVESTOCK_SHOP_BUY_SHEEP = 2,
    LIVESTOCK_SHOP_SELL_COW = 7,
    LIVESTOCK_SHOP_SELL_SHEEP = 8,
    LIVESTOCK_SHOP_COW_INFO = 9,
    LIVESTOCK_SHOP_SHEEP_INFO = 10,
};

extern "C" LivestockShopEntry const gUnk_080FFB90[11];

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
