#ifndef SCHEDULE_INFO_HH
#define SCHEDULE_INFO_HH

#include "prelude.h"

struct PathPointA
{
    u16 instant;
    i16 coord;
    bool is_y_coord : 1;
};

struct PathPointB
{
    u16 coord;
    u16 speed;
    u16 unk_04; /* duration? */
    u16 facing : 2;
    bool is_y_coord : 1;
};

struct PathInfo
{
    void const * points;
    u16 num_points;
    i16 x_start;
    i16 y_start;
    u32 location_start : 10;
    u32 facing_start : 2;
    bool point_type_select : 1;
};

struct ScheduleEntry
{
    u16 time;
    PathInfo const * path;
};

struct Schedule
{
    u16 num_time_entries;
    ScheduleEntry const * time_entries;
};

struct ScheduleInfo
{
    u32 (*select_schedule)(void const * unk_arg_0);
    u32 num_schedules;
    Schedule const * const * schedules;
};

struct Npc;

EC void ApplyNpcSchedule(Npc * npc, ScheduleInfo const * info, void const * context);
EC void InitializeCharacterSchedules(void * social_state, void const * context);

#endif // SCHEDULE_INFO_HH
