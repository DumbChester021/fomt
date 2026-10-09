#include "prelude.h"

EC void func_08010F24(u8 * state) SECTION(".text.game_state_flag_setters");
EC void func_08010F30(u8 * state) SECTION(".text.game_state_flag_setters");
EC void func_08010F3C(u8 * state) SECTION(".text.game_state_flag_setters");
EC void func_08010F48(u8 * state) SECTION(".text.game_state_flag_setters");

void func_08010F24(u8 * state) { *state |= 1; }
void func_08010F30(u8 * state) { *state |= 2; }
void func_08010F3C(u8 * state) { *state |= 4; }
void func_08010F48(u8 * state) { *state |= 8; }
