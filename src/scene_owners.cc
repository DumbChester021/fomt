#include "scene_owners.hh"

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
extern void RunController84228(SceneController *) asm("func_08084228");
extern void RunController8A55C(SceneController *) asm("func_0808A55C");
extern void RunController8C0BC(SceneController *) asm("func_0808C0BC");
extern void RunController8E6FC(SceneController *) asm("func_0808E6FC");
extern void RunController90960(SceneController *) asm("func_08090960");
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

EC SceneRequestResult * func_08085568(SceneRequestResult *, SceneOwner85528 *) SECTION(".text.scene_run_85568");
SceneRequestResult * func_08085568(SceneRequestResult * result, SceneOwner85528 * self)
{
    RunController84228(self->controller.Get());
    result->request = self->continuation.Move();
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
