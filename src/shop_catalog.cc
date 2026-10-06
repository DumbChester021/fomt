#include "item.hh"
#include "shop_catalog.hh"

extern "C" char const gUnk_080FE974[];
extern "C" void func_080CABEC(void * scene, char const * text);

extern "C" void func_0807D1DC(void * scene, u32 slot) SECTION(".text.shop_desc_seed");
extern "C" void func_0807DE0C(void * scene, u32 catalog_index) SECTION(".text.shop_desc_supermarket");
extern "C" void func_0807E51C(void * scene, u32 slot) SECTION(".text.shop_desc_medicine");
extern "C" void func_0807F684(void * scene, u32 slot) SECTION(".text.shop_desc_mixed");
extern "C" void func_08081108(void * scene, u32 catalog_index) SECTION(".text.shop_desc_record");

void func_0807D1DC(void * scene, u32 slot)
{
    ShopItemEntry const * catalog = gUnk_080FDDD8;

    i32 catalog_index = *reinterpret_cast<i32 *>(
        reinterpret_cast<u8 *>(scene) + 0x2A8 + slot * sizeof(i32));

    Tool item(catalog[catalog_index].item_or_service_id);
    func_080CABEC(scene, item.GetDesc());
}

void func_0807DE0C(void * scene, u32 catalog_index)
{
    Food item(gUnk_080FDFA4[catalog_index].item_or_service_id);
    func_080CABEC(scene, item.GetDesc());
}

void func_0807E51C(void * scene, u32 slot)
{
    ShopItemEntry const * catalog = gUnk_080FE050;

    i32 catalog_index = *reinterpret_cast<i32 *>(
        reinterpret_cast<u8 *>(scene) + 0x2A8 + slot * sizeof(i32));

    Food item(catalog[catalog_index].item_or_service_id);
    func_080CABEC(scene, item.GetDesc());
}

void func_0807F684(void * scene, u32 slot)
{
    i32 catalog_index = *reinterpret_cast<i32 *>(
        reinterpret_cast<u8 *>(scene) + 0x2A8 + slot * sizeof(i32));

    bool is_article = false;

    if (catalog_index <= 2)
        is_article = true;

    char const * desc;

    if (!is_article)
    {
        Tool item(gUnk_080FE484[catalog_index].item_or_service_id);
        desc = item.GetDesc();
    }
    else
    {
        Article item(gUnk_080FE484[catalog_index].item_or_service_id);
        desc = item.GetDesc();
    }

    func_080CABEC(scene, desc);
}

void func_08081108(void * scene, u32 catalog_index)
{
    if (catalog_index != 10)
    {
        Article item(gUnk_080FE8FC[catalog_index].item_or_service_id);
        func_080CABEC(scene, item.GetDesc());
    }
    else
    {
        func_080CABEC(scene, gUnk_080FE974);
    }
}
