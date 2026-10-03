#include "npc.hh"
#include "schedule_info.hh"

EC void ApplyNpcSchedule(Npc * npc, ScheduleInfo const * info, void const * context)
{
    u32 schedule_index = info->select_schedule(context);
    PathInfo const * path = nullptr;

    if (info->schedules != nullptr)
    {
        Schedule const * schedule = info->schedules[schedule_index];

        if (schedule != nullptr && schedule->num_time_entries != 0 && schedule->time_entries != nullptr)
            path = schedule->time_entries[0].path;
    }

    ActorLocation location = path != nullptr
        ? ActorLocation(Location(path->location_start, path->x_start, path->y_start), path->facing_start)
        : ActorLocation(Location(MAP_NONE, 0, 0), 0);

    npc->SetLocation(location);
    npc->unk_0C_0 = schedule_index;
    npc->unk_0C_5 = 0;
    npc->unk_0D_2 = 0;
    npc->unk_0D_7 = 0;
}

EXTERN_C
Npc * func_080A0A04(void *);
extern ScheduleInfo const gUnk_080F280C;
extern ScheduleInfo const ScheduleInfo_Unk_080F1A80;
extern ScheduleInfo const gUnk_080F1FC0;
extern ScheduleInfo const gUnk_080F8678;
extern ScheduleInfo const gUnk_080F81BC;
extern ScheduleInfo const gUnk_080F77FC;
extern ScheduleInfo const gUnk_080F7294;
extern ScheduleInfo const gUnk_080F6370;
extern ScheduleInfo const gUnk_080F66C4;
extern ScheduleInfo const gUnk_080F49C0;
extern ScheduleInfo const gUnk_080F5540;
extern ScheduleInfo const gUnk_080F4D74;
extern ScheduleInfo const gUnk_080F59CC;
extern ScheduleInfo const gUnk_080F6B4C;
extern ScheduleInfo const gUnk_080F33B8;
extern ScheduleInfo const gUnk_080F61FC;
extern ScheduleInfo const gUnk_080F3408;
extern ScheduleInfo const gUnk_080F3FD8;
extern ScheduleInfo const gUnk_080F35E4;
extern ScheduleInfo const gUnk_080F3010;
extern ScheduleInfo const gUnk_080F5D94;
extern ScheduleInfo const gUnk_080F6DE8;
extern ScheduleInfo const gUnk_080F2AF8;
extern ScheduleInfo const gUnk_080F42F0;
extern ScheduleInfo const gUnk_080F43DC;
extern ScheduleInfo const gUnk_080F6FF8;
extern ScheduleInfo const gUnk_080F7B40;
extern ScheduleInfo const gUnk_080F2DC0;
extern ScheduleInfo const gUnk_080F597C;
extern ScheduleInfo const gUnk_080F6B10;
extern ScheduleInfo const gUnk_080F4974;
extern ScheduleInfo const gUnk_080F29C0;
EXTERN_C_END

EC void InitializeCharacterSchedules(void * social_state, void const * context)
{
    u8 * state = static_cast<u8 *>(social_state);

    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x070), &gUnk_080F280C, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x084), &ScheduleInfo_Unk_080F1A80, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x098), &gUnk_080F1FC0, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x0B0), &gUnk_080F8678, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x0C4), &gUnk_080F81BC, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x0D8), &gUnk_080F77FC, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x0F0), &gUnk_080F7294, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x104), &gUnk_080F6370, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x118), &gUnk_080F66C4, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x12C), &gUnk_080F49C0, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x140), &gUnk_080F5540, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x154), &gUnk_080F4D74, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x16C), &gUnk_080F59CC, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x180), &gUnk_080F6B4C, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x194), &gUnk_080F33B8, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x1A8), &gUnk_080F61FC, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x1BC), &gUnk_080F3408, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x1D0), &gUnk_080F3FD8, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x1E4), &gUnk_080F35E4, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x1FC), &gUnk_080F3010, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x210), &gUnk_080F5D94, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x228), &gUnk_080F6DE8, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x23C), &gUnk_080F2AF8, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x250), &gUnk_080F42F0, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x264), &gUnk_080F43DC, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x27C), &gUnk_080F6FF8, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x290), &gUnk_080F7B40, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x2A8), &gUnk_080F2DC0, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x2BC), &gUnk_080F597C, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x310), &gUnk_080F6B10, context);
    ApplyNpcSchedule(reinterpret_cast<Npc *>(state + 0x328), &gUnk_080F4974, context);

    Npc * child = func_080A0A04(social_state);

    if (child != nullptr)
        ApplyNpcSchedule(child, &gUnk_080F29C0, context);
}

EC void func_0803D688(Npc * npc, ScheduleInfo const * info, void const * context) ALIAS(ApplyNpcSchedule);
EC void func_0803D7E4(void * social_state, void const * context) ALIAS(InitializeCharacterSchedules);
