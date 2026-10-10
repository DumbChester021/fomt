#include "dog.hh"

// This particular old-toolchain assignment uses a compiler-generated
// Animal operator= symbol. Keep Animal's implicit assignment available to
// other TUs rather than changing its class declaration globally.
EXTERN_C Animal * CopyAnimalBase(Animal *, Animal const *)
    asm("__as__6AnimalRC6Animal"); EXTERN_C_END

// Preserve the base-class assignment call and copy Dog's saved fields by
// their real typed members. The Animal assignment is out-of-line in retail.
EC Dog * CopySavedDogState(Dog *dest, Dog const *src)
    SECTION(".text.save_dog_copy");
EC Dog * CopySavedDogState(Dog *dest, Dog const *src)
{
    CopyAnimalBase(dest, src);
    dest->adequacy = src->adequacy;
    dest->has_played_today = src->has_played_today;
    dest->has_talked_today = src->has_talked_today;
    dest->unk_20 = src->unk_20;
    dest->unk_24 = src->unk_24;
    dest->frisbee_record = src->frisbee_record;
    dest->unk_2D_2 = src->unk_2D_2;
    dest->frisbee_gauge_limit = src->frisbee_gauge_limit;
    return dest;
}
EC Dog * func_080D67C8(Dog * dest, Dog const * src)
    ALIAS(CopySavedDogState);
