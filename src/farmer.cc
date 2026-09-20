#include "farmer.hh"

Farmer::Farmer(char const * arg_1, GameDate const & arg_2)
    : unk_00(arg_1),
      unk_20(arg_2),
      location(Location(2, 0, 0), 0),
      num_power_berries(0),
      unk_44_04(0),
      unk_44_05(0),
      unk_44_06(0),
      stamina(150),
      unk_44_0F(0),
      unk_44_17(0),
      step_count(0),
      unk_48_1D(0),
      unk_4C_00(0),
      unk_4C_07(0),
      unk_4C_0F(0),
      unk_50_0D(0)
{
}

EC char const * func_0800E4E0(Farmer const & self)
{
    return self.unk_00;
}

EC char const * func_0800E4E4(Farmer const & self)
{
    return self.unk_10;
}

EC GameDate func_0800E4E8(Farmer const & self)
{
    return self.unk_20;
}

EC unsigned int func_0800E4F0(Farmer const & self)
{
    return self.stamina;
}

EC unsigned int func_0800E4FC(Farmer const & self)
{
    return self.unk_44_0F / 2;
}

EC bool func_0800E504(Farmer const & self)
{
    return self.unk_44_0F >= 200;
}

EC unsigned int func_0800E51C(Farmer const & self)
{
    return self.num_power_berries * 10 + 150;
}

EC unsigned int func_0800E530(Farmer const & self)
{
    return self.num_power_berries;
}

EC bool func_0800E53C(Farmer const & self)
{
    return self.unk_44_04;
}

EC Farmer::ToolLevel const & func_0800E548(Farmer const & self, unsigned int idx)
{
    return self.unk_2C[idx];
}

EC Tool func_0800E550(Farmer const & self, Tool tool)
{
    Tool result(tool);

    switch (result.GetId())
    {
        case TOOL_IRON_SICKLE:
            switch (func_0800EF6C(self.unk_2C[1]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_SICKLE);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_SICKLE);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_SICKLE);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_SICKLE);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_SICKLE);
            }

            break;

        case TOOL_IRON_HOE:
            switch (func_0800EF6C(self.unk_2C[0]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_HOE);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_HOE);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_HOE);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_HOE);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_HOE);
            }

            break;

        case TOOL_IRON_AXE:
            switch (func_0800EF6C(self.unk_2C[2]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_AXE);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_AXE);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_AXE);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_AXE);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_AXE);
            }

            break;

        case TOOL_IRON_HAMMER:
            switch (func_0800EF6C(self.unk_2C[3]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_HAMMER);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_HAMMER);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_HAMMER);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_HAMMER);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_HAMMER);
            }

            break;

        case TOOL_WATERING_CAN:
            switch (func_0800EF6C(self.unk_2C[4]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_WATERING_CAN);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_WATERING_CAN);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_WATERING_CAN);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_WATERING_CAN);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_WATERING_CAN);
            }

            break;

        case TOOL_FISHING_ROD:
            switch (func_0800EF6C(self.unk_2C[5]))
            {
                case Farmer::ToolLevel::LEVEL_1:
                    return Tool(TOOL_COPPER_FISHING_ROD);
                case Farmer::ToolLevel::LEVEL_2:
                    return Tool(TOOL_SILVER_FISHING_ROD);
                case Farmer::ToolLevel::LEVEL_3:
                    return Tool(TOOL_GOLD_FISHING_ROD);
                case Farmer::ToolLevel::LEVEL_4:
                    return Tool(TOOL_MYSTRILE_FISHING_ROD);
                case Farmer::ToolLevel::LEVEL_5:
                    return Tool(TOOL_MYTHIC_FISHING_ROD);
            }

            break;
    }

    return result;
}

EC ActorLocation func_0800E924(Farmer const & self)
{
    return self.location;
}

EC bool func_0800E934(Farmer const & self)
{
    return self.unk_44_05;
}

EC bool func_0800E940(Farmer const & self)
{
    return self.unk_44_06;
}

EC unsigned int func_0800E94C(Farmer const & self)
{
    return self.unk_44_17;
}

