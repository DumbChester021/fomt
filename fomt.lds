OUTPUT_ARCH(arm)

_M4aNumMusicPlayers = 5;
_M4aMaxLines = 0x50;

gMPlayJumpTableTemplate = 0x08139A88;
gScaleTable = 0x08139B18;
gFreqTable = 0x08139BCC;
gPcmSamplesPerVBlankTable = 0x08139BFC;
gCgbScaleTable = 0x08139C14;
gCgbFreqTable = 0x08139C98;
gNoiseTable = 0x08139CB0;
gCgb3Vol = 0x08139CEC;
gClockTable = 0x08139CFC;
gXcmdTable = 0x08139D30;

__vt_7UnkPoly = vtable_unk_080E82D8;
func_08007874 = __13UnkHandleBase;
func_080079E8 = _._13UnkHandleBase;
func_0803AC78 = _._12Unk_0803AB30;
func_0803B0A8 = _._12Unk_0803AEA0;
func_080A47B4 = _._7UnkPoly;
__vt_18UnknownEntityThing = vtable_unk_080E68B4;
__vt_22UnknownEntityThingBase = vtable_unk_080E65E0;
_._18UnknownEntityThing = func_080DC8F8;
__vt_12LilliaEntity = vtable_unk_080E7198;
func_08035AFC = __12LilliaEntityP10GameObjectP3NpcUi;
func_08035B38 = vfunc_30__12LilliaEntity;

__vt_10RickEntity = vtable_unk_080E7158;
func_08035B64 = __10RickEntityP10GameObjectP3NpcUi;
func_08035B9C = vfunc_30__10RickEntity;
__vt_12PopuriEntity = vtable_unk_080E7118;
func_08035BC8 = __12PopuriEntityP10GameObjectP3NpcUi;
func_08035CD4 = vfunc_30__12PopuriEntity;
__vt_12BarleyEntity = vtable_unk_080E70D8;
func_08035D04 = __12BarleyEntityP10GameObjectP3NpcUi;
func_08035D40 = vfunc_30__12BarleyEntity;
__vt_9MayEntity = vtable_unk_080E7098;
func_08035D70 = __9MayEntityP10GameObjectP3NpcUi;
func_08035DAC = vfunc_30__9MayEntity;
__vt_13SaibaraEntity = vtable_unk_080E7058;
func_08035DD8 = __13SaibaraEntityP10GameObjectP3NpcUi;
func_08035E14 = vfunc_30__13SaibaraEntity;
__vt_10GrayEntity = vtable_unk_080E7018;
func_08035E40 = __10GrayEntityP10GameObjectP3NpcUi;
func_08035E7C = vfunc_30__10GrayEntity;
__vt_10DukeEntity = vtable_unk_080E6FD8;
func_08035EAC = __10DukeEntityP10GameObjectP3NpcUi;
func_08035EE4 = vfunc_30__10DukeEntity;
__vt_11MannaEntity = vtable_unk_080E6F98;
func_08035F10 = __11MannaEntityP10GameObjectP3NpcUi;
func_08035F48 = vfunc_30__11MannaEntity;
__vt_11BasilEntity = vtable_unk_080E6F58;
func_08035F74 = __11BasilEntityP10GameObjectP3NpcUi;
func_08035FB0 = vfunc_30__11BasilEntity;
__vt_10AnnaEntity = vtable_unk_080E6F18;
func_08035FE0 = __10AnnaEntityP10GameObjectP3NpcUi;
func_0803601C = vfunc_30__10AnnaEntity;
__vt_10MaryEntity = vtable_unk_080E6ED8;
func_08036048 = __10MaryEntityP10GameObjectP3NpcUi;
func_08036154 = vfunc_30__10MaryEntity;
__vt_12ThomasEntity = vtable_unk_080E6E98;
func_08036184 = __12ThomasEntityP10GameObjectP3NpcUi;
func_080361C0 = vfunc_30__12ThomasEntity;
__vt_12HarrisEntity = vtable_unk_080E6E58;
func_080361EC = __12HarrisEntityP10GameObjectP3NpcUi;
func_08036228 = vfunc_30__12HarrisEntity;
__vt_11EllenEntity = vtable_unk_080E6E18;
func_08036258 = __11EllenEntityP10GameObjectP3NpcUi;
func_08036290 = vfunc_30__11EllenEntity;
__vt_9StuEntity = vtable_unk_080E6DD8;
func_080362C0 = __9StuEntityP10GameObjectP3NpcUi;
func_080362FC = vfunc_30__9StuEntity;
__vt_10JeffEntity = vtable_unk_080E6D98;
func_08036328 = __10JeffEntityP10GameObjectP3NpcUi;
func_08036364 = vfunc_30__10JeffEntity;
__vt_11SashaEntity = vtable_unk_080E6D58;
func_08036390 = __11SashaEntityP10GameObjectP3NpcUi;
func_080363CC = vfunc_30__11SashaEntity;
__vt_11KarenEntity = vtable_unk_080E6D18;
func_080363F8 = __11KarenEntityP10GameObjectP3NpcUi;
func_08036500 = vfunc_30__11KarenEntity;
__vt_12DoctorEntity = vtable_unk_080E6CD8;
func_08036530 = __12DoctorEntityP10GameObjectP3NpcUi;
func_08036564 = vfunc_30__12DoctorEntity;
__vt_10ElliEntity = vtable_unk_080E6C98;
func_08036590 = __10ElliEntityP10GameObjectP3NpcUi;
func_0803669C = vfunc_30__10ElliEntity;
__vt_12CarterEntity = vtable_unk_080E6C58;
func_080366CC = __12CarterEntityP10GameObjectP3NpcUi;
func_08036704 = vfunc_30__12CarterEntity;
__vt_11CliffEntity = vtable_unk_080E6C18;
func_08036730 = __11CliffEntityP10GameObjectP3NpcUi;
func_080367C8 = vfunc_30__11CliffEntity;
__vt_10DougEntity = vtable_unk_080E6BD8;
func_080367F8 = __10DougEntityP10GameObjectP3NpcUi;
func_08036834 = vfunc_30__10DougEntity;
__vt_9AnnEntity = vtable_unk_080E6B58;
func_080368C4 = __9AnnEntityP10GameObjectP3NpcUi;
func_080369E0 = vfunc_30__9AnnEntity;
__vt_9KaiEntity = vtable_unk_080E6B18;
func_08036A10 = __9KaiEntityP10GameObjectP3NpcUi;
func_08036A4C = vfunc_30__9KaiEntity;
__vt_10GotzEntity = vtable_unk_080E6AD8;
func_08036A78 = __10GotzEntityP10GameObjectP3NpcUi;
func_08036B1C = vfunc_30__10GotzEntity;
__vt_10ZackEntity = vtable_unk_080E6A98;
func_08036B4C = __10ZackEntityP10GameObjectP3NpcUi;
func_08036B80 = vfunc_30__10ZackEntity;
__vt_9WonEntity = vtable_unk_080E6A58;
func_08036C48 = __9WonEntityP10GameObjectP3NpcUi;
func_08036C80 = vfunc_30__9WonEntity;
__vt_13GourmetEntity = vtable_unk_080E6A18;
func_08036CAC = __13GourmetEntityP10GameObjectP3NpcUi;
func_08036CDC = vfunc_30__13GourmetEntity;
__vt_20HarvestGoddessEntity = vtable_unk_080E69D8;
func_08036D0C = __20HarvestGoddessEntityP10GameObjectP3NpcUi;
func_08036D3C = vfunc_30__20HarvestGoddessEntity;
__vt_11KappaEntity = vtable_unk_080E6998;
func_08036D68 = __11KappaEntityP10GameObjectP3NpcUi;
func_08036D98 = vfunc_30__11KappaEntity;
__vt_8LuEntity = vtable_unk_080E6B98;
func_08036860 = __8LuEntityP10GameObjectP3NpcUi;
func_08036898 = vfunc_30__8LuEntity;

