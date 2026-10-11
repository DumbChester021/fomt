#include "saved_social_state.hh"
#include <string.h>

EC SavedSocialState * CopySavedSocialState(SavedSocialState * dest, SavedSocialState const * src)
    SECTION(".text.save_social_copy");
EC SavedSocialState * CopySavedSocialState(SavedSocialState * dest, SavedSocialState const * src)
{
    dest->packed_header.flag_0_5 = src->packed_header.flag_0_5;
    dest->packed_header.flag_6_12 = src->packed_header.flag_6_12;
    dest->packed_header.flag_13_20 = src->packed_header.flag_13_20;
    dest->packed_header.flag_21 = src->packed_header.flag_21;
    dest->packed_header.flag_22_24 = src->packed_header.flag_22_24;
    dest->packed_header.flag_25 = src->packed_header.flag_25;
    dest->packed_header.flag_26_28 = src->packed_header.flag_26_28;
    dest->child_prefix = src->child_prefix;
    strcpy(dest->child_name, src->child_name);
    u8 * child_dest = dest->child_values;
    *child_dest = src->child_values[0];
    u8 second_child_value = src->child_values[1];
    ++child_dest;
    *child_dest = second_child_value;
    dest->child_active = src->child_active;
    dest->child_word_2c = src->child_word_2c;
    dest->child_chunks[0] = src->child_chunks[0];
    dest->child_chunks[1] = src->child_chunks[1];
    dest->child_chunks[2] = src->child_chunks[2];
    dest->child_chunks[3] = src->child_chunks[3];
    dest->child_chunks[4] = src->child_chunks[4];
    dest->child_chunks[5] = src->child_chunks[5];
    dest->child_chunks[6] = src->child_chunks[6];
    dest->child_chunks[7] = src->child_chunks[7];
    dest->lillia = src->lillia;
    dest->rick = src->rick;
    dest->popuri = src->popuri;
    dest->barley = src->barley;
    dest->may = src->may;
    dest->saibara = src->saibara;
    dest->gray = src->gray;
    dest->duke = src->duke;
    dest->manna = src->manna;
    dest->basil = src->basil;
    dest->anna = src->anna;
    dest->mary = src->mary;
    dest->thomas = src->thomas;
    dest->harris = src->harris;
    dest->ellen = src->ellen;
    dest->stu = src->stu;
    dest->jeff = src->jeff;
    dest->sasha = src->sasha;
    dest->karen = src->karen;
    dest->doctor = src->doctor;
    dest->elli = src->elli;
    dest->carter = src->carter;
    dest->cliff = src->cliff;
    dest->doug = src->doug;
    dest->ann = src->ann;
    dest->kai = src->kai;
    dest->gotz = src->gotz;
    dest->zack = src->zack;
    dest->won = src->won;
    dest->gourmet = src->gourmet;
    dest->goddess = src->goddess;
    dest->kappa = src->kappa;
    dest->lou = src->lou;
    dest->lu = src->lu;
    dest->staid = src->staid;
    dest->nappy = src->nappy;
    dest->bold = src->bold;
    dest->chef = src->chef;
    dest->aqua = src->aqua;
    dest->hoggy = src->hoggy;
    dest->timid = src->timid;
    memcpy(dest->suffix, src->suffix, sizeof(dest->suffix));
    dest->last_word = src->last_word;
    dest->last_byte = src->last_byte;
    return dest;
}

EC SavedSocialState * func_080D60B0(SavedSocialState * dest, SavedSocialState const * src)
    ALIAS(CopySavedSocialState);
