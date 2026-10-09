# Livestock shop: offers, animal results and barn queries

Controller 85584 handles livestock purchase and sale offers. Its helper
contracts and catalog are exact source. The complete screen controller,
base class and virtual hierarchy remain incomplete.

## Exact source boundaries

| Helper | Retail range | Linked bytes | Behavior |
| --- | --- | ---: | --- |
| GetAnimalHeartCount | 08085EC4..08085EEC | 40 | min(10, unsigned affection / 25) |
| GetPurchasedAnimalType | 08085EEC..08085F08 | 28 | Purchase type 0/1, otherwise 999 |
| GetAnimalSalePrice | 080868E4..080869A0 | 188 | Species/rank sale price |
| CountPregnantAnimals | 080869A0..08086A08 | 104 | Pregnant livestock across Barn capacity |

include/livestock_controller.hh and src/livestock_controller.cc preserve the
original function symbols. The 360 linked bytes include two alignment bytes
after the heart and pregnancy helpers; those bodies are 38 and 102 bytes.
Complete linked blocks are the matching authority.

## Controller views and results

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

Local views establish only observed fields. They do not claim complete
GameState/controller inheritance layouts. Existing Barn, Cow, Sheep and
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

## Verification and remaining boundaries

Four natural helpers, complete blocks/TU slices and all 220 relocated catalog
bytes match. Final isolated and forced production full-ROM comparisons pass
with the unchanged tracked compiler.
ROM: 8,388,608 bytes; SHA1 a2fc3574f0a65a4fcf7682fb274b9d7eebdef963.

Only four helpers leave the inventory; every other remaining assembly
address/size is unchanged. Labels, controller ctor 85584, dtor 8562C,
render/description routines and the large Run remain assembly.
A specific named store/location and complete controller layout remain
unclaimed. NEXT_AGENT_HANDOFF.md owns the continuation.
