#include "prelude.h"

EC int rand(void);

// Generate a nonzero random value for GameState initialization.
EC int GenerateNonzeroRandomValue(void) SECTION(".text.game_state_nonzero_random");
EC int GenerateNonzeroRandomValue(void)
{
    int value;
    do {
        value = rand();
    } while (value == 0);
    return value;
}
EC int func_08010348(void) ALIAS(GenerateNonzeroRandomValue);
