#include "scene_owners.hh"
#include "livestock_controller.hh"
#include <new>

SceneOwner521BC::~SceneOwner521BC() {}
SceneOwner57E1C::~SceneOwner57E1C() {}
SceneOwner5CEFC::~SceneOwner5CEFC() {}
SceneOwner5E658::~SceneOwner5E658() {}
SceneOwner5FD04::~SceneOwner5FD04() {}
SceneOwner69E58::~SceneOwner69E58() {}
SceneOwner7561C::~SceneOwner7561C() {}
SceneOwner7DD68::~SceneOwner7DD68() {}
SceneOwner7EE44::~SceneOwner7EE44() {}
SceneOwner7F5B0::~SceneOwner7F5B0() {}
SceneOwner8048C::~SceneOwner8048C() {}
SceneOwner80DC4::~SceneOwner80DC4() {}
SceneOwner81A70::~SceneOwner81A70() {}
SceneOwner82144::~SceneOwner82144() {}
SceneOwner83AEC::~SceneOwner83AEC() {}
SceneOwner85528::~SceneOwner85528() {}
SceneOwner881AC::~SceneOwner881AC() {}
SceneOwner8AB68::~SceneOwner8AB68() {}
SceneOwner8C59C::~SceneOwner8C59C() {}
SceneOwner8ED08::~SceneOwner8ED08() {}
SceneOwner90E84::~SceneOwner90E84() {}
SceneOwner925C4::~SceneOwner925C4() {}
SceneOwner931E0::~SceneOwner931E0() {}
SceneOwner93A88::~SceneOwner93A88() {}
SceneOwner9A518::~SceneOwner9A518() {}


// Old aggregate-return ABI: the caller supplies the one-pointer result slot.
struct SceneRequestResult
{
    AUnk_0800080C * request;
};

// Old auto_ptr-style return transfer used by the 925C4 controller path.
struct ControllerRunResult925
{
    AUnk_0800080C * request;

    ~ControllerRunResult925()
    {
        delete request;
    }
};

struct ControllerRunTransfer925
{
    ControllerRunResult925 * source;
    AUnk_0800080C * request;

    ControllerRunTransfer925(ControllerRunResult925 * source_, AUnk_0800080C * request_)
        : source(source_)
        , request(request_)
    {
        source->request = 0;
    }
};

// Local reconstruction of the old move-copy pointer semantics used by 83B2C.
// Keep this scoped to the recovered Run until SmartPtr itself is reconstructed.
template <typename T>
struct SceneMovePtr83
{
    T * inner;

    SceneMovePtr83(SceneMovePtr83 & source)
        : inner(source.Move())
    {
    }

    ~SceneMovePtr83()
    {
        delete inner;
    }

    T * Move()
    {
        T * value = inner;
        inner = 0;
        return value;
    }
};

extern u32 vtable_unk_080E7CF4[];

struct SceneRequest83
{
    u32 * vtable;
    SceneMovePtr83<AUnk_0800080C> continuation;
    void * context;
    u8 flag;

    SceneRequest83(SceneMovePtr83<AUnk_0800080C> continuation_, void * context_, u8 flag_)
        : vtable(vtable_unk_080E7CF4)
        , continuation(continuation_)
        , context(context_)
        , flag(flag_)
    {
    }
};

struct OwnedSceneRequest83
{
    AUnk_0800080C * request;

    ~OwnedSceneRequest83()
    {
        delete request;
    }
};

struct SceneRequestTransfer83
{
    OwnedSceneRequest83 * source;
    AUnk_0800080C * request;

    SceneRequestTransfer83(OwnedSceneRequest83 * source_, AUnk_0800080C * request_)
        : source(source_)
        , request(request_)
    {
        source->request = 0;
    }
};

// Local moving-copy and return-storage view used by 881EC.
template <typename T>
struct SceneMovePtr881
{
    T * inner;

    SceneMovePtr881()
    {
    }

    explicit SceneMovePtr881(T * value)
        : inner(value)
    {
    }

    SceneMovePtr881(SceneMovePtr881 & source)
        : inner(source.Move())
    {
    }

    ~SceneMovePtr881()
    {
        delete inner;
    }

    T * Move()
    {
        T * value = inner;
        inner = 0;
        return value;
    }
};

static inline u32 InnerSceneRequestMode881(int state)
{
    u32 mode = 1;
    if (state != 0)
        mode = 2;
    return mode;
}

extern u32 vtable_unk_080E5D94[];
extern u32 vtable_unk_080E5C64[];

struct InnerSceneRequest881
{
    u32 * vtable;
    SceneMovePtr881<AUnk_0800080C> continuation;
    void * context;
    u32 mode;

