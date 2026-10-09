#include "prelude.h"

// Prefix views only: the remaining object layout and concrete owned type are unknown.
struct OwnedPolymorphicObject
{
    virtual ~OwnedPolymorphicObject();
};

struct PolymorphicOwner4
{
    void * vtable;
    OwnedPolymorphicObject * owned;
};

struct PolymorphicOwner8
{
    void * vtable;
    void * unk_04;
    OwnedPolymorphicObject * owned;
};

extern void DestroySceneBase(void *, u32) asm("func_080007EC");
extern void DestroySceneRequestBase(void *, u32) asm("func_0800080C");

// Retail entries forward the incoming destructor mode to the base destructor.
// An explicit ABI call avoids introducing an unobserved derived-vtable store.
#define OWNED_DTOR(section_name, name, owner, base) \
    EC void name(owner *, u32) SECTION(section_name); \
    void name(owner * self, u32 mode) \
    { \
        delete self->owned; \
        base(self, mode); \
    }

OWNED_DTOR(".text.owned_dtor_db2ec", func_080DB2EC, PolymorphicOwner8, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db36c", func_080DB36C, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db3dc", func_080DB3DC, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db630", func_080DB630, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db6a4", func_080DB6A4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db714", func_080DB714, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db784", func_080DB784, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db7f4", func_080DB7F4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db864", func_080DB864, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db8d4", func_080DB8D4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db944", func_080DB944, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_db9b4", func_080DB9B4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dba24", func_080DBA24, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dba94", func_080DBA94, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbb04", func_080DBB04, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbb74", func_080DBB74, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbbe4", func_080DBBE4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbc50", func_080DBC50, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbcc0", func_080DBCC0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbd30", func_080DBD30, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbda0", func_080DBDA0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbe10", func_080DBE10, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbe80", func_080DBE80, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbef0", func_080DBEF0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbf60", func_080DBF60, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dbfd0", func_080DBFD0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc040", func_080DC040, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc0c0", func_080DC0C0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc130", func_080DC130, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc1a0", func_080DC1A0, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc21c", func_080DC21C, PolymorphicOwner8, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc404", func_080DC404, PolymorphicOwner4, DestroySceneBase)
OWNED_DTOR(".text.owned_dtor_dc474", func_080DC474, PolymorphicOwner8, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc4e4", func_080DC4E4, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_dc554", func_080DC554, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_e09bc", func_080E09BC, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_e34dc", func_080E34DC, PolymorphicOwner4, DestroySceneRequestBase)
OWNED_DTOR(".text.owned_dtor_e41e8", func_080E41E8, PolymorphicOwner4, DestroySceneBase)
OWNED_DTOR(".text.owned_dtor_e4210", func_080E4210, PolymorphicOwner4, DestroySceneBase)
