#include "prelude.h"
EC void func_08050DC8(void *, const void *, u32, u32);
EC void func_08050E50(void *, u32);
EC u8 gUnk_081004E0[];
EC u8 gUnk_08100524[];
EC u8 gUnk_08100540[];
EC u8 gUnk_08100594[];
EC void InitializeMenuSubobject_080e35e8(void * self) SECTION(".text.menu_subobject_init_080e35e8");
void InitializeMenuSubobject_080e35e8(void * self) { u8 * subobject = (u8 *)self + 0x1C8; func_08050DC8(subobject, gUnk_081004E0, 0, 0); func_08050E50(subobject, 57); }
EC void InitializeMenuSubobject_080e3628(void * self) SECTION(".text.menu_subobject_init_080e3628");
void InitializeMenuSubobject_080e3628(void * self) { u8 * subobject = (u8 *)self + 0x1C8; func_08050DC8(subobject, gUnk_08100524, 0, 0); func_08050E50(subobject, 56); }
EC void InitializeMenuSubobject_080e3650(void * self) SECTION(".text.menu_subobject_init_080e3650");
void InitializeMenuSubobject_080e3650(void * self) { u8 * subobject = (u8 *)self + 0x1C8; func_08050DC8(subobject, gUnk_08100540, 0, 0); func_08050E50(subobject, 56); }
EC void InitializeMenuSubobject_080e3734(void * self) SECTION(".text.menu_subobject_init_080e3734");
void InitializeMenuSubobject_080e3734(void * self) { u8 * subobject = (u8 *)self + 0x1C8; func_08050DC8(subobject, gUnk_08100594, 0, 0); func_08050E50(subobject, 56); }