    InnerSceneRequest881(SceneMovePtr881<AUnk_0800080C> continuation_, void * context_, u32 mode_)
        : vtable(vtable_unk_080E5D94)
        , continuation(continuation_)
        , context(context_)
        , mode(mode_)
    {
    }
};

struct OuterSceneRequest881
{
    u32 * vtable;
    SceneMovePtr881<AUnk_0800080C> inner;
    void * context;
    u32 mode;
    u8 status;

    OuterSceneRequest881(SceneMovePtr881<AUnk_0800080C> inner_, void * context_, u32 mode_, u8 status_)
        : vtable(vtable_unk_080E5C64)
        , inner(inner_)
        , context(context_)
        , mode(mode_)
        , status(status_)
    {
    }
};

struct SceneRequestTransfer881
{
    SceneMovePtr881<AUnk_0800080C> * source;
    AUnk_0800080C * request;

    SceneRequestTransfer881(SceneMovePtr881<AUnk_0800080C> * source_, AUnk_0800080C * request_)
        : source(source_)
        , request(request_)
    {
        source->inner = 0;
    }
};

// These asm("func_...") clauses bind old linker symbols for typed calls;
// they do not inject inline ARM instructions or force a register. Preserve
// them until the original ABI/return ownership can be declared directly.
extern SmartPtr<AUnk_0800080C> RunController51504(SceneController *) asm("func_08051504");
extern SmartPtr<AUnk_0800080C> RunController52984(SceneController *) asm("func_08052984");
extern SmartPtr<AUnk_0800080C> RunController588AC(SceneController *) asm("func_080588AC");
extern SmartPtr<AUnk_0800080C> RunController5D170(SceneController *) asm("func_0805D170");
extern SmartPtr<AUnk_0800080C> RunController5EE44(SceneController *) asm("func_0805EE44");
extern void RunController769A0(SceneController *) asm("func_080769A0");
extern void RunController7D218(SceneController *) asm("func_0807D218");
extern void RunController7E558(SceneController *) asm("func_0807E558");
extern void RunController7EF90(SceneController *) asm("func_0807EF90");
extern void RunController7F8C8(SceneController *) asm("func_0807F8C8");
extern void RunController80540(SceneController *) asm("func_08080540");
extern void RunController8114C(SceneController *) asm("func_0808114C");
extern void RunController81BBC(SceneController *) asm("func_08081BBC");
extern int RunController82CEC(SceneController *) asm("func_08082CEC");
extern void RunController84228(SceneController *) asm("func_08084228");
extern int RunController86A08(SceneController *) asm("func_08086A08");

extern void RunController8A55C(SceneController *) asm("func_0808A55C");
extern void RunController8C0BC(SceneController *) asm("func_0808C0BC");
extern void RunController8E6FC(SceneController *) asm("func_0808E6FC");
extern void RunController90960(SceneController *) asm("func_08090960");
extern ControllerRunResult925 * RunController9152C(ControllerRunResult925 *, SceneController *) asm("func_0809152C");
extern void RunController92D64(SceneController *) asm("func_08092D64");
extern void RunController93364(SceneController *) asm("func_08093364");
extern SmartPtr<AUnk_0800080C> RunController94F6C(SceneController *) asm("func_08094F6C");

