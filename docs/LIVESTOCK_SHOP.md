# Livestock shop: controller, offers and barn queries

Controller 85584 handles livestock purchase and sale offers. Its construction,
cleanup, helper contracts and catalog are exact source. The complete screen
implementation and shared base internals remain incomplete.

## Exact source boundaries

| Entry | Retail range | Linked bytes | Behavior |
| --- | --- | ---: | --- |
| LivestockController constructor | 08085584..0808562C | 168 | Base construction and screen fields |
| LivestockController destructor | 0808562C..08085640 | 20 | Derived vtable and base cleanup |
| GetAnimalHeartCount | 08085EC4..08085EEC | 40 | min(10, unsigned affection / 25) |
| GetPurchasedAnimalType | 08085EEC..08085F08 | 28 | Purchase type 0/1, otherwise 999 |
| GetAnimalSalePrice | 080868E4..080869A0 | 188 | Species/rank sale price |
| CountPregnantAnimals | 080869A0..08086A08 | 104 | Pregnant livestock across Barn capacity |

include/livestock_controller.hh and src/livestock_controller.cc preserve the
original function symbols. The six functions own 548 linked bytes: 188 for
construction/cleanup and 360 for helpers. The helper spans include two alignment
bytes after the heart and pregnancy helpers; those bodies are 38 and 102 bytes.
Complete linked blocks are the matching authority.

## Controller construction and layout

LivestockController derives from ControllerC7F58, whose proven extent is
0x6A4. That base derives from the existing eight-byte SceneController deletion
prefix. Its context pointer is at +8; the remaining base fields are opaque.
Base construction and cleanup still call assembly at 080C7F58 and 080C8360.

| Offset | Field or extent | Constructor behavior |
| --- | --- | --- |
| +0x6A4 | u32 state | Input 0/1/other selects 0/5/6 |
| +0x6A8 | Byte flag | Clears |
| +0x6AC..+0x72B | Opaque 128-byte range | No derived initialization |
| +0x72C | u32 field | Clears |
| +0x730..+0x76F | Opaque 64-byte range | No derived initialization |
| +0x770 | 17 menu records, stride 0x304 | Empty default construction |
| +0x3AB4 | FixedStr<127> title | Copies gUnk_080FFC6C with length cap |
| +0x3B34 | FixedStr<99> message | Clears first byte |
| +0x3B98 | 16 animal records, stride 0x84 | Clears each string's first byte |
| +0x43D8/+0x43DC | Purchase type/slot | No constructor initialization |

Menu-record consumers prove the 0x304 stride and 0x300-byte interior range
at +4. Their empty default constructors naturally retain the retail loop:
the counter starts at 16 and decrements until -1, for seventeen iterations.
The contents remain opaque. Each animal record has an uninitialized word at
+0 and FixedStr<127> at +4. The array ends exactly at the purchase result tail.
Description concatenation proves the message capacity of 99 characters;
this field occupies 100 bytes and does not overlap the animal records.

The destructor installs vtable 080E7D30 at +4 and forwards the incoming
destructor mode to the base. Normal compiler ABI and linker aliases retain
the original retail entry labels; no generated vtable copy is emitted.

## Controller context and results

| Offset | Proven contract |
| --- | --- |
| Controller +4 | Derived vtable 080E7D30 |
| Controller +8 | Context pointer |
| Context +0x5F0 | Existing Barn object |
| Controller +0x43D8 | Purchase type: cow 0, sheep 1 |
| Controller +0x43DC | Returned insertion slot |
| Allocation | 0x43E0 bytes |

Successful Barn::InsertCow and Barn::InsertSheep paths prove the tail meanings.
The getter returns a stored value <=1, otherwise 999; it does not initialize
the field. Result types differ from shop service IDs and Barn::Ent::Kind.

Scene Run 881EC selects nested mode 1 for zero and mode 2 for every other
result. Its source uses the semantic getter; its 192-byte span and ownership
transfers remain exact. See [SCENES.md](SCENES.md).

The controller extent and initialization fields are proven, while the base
and menu interiors remain opaque. The context view does not claim a complete
GameState layout. Existing Barn, Cow, Sheep and
BarnAnimal interfaces remain authoritative.

## Animal display and sale contracts

Both audited calls in renderer 8586C pass Animal::GetAffection before drawing
repeated icons. Heart count uses divisor 25 and is capped at ten.

