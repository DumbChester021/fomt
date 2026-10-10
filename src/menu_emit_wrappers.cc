#include "prelude.h"

struct MenuEmitObject { u8 pad_00[0x54]; short x; short y; };
EC void func_08039F90(MenuEmitObject *, u32, u32, u32, int, int, int, int);

EC void EmitMenuObject_080dd3a8(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd3a8");
void EmitMenuObject_080dd3a8(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dd434(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd434");
void EmitMenuObject_080dd434(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dd514(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd514");
void EmitMenuObject_080dd514(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dd5b8(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd5b8");
void EmitMenuObject_080dd5b8(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dd7b8(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd7b8");
void EmitMenuObject_080dd7b8(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dd890(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dd890");
void EmitMenuObject_080dd890(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080dde98(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080dde98");
void EmitMenuObject_080dde98(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }

EC void EmitMenuObject_080ddf3c(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080ddf3c");
void EmitMenuObject_080ddf3c(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,8,2); }

EC void EmitMenuObject_080ddfe0(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080ddfe0");
void EmitMenuObject_080ddfe0(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,8,2); }

EC void EmitMenuObject_080de080(MenuEmitObject * self, u32 a, u32 b, u32 c) SECTION(".text.menu_emit_080de080");
void EmitMenuObject_080de080(MenuEmitObject * self, u32 a, u32 b, u32 c) { func_08039F90(self,a,b,c,self->x,self->y,0,2); }
