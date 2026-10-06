# TODO

## Active retail-decomp priority

- preserve the completed **Water Splash** animation 425 / 0x1A9 multi-frame asset lane under `assets/item_icons/effects/water_splash/`; `packed-animation-v1` round-trips the full bank exactly, `calcprogress.py` counts all frame resources, full ROM verification passes, and the family adds 384 unique graphics bytes;
- work assets and their owning runtime code together; do not promote the remaining
  45 simple or 32 multi-frame animations anonymously merely to raise coverage;
- keep `func_08092A70` parked at behavior-complete exact-size `0x260` /
  3 differing bytes; fresh compiler/CFG evidence does not justify more work
  without new structure;
- keep `func_080CAC7C` / `func_080CAD18` and `func_08092940` parked unless
  new structural evidence appears; Wrapped Present (352) and Basket (53) plus
  their owning exact render/wrapping paths are already complete;
- preserve the completed cooking family under `assets/item_icons/cooking/`
  and `gCookingUtensilIconIds`; Sugar/Salt/Vinegar/Soy Sauce/Miso are proven
  text/state-only entries, so do not invent packed-sprite IDs for them;
- preserve recovered mine Money Bag animation 106 under
  `assets/item_icons/mine/`; GameObject +0x64 -> +0xDE4 proves the
  `gUnk_086678A0` provider and the mine reward path proves 5-20 G semantics;
- preserve the completed 18-entry **overnight forage/map** family under
  `assets/item_icons/overnight/`; `func_080A95A4` + `func_080AAF28` + exact
  `func_0801A8C0` prove 00:00-05:59 dark-palette semantics. The family adds
  544 unique palette bytes and full ROM verification passes;
- preserve the completed six-entry **Fish King** family under `assets/item_icons/fish_kings/`: Jp. Huchen 252, Monkfish 249, Catfish 254, Carp 253, Coelacanth 250, Squid 251. `func_0809CE30` maps collection indices 0x35..0x3A to these IDs and `gUnk_08103A18` supplies the retail names; gain is 800 unique bytes (768 graphics + 32 palette);
- preserve the completed **menu-special** family under `assets/item_icons/menu_special/`: Water 461, Box Lunch 401, Milk 290, Spaghetti 422, Snow-cone 247. `gUnk_080FE2D8` / `gUnk_080FEB60` presentation records select these packed IDs and their custom text strings prove semantics; gain 544 unique bytes (384 graphics + 160 palette);
- preserve the completed **Dog Ball visual** family 21..48 under `assets/item_icons/dog_ball/`. Selector `0x4B` is the thrown Ball entity; `func_08038398(ball, dog.anim_id, dog.facing)` maps one default block plus dog animation IDs `0x33C/0x340/0x344/0x348/0x34C/0x375` into seven four-facing packed-resource blocks, and `func_0803853C` feeds field `+0x28` directly into the GameObject `+0x64` packed provider. This adds 28 animations / 53 frames, including 10 multi-frame animations, and 1,024 unique graphics bytes with no new palette bytes;
- direct literal candidates 21/4/7 remain closed as other-bank false leads;
- common packed consumer paths are now exhaustively closed for the remaining multi-frame set: direct `func_080A4A00`, `func_0805E824`, packed `SpriteAnimator::SetAnimation`, `func_080CB304` / `func_080CC728` / `func_080CBAF0`, `func_080CAC7C` / `func_080CAD18`, local packed-provider constructor screens, and script-driven OnCall 320 landing visuals;
- preserve the newly decoded landing-resource chain: `0x0802BD50` (vtable `vtable_unk_080E65F4` slot `+0x44`) stores `resource_id` at entity `+0x56`; `func_0802BA74` forwards it to GameObject `+0xBC` / `func_080AD77C`. Full scan of 1,328 retail scripts proves OnCall 320 only supplies IDs 0 and 1;
- direct `gUnk_086678A0` tracing is now complete across all **22 explicit provider-constructor sites**; `func_080CE184` is only grid/slot arithmetic and `func_0800F258` is `GetHeldArticle`, so both are closed false sprite leads. Continue the remaining **77 animations** by resource-family provenance, starting with **173..180**, **413..420**, **54..57**, and **160/161**, and require runtime/table ownership before promotion;
- keep excluding already-closed Tool/Food/Article, cooking, Wrapped Present, Basket, Money Bag, overnight-forage, Water Splash, Fish King, menu-special, and Dog Ball paths;
- classify large opaque ranges in `asm/data/data_0813B288.s` only together
  with the loaders/renderers/providers that establish their format and owner;
- recover map/tileset and M4A song/voicegroup/sample authoring with the same
  code-coupled rule, replacing baserom-backed payloads only when byte-exact;
- keep `make progress` honest: opaque copied blobs do not count as reconstructed
  assets.

## Longer-term cleanup

- remove/replace "libsix" and "libagbc++";
- maybe replace offset labels in m4a as they are from pokeemerald;
- decompile the rest of the game.
