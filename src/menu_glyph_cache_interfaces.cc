#include "intrusive_callback_list.hh"
#include "item.hh"
#include <new>
#include <string.h>

// Small stateless policy object used by the menu text/parser helpers.
// Its retail vtable is vtable_unk_080E78F0.
struct MenuParsePolicy
{
    virtual ~MenuParsePolicy() {}
    virtual u8 StopOnBoundary() { return 0; }
    virtual u8 AcceptCommand() { return 0; }
    virtual u8 ContinueParsing() { return 1; }
};

// Force old GCC to emit the inline virtuals/destructor. This helper itself is
// intentionally not selected by the retail linker script.
EC MenuParsePolicy * ForceMenuParsePolicy(MenuParsePolicy * storage)
{
    return new (storage) MenuParsePolicy;
}

struct MenuArticleNameProviderView
{
    void * vtable;
    u16 article_id;
};

struct MenuArticleNameResult
{
    u8 valid;
    u8 padding[3];
    char text[32];
};

EC MenuArticleNameResult * BuildMenuArticleName(
    MenuArticleNameResult * out,
    MenuArticleNameProviderView const * self,
    u32 mode) SECTION(".text.menu_article_name");

MenuArticleNameResult * BuildMenuArticleName(
    MenuArticleNameResult * out,
    MenuArticleNameProviderView const * self,
    u32 mode)
{
    char text[32];

    if (mode == 0xFF)
    {
        Article article(self->article_id);
        char const * source = article.GetName();
        u32 length = strlen(source);
        if (length > 31)
            length = 31;

        memcpy(text, source, length);
        text[length] = 0;
        out->valid = 1;
        strcpy(out->text, text);
    }
    else
    {
        text[0] = 0;
        out->valid = 0;
        strcpy(out->text, text);
    }

    return out;
}

struct MenuArticleProviderLifetime
{
    void * vtable;
};

EC u8 vtable_unk_080E76F8[];

EC void DestroyMenuArticleProvider(MenuArticleProviderLifetime * self, u32 flags)
    SECTION(".text.menu_article_provider_dtor");

void DestroyMenuArticleProvider(MenuArticleProviderLifetime * self, u32 flags)
{
    self->vtable = vtable_unk_080E76F8;
    if ((flags & 1) != 0)
        ::operator delete(self);
}

struct AnimalNameProviderView
{
    void * vtable;
    u32 name0;
    u32 name1;
    u32 name2;
    u32 name3;
    int number;
    char const * fallback;
};

union AnimalNameScratch
{
    struct
    {
        char number[8];
        char text[32];
    } main;
    char fallback_text[32];
};

EC void func_0804EC84(int value, char * out, u32 width);
EC char gUnk_080FA796[][13];

static inline void CopyMenuName31(char * dest, char const * source)
{
    u32 length = strlen(source);
    if (length > 31)
        length = 31;
    memcpy(dest, source, length);
    dest[length] = 0;
}

EC MenuArticleNameResult * BuildAnimalNameText(
    MenuArticleNameResult * out,
    AnimalNameProviderView const * self,
    u32 mode) SECTION(".text.menu_animal_name");

MenuArticleNameResult * BuildAnimalNameText(
    MenuArticleNameResult * out,
    AnimalNameProviderView const * self,
    u32 mode)
{
    AnimalNameScratch scratch;
    u32 index;

    switch (mode)
    {
    case 0xFA:
        func_0804EC84(self->number, scratch.main.number, 0);
        CopyMenuName31(scratch.main.text, scratch.main.number);
        out->valid = 1;
        strcpy(out->text, scratch.main.text);
        goto done;

    case 0xFB:
        goto fallback;

    case 0xFC:
        index = self->name0;
        break;
    case 0xFD:
        index = self->name1;
        break;
    case 0xFE:
        index = self->name2;
        break;
    case 0xFF:
        index = self->name3;
        break;

    default:
        goto invalid;
    }

    if (index == 0x80)
        goto fallback;

    CopyMenuName31(scratch.main.text, gUnk_080FA796[index]);
    out->valid = 1;
    strcpy(out->text, scratch.main.text);
    goto done;

invalid:
    {
        char * text = scratch.main.text;
        u32 zero = 0;
        text[0] = zero;
        out->valid = zero;
        strcpy(out->text, text);
        goto done;
    }

fallback:
    CopyMenuName31(scratch.fallback_text, self->fallback);
    out->valid = 1;
    strcpy(out->text, scratch.fallback_text);

done:
    return out;
}

// E78E0 follows the recovered IntrusiveCallbackNode [callback, destructor]
// vtable shape. The derived cleanup owns no additional resources here.
EC void DestroyMenuCallback(IntrusiveCallbackNode * self, u32 flags)
    asm("DestroyMenuCallback") SECTION(".text.menu_callback_dtor");

void DestroyMenuCallback(IntrusiveCallbackNode * self, u32 flags)
{
    DestroyIntrusiveCallbackNode(self, flags);
}