__vt_9LouEntity = vtable_unk_080E6958;
func_08036DC4 = __9LouEntityP10GameObjectP3NpcUi;
func_08036E00 = vfunc_30__9LouEntity;
__vt_11ChildEntity = vtable_unk_080E6918;
func_08036E2C = __11ChildEntityP10GameObjectP3NpcUi;
func_08036EF0 = vfunc_3C__11ChildEntityUi;

__vt_14UnkEntity37008 = vtable_unk_080E7328;
func_08037008 = __14UnkEntity37008P10GameObjectR13ActorLocationUiUi;
func_08037048 = _._14UnkEntity37008;
func_08037244 = SetBox__14UnkEntity37008RC3Box;
func_08037430 = vfunc_34__14UnkEntity37008;
func_08037434 = vfunc_10__14UnkEntity37008;
func_0803745C = vfunc_14__14UnkEntity37008;
func_08037470 = GetBox__C14UnkEntity37008;

__vt_13UnkEntity72E4 = vtable_unk_080E72E4;
func_0803753C = vfunc_30__13UnkEntity72E4;
__vt_13UnkEntity72A0 = vtable_unk_080E72A0;
func_080376E4 = vfunc_30__13UnkEntity72A0;
__vt_13UnkEntity725C = vtable_unk_080E725C;
func_0803788C = vfunc_30__13UnkEntity725C;
func_080378B8 = vfunc_3C__13UnkEntity725C;
func_080378EC = GetAnim__13UnkEntity725CUi;
__vt_13UnkEntity7218 = vtable_unk_080E7218;
func_080379D8 = vfunc_30__13UnkEntity7218;
func_08037A04 = vfunc_3C__13UnkEntity7218;
func_08037A38 = GetAnim__13UnkEntity7218Ui;
func_08037618 = GetAnim__13UnkEntity72E4Ui;
func_08037628 = GetSpeed__13UnkEntity72E4Ui;
func_080377C4 = GetAnim__13UnkEntity72A0Ui;
func_080377D4 = GetSpeed__13UnkEntity72A0Ui;
func_080378FC = GetSpeed__13UnkEntity725CUi;
func_08037A48 = GetSpeed__13UnkEntity7218Ui;
func_08037BB8 = __13UnkEntity7218P10GameObjectR13ActorLocation;
func_08037BE0 = __13UnkEntity725CP10GameObjectR13ActorLocation;
__vt_10BallEntity = vtable_unk_080E73B4;
func_08038028 = __10BallEntityP10GameObjectR8Location;
func_080380EC = Launch__10BallEntityUi;
func_08038108 = IsActive__C10BallEntity;
func_0803834C = GetBox__C10BallEntity;
func_0803836C = GetFlightHeight__C10BallEntity;
__vt_11Entity38740 = vtable_unk_080E7380;
__vt_11Entity398A4 = vtable_unk_080E74DC;
__vt_12Strategy74CC = vtable_unk_080E74CC;
__vt_12Strategy74BC = vtable_unk_080E74BC;
__vt_12Strategy74AC = vtable_unk_080E74AC;
__vt_12Strategy749C = vtable_unk_080E749C;
__vt_12Strategy748C = vtable_unk_080E748C;
func_08038740 = __11Entity38740P10GameObjectPv;
func_080387A0 = vfunc_30__11Entity38740;
func_080387B8 = MethodB8__11Entity38740;
func_080387C8 = MethodC8__11Entity38740;
func_080387D8 = MethodD8__11Entity38740;
func_080387EC = MethodEC__11Entity38740;
func_080387FC = MethodFC__11Entity38740;
func_0803880C = Method0C__11Entity38740;
func_0801FD0C = vfunc_3C__10GameObjectUi;
gUnk_08104258 = gCharacterInfo;

