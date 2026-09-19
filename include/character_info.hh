#ifndef CHARACTER_INFO_HH
#define CHARACTER_INFO_HH

#include "prelude.h"
#include "unknown_types.hh"

struct Npc;

enum CharacterId
{
    CHARACTER_ID_EMPTY_NAME = 0,
    CHARACTER_ID_POPURI = 3,
    CHARACTER_ID_MARY = 12,
    CHARACTER_ID_KAREN = 19,
    CHARACTER_ID_ELLI = 21,
    CHARACTER_ID_ANN = 25,
    CHARACTER_ID_HARVEST_GODDESS = 31,
    CHARACTER_ID_CHILD = 35,
    CHARACTER_ID_MAX = 42,
    CHARACTER_COUNT = CHARACTER_ID_MAX + 1,
};

struct PACKED CharacterBirthday
{
    Season season : 2;
    u8 day : 5; // One-based; converted to GameDate's zero-based day by GetCharacterBirthday.

    Season GetSeason() const { return season; }
    unsigned int GetDay() const { return day; }
};

struct CharacterInfo
{
    char const * name;
    CharacterBirthday birthday;
    CharacterBirthday alternate_birthday;
    STRUCT_PAD(0x06, 0x08);
};

EC char const * GetCharacterName(void const * social_state, unsigned int character_id);
EC GameDate GetCharacterBirthday(void const * social_state, unsigned int character_id, GameDate const & player_date);
EC Npc * GetCharacterNpc(void * social_state, unsigned int character_id);

#endif