EC unsigned int func_0800E958(Farmer const & self)
{
    return self.step_count;
}

EC unsigned int func_0800E970(Farmer const & self)
{
    return self.unk_4C_00;
}

EC unsigned int func_0800E97C(Farmer const & self)
{
    return self.unk_4C_07;
}

EC unsigned int func_0800E988(Farmer const & self)
{
    return self.unk_4C_0F;
}

EC unsigned int func_0800E9A0(Farmer const & self)
{
    return self.unk_50_0D;
}

EC void func_0800E9A8(Farmer & self, char const * arg_1)
{
    self.unk_10 = FixedStr<12>(arg_1);
}

EC void func_0800E9E4(Farmer & self, int increase)
{
    if ((int)self.stamina + increase > 0)
    {
        self.stamina = min_inl<u32 const &>(self.stamina + increase, func_0800E51C(self));
    }
    else
    {
        self.stamina = 0;
    }
}

EC void func_0800EA38(Farmer & self, int decrease)
{
    return func_0800E9E4(self, -decrease);
}

EC void func_0800EA44(Farmer & self)
{
    self.stamina = func_0800E51C(self);
}

EC void func_0800EA68(Farmer & self, int arg_1)
{
    if (arg_1 > 0)
    {
        if (!self.unk_44_04)
        {
            arg_1 = arg_1 * 2;
        }

        self.unk_44_0F = (fu8)min_inl<u32 const &>(self.unk_44_0F + arg_1, 200);
    }
    else if (arg_1 < 0)
    {
        arg_1 = arg_1 * 2;

        /* - -arg_1? */
        self.unk_44_0F = self.unk_44_0F > -arg_1 ? self.unk_44_0F - -arg_1 : 0;
    }
}

EC void func_0800EAD4(Farmer & self, int decrease)
{
    return func_0800EA68(self, -decrease);
}

EC void func_0800EAE0(Farmer & self)
{
    self.unk_44_0F = 0;
}

EC void func_0800EAF0(Farmer & self)
{
    self.unk_44_04 = true;
}

EC void func_0800EAFC(Farmer & self)
{
    if (self.num_power_berries < 10)
    {
        self.num_power_berries++;
        func_0800E9E4(self, 10);
    }
}

EC Farmer::ToolLevel & func_0800EB2C(Farmer & self, int idx)
{
    return self.unk_2C[idx];
}

EC void func_0800EB34(Farmer & self, ActorLocation const & location)
{
    self.location = location;
}

EC unsigned int func_0800EB3C(Farmer & self)
{
    if (self.rucksack.HasNoItems())
        return 0;

    RucksackItem item;

    if (!IsHeldItemEmpty(&self.held_item))
    {
        switch (GetHeldItemKind(&self.held_item))
        {
            default:
                return 0;

            case HeldItem::KIND_FOOD:
            case HeldItem::KIND_ARTICLE:
                item = GetHeldRucksackItem(&self.held_item);
                ClearHeldItem(&self.held_item);
                break;
        }
    }

    unsigned int num_cycles = 0;

    do
    {
        item = self.rucksack.CycleItemBack(item);
        num_cycles++;
    } while (item.IsEmpty());

    SetHeldRucksackItem(&self.held_item, item);

    return num_cycles;
}

EC unsigned int func_0800EBC4(Farmer & self)
{
    /* same as previous func but in reverse order (CycleItemFront rather than CycleItemBack) */

    if (self.rucksack.HasNoItems())
        return 0;

    RucksackItem item;

    if (!IsHeldItemEmpty(&self.held_item))
    {
        switch (GetHeldItemKind(&self.held_item))
        {
            default:
                return 0;

            case HeldItem::KIND_FOOD:
            case HeldItem::KIND_ARTICLE:
                item = GetHeldRucksackItem(&self.held_item);
                ClearHeldItem(&self.held_item);
                break;
        }
    }

    unsigned int num_cycles = 0;

    do
    {
        item = self.rucksack.CycleItemFront(item);
        num_cycles++;
    } while (item.IsEmpty());

    SetHeldRucksackItem(&self.held_item, item);

    return num_cycles;
}

