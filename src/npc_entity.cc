#include "entity_npc.hh"

EC void func_08034F00(ANpcEntity * self, int arg_unk_1);
EC void func_08035380(ANpcEntity & self);

static inline void TMP_ChangeAnim(ANpcEntity & self, u32 new_anim_id)
{
    if (self.anim_id != new_anim_id)
    {
        self.SetAnim(new_anim_id);
    }
}

static inline u32 TMP_GetAnim(ANpcEntity & self)
{
    return self.anim_id;
}

ANpcEntity::ANpcEntity(GameObject * game_object, Npc * npc, u32 arg_3, void const * arg_4, u32 anim_id, u32 arg_6, u32 arg_7)
    : AActorEntity(game_object, npc->GetLocation(), 2, npc->anim_id == NO_ANIM ? anim_id : npc->anim_id),
      npc(npc),
      unk_34(arg_3),
      unk_38(reinterpret_cast<UnkNpcSchedule const *>(arg_4)),
      unk_3C(npc->unk_0C_0),
      unk_3D(npc->unk_0C_5),
      unk_3E(npc->unk_0D_2),
      unk_3F(0),
      unk_40(npc->unk_0D_7),
      unk_42(arg_7),
      unk_44(anim_id),
      unk_46(arg_6)
{
    if (this->npc->anim_id == NO_ANIM)
    {
        func_08034F00(this, true);
    }
    else
    {
        unk_06 = true;
        TMP_ChangeAnim(*this, npc->anim_id);
    }
}

ANpcEntity::~ANpcEntity()
{
    npc->SetLocation(GetLocation());

    if (unk_06)
    {
        npc->anim_id = TMP_GetAnim(*this);
    }
    else
    {
        npc->anim_id = NO_ANIM;
    }

    if (unk_38 != nullptr)
    {
        npc->unk_0C_0 = unk_3C;
        npc->unk_0C_5 = unk_3D;
        npc->unk_0D_2 = unk_3E;
        npc->unk_0D_7 = unk_40;
    }
}

EC void func_08034E8C(ANpcEntity & self)
{
    self.AActorEntity::vfunc_14();
    self.npc->SetChangedLocation();
}

EC void func_08034EA0(ANpcEntity & self)
{
    self.unk_06 = false;
    self.vfunc_3C(1);
}

EC void func_08034EB4(ANpcEntity & self)
{
    func_08035380(self);

    if (self.unk_24 != 0)
        self.unk_24--;
    else
        self.unk_24 = self.unk_26;

    if (self.unk_10.Get() != nullptr)
    {
        self.unk_10->vfunc_0C();
    }
}

EC u32 func_08034EE0(ANpcEntity & self)
{
    if (self.npc->unk_10 == 0)
        return self.unk_42;

    return self.npc->unk_10;
}

EC void func_08034EF8(ANpcEntity & self, u32 unk_arg_1)
{
    self.npc->unk_10 = unk_arg_1;
}

