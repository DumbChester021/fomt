#include "character_info.hh"

EXTERN_C
extern char const gUnk_08104108[];
extern CharacterInfo const gUnk_08104258[];
char const * func_0809EACC(void const * child);
EXTERN_C_END

EC char const * GetCharacterName(void const * social_state, unsigned int character_id)
{
    bool is_valid = false;

    if (character_id <= CHARACTER_ID_MAX)
        is_valid = true;

    if (!is_valid)
        return gUnk_08104108;

    if (character_id != CHARACTER_ID_EMPTY_NAME)
    {
        asm("" : "+r"(character_id));

        if (character_id == CHARACTER_ID_CHILD)
            return func_0809EACC(static_cast<u8 const *>(social_state) + 4);
    }

    return gUnk_08104258[character_id].name;
}

EC char const * func_0809FE3C(void const * social_state, unsigned int character_id) ALIAS(GetCharacterName);