EC unsigned int func_0800EC4C(Farmer & self)
{
    if (self.rucksack.HasNoTools())
        return 0;

    unsigned int num_cycles = 0;

    do
    {
        self.unk_5C = self.rucksack.CycleToolBack(self.unk_5C);
        num_cycles++;
    } while (self.unk_5C.IsEmpty());

    return num_cycles;
}

EC unsigned int func_0800ECB0(Farmer & self)
{
    if (self.rucksack.HasNoTools())
        return 0;

    unsigned int num_cycles = 0;

    do
    {
        self.unk_5C = self.rucksack.CycleToolFront(self.unk_5C);
        num_cycles++;
    } while (self.unk_5C.IsEmpty());

    return num_cycles;
}

EC void func_0800ED14(Farmer & self)
{
    self.unk_44_05 = true;
}

EC void func_0800ED20(Farmer & self)
{
    self.unk_44_06 = true;
}

EC void func_0800ED2C(Farmer & self)
{
    self.unk_44_06 = false;
}

EC void func_0800ED3C(Farmer & self, unsigned int arg_1)
{
    self.unk_44_17 = arg_1;
}

EC void func_0800ED54(Farmer & self, int arg_1)
{
    int r2 = self.unk_44_17 - arg_1;

    if (r2 < 0)
        r2 = 0;
    else if (r2 >= 0xFF)
        r2 = 0xFF;

    self.unk_44_17 = r2;
}

EC void func_0800ED8C(Farmer & self)
{
    if (self.step_count < Farmer::MAX_COUNT_STEPS)
    {
        bool has_pedometer =
            (!self.unk_5C.IsEmpty() && self.unk_5C.GetTool().GetId() == TOOL_PEDOMETER) || self.rucksack.GetFirstSlotWithTool(TOOL_PEDOMETER) != -1;

        if (has_pedometer)
        {
            self.step_count++;
        }
    }
}

EC bool func_0800EE2C(Farmer & self)
{
    bool wrap_around = (++self.unk_48_1D) > 4;

    if (wrap_around)
        self.unk_48_1D = 0;

    return wrap_around;
}

EC void func_0800EE60(Farmer & self)
{
    if (self.unk_44_0F == 0)
    {
        if (self.unk_4C_00 < 0x7F)
        {
            self.unk_4C_00++;
        }
    }
    else
    {
        self.unk_4C_00 = 0;
    }

    if (self.unk_50_0D <= 6)
    {
        if (self.rucksack.GetUpgradeLevel() != Rucksack::LEVEL_0)
        {
            self.unk_50_0D++;
        }
    }
}

EC bool func_0800EECC(Farmer & self, unsigned int arg_1)
{
    if (self.unk_4C_07 < arg_1)
    {
        self.unk_4C_07 = arg_1;
        return true;
    }

    return false;
}

EC void func_0800EEF8(Farmer & self)
{
    if (self.unk_4C_0F < 1000000000)
    {
        self.unk_4C_0F++;
    }
}

Farmer::ToolLevel::ToolLevel()
    : unk_000(0), unk_010(0), unk_013(unk_010)
{
}

EC unsigned int func_0800EF68(Farmer::ToolLevel const & self)
{
    return self.unk_000;
}

EC unsigned int func_0800EF6C(Farmer::ToolLevel const & self)
{
    return self.unk_010;
}

EC bool func_0800EF74(Farmer::ToolLevel const & self)
{
    return self.unk_013 != self.unk_010;
}

EC void func_0800EF88(Farmer::ToolLevel & self, int arg_1)
{
    self.unk_000 = min_inl<u32 const &>(self.unk_000 + arg_1, 0xFFFF);
}

EC void func_0800EFB4(Farmer::ToolLevel & self, unsigned int arg_1)
{
    if (self.unk_010 != arg_1)
    {
        self.unk_013 = arg_1;
    }
}

EC void func_0800EFD8(Farmer::ToolLevel & self)
{
    self.unk_010 = self.unk_013;
}
