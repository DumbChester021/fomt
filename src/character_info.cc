#include "character_info.hh"

EXTERN_C
extern char const gUnk_08104108[];
extern CharacterInfo const gCharacterInfo[];
char const * func_0809EACC(void const * child);
GameDate func_0809EAD0(void const * child);
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

    return gCharacterInfo[character_id].name;
}

EC char const * func_0809FE3C(void const * social_state, unsigned int character_id) ALIAS(GetCharacterName);

EC GameDate GetCharacterBirthday(void const * social_state, unsigned int character_id, GameDate const & player_date)
{
    register GameDate const * player_date_ptr asm("r8") = &player_date;
    bool is_valid = false;

    if (character_id <= CHARACTER_ID_MAX)
        is_valid = true;

    if (!is_valid)
    {
        GameDate result;
        register unsigned int day asm("r2") = 15;
        result.season = SEASON_SPRING;
        result.day = day;
        return result;
    }

    if (character_id > CHARACTER_ID_CHILD)
        goto regular_birthday;

    switch (character_id)
    {
    case CHARACTER_ID_POPURI:
    case CHARACTER_ID_MARY:
    case CHARACTER_ID_KAREN:
    case CHARACTER_ID_ELLI:
    case CHARACTER_ID_ANN:
    case CHARACTER_ID_HARVEST_GODDESS:
        {
            CharacterInfo const & info = gCharacterInfo[character_id];
            GameDate result;
            Season birthday_season = info.birthday.GetSeason();
            unsigned int day = info.birthday.GetDay();
            result.season = birthday_season;
            day -= 1;

            if (day > 29)
                day %= 30;

            result.day = day;
            register GameDate current_date asm("r2") = *player_date_ptr;

            if (current_date.season == result.season)
            {
                register unsigned int current_day asm("r1") = current_date.day;

                if (current_day + 1 == result.day + 1)
                {
                    GameDate alternate_result;
                    Season alternate_season = info.alternate_birthday.GetSeason();
                    unsigned int alternate_day = info.alternate_birthday.GetDay();
                    alternate_result.season = alternate_season;
                    day = alternate_day - 1;

                    if (day > 29)
                        day %= 30;

                    alternate_result.day = day;
                    result = alternate_result;
                }
            }

            return result;
        }
    case CHARACTER_ID_CHILD:
        return func_0809EAD0(static_cast<u8 const *>(social_state) + 4);
    case CHARACTER_ID_EMPTY_NAME:
    regular_birthday:
    default:
        break;
    }

    CharacterInfo const & info = gCharacterInfo[character_id];
    GameDate result;
    Season birthday_season = info.birthday.GetSeason();
    unsigned int birthday_day = info.birthday.GetDay();
    result.season = birthday_season;
    unsigned int day = birthday_day - 1;

    if (day > 29)
        day %= 30;

    result.day = day;
    return result;
}

EC GameDate func_0809FE74(void const * social_state, unsigned int character_id, GameDate const & player_date) ALIAS(GetCharacterBirthday);
