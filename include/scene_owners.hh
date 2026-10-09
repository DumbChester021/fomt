#ifndef SCENE_OWNERS_HH
#define SCENE_OWNERS_HH

#include "scene.hh"

#pragma interface

// Shared deletion prefix; concrete controllers have additional state.
struct SceneController
{
    virtual ~SceneController();

    /* +00 */ void * unk_00;
    /* +04 */ // vtable
};

#define DECLARE_SCENE_OWNER(name, section_name) \
    struct name : public AScene \
    { \
        virtual ~name() SECTION(section_name); \
        virtual SmartPtr<AUnk_0800080C> Run(); \
        SmartPtr<SceneController> controller; \
        SmartPtr<AUnk_0800080C> continuation; \
    };

#define DECLARE_SCENE_OWNER_CTOR(name, ctor_section, dtor_section) \
    struct name : public AScene \
    { \
        name(SmartPtr<AUnk_0800080C> &, void *) SECTION(ctor_section); \
        virtual ~name() SECTION(dtor_section); \
        virtual SmartPtr<AUnk_0800080C> Run(); \
        SmartPtr<SceneController> controller; \
        SmartPtr<AUnk_0800080C> continuation; \
    };

#define DECLARE_SCENE_OWNER_CTOR_U8(name, ctor_section, dtor_section) \
    struct name : public AScene \
    { \
        name(SmartPtr<AUnk_0800080C> &, void *, u8) SECTION(ctor_section); \
        virtual ~name() SECTION(dtor_section); \
        virtual SmartPtr<AUnk_0800080C> Run(); \
        SmartPtr<SceneController> controller; \
        SmartPtr<AUnk_0800080C> continuation; \
    };

DECLARE_SCENE_OWNER_CTOR(SceneOwner521BC, ".text.scene_ctor_5218c", ".text.scene_owner_521bc")
DECLARE_SCENE_OWNER_CTOR_U8(SceneOwner57E1C, ".text.scene_ctor_57dd8", ".text.scene_owner_57e1c")
DECLARE_SCENE_OWNER_CTOR_U8(SceneOwner5CEFC, ".text.scene_ctor_5ceb8", ".text.scene_owner_5cefc")
DECLARE_SCENE_OWNER_CTOR(SceneOwner5E658, ".text.scene_ctor_5e624", ".text.scene_owner_5e658")
DECLARE_SCENE_OWNER_CTOR(SceneOwner5FD04, ".text.scene_ctor_5fcd0", ".text.scene_owner_5fd04")
DECLARE_SCENE_OWNER_CTOR_U8(SceneOwner69E58, ".text.scene_ctor_69e14", ".text.scene_owner_69e58")
DECLARE_SCENE_OWNER_CTOR(SceneOwner7561C, ".text.scene_ctor_755ec", ".text.scene_owner_7561c")
DECLARE_SCENE_OWNER_CTOR(SceneOwner7DD68, ".text.scene_ctor_7dd38", ".text.scene_owner_7dd68")
DECLARE_SCENE_OWNER_CTOR(SceneOwner7EE44, ".text.scene_ctor_7ee14", ".text.scene_owner_7ee44")
DECLARE_SCENE_OWNER_CTOR(SceneOwner7F5B0, ".text.scene_ctor_7f580", ".text.scene_owner_7f5b0")
DECLARE_SCENE_OWNER_CTOR(SceneOwner8048C, ".text.scene_ctor_8045c", ".text.scene_owner_8048c")
DECLARE_SCENE_OWNER_CTOR(SceneOwner80DC4, ".text.scene_ctor_80d94", ".text.scene_owner_80dc4")
DECLARE_SCENE_OWNER_CTOR(SceneOwner81A70, ".text.scene_ctor_81a40", ".text.scene_owner_81a70")
DECLARE_SCENE_OWNER_CTOR(SceneOwner82144, ".text.scene_ctor_82114", ".text.scene_owner_82144")
struct SceneOwner83AEC : public AScene
{
    virtual ~SceneOwner83AEC() SECTION(".text.scene_owner_83aec");
    virtual SmartPtr<AUnk_0800080C> Run();

    SmartPtr<SceneController> controller;
    SmartPtr<AUnk_0800080C> continuation;
    u32 unk_0C;
    u32 unk_10;
    u32 unk_14;
    u32 unk_18;
    void * unk_1C;
};

DECLARE_SCENE_OWNER_CTOR(SceneOwner85528, ".text.scene_ctor_854f4", ".text.scene_owner_85528")
struct SceneOwner881AC : public AScene
{
    virtual ~SceneOwner881AC() SECTION(".text.scene_owner_881ac");
    virtual SmartPtr<AUnk_0800080C> Run();

    SmartPtr<SceneController> controller;
    SmartPtr<AUnk_0800080C> continuation;
    u32 unk_0C;
    void * unk_10;
};

DECLARE_SCENE_OWNER_CTOR(SceneOwner8AB68, ".text.scene_ctor_8ab38", ".text.scene_owner_8ab68")
DECLARE_SCENE_OWNER_CTOR(SceneOwner8C59C, ".text.scene_ctor_8c56c", ".text.scene_owner_8c59c")
DECLARE_SCENE_OWNER_CTOR(SceneOwner8ED08, ".text.scene_ctor_8ecd8", ".text.scene_owner_8ed08")
DECLARE_SCENE_OWNER_CTOR(SceneOwner90E84, ".text.scene_ctor_90e54", ".text.scene_owner_90e84")
DECLARE_SCENE_OWNER(SceneOwner925C4, ".text.scene_owner_925c4")
DECLARE_SCENE_OWNER_CTOR(SceneOwner931E0, ".text.scene_ctor_931b0", ".text.scene_owner_931e0")
DECLARE_SCENE_OWNER_CTOR(SceneOwner93A88, ".text.scene_ctor_93a58", ".text.scene_owner_93a88")
DECLARE_SCENE_OWNER(SceneOwner9A518, ".text.scene_owner_9a518")

#undef DECLARE_SCENE_OWNER_CTOR_U8
#undef DECLARE_SCENE_OWNER_CTOR
#undef DECLARE_SCENE_OWNER

#endif // SCENE_OWNERS_HH
