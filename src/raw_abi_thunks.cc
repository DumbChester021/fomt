#include "prelude.h"

extern void Raw0080C(void *) asm("func_0800080C");
extern void Raw098AC(void *) asm("func_080098AC");
extern void Raw76E0C(void *) asm("func_08076E0C");
extern void Raw70C88(void *) asm("func_08070C88");

#define RAW_ABI_THUNK(section_name, name, target) \
    EC void name(void * self) SECTION(section_name); \
    void name(void * self) { target(self); }

RAW_ABI_THUNK(".text.raw_thunks_d3c60", func_080D3C60, Raw0080C)
RAW_ABI_THUNK(".text.raw_thunks_d3c60", func_080D3C6C, Raw0080C)
RAW_ABI_THUNK(".text.raw_thunks_d7868", func_080D7868, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_d7868", func_080D7874, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_d7b2c", func_080D7B2C, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_d7b2c", func_080D7B38, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_d7b2c", func_080D7B44, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e0a7c", func_080E0A7C, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e0a7c", func_080E0A88, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e1018", func_080E1018, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e1018", func_080E1024, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e1018", func_080E1030, Raw098AC)
RAW_ABI_THUNK(".text.raw_thunks_e1d8c", func_080E1D8C, Raw76E0C)
RAW_ABI_THUNK(".text.raw_thunks_e1d8c", func_080E1D98, Raw76E0C)
RAW_ABI_THUNK(".text.raw_thunks_e1d8c", func_080E1DA4, Raw76E0C)
RAW_ABI_THUNK(".text.raw_thunks_e1d8c", func_080E1DB0, Raw76E0C)
RAW_ABI_THUNK(".text.raw_thunks_e20f8", func_080E20F8, Raw70C88)
RAW_ABI_THUNK(".text.raw_thunks_e20f8", func_080E2104, Raw70C88)
RAW_ABI_THUNK(".text.raw_thunks_e20f8", func_080E2110, Raw70C88)