| Product rank | Cow sale price | Sheep sale price |
| ---: | ---: | ---: |
| 0 | 3000 | 2000 |
| 1 | 4000 | 2500 |
| 2 | 5000 | 3000 |
| 3 | 6000 | 4000 |
| 4 | 7000 | 5000 |

Sale price defaults to 3000 for an unhandled type or rank. Valid-species paths
dereference the selected animal and require a valid slot. Pricing uses
Livestock::GetProductRank, not affection directly.

Pregnancy count scans below live Barn capacity, tests cow then sheep, and
calls BarnAnimal::IsPregnant. Retail repeats the successful getter before
the pregnancy test; source preserves those calls.

## Editable catalog

LivestockShopEntry in include/shop_catalog.hh is a 20-byte record.
gUnk_080FFB90[11] in src/data_shop_catalog.cc replaces 080FFB90..080FFC6C.

| Offset | Field | Consumer evidence |
| --- | --- | --- |
| +0 | Item or service ID | Article/Tool construction and action branches |
| +4 | Name pointer | Service names passed to the text renderer |
| +8 | Unit price | Purchase amount multiplied by this value |
| +0xC | Description pointer | Buy/sell service description path |
| +0x10 | Kind | Article, purchase, Tool, sale or animal-info dispatch |

| Entry | Unit price | Kind |
| --- | ---: | --- |
| Animal fodder | 20 | Article |
| Buy cow | 5000 | Purchase |
| Buy sheep | 4000 | Purchase |
| Cow Miracle Potion | 3000 | Tool |
| Sheep Miracle Potion | 3000 | Tool |
| Animal medicine | 1000 | Tool |
| Bell | 500 | Tool |
| Sell cow | 0 | Sale |
| Sell sheep | 0 | Sale |
| Cow info | 0 | Animal info |
| Sheep info | 0 | Animal info |

Zero sale-entry catalog prices do not define payout; GetAnimalSalePrice does.
Article/Tool descriptions use existing item interfaces. Label pointers retain
the original empty/Buy Cow/Buy Sheep/Sell Cow/Sell Sheep bundle at
080FFB60..080FFB90, which remains assembly.

The table originally belonged to .rodata.after_record_article_catalog.
Source follows that prefix, then remaining assembly follows in
.rodata.after_livestock_shop_catalog. Address adjacency alone does not
establish the owning section.

## Offer-list inputs and tilemap drawing

Builder 85640 resets a capacity-40 list whose count is at base +0x20 and
whose 16-byte descriptor array begins at +0x24. The offer-ID count is at
+0x2A4, followed by forty u32 IDs at +0x2A8. Base +0x1C stores a
tilemap-owner pointer; the owner stores the u16 tile pointer at +0x18.

For Article/Tool kinds, the builder uses existing icon IDs and packed sprite
bank gUnk_086678A0. It registers graphics/palette pointers from a returned
32-byte frame descriptor. Source ownership and copy lifetimes are unresolved;
the observed post-getter copy needs a shared interface explanation.

Entries occupy two tile rows. FillSequentialTileRect is exact source, and
the price-number drawer remains assembly. Offer IDs <=6 draw unit_price.
See [MENU_TILEMAP.md](MENU_TILEMAP.md) for rectangles, digits and column offsets.

## Verification and remaining boundaries

Natural construction/cleanup, four helpers, complete blocks/TU slices and
all 220 relocated catalog bytes match. Final isolated and forced production
full-ROM comparisons pass with the unchanged tracked compiler.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.

The lifecycle promotion removes only ctor 85584 and dtor 8562C from the
remaining-function inventory; every other assembly address/size is unchanged.
Offer builder 85640, renderer 8586C, description 85F08 and Run 86A08 remain
assembly. Builder recovery is parked on frame-copy and list-lifetime contracts.
The packed frame getter 5E790 is now parked at 140 bytes / 34 differences,
reproducing its historical middle schedule. The sprite/animation count accessors
at 5E81C/5E820 add eight exact source bytes; shared frame-copy/list lifetimes
remain unresolved. Related menu callbacks/text streams now add fourteen
exact functions/ 576 bytes. OAM EA94 is parked; next recover the 756-byte
shared glyph backend family. See [MENU_TEXT.md](MENU_TEXT.md).
A specific named store/location and opaque base/record semantics remain
unclaimed. NEXT_AGENT_HANDOFF.md owns the continuation.
