#include "prelude.h"

struct MenuPointerView {
    u8 prefix[0xAC];
    void *resource;
};

EC void func_080D6F0C(void *);
EC void func_080D6F3C(void *);
EC void func_08050E8C(void *);
EC void func_08050E5C(void *);
EC void func_08050E74(void *);

EC void InitializeMenuPair_080d6f1c(void * ptr) SECTION(".text.menu_pair_080d6f1c");
void InitializeMenuPair_080d6f1c(void * ptr)
{
    u8 *self = (u8 *)ptr;
    func_080D6F0C(self + 16);
    func_080D6F0C(self + 4);
    self[0] = 0;
    self[1] = 1;
}

EC void InitializeMenuPair_080d6f5c(void * ptr) SECTION(".text.menu_pair_080d6f5c");
void InitializeMenuPair_080d6f5c(void * ptr)
{
    u8 *self = (u8 *)ptr;
    func_080D6F3C(self + 64);
    func_080D6F3C(self + 4);
    self[0] = 0;
    self[1] = 1;
}

EC void ReleaseMenuResource_080d7f60(MenuPointerView *self) SECTION(".text.menu_resource_080d7f60");
void ReleaseMenuResource_080d7f60(MenuPointerView *self)
{
    if (self->resource)
        func_08050E8C(self->resource);
}

EC void ReleaseMenuResource_080d7f74(MenuPointerView *self) SECTION(".text.menu_resource_080d7f74");
void ReleaseMenuResource_080d7f74(MenuPointerView *self)
{
    if (self->resource)
        func_08050E5C(self->resource);
}

EC void ReleaseMenuResource_080d7f88(MenuPointerView *self) SECTION(".text.menu_resource_080d7f88");
void ReleaseMenuResource_080d7f88(MenuPointerView *self)
{
    if (self->resource)
        func_08050E74(self->resource);
}
