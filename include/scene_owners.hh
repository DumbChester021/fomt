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

DECLARE_SCENE_OWNER(SceneOwner521BC, ".text.scene_owner_521bc")
DECLARE_SCENE_OWNER(SceneOwner57E1C, ".text.scene_owner_57e1c")
DECLARE_SCENE_OWNER(SceneOwner5CEFC, ".text.scene_owner_5cefc")
DECLARE_SCENE_OWNER(SceneOwner5E658, ".text.scene_owner_5e658")
DECLARE_SCENE_OWNER(SceneOwner5FD04, ".text.scene_owner_5fd04")
DECLARE_SCENE_OWNER(SceneOwner69E58, ".text.scene_owner_69e58")
DECLARE_SCENE_OWNER(SceneOwner7561C, ".text.scene_owner_7561c")
DECLARE_SCENE_OWNER(SceneOwner7DD68, ".text.scene_owner_7dd68")
DECLARE_SCENE_OWNER(SceneOwner7EE44, ".text.scene_owner_7ee44")
DECLARE_SCENE_OWNER(SceneOwner7F5B0, ".text.scene_owner_7f5b0")
DECLARE_SCENE_OWNER(SceneOwner8048C, ".text.scene_owner_8048c")
DECLARE_SCENE_OWNER(SceneOwner80DC4, ".text.scene_owner_80dc4")
DECLARE_SCENE_OWNER(SceneOwner81A70, ".text.scene_owner_81a70")
DECLARE_SCENE_OWNER(SceneOwner82144, ".text.scene_owner_82144")
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

DECLARE_SCENE_OWNER(SceneOwner85528, ".text.scene_owner_85528")
struct SceneOwner881AC : public AScene
{
    virtual ~SceneOwner881AC() SECTION(".text.scene_owner_881ac");
    virtual SmartPtr<AUnk_0800080C> Run();

    SmartPtr<SceneController> controller;
    SmartPtr<AUnk_0800080C> continuation;
    u32 unk_0C;
    void * unk_10;
};

DECLARE_SCENE_OWNER(SceneOwner8AB68, ".text.scene_owner_8ab68")
DECLARE_SCENE_OWNER(SceneOwner8C59C, ".text.scene_owner_8c59c")
DECLARE_SCENE_OWNER(SceneOwner8ED08, ".text.scene_owner_8ed08")
DECLARE_SCENE_OWNER(SceneOwner90E84, ".text.scene_owner_90e84")
DECLARE_SCENE_OWNER(SceneOwner925C4, ".text.scene_owner_925c4")
DECLARE_SCENE_OWNER(SceneOwner931E0, ".text.scene_owner_931e0")
DECLARE_SCENE_OWNER(SceneOwner93A88, ".text.scene_owner_93a88")
DECLARE_SCENE_OWNER(SceneOwner9A518, ".text.scene_owner_9a518")

#undef DECLARE_SCENE_OWNER

#endif // SCENE_OWNERS_HH