EC SceneRequestResult * func_080521FC(SceneRequestResult *, SceneOwner521BC *) SECTION(".text.scene_run_521fc");
SceneRequestResult * func_080521FC(SceneRequestResult * result, SceneOwner521BC * self)
{
    RunController51504(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08057E5C(SceneRequestResult *, SceneOwner57E1C *) SECTION(".text.scene_run_57e5c");
SceneRequestResult * func_08057E5C(SceneRequestResult * result, SceneOwner57E1C * self)
{
    RunController52984(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0805CF3C(SceneRequestResult *, SceneOwner5CEFC *) SECTION(".text.scene_run_5cf3c");
SceneRequestResult * func_0805CF3C(SceneRequestResult * result, SceneOwner5CEFC * self)
{
    RunController588AC(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0805E698(SceneRequestResult *, SceneOwner5E658 *) SECTION(".text.scene_run_5e698");
SceneRequestResult * func_0805E698(SceneRequestResult * result, SceneOwner5E658 * self)
{
    RunController5D170(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0805FD44(SceneRequestResult *, SceneOwner5FD04 *) SECTION(".text.scene_run_5fd44");
SceneRequestResult * func_0805FD44(SceneRequestResult * result, SceneOwner5FD04 * self)
{
    RunController5EE44(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08069E98(SceneRequestResult *, SceneOwner69E58 *) SECTION(".text.scene_run_69e98");
SceneRequestResult * func_08069E98(SceneRequestResult * result, SceneOwner69E58 * self)
{
    RunController769A0(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0807565C(SceneRequestResult *, SceneOwner7561C *) SECTION(".text.scene_run_7565c");
SceneRequestResult * func_0807565C(SceneRequestResult * result, SceneOwner7561C * self)
{
    RunController769A0(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0807DDA8(SceneRequestResult *, SceneOwner7DD68 *) SECTION(".text.scene_run_7dda8");
SceneRequestResult * func_0807DDA8(SceneRequestResult * result, SceneOwner7DD68 * self)
{
    RunController7D218(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0807EE84(SceneRequestResult *, SceneOwner7EE44 *) SECTION(".text.scene_run_7ee84");
SceneRequestResult * func_0807EE84(SceneRequestResult * result, SceneOwner7EE44 * self)
{
    RunController7E558(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0807F5F0(SceneRequestResult *, SceneOwner7F5B0 *) SECTION(".text.scene_run_7f5f0");
SceneRequestResult * func_0807F5F0(SceneRequestResult * result, SceneOwner7F5B0 * self)
{
    RunController7EF90(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_080804CC(SceneRequestResult *, SceneOwner8048C *) SECTION(".text.scene_run_804cc");
SceneRequestResult * func_080804CC(SceneRequestResult * result, SceneOwner8048C * self)
{
    RunController7F8C8(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08080E04(SceneRequestResult *, SceneOwner80DC4 *) SECTION(".text.scene_run_80e04");
SceneRequestResult * func_08080E04(SceneRequestResult * result, SceneOwner80DC4 * self)
{
    RunController80540(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08081AB0(SceneRequestResult *, SceneOwner81A70 *) SECTION(".text.scene_run_81ab0");
SceneRequestResult * func_08081AB0(SceneRequestResult * result, SceneOwner81A70 * self)
{
    RunController8114C(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08082184(SceneRequestResult *, SceneOwner82144 *) SECTION(".text.scene_run_82184");
SceneRequestResult * func_08082184(SceneRequestResult * result, SceneOwner82144 * self)
{
    RunController81BBC(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08083B2C(SceneRequestResult *, SceneOwner83AEC *) SECTION(".text.scene_run_83b2c");
SceneRequestResult * func_08083B2C(SceneRequestResult * result, SceneOwner83AEC * self)
{
    SceneMovePtr83<AUnk_0800080C> * continuation =
        reinterpret_cast<SceneMovePtr83<AUnk_0800080C> *>(&self->continuation);

    int status = RunController82CEC(self->controller.Get());

    if (status == 0) {
        result->request = continuation->Move();
    } else if (status == 1) {
        OwnedSceneRequest83 owned;
        SceneRequest83 * request = new SceneRequest83(*continuation, self->unk_1C, 0);
        owned.request = reinterpret_cast<AUnk_0800080C *>(request);
        AUnk_0800080C * moved = owned.request;
        SceneRequestTransfer83 transfer(&owned, moved);
        result->request = moved;
    } else {
        OwnedSceneRequest83 owned;
        SceneRequest83 * request = new SceneRequest83(*continuation, self->unk_1C, 1);
        owned.request = reinterpret_cast<AUnk_0800080C *>(request);
        AUnk_0800080C * moved = owned.request;
        SceneRequestTransfer83 transfer(&owned, moved);
        result->request = moved;
    }

    return result;
}

EC SceneRequestResult * func_08085568(SceneRequestResult *, SceneOwner85528 *) SECTION(".text.scene_run_85568");
SceneRequestResult * func_08085568(SceneRequestResult * result, SceneOwner85528 * self)
{
    RunController84228(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_080881EC(SceneRequestResult *, SceneOwner881AC *) SECTION(".text.scene_run_881ec");
SceneRequestResult * func_080881EC(SceneRequestResult * result, SceneOwner881AC * self)
{
    SceneMovePtr881<AUnk_0800080C> * continuation =
        reinterpret_cast<SceneMovePtr881<AUnk_0800080C> *>(&self->continuation);

    int status = RunController86A08(self->controller.Get());

    if (status != -1) {
        u32 animalType = GetPurchasedAnimalType(self->controller.Get());

        u32 outerMode = 1;
        if (animalType != 0)
            outerMode = 2;

        SceneMovePtr881<AUnk_0800080C> innerOwner(
            reinterpret_cast<AUnk_0800080C *>(
                new InnerSceneRequest881(*continuation, self->unk_10, InnerSceneRequestMode881(animalType))));

        SceneMovePtr881<AUnk_0800080C> returnSource;
        OuterSceneRequest881 * outer = new OuterSceneRequest881(
            innerOwner, self->unk_10, outerMode, status);
        AUnk_0800080C * moved = reinterpret_cast<AUnk_0800080C *>(outer);
        SceneRequestTransfer881 transfer(&returnSource, moved);
        result->request = moved;
    } else {
        result->request = continuation->Move();
    }

    return result;
}

EC SceneRequestResult * func_0808ABA8(SceneRequestResult *, SceneOwner8AB68 *) SECTION(".text.scene_run_8aba8");
SceneRequestResult * func_0808ABA8(SceneRequestResult * result, SceneOwner8AB68 * self)
{
    RunController8A55C(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0808C5DC(SceneRequestResult *, SceneOwner8C59C *) SECTION(".text.scene_run_8c5dc");
SceneRequestResult * func_0808C5DC(SceneRequestResult * result, SceneOwner8C59C * self)
{
    RunController8C0BC(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0808ED48(SceneRequestResult *, SceneOwner8ED08 *) SECTION(".text.scene_run_8ed48");
SceneRequestResult * func_0808ED48(SceneRequestResult * result, SceneOwner8ED08 * self)
{
    RunController8E6FC(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08090EC4(SceneRequestResult *, SceneOwner90E84 *) SECTION(".text.scene_run_90ec4");
SceneRequestResult * func_08090EC4(SceneRequestResult * result, SceneOwner90E84 * self)
{
    RunController90960(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08092604(SceneRequestResult *, SceneOwner925C4 *) SECTION(".text.scene_run_92604");
SceneRequestResult * func_08092604(SceneRequestResult * result, SceneOwner925C4 * self)
{
    ControllerRunResult925 next;
    RunController9152C(&next, self->controller.Get());
    AUnk_0800080C * moved = next.request;
    ControllerRunTransfer925 transfer(&next, moved);
    result->request = moved;
    return result;
}

EC SceneRequestResult * func_08093220(SceneRequestResult *, SceneOwner931E0 *) SECTION(".text.scene_run_93220");
SceneRequestResult * func_08093220(SceneRequestResult * result, SceneOwner931E0 * self)
{
    RunController92D64(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_08093AD4(SceneRequestResult *, SceneOwner93A88 *) SECTION(".text.scene_run_93ad4");
SceneRequestResult * func_08093AD4(SceneRequestResult * result, SceneOwner93A88 * self)
{
    RunController93364(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

EC SceneRequestResult * func_0809A558(SceneRequestResult *, SceneOwner9A518 *) SECTION(".text.scene_run_9a558");
SceneRequestResult * func_0809A558(SceneRequestResult * result, SceneOwner9A518 * self)
{
    RunController94F6C(self->controller.Get());
    result->request = self->continuation.Move();
    return result;
}

extern SceneController * ConstructController5143C(void *, void *) asm("func_0805143C");
extern SceneController * ConstructController522F8(void *, void *, u8) asm("func_080522F8");
extern SceneController * ConstructController5806C(void *, void *, u8) asm("func_0805806C");
extern SceneController * ConstructController5FD78(void *, void *, u8) asm("func_0805FD78");
extern SceneController * ConstructController5CF70(void *, void *) asm("func_0805CF70");
extern SceneController * ConstructController5ED4C(void *, void *) asm("func_0805ED4C");
extern SceneController * ConstructController70B70(void *, void *) asm("func_08070B70");
extern SceneController * ConstructController7D194(void *, void *) asm("func_0807D194");
extern SceneController * ConstructController7E4D4(void *, void *) asm("func_0807E4D4");
extern SceneController * ConstructController7EEA0(void *, void *) asm("func_0807EEA0");
extern SceneController * ConstructController7F63C(void *, void *) asm("func_0807F63C");
extern SceneController * ConstructController804F8(void *, void *) asm("func_080804F8");
extern SceneController * ConstructController80E20(void *, void *) asm("func_08080E20");
extern SceneController * ConstructController81ACC(void *, void *) asm("func_08081ACC");
extern SceneController * ConstructController821D0(void *, void *, u8, u32, u32, u32, u32) asm("func_080821D0");
extern SceneController * ConstructController83BD4(void *, void *) asm("func_08083BD4");
extern SceneController * ConstructController85584(void *, void *, u32) asm("func_08085584");
extern SceneController * ConstructController882AC(void *, void *) asm("func_080882AC");
extern SceneController * ConstructController8ABC4(void *, void *) asm("func_0808ABC4");
extern SceneController * ConstructController8C5F8(void *, void *) asm("func_0808C5F8");
extern SceneController * ConstructController8ED64(void *, void *) asm("func_0808ED64");
extern SceneController * ConstructController92640(void *, void *) asm("func_08092640");
extern SceneController * ConstructController9323C(void *, void *) asm("func_0809323C");
extern SceneController * ConstructController94AC0(void *, void *, u8) asm("func_08094AC0");

SceneOwner521BC::SceneOwner521BC(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController5143C(operator new(0x8c0), context))
    , continuation(next.Move())
{
}

SceneOwner57E1C::SceneOwner57E1C(SmartPtr<AUnk_0800080C> & next, void * context, u8 value)
    : controller(ConstructController522F8(operator new(0x23a8), context, value))
    , continuation(next.Move())
{
}

SceneOwner5CEFC::SceneOwner5CEFC(SmartPtr<AUnk_0800080C> & next, void * context, u8 value)
    : controller(ConstructController5806C(operator new(0x14fc), context, value))
    , continuation(next.Move())
{
}

SceneOwner5E658::SceneOwner5E658(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController5CF70(operator new(0xaf4), context))
    , continuation(next.Move())
{
}

SceneOwner5FD04::SceneOwner5FD04(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController5ED4C(operator new(0x6430), context))
    , continuation(next.Move())
{
}

SceneOwner69E58::SceneOwner69E58(SmartPtr<AUnk_0800080C> & next, void * context, u8 value)
    : controller(ConstructController5FD78(operator new(0x164), context, value))
    , continuation(next.Move())
{
}

SceneOwner7561C::SceneOwner7561C(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController70B70(operator new(0x17c), context))
    , continuation(next.Move())
{
}

SceneOwner7DD68::SceneOwner7DD68(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController7D194(operator new(0x710), context))
    , continuation(next.Move())
{
}

SceneOwner7EE44::SceneOwner7EE44(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController7E4D4(operator new(0x710), context))
    , continuation(next.Move())
{
}

SceneOwner7F5B0::SceneOwner7F5B0(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController7EEA0(operator new(0x6b0), context))
    , continuation(next.Move())
{
}

SceneOwner8048C::SceneOwner8048C(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController7F63C(operator new(0x710), context))
    , continuation(next.Move())
{
}

SceneOwner80DC4::SceneOwner80DC4(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController804F8(operator new(0x710), context))
    , continuation(next.Move())
{
}

SceneOwner81A70::SceneOwner81A70(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController80E20(operator new(0x710), context))
    , continuation(next.Move())
{
}

SceneOwner82144::SceneOwner82144(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController81ACC(operator new(0x6b0), context))
    , continuation(next.Move())
{
}

SceneOwner83AEC::SceneOwner83AEC(SmartPtr<AUnk_0800080C> & next, void * context, u8 value, u32 a, u32 b, u32 c, u32 d)
    : controller(ConstructController821D0(operator new(0x48e8), context, value, a, b, c, d))
    , continuation(next.Move())
    , unk_0C(a)
    , unk_10(b)
    , unk_14(c)
    , unk_18(d)
    , unk_1C(context)
{
}

SceneOwner85528::SceneOwner85528(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController83BD4(operator new(0x61f4), context))
    , continuation(next.Move())
{
}

SceneOwner881AC::SceneOwner881AC(SmartPtr<AUnk_0800080C> & next, void * context, u32 value)
    : controller(ConstructController85584(operator new(0x43e0), context, value))
    , continuation(next.Move())
    , unk_0C(value)
    , unk_10(context)
{
}

SceneOwner8AB68::SceneOwner8AB68(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController882AC(operator new(0x10c), context))
    , continuation(next.Move())
{
}

SceneOwner8C59C::SceneOwner8C59C(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController8ABC4(operator new(0x10c), context))
    , continuation(next.Move())
{
}

SceneOwner8ED08::SceneOwner8ED08(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController8C5F8(operator new(0x10c), context))
    , continuation(next.Move())
{
}

SceneOwner90E84::SceneOwner90E84(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController8ED64(operator new(0x10c), context))
    , continuation(next.Move())
{
}

SceneOwner931E0::SceneOwner931E0(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController92640(operator new(0x10c), context))
    , continuation(next.Move())
{
}

SceneOwner93A88::SceneOwner93A88(SmartPtr<AUnk_0800080C> & next, void * context)
    : controller(ConstructController9323C(operator new(0x3f0), context))
    , continuation(next.Move())
{
}

SceneOwner9A518::SceneOwner9A518(SmartPtr<AUnk_0800080C> & next, void * context, u8 value)
    : controller(ConstructController94AC0(operator new(0x33e0), context, value))
    , continuation(next.Move())
{
}
