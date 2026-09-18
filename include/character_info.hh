#ifndef CHARACTER_INFO_HH
#define CHARACTER_INFO_HH

#include "prelude.h"

enum CharacterId
{
    CHARACTER_ID_EMPTY_NAME = 0,
    CHARACTER_ID_CHILD = 35,
    CHARACTER_ID_MAX = 42,
    CHARACTER_COUNT = CHARACTER_ID_MAX + 1,
};

struct CharacterInfo
{
    char const * name;
    u32 unk_04;
};

EC char const * GetCharacterName(void const * social_state, unsigned int character_id);

#endif