EC NAKED void func_08034F00(ANpcEntity * self, int unk_arg_1)
{
    // https://decomp.me/scratch/hL2sP

    asm_unified("\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, sb\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x34\n\
        adds r6, r0, #0\n\
        str r1, [sp, #0x14]\n\
        cmp r1, #0\n\
        bgt .L08034F16\n\
        b .L08035370\n\
    .L08034F16:\n\
        ldr r1, [r6, #0x38]\n\
        movs r0, #0x3c\n\
        adds r0, r0, r6\n\
        mov r8, r0\n\
        adds r2, r6, #0\n\
        adds r2, #0x3d\n\
        str r2, [sp, #0x30]\n\
        cmp r1, #0\n\
        bne .L08034F2A\n\
        b .L08035312\n\
    .L08034F2A:\n\
        ldr r3, [sp, #0x14]\n\
        cmp r3, #2\n\
        ble .L08034F3C\n\
        ldr r0, [r6, #0x34]\n\
        ldr r1, [r1]\n\
        bl _call_via_r1\n\
        mov r4, r8\n\
        strb r0, [r4]\n\
    .L08034F3C:\n\
        ldr r0, [r6, #0x38]\n\
        mov r2, r8\n\
        ldrb r1, [r2]\n\
        ldr r0, [r0, #8]\n\
        lsls r1, r1, #2\n\
        adds r1, r1, r0\n\
        ldr r7, [r1]\n\
        cmp r7, #0\n\
        bne .L08034F50\n\
        b .L08035312\n\
    .L08034F50:\n\
        ldr r0, [r6]\n\
        ldr r1, [r0]\n\
        movs r3, #0xa2\n\
        lsls r3, r3, #1\n\
        adds r1, r1, r3\n\
        ldr r1, [r1]\n\
        bl _call_via_r1\n\
        ldrh r3, [r0, #0xa]\n\
        lsls r0, r3, #0x1b\n\
        lsrs r0, r0, #0x1b\n\
        subs r2, r0, #6\n\
        cmp r2, #0\n\
        bge .L08034F6E\n\
        adds r2, #0x18\n\
    .L08034F6E:\n\
        lsls r1, r2, #4\n\
        subs r1, r1, r2\n\
        lsls r1, r1, #2\n\
        lsls r0, r3, #0x15\n\
        lsrs r0, r0, #0x1a\n\
        adds r1, r1, r0\n\
        mov sl, r1\n\
        ldr r4, [sp, #0x14]\n\
        cmp r4, #2\n\
        ble .L08034FAA\n\
        str r1, [sp, #0xc]\n\
        ldr r4, [r7, #4]\n\
        ldrh r1, [r7]\n\
        lsls r1, r1, #3\n\
        adds r1, r4, r1\n\
        add r2, sp, #0xc\n\
        movs r5, #0\n\
        str r5, [sp]\n\
        adds r0, r4, #0\n\
        movs r3, #0\n\
        bl func_080D7ECC\n\
        subs r0, r0, r4\n\
        asrs r0, r0, #3\n\
        subs r0, #1\n\
        ldr r1, [sp, #0x30]\n\
        strb r0, [r1]\n\
        adds r0, r6, #0\n\
        adds r0, #0x3e\n\
        strb r5, [r0]\n\
    .L08034FAA:\n\
        ldr r2, [sp, #0x30]\n\
        ldrb r1, [r2]\n\
        ldrh r3, [r7]\n\
        cmp r1, r3\n\
        blo .L08034FB6\n\
        b .L08035312\n\
    .L08034FB6:\n\
        lsls r1, r1, #3\n\
        ldr r0, [r7, #4]\n\
        adds r3, r0, r1\n\
        ldr r4, [r3, #4]\n\
        str r4, [sp, #0x18]\n\
        cmp r4, #0\n\
        bne .L08034FC6\n\
        b .L08035312\n\
    .L08034FC6:\n\
        movs r0, #0\n\
        str r0, [sp, #0x1c]\n\
        ldr r4, [r4]\n\
        cmp r4, #0\n\
        bne .L08034FD2\n\
        b .L08035290\n\
    .L08034FD2:\n\
        ldr r2, [sp, #0x18]\n\
        ldrh r1, [r2, #4]\n\
        cmp r1, #0\n\
        bne .L08034FDC\n\
        b .L08035290\n\
    .L08034FDC:\n\
        adds r0, r6, #0\n\
        adds r0, #0x3e\n\
        ldrb r2, [r0]\n\
        mov sb, r0\n\
        cmp r2, r1\n\
        blo .L08034FEA\n\
        b .L08035312\n\
    .L08034FEA:\n\
        ldr r0, [sp, #0x18]\n\
        movs r1, #6\n\
        ldrsh r7, [r0, r1]\n\
        movs r1, #8\n\
        ldrsh r0, [r0, r1]\n\
        mov r8, r0\n\
        ldr r1, [sp, #0x18]\n\
        ldrb r0, [r1, #0xb]\n\
        lsls r1, r0, #0x1c\n\
        lsrs r5, r1, #0x1e\n\
        lsls r0, r0, #0x1b\n\
        cmp r0, #0\n\
        bge .L08035006\n\
        b .L08035184\n\
    .L08035006:\n\
        str r4, [sp, #0x20]\n\
        ldrh r0, [r3]\n\
        movs r1, #0\n\
        cmp sl, r0\n\
        blo .L08035014\n\
        mov r2, sl\n\
        subs r1, r2, r0\n\
    .L08035014:\n\
        str r1, [sp, #0x10]\n\
        ldr r3, [sp, #0x14]\n\
        cmp r3, #2\n\
        ble .L08035048\n\
        ldr r0, [sp, #0x18]\n\
        ldrh r1, [r0, #4]\n\
        lsls r1, r1, #3\n\
        adds r1, r4, r1\n\
        add r2, sp, #0x10\n\
        ldr r3, [sp, #0x1c]\n\
        str r3, [sp]\n\
        adds r0, r4, #0\n\
        movs r3, #0\n\
        bl func_080DC96C\n\
        subs r0, r0, r4\n\
        asrs r0, r0, #3\n\
        mov r4, sb\n\
        strb r0, [r4]\n\
        ldr r0, [sp, #0x18]\n\
        ldrh r1, [r0, #4]\n\
        ldrb r0, [r4]\n\
        cmp r0, r1\n\
        blo .L08035048\n\
        subs r0, r1, #1\n\
        strb r0, [r4]\n\
    .L08035048:\n\
        mov r1, sb\n\
        ldrb r0, [r1]\n\
        lsls r0, r0, #3\n\
        ldr r2, [sp, #0x20]\n\
        adds r4, r2, r0\n\
        movs r3, #0\n\
        str r3, [sp, #0x24]\n\
        adds r0, r6, #0\n\
        adds r0, #0x20\n\
        str r0, [sp, #0x2c]\n\
        cmp r2, r4\n\
        beq .L08035094\n\
    .L08035060:\n\
        ldrh r1, [r2]\n\
        str r1, [sp, #0x24]\n\
        movs r3, #2\n\
        ldrsh r1, [r2, r3]\n\
        ldrb r0, [r2, #4]\n\
        lsls r0, r0, #0x1f\n\
        cmp r0, #0\n\
        bne .L08035080\n\
        cmp r7, r1\n\
        beq .L0803508E\n\
        movs r5, #3\n\
        cmp r7, r1\n\
        ble .L0803507C\n\
        movs r5, #2\n\
    .L0803507C:\n\
        adds r7, r1, #0\n\
        b .L0803508E\n\
    .L08035080:\n\
        cmp r8, r1\n\
        beq .L0803508E\n\
        movs r5, #0\n\
        cmp r8, r1\n\
        ble .L0803508C\n\
        movs r5, #1\n\
    .L0803508C:\n\
        mov r8, r1\n\
    .L0803508E:\n\
        adds r2, #8\n\
        cmp r2, r4\n\
        bne .L08035060\n\
    .L08035094:\n\
        movs r1, #0\n\
        ldrb r0, [r4, #4]\n\
        lsls r0, r0, #0x1f\n\
        cmp r0, #0\n\
        bne .L080350A0\n\
        movs r1, #1\n\
    .L080350A0:\n\
        mov sb, r1\n\
        movs r1, #2\n\
        ldrsh r0, [r4, r1]\n\
        mov r3, r8\n\
        subs r2, r0, r3\n\
        mov r1, sb\n\
        cmp r1, #0\n\
        beq .L080350B2\n\
        subs r2, r0, r7\n\
    .L080350B2:\n\
        str r2, [sp, #0x28]\n\
        cmp r2, #0\n\
        beq .L0803510E\n\
        ldrh r0, [r4]\n\
        ldr r3, [sp, #0x24]\n\
        subs r0, r0, r3\n\
        movs r1, #0x19\n\
        adds r3, r0, #0\n\
        muls r3, r1, r3\n\
        adds r0, r6, #0\n\
        adds r0, #0x3f\n\
        ldrb r1, [r0]\n\
        mov sl, r0\n\
        cmp r1, #0\n\
        bne .L080350DA\n\
        lsls r0, r2, #0x10\n\
        adds r1, r3, #0\n\
        bl __divsi3\n\
        b .L080350DC\n\
    .L080350DA:\n\
        movs r0, #0\n\
    .L080350DC:\n\
        mov r2, sb\n\
        cmp r2, #0\n\
        beq .L080350F2\n\
        movs r5, #3\n\
        ldr r3, [sp, #0x28]\n\
        cmp r3, #0\n\
        bge .L080350EC\n\
        movs r5, #2\n\
    .L080350EC:\n\
        str r0, [r6, #0x18]\n\
        movs r0, #0\n\
        b .L080350FA\n\
    .L080350F2:\n\
        ldr r1, [sp, #0x28]\n\
        lsrs r5, r1, #0x1f\n\
        mov r2, sb\n\
        str r2, [r6, #0x18]\n\
    .L080350FA:\n\
        str r0, [r6, #0x1c]\n\
        movs r3, #0\n\
        str r3, [sp, #0x1c]\n\
        mov r1, sl\n\
        ldrb r0, [r1]\n\
        cmp r0, #0\n\
        bne .L08035112\n\
        movs r2, #1\n\
        str r2, [sp, #0x1c]\n\
        b .L08035112\n\
    .L0803510E:\n\
        str r2, [r6, #0x18]\n\
        str r2, [r6, #0x1c]\n\
    .L08035112:\n\
        ldr r3, [sp, #0x14]\n\
        cmp r3, #2\n\
        ble .L08035168\n\
        adds r1, r6, #0\n\
        adds r1, #0x40\n\
        movs r0, #0\n\
        strh r0, [r1]\n\
        mov r0, sb\n\
        cmp r0, #0\n\
        beq .L08035146\n\
        ldr r0, [sp, #0x10]\n\
        ldrh r1, [r4]\n\
        cmp r0, r1\n\
        bhs .L08035140\n\
        ldr r1, [r6, #0x18]\n\
        ldr r2, [sp, #0x24]\n\
        subs r0, r0, r2\n\
        movs r3, #0x19\n\
        muls r0, r3, r0\n\
        muls r0, r1, r0\n\
        asrs r0, r0, #0x10\n\
        adds r7, r7, r0\n\
        b .L08035266\n\
    .L08035140:\n\
        movs r0, #2\n\
        ldrsh r7, [r4, r0]\n\
        b .L08035266\n\
    .L08035146:\n\
        ldr r0, [sp, #0x10]\n\
        ldrh r1, [r4]\n\
        cmp r0, r1\n\
        bhs .L08035160\n\
        ldr r1, [r6, #0x1c]\n\
        ldr r2, [sp, #0x24]\n\
        subs r0, r0, r2\n\
        movs r3, #0x19\n\
        muls r0, r3, r0\n\
        muls r0, r1, r0\n\
        asrs r0, r0, #0x10\n\
        add r8, r0\n\
        b .L08035266\n\
    .L08035160:\n\
        movs r1, #2\n\
        ldrsh r0, [r4, r1]\n\
        mov r8, r0\n\
        b .L08035266\n\
    .L08035168:\n\
        ldr r2, [sp, #0x14]\n\
        cmp r2, #1\n\
        bgt .L08035170\n\
        b .L0803527E\n\
    .L08035170:\n\
        ldr r0, [sp, #0x10]\n\
        ldr r3, [sp, #0x24]\n\
        subs r0, r0, r3\n\
        movs r4, #0x19\n\
        adds r1, r0, #0\n\
        muls r1, r4, r1\n\
        adds r0, r6, #0\n\
        adds r0, #0x40\n\
        strh r1, [r0]\n\
        b .L08035266\n\
    .L08035184:\n\
        lsls r0, r2, #3\n\
        adds r3, r4, r0\n\
        adds r1, r4, #0\n\
        movs r0, #0x40\n\
        adds r0, r0, r6\n\
        mov sb, r0\n\
        adds r2, r6, #0\n\
        adds r2, #0x20\n\
        str r2, [sp, #0x2c]\n\
        cmp r1, r3\n\
        beq .L080351BC\n\
    .L0803519A:\n\
        movs r4, #0\n\
        ldrsh r2, [r1, r4]\n\
        ldrb r0, [r1, #6]\n\
        lsls r0, r0, #0x1d\n\
        cmp r0, #0\n\
        blt .L080351AE\n\
        cmp r7, r2\n\
        beq .L080351B4\n\
        adds r7, r2, #0\n\
        b .L080351B4\n\
    .L080351AE:\n\
        cmp r8, r2\n\
        beq .L080351B4\n\
        mov r8, r2\n\
    .L080351B4:\n\
        ldrh r0, [r1, #4]\n\
        adds r1, #8\n\
        cmp r1, r3\n\
        bne .L0803519A\n\
    .L080351BC:\n\
        ldr r0, [sp, #0x14]\n\
        cmp r0, #1\n\
        ble .L080351C8\n\
        movs r0, #0\n\
        mov r1, sb\n\
        strh r0, [r1]\n\
    .L080351C8:\n\
        movs r1, #0\n\
        ldrb r0, [r3, #6]\n\
        lsls r0, r0, #0x1d\n\
        cmp r0, #0\n\
        blt .L080351D4\n\
        movs r1, #1\n\
    .L080351D4:\n\
        adds r5, r1, #0\n\
        movs r2, #0\n\
        ldrsh r0, [r3, r2]\n\
        mov r1, r8\n\
        subs r4, r0, r1\n\
        cmp r5, #0\n\
        beq .L080351E4\n\
        subs r4, r0, r7\n\
    .L080351E4:\n\
        mov r2, sb\n\
        ldrh r0, [r2]\n\
        cmp r0, #0\n\
        bne .L0803524A\n\
        cmp r4, #0\n\
        beq .L0803524A\n\
        adds r0, r6, #0\n\
        adds r0, #0x3f\n\
        ldrb r1, [r0]\n\
        movs r2, #0\n\
        mov sl, r0\n\
        cmp r1, #0\n\
        bne .L08035202\n\
        movs r2, #0x80\n\
        lsls r2, r2, #8\n\
    .L08035202:\n\
        ldrh r0, [r3, #2]\n\
        cmp r0, #0\n\
        beq .L0803520A\n\
        muls r2, r0, r2\n\
    .L0803520A:\n\
        cmp r5, #0\n\
        beq .L08035224\n\
        cmp r4, #0\n\
        bge .L0803521A\n\
        movs r5, #2\n\
        rsbs r0, r2, #0\n\
        str r0, [r6, #0x18]\n\
        b .L0803521E\n\
    .L0803521A:\n\
        movs r5, #3\n\
        str r2, [r6, #0x18]\n\
    .L0803521E:\n\
        movs r0, #0\n\
        str r0, [r6, #0x1c]\n\
        b .L08035238\n\
    .L08035224:\n\
        cmp r4, #0\n\
        bge .L08035230\n\
        movs r5, #1\n\
        rsbs r0, r2, #0\n\
        str r0, [r6, #0x1c]\n\
        b .L08035234\n\
    .L08035230:\n\
        movs r5, #0\n\
        str r2, [r6, #0x1c]\n\
    .L08035234:\n\
        movs r0, #0\n\
        str r0, [r6, #0x18]\n\
    .L08035238:\n\
        movs r3, #0\n\
        str r3, [sp, #0x1c]\n\
        mov r4, sl\n\
        ldrb r0, [r4]\n\
        cmp r0, #0\n\
        bne .L08035266\n\
        movs r0, #1\n\
        str r0, [sp, #0x1c]\n\
        b .L08035266\n\
    .L0803524A:\n\
        cmp r5, #0\n\
        beq .L08035254\n\
        movs r1, #0\n\
        ldrsh r7, [r3, r1]\n\
        b .L0803525A\n\
    .L08035254:\n\
        movs r4, #0\n\
        ldrsh r2, [r3, r4]\n\
        mov r8, r2\n\
    .L0803525A:\n\
        movs r0, #0\n\
        str r0, [r6, #0x18]\n\
        str r0, [r6, #0x1c]\n\
        ldrb r0, [r3, #6]\n\
        lsls r0, r0, #0x1e\n\
        lsrs r5, r0, #0x1e\n\
    .L08035266:\n\
        ldr r0, [sp, #0x14]\n\
        cmp r0, #1\n\
        ble .L0803527E\n\
        ldr r2, [sp, #0x18]\n\
        ldrh r1, [r2, #0xa]\n\
        lsls r1, r1, #0x16\n\
        lsrs r1, r1, #0x16\n\
        adds r0, r6, #0\n\
        adds r2, r7, #0\n\
        mov r3, r8\n\
        bl SetLocation__7AEntityUiii\n\
    .L0803527E:\n\
        ldr r3, [sp, #0x2c]\n\
        ldrb r0, [r3]\n\
        cmp r0, r5\n\
        beq .L080352CA\n\
        adds r0, r6, #0\n\
        adds r1, r5, #0\n\
        bl SetAnimFacing__12AActorEntityUi\n\
        b .L080352CA\n\
    .L08035290:\n\
        ldr r4, [sp, #0x14]\n\
        cmp r4, #1\n\
        ble .L080352AC\n\
        ldr r0, [sp, #0x18]\n\
        ldrh r1, [r0, #0xa]\n\
        lsls r1, r1, #0x16\n\
        lsrs r1, r1, #0x16\n\
        movs r3, #6\n\
        ldrsh r2, [r0, r3]\n\
        movs r4, #8\n\
        ldrsh r3, [r0, r4]\n\
        adds r0, r6, #0\n\
        bl SetLocation__7AEntityUiii\n\
    .L080352AC:\n\
        ldr r1, [sp, #0x18]\n\
        ldrb r0, [r1, #0xb]\n\
        lsls r0, r0, #0x1c\n\
        lsrs r1, r0, #0x1e\n\
        adds r0, r6, #0\n\
        adds r0, #0x20\n\
        ldrb r0, [r0]\n\
        cmp r0, r1\n\
        beq .L080352C4\n\
        adds r0, r6, #0\n\
        bl SetAnimFacing__12AActorEntityUi\n\
    .L080352C4:\n\
        movs r0, #0\n\
        str r0, [r6, #0x18]\n\
        str r0, [r6, #0x1c]\n\
    .L080352CA:\n\
        ldr r2, [sp, #0x14]\n\
        cmp r2, #1\n\
        ble .L080352E2\n\
        ldr r4, [r6, #0x30]\n\
        add r0, sp, #4\n\
        adds r1, r6, #0\n\
        bl GetLocation__C12AActorEntity\n\
        adds r0, r4, #0\n\
        add r1, sp, #4\n\
        bl SetLocation__3NpcRC13ActorLocation\n\
    .L080352E2:\n\
        ldr r3, [sp, #0x1c]\n\
        cmp r3, #0\n\
        beq .L080352F8\n\
        ldr r0, [r6, #0x14]\n\
        ldr r1, [r0, #0x28]\n\
        adds r0, r6, #0\n\
        bl _call_via_r1\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        beq .L080352FE\n\
    .L080352F8:\n\
        adds r0, r6, #0\n\
        adds r0, #0x44\n\
        b .L08035302\n\
    .L080352FE:\n\
        adds r0, r6, #0\n\
        adds r0, #0x46\n\
    .L08035302:\n\
        ldrh r1, [r0]\n\
        ldrh r0, [r6, #0x22]\n\
        cmp r0, r1\n\
        beq .L08035370\n\
        adds r0, r6, #0\n\
        bl SetAnim__12AActorEntityUi\n\
        b .L08035370\n\
    .L08035312:\n\
        ldr r4, [sp, #0x14]\n\
        cmp r4, #1\n\
        ble .L08035334\n\
        adds r0, r6, #0\n\
        movs r1, #0x8d\n\
        lsls r1, r1, #2\n\
        bl SetMap__7AEntityUi\n\
        ldr r4, [r6, #0x30]\n\
        add r0, sp, #4\n\
        adds r1, r6, #0\n\
        bl GetLocation__C12AActorEntity\n\
        adds r0, r4, #0\n\
        add r1, sp, #4\n\
        bl SetLocation__3NpcRC13ActorLocation\n\
    .L08035334:\n\
        adds r0, r6, #0\n\
        adds r0, #0x20\n\
        ldrb r0, [r0]\n\
        cmp r0, #0\n\
        beq .L08035346\n\
        adds r0, r6, #0\n\
        movs r1, #0\n\
        bl SetAnimFacing__12AActorEntityUi\n\
    .L08035346:\n\
        movs r4, #0\n\
        str r4, [r6, #0x18]\n\
        str r4, [r6, #0x1c]\n\
        adds r0, r6, #0\n\
        adds r0, #0x44\n\
        ldrh r1, [r0]\n\
        ldrh r0, [r6, #0x22]\n\
        cmp r0, r1\n\
        beq .L0803535E\n\
        adds r0, r6, #0\n\
        bl SetAnim__12AActorEntityUi\n\
    .L0803535E:\n\
        mov r0, r8\n\
        strb r4, [r0]\n\
        ldr r1, [sp, #0x30]\n\
        strb r4, [r1]\n\
        adds r0, r6, #0\n\
        adds r0, #0x3e\n\
        strb r4, [r0]\n\
        adds r0, #2\n\
        strh r4, [r0]\n\
    .L08035370:\n\
        add sp, #0x34\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov sb, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
    ");
}