MEMORY
{
    EWRAM (w!x) : ORIGIN = 0x02000000, LENGTH = 256K
    IWRAM (w!x) : ORIGIN = 0x03000000, LENGTH = 32K
    ROM   (rx)  : ORIGIN = 0x08000000, LENGTH = 32M
}

SECTIONS
{
    .ewram_bss (NOLOAD) : ALIGN(4)
    {
        . = ALIGN(4); src/sound_data.o(.sbss);
        . = ALIGN(4); src/m4a.o(.gSoundInfo);
        . = ALIGN(4); src/m4a.o(.gMPlayJumpTable);
        . = ALIGN(4); src/m4a.o(.gCgbChans);
        . = ALIGN(4); src/m4a.o(.gMusicPlayerA);
        . = ALIGN(4); src/m4a.o(.gMusicPlayerB);
        . = ALIGN(4); src/m4a.o(.gMusicPlayerC);
        . = ALIGN(4); src/m4a.o(.gMusicPlayerE);
        . = ALIGN(4); src/m4a.o(.gMPlayMemAccArea);
        . = ALIGN(4); src/m4a.o(.gMusicPlayerD);
        __ewram_bss_end = .;
    } > EWRAM

    .bss (NOLOAD) : ALIGN(4)
    {
        . = ALIGN(4); src/m4a.o(.bss);
        . = ALIGN(4);
        . = 0x000400; gUnk_03000400 = .;
        . = 0x000402; gUnk_03000402 = .;
        . = 0x000404; gUnk_03000404 = .;
        . = 0x000408; gUnk_03000408 = .;
        . = 0x00040C; gUnk_0300040C = .;
        . = 0x000410; gUnk_03000410 = .;
        . = 0x000414; gUnk_03000414 = .;
        . = 0x000418; gUnk_03000418 = .;
        . = 0x00041C; gUnk_0300041C = .;
        . = 0x000420; gUnk_03000420 = .;
        . = 0x000430; gUnk_03000430 = .;
        . = 0x000450; gUnk_03000450 = .;
        . = 0x000490; /* end */
    } > IWRAM

    .rom : ALIGN(4)
    {
        src/crt0.o(.rom_header);
        asm/main.o(.text);
        asm/sram_proxy_1.o(.text);
        src/save_format.o(.text);
        asm/sram_proxy_1.o(.text.after_save_format);
        asm/interrupt.o(.text);
        src/new.o(.text);
        src/pure_virtual.o(.text);
        asm/sram_proxy_2.o(.text);
        src/scene.o(.text);
        asm/scene.o(.text);
        asm/intro_scene.o(.text);
        asm/new_game.o(.text);
        src/hardware.o(.text);
        asm/hardware.o(.text);
        src/resource_handle.o(.text.resource_handle_ctor);
        asm/hardware.o(.text.after_resource_handle_ctor);
        src/resource_handle.o(.text.resource_handle_dtor);
        asm/hardware.o(.text.after_resource_handle_dtor);
        src/resource_handle.o(.text.resource_handle_acquire);
        src/resource_handle.o(.text.resource_handle_ops);
        asm/hardware.o(.text.after_resource_handle_ops);
        src/resource_handle.o(.text.resource_block_reset);
        src/resource_handle.o(.text.resource_block_ranges);
        asm/hardware.o(.text.after_resource_block_reset);
        src/resource_handle.o(.text.resource_block_free);
        asm/hardware.o(.text.after_resource_block_free);
        src/hardware_context.o(.text.hardware_get_context);
        asm/hardware.o(.text.after_hardware_get_context);
        src/hardware_context.o(.text.hardware_accessors);
        asm/hardware.o(.text.after_hardware_accessors);
        src/hardware_context.o(.text.hardware_vblank_callbacks);
        asm/hardware.o(.text.after_hardware_vblank_callbacks);
        src/hardware_transfer.o(.text.hardware_transfer_setup);
        asm/hardware.o(.text.after_hardware_transfer_setup);
        src/hardware_transfer.o(.text.hardware_transfer_execute);
        asm/hardware.o(.text.after_hardware_transfer_execute);
        src/key_input.o(.text);
        asm/hardware.o(.text.after_key_input);
        src/intrusive_callback_list.o(.text.intrusive_callback_node_destroy);
        asm/hardware.o(.text.after_intrusive_callback_node_destroy);
        src/intrusive_callback_list.o(.text.intrusive_callback_list_destroy);
        asm/hardware.o(.text.after_intrusive_callback_list_destroy);
        src/intrusive_callback_list.o(.text.intrusive_callback_list_append);
        asm/hardware.o(.text.after_intrusive_callback_list_append);
        src/intrusive_callback_list.o(.text.intrusive_callback_list_remove);
        asm/hardware.o(.text.after_intrusive_callback_list_remove);
        src/intrusive_callback_list.o(.text.intrusive_callback_list_clear);
        asm/hardware.o(.text.after_intrusive_callback_list_clear);
        src/farm.o(.text);
        src/field.o(.text);
        src/shipping_bin.o(.text);
        src/tool_chest.o(.text);
        src/fridge.o(.text);
        src/shelf.o(.text);
        src/record_player.o(.text);
        src/code_0800BC58.o(.text);
        src/farm_house.o(.text);
        src/coop.o(.text);
        src/barn.o(.text);
        src/item.o(.text);
        src/code_0800E2E4.o(.text);
        src/farmer.o(.text);
        src/rucksack_item.o(.text);
        src/held_item.o(.text);
        src/rucksack.o(.text);
        asm/more_items.o(.text);
        asm/game_scene.o(.text);
        asm/game_state.o(.text);
        src/save_format.o(.text.save_record);
        asm/game_state.o(.text.after_save_record);
        src/code_08017C00.o(.text);
        asm/game_state.o(.text.after_func_08017C00);
        src/code_0801A8C0.o(.text);
        asm/game_state.o(.text.after_time_period);
        src/game_object_article_interaction.o(.text);
        asm/game_state.o(.text.after_article_interaction);
        src/game_object_discard.o(.text);
        asm/game_state.o(.text.after_discarded_item);
        src/game_object_entity_lookup.o(.text);
        asm/game_state.o(.text.after_entity_lookups);
        src/entity.o(.text);
        src/code_entity_08020018.o(.text);
        asm/code_entities.o(.text);
        src/farmer_entity_item_action.o(.text);
        asm/code_entities.o(.text.after_func_0802A7E0);
        src/entity_actor.o(.text);
        asm/code_entities_080320DC.o(.text);
        src/entity_effect.o(.text);
        asm/code_entities_080320DC.o(.text.after_func_08032690);
        src/npc_entity.o(.text);
        asm/code_entities_08034CEC.o(.text);
        src/entity_lillia.o(.text);
        src/entity_resident_npcs.o(.text.npc_resident_run1);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run1);
        src/entity_resident_npcs.o(.text.npc_resident_run2);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run2);
        src/entity_resident_npcs.o(.text.npc_resident_run3);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run3);
        src/entity_resident_npcs.o(.text.npc_resident_run4);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run4);
        src/entity_resident_npcs.o(.text.npc_resident_run5);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run5);
        src/entity_resident_npcs.o(.text.npc_resident_run6);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run6);
        src/entity_resident_npcs.o(.text.npc_resident_run7);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run7);
        src/entity_resident_npcs.o(.text.npc_resident_run8);
        asm/code_entities_08034CEC.o(.text.after_npc_resident_run8);
        src/entity_resident_npcs.o(.text.npc_resident_run9);
        src/entity_resident_npcs.o(.text.npc_special_run1);
        asm/code_entities_08034CEC.o(.text.after_npc_special_run1);
        src/entity_resident_npcs.o(.text.npc_special_run2);
        asm/code_entities_08034CEC.o(.text.after_npc_special_run2);
        src/entity_unk_08037008.o(.text.entity_locbound_run1);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run1);
        src/entity_unk_08037008.o(.text.entity_locbound_run1b);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run1b);
        src/entity_unk_08037008.o(.text.entity_locbound_run2);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run2);
        src/entity_unk_08037008.o(.text.entity_locbound_run3);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run3);
        src/entity_unk_08037008.o(.text.entity_locbound_run3b);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run3b);
        src/entity_unk_08037008.o(.text.entity_locbound_run4);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run4);
        src/entity_unk_08037008.o(.text.entity_locbound_run4b);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run4b);
        src/entity_unk_08037008.o(.text.entity_locbound_run5);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run5);
        src/entity_unk_08037008.o(.text.entity_locbound_run6);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run6);
        src/entity_unk_08037008.o(.text.entity_locbound_run8);
        asm/code_entities_08034CEC.o(.text.after_entity_locbound_run8);
        src/entity_ball.o(.text.ball_ctor);
        src/entity_ball.o(.text.ball_dtor);
        asm/code_entities_08034CEC.o(.text.after_ball_ctor);
        src/entity_ball.o(.text.ball_run1);
        asm/code_entities_08034CEC.o(.text.after_ball_run1);
        src/entity_ball.o(.text.ball_run3);
        src/entity_ball.o(.text.ball_run2);
        src/entity_ball.o(.text.ball_dog_play_position);
        asm/code_entities_08034CEC.o(.text.after_ball_run2);
        src/entity_ball.o(.text.ball_reset_dog_play);
        asm/code_entities_08034CEC.o(.text.after_ball_reset_dog_play);
        src/entity_ball.o(.text.ball_controller_update);
        asm/code_entities_08034CEC.o(.text.after_ball_controller_update);
        src/entity_unk_08038740.o(.text.entity38740_ctor);
        src/entity_unk_08038740.o(.text.entity38740_factory);
        src/entity_unk_08038740.o(.text.entity38740_b8);
        src/entity_unk_08038740.o(.text.entity38740_c8);
        src/entity_unk_08038740.o(.text.entity38740_d8);
        src/entity_unk_08038740.o(.text.entity38740_ec);
        src/entity_unk_08038740.o(.text.entity38740_fc);
        src/entity_unk_08038740.o(.text.entity38740_0c);
        asm/code_entities_08034CEC.o(.text.after_entity38740_0c);
        src/entity_unk_08038740.o(.text.entity38740_ctrl_e90);
        src/entity_unk_08038740.o(.text.entity38740_ctrl_ea0);
        src/entity_unk_08038740.o(.text.entity38740_ctrl_eb8);
        asm/code_entities_08034CEC.o(.text.after_entity38740_eb8);
        src/entity_unk_08038740.o(.text.entity38740_ctrl_390d0);
        asm/code_entities_08034CEC.o(.text.after_entity38740_390d0);
        src/entity_unk_08038740.o(.text.entity39134_nearest);
        asm/code_entities_08034CEC.o(.text.after_entity39134);
        src/entity_unk_08038740.o(.text.entity391c0_area);
        asm/code_entities_08034CEC.o(.text.after_entity391c0);
        src/entity_unk_08038740.o(.text.entity391fc_noop);
        src/entity_unk_08038740.o(.text.entity39200_false);
        asm/code_entities_08034CEC.o(.text.after_entity39200);
        src/entity_unk_08038740.o(.text.entity3930c_true);
        asm/code_entities_08034CEC.o(.text.after_entity3930c);
        src/entity_unk_08038740.o(.text.entity396f4_mode);
        asm/code_entities_08034CEC.o(.text.after_entity396f4);
        src/entity_unk_08038740.o(.text.entity398a0_two);
        asm/code_entities_08034CEC.o(.text.after_entity398a0);
        src/entity_unk_08038740.o(.text.entity398a4_ctor);
        src/entity_unk_08038740.o(.text.entity399c0_dtor);
        src/entity_unk_08038740.o(.text.entity39a30_factory);
        asm/code_entities_08034CEC.o(.text.after_entity39a30);
        src/entity_unk_08038740.o(.text.entity39a5c_noop);
        asm/code_entities_08034CEC.o(.text.after_entity39a5c);
        src/entity_unk_08038740.o(.text.entity39a60_update);
        src/entity_unk_08038740.o(.text.entity39d4c_table);
        src/entity_unk_08038740.o(.text.entity39d5c_mask);
        src/entity_unk_08038740.o(.text.entity39d98_mode);
        asm/code_entities_08034CEC.o(.text.after_entity39d98);
        src/entity_unk_08038740.o(.text.entity39da8_setup);
        src/entity_unk_08038740.o(.text.entity39e18_setup);
        asm/code_entities_08034CEC.o(.text.after_entity39e18);
        src/entity_unk_08038740.o(.text.entity39e88_two);
        src/entity_unk_08038740.o(.text.entity39e8c_strategy);
        asm/code_entities_08034CEC.o(.text.after_entity39e8c);
        src/entity_unk_08038740.o(.text.entity39f50_dtor);
        asm/code_entities_08034CEC.o(.text.after_entity39f50);
        src/entity_unk_08038740.o(.text.entity3a144_table);
        asm/code_entities_08034CEC.o(.text.after_entity3a144);
        src/entity_unk_08038740.o(.text.entity3a320_sine);
        src/entity_unk_08038740.o(.text.entity3a334_cosine);
        src/entity_unk_08038740.o(.text.entity3a350_sound);
        asm/code_entities_08034CEC.o(.text.after_entity3a350);
        src/entity_unk_08038740.o(.text.entity3a798_factory);
        src/entity_unk_08038740.o(.text.entity3a804_get_step);
        src/entity_unk_08038740.o(.text.entity3a80c_set_step);
        src/entity_unk_08038740.o(.text.entity3a814_will_finish);
        src/entity_unk_08038740.o(.text.entity3a820_is_moving);
        src/entity_unk_08038740.o(.text.entity3a840_update_effect);
        src/entity_unk_08038740.o(.text.entity3a870_set_animation);
        src/entity_unk_08038740.o(.text.entity3a8a0_game_object);

        src/map_resource.o(.text);
        asm/code_0803A8A4.o(.text.after_map_resource);
        src/resource_owner_cached.o(.text);
        asm/code_0803A8A4.o(.text.resource_owner_variable_ctor);
        src/resource_owner_variable.o(.text);
        asm/code_0803A8A4.o(.text.after_resource_owner_dtors);
        src/character_schedule.o(.text);
        asm/code_0803A8A4.o(.text.after_character_schedules);
        src/script_engine.o(.text);
        asm/code_0803EE94.o(.text);
        src/heart_event_days.o(.text);
        asm/code_0803EE94.o(.text.after_heart_event_days);
        src/sprite_animation_provider.o(.text);
        asm/code_0803EE94.o(.text.after_animation_provider);
        src/sprite_animator.o(.text);
        asm/code_0803EE94.o(.text.after_sprite_animator);
        src/shop_catalog.o(.text.shop_desc_seed);
        asm/code_0803EE94.o(.text.after_seed_shop_desc);
        src/shop_catalog.o(.text.shop_desc_supermarket);
        asm/code_0803EE94.o(.text.after_supermarket_shop_desc);
        src/shop_catalog.o(.text.shop_desc_medicine);
        asm/code_0803EE94.o(.text.after_medicine_shop_desc);
        src/shop_catalog.o(.text.shop_desc_mixed);
        asm/code_0803EE94.o(.text.after_mixed_shop_desc);
        src/shop_catalog.o(.text.shop_desc_record);
        asm/code_0803EE94.o(.text.after_record_shop_desc);
        src/rucksack_item_render.o(.text);
        asm/code_0803EE94.o(.text.after_rucksack_item_renderer);
        src/rucksack_wrapping.o(.text);
        asm/code_0803EE94.o(.text.after_rucksack_wrapping);
        src/money.o(.text);
        asm/code_0803EE94.o(.text.after_money_debit);

        src/actor.o(.text);
        src/animal.o(.text);
        src/pet.o(.text);
        src/livestock.o(.text);
        src/barn_animal.o(.text);
        src/dog.o(.text);
        src/horse.o(.text);
        src/chicken.o(.text);
        src/cow.o(.text);
        src/sheep.o(.text);
        src/code_actor_0809BFE8.o(.text);
        asm/code_actor_0809BFE8.o(.text);
        src/fishing_records.o(.text);
        src/mine_floor.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_func_0809CF34);
        src/mine_floor_accessors.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_mine_floor_accessors);
        src/mine_floor_content.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_mine_floor_content);
        src/mine_floor_helpers.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_mine_floor_helpers);
        src/mine_floor_tile_resource.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_mine_floor_tile_resource);
        src/mine_floor_progress_flags.o(.text);
        asm/code_actor_0809BFE8.o(.text.after_mine_floor_progress_flags);
        src/npc.o(.text);
        src/bachelorette.o(.text);
        src/harvest_sprite.o(.text);

        asm/code_809E804.o(.text);
        src/character_info.o(.text);
        asm/code_809E804.o(.text.after_character_info);
        src/character_location.o(.text);
        asm/code_809E804.o(.text.before_character_social);
        src/character_social.o(.text);
        asm/code_809E804.o(.text.after_character_social);
        src/ground_pickup_state.o(.text.ground_pickup_state_init);
        asm/code_809E804.o(.text.after_ground_pickup_state_init);
        src/ground_pickup_state.o(.text.ground_pickup_state_durability);
        asm/code_809E804.o(.text.after_ground_pickup_state_durability);
        src/water_region.o(.text);
        src/code_080A4650.o(.text);
        src/map_data.o(.text);
        src/code_080A46AC.o(.text);
        src/code_080A480C.o(.text);
        src/code_080A4A4C.o(.text);
        src/code_080A4A94.o(.text);
        asm/code_809E804.o(.text.after_func_080A4BEC);
        src/code_080A5670.o(.text);
        src/code_080A56DC.o(.text);
        asm/code_809E804.o(.text.after_func_080A56DC);
        src/code_080A5A9C.o(.text);
        asm/code_809E804.o(.text.after_func_080A5A9C);
        src/code_080A5EA0.o(.text);
        asm/code_809E804.o(.text.after_func_080A5EA0);
        src/code_080A601C.o(.text);
        asm/code_809E804.o(.text.after_func_080A601C);
        src/code_080A6420.o(.text);
        asm/code_809E804.o(.text.after_func_080A6420);
        src/code_080A6640.o(.text);
        asm/code_809E804.o(.text.after_func_080A6640);
        src/terrain.o(.text);
        asm/code_809E804.o(.text.after_is_footprint_on_water_surface);

        src/m4a_1.o(.text);
        src/m4a.o(.text);
        asm/code_lib_syscall.o(.text);
        asm/code_lib_sram.o(.text);
        *libgcc.a:_call_via_rX.o(.text);
        /* these need to be recompiled using -mthumb-interwork */
        /* *libc.a:memcmp.o(.text); */
        /* *libc.a:memcpy.o(.text); */
        /* *libc.a:memmove.o(.text); */
        /* *libc.a:memset.o(.text); */
        /* *libc.a:strcat.o(.text); */
        /* *libc.a:strcpy.o(.text); */
        /* *libc.a:strlen.o(.text); */
        asm/code_libc_string.o(.text);

        asm/code_linkonce.o(.text.code_080D3BC0);
        src/raw_abi_thunks.o(.text.raw_thunks_d3c60);
        asm/code_linkonce.o(.text.after_raw_thunks_d3c60);
        *(.gnu.linkonce.t.__as__6AnimalRC6Animal);
        asm/code_linkonce.o(.text.code_080D68C0);
        src/resource_handle.o(.text.resource_subtree_fill_all);
        asm/code_linkonce.o(.text.after_resource_subtree_fill_all);
        src/resource_handle.o(.text.resource_subtree_clear_all);
        asm/code_linkonce.o(.text.after_resource_subtree_clear_all);
        src/resource_handle.o(.text.resource_subtree_fill);
        asm/code_linkonce.o(.text.after_resource_subtree_fill);
        src/resource_handle.o(.text.resource_subtree_clear);
        asm/code_linkonce.o(.text.after_resource_subtree_clear);
        src/resource_handle.o(.text.resource_subtree_free);
        src/resource_handle.o(.text.resource_child_free);
        src/resource_handle.o(.text.resource_entry_pool_init);
        asm/code_linkonce.o(.text.after_resource_entry_pool_init);
        src/raw_abi_thunks.o(.text.raw_thunks_d7868);
        asm/code_linkonce.o(.text.after_raw_thunks_d7868);
        src/raw_abi_thunks.o(.text.raw_thunks_d7b2c);
        asm/code_linkonce.o(.text.after_raw_thunks_d7b2c);
        *(.gnu.linkonce.t.__as__5SheepRC5Sheep);
        *(.gnu.linkonce.t.__as__3CowRC3Cow);
        *(.gnu.linkonce.t.__as__9LivestockRC9Livestock);
        *(.gnu.linkonce.t.push_back__t8FixedVec2Z12RucksackItemUl8G12RucksackItem);
        *(.gnu.linkonce.t.push_front__t8FixedVec2Z12RucksackItemUl8G12RucksackItem);
        *(.gnu.linkonce.t.push_back__t8FixedVec2Z9ToolStackUl8G9ToolStack);
        *(.gnu.linkonce.t.push_front__t8FixedVec2Z9ToolStackUl8G9ToolStack);
        asm/code_linkonce.o(.text.code_080D7CFC);
        src/entity_effect_dtor.o(.text);
        asm/code_linkonce.o(.text.after_func_080DC8F8);
        src/npc_entity_dtor_thunks.o(.text.npc_entity_dtor_thunks);
        src/entity37008_dtor_thunks.o(.text.entity37008_dtor_thunks);
        asm/code_linkonce.o(.text.after_entity37008_dtor_thunks);
        src/raw_abi_thunks.o(.text.raw_thunks_e0a7c);
        asm/code_linkonce.o(.text.after_raw_thunks_e0a7c);
        *(.gnu.linkonce.t.__lower_bound__H4ZPC12JumpTableEntZiZ28ScriptJumpTableSearchCompareZl_X01T0RCX11X21PX31_X01);
        asm/code_linkonce.o(.text.code_080E0EF0);
        src/raw_abi_thunks.o(.text.raw_thunks_e1018);
        asm/code_linkonce.o(.text.after_raw_thunks_e1018);
        src/raw_abi_thunks.o(.text.raw_thunks_e1d8c);
        asm/code_linkonce.o(.text.after_raw_thunks_e1d8c);
        src/raw_abi_thunks.o(.text.raw_thunks_e20f8);
        asm/code_linkonce.o(.text.after_raw_thunks_e20f8);

        *(.gnu.linkonce.d.__vt_6AScene);
        *(.gnu.linkonce.d.__vt_13AUnk_0800080C);
        . = ALIGN(4); asm/vtables.o(.rodata);
        *(.gnu.linkonce.d.__vt_7AEntity);
        . = ALIGN(4); asm/vtables.o(.rodata.080E6284);
        src/entity_effect_vtable.o(.rodata);
        asm/vtables.o(.rodata.after_vtable_unk_080E68B4);
        *(.gnu.linkonce.d.__vt_13AScriptEngine);
        . = ALIGN(4); asm/vtables.o(.rodata.080E7824);

        . = ALIGN(4); asm/data/data_080E8610.o(.rodata);
        src/data_field_weather_rates.o(.rodata);
        asm/data/data_080E8610.o(.rodata.after_field_weather_rates);
        src/shipping_bin.o(.rodata);
        src/record_player.o(.rodata);
        . = ALIGN(4); src/item.o(.rodata);
        /* . = ALIGN(4); src/code_0800E2E4.o(.rodata); */
        . = ALIGN(4); asm/data/data_080F0348.o(.rodata);
        . = ALIGN(4); src/data_schedules.o(.rodata);
        . = ALIGN(4); asm/data/data_080F1A80.o(.rodata);
        . = ALIGN(4); src/script_engine.o(.rodata);
        . = ALIGN(4); asm/data/data_080F9EB8.o(.rodata);
        src/data_shop_catalog.o(.rodata.shop_catalog_fddd8);
        asm/data/data_080F9EB8.o(.rodata.after_seed_catalog);
        src/data_shop_catalog.o(.rodata.shop_catalog_fdfa4);
        asm/data/data_080F9EB8.o(.rodata.after_supermarket_catalog);
        src/data_shop_catalog.o(.rodata.shop_catalog_fe050);
        asm/data/data_080F9EB8.o(.rodata.after_medicine_catalog);
        src/data_shop_catalog.o(.rodata.shop_catalog_fe484);
        asm/data/data_080F9EB8.o(.rodata.after_mixed_catalog);
        src/data_shop_catalog.o(.rodata.shop_catalog_fe740);
        asm/data/data_080F9EB8.o(.rodata.after_winery_catalog);
        src/data_shop_catalog.o(.rodata.shop_catalog_fe8fc);
        asm/data/data_080F9EB8.o(.rodata.after_record_article_catalog);
        src/data_livestock_day_update_info.o(.rodata);
        src/data_cursed_tool_requirements.o(.rodata);
        asm/data/data_080F9EB8.o(.rodata.after_cursed_tool_requirements);
        src/data_character_info.o(.rodata);
        asm/data/data_080F9EB8.o(.rodata.after_character_info);
        src/data_water_regions.o(.rodata);
        asm/data/data_080F9EB8.o(.rodata.after_water_regions);
        . = ALIGN(4); src/sound_data.o(.rodata.*);
        . = ALIGN(4); asm/data/data_0813B288.o(.rodata);
    } > ROM = 0xFF

    .iwram : ALIGN(4)
    {
        asm/code_iwram.o(.iwram);
    } > IWRAM AT> ROM = 0xFF

    __iwram_vma     = ADDR(.iwram);
    __iwram_vma_end = ADDR(.iwram) + SIZEOF(.iwram);
    __iwram_lma     = LOADADDR(.iwram);

    .pad : ALIGN(4)
    {
        LONG(0);
        . = 0x08800000 - 0x0875C240;
    } > ROM = 0xFF

    /* DWARF 2 sections */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
