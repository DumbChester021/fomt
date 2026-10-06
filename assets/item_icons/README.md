# Item icon assets

This directory contains editable PNG source assets for semantically recovered
animations in the packed sprite bank at ROM `0x086678A0`, including all retail
Tool, Food, and Article icons plus proven UI/gameplay families.

The tooling requires Python 3 with Pillow; see `INSTALL.md`.

Current coverage:

- 81 Tool icons
- 171 Food icons
- 95 Article icons
- 2 special item-state/held-item icons (Wrapped Present and Basket)
- 8 cooking utensil icons
- 1 mine Money Bag reward icon
- 18 overnight forage/map variants used from 00:00 through 05:59
- 1 multi-frame effect animation: Water Splash (425 / 0x1A9)
- 6 Fish King icons: Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, Squid
- 5 menu-special presentation icons: Water, Box Lunch, Milk, Spaghetti, Snow-cone
- 28 Dog Ball visual animations (IDs 21..48), synchronized to dog animation selector + facing; 10 are multi-frame
- **416 semantically owned animations**

Simple manifest entries use one indexed PNG plus JSON sidecar. Proven multi-frame
entries use the `packed-animation-v1` bundle: one indexed PNG per nonblank frame
plus JSON preserving frame timing, descriptor data, OAM parts, tile offsets,
and shared palette references.

## Round trip

`export-items` exports only the 347 core Tool/Food/Article icons and rewrites
the target manifest. Use it with a scratch output directory when refreshing
those core assets; do **not** point it at canonical `assets/item_icons` or the
additional semantic families will be omitted.

```sh
python3 tools/packed_sprite_bank.py export-items --out-dir /tmp/fomt-item-icons
```

Rebuild the packed bank from the PNG/JSON sources:

```sh
python3 tools/packed_sprite_bank.py build-bank \
  --manifest assets/item_icons/manifest.json \
  --out build/assets/item_icon_bank.bin
```

The normal Makefile already performs this step before assembling
`asm/data/data_0813B288.s`.

With the retail PNGs unchanged:

```
EXACT: rebuilt bank matches retail (196736 bytes)
fomt.gba: OK
```

Editing a source PNG changes the corresponding GBA tile/palette bytes on the next
build. JSON sidecars record animation, descriptor, OAM-layout, and frame metadata.

Some retail assets deliberately share underlying graphics or palette spans. The
builder validates every shared byte: if two PNG sources that reference the same
resource encode different bytes, the build fails with a `shared graphics` or
`shared palette conflict` instead of using manifest-order/last-write-wins
behavior. This applies to both simple and multi-frame sources.

Current manifest-wide sharing:
- 442 unique frame records
- 415 unique sprite descriptors
- 264 unique graphics spans
- 330 unique palette spans
- 46 referenced layout records
- shared graphics/palette bytes are validated for conflicts

## Current boundary

All 347 named Tool/Food/Article icons are editable. Additional proven families
are Wrapped Present (352), Basket (53), eight cooking utensils, Money Bag (106),
18 overnight forage/map variants, Water Splash (425 / 0x1A9), and the six Fish Kings.

The overnight family is code-backed by `func_080A95A4`, `func_080AAF28`, and
exact hour classifier `func_0801A8C0`; it adds **544 unique palette bytes**.

The menu-special family is code/text-backed by `func_0807EF90`, `func_08081BBC`, `gUnk_080FE2D8`, and `gUnk_080FEB60`; direct-ID rows use custom retail descriptions rather than Food::GetDesc(). It contributes **544 unique bytes** (384 graphics + 160 palette).

The Dog Ball family is code-backed by selector `0x4B`, `func_08038398`, and `func_0803853C`. The Ball entity initializes resource `0x31` (the already-owned Ball icon animation 49), then maps dog animation selector + facing into packed IDs 21..48. The 28-animation family contains 53 frames and contributes **1,024 unique graphics bytes**, with palette data fully shared.

The Fish King family is code-backed by `func_080713B8` and exact `func_0809CE30`, which maps collection indices `0x35..0x3A` to animation IDs 252, 249, 254, 253, 250, and 251. The retail `gUnk_08103A18` string table names those entries Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, and Squid respectively. Sources live under `assets/item_icons/fish_kings/` and add **800 unique editable bytes** (768 graphics + 32 palette).

Water Splash is the first promoted multi-frame family. Exact
`src/game_object_discard.cc` names `EFFECT_WATER_SPLASH = 0x1A9` and selects it
on `IsFootprintOnWaterSurface`. Its source lives under
`assets/item_icons/effects/water_splash/` as four indexed PNG frames plus one
blank timing frame represented in JSON. Frames 2 and 3 use two OAM parts. The
bundle round-trips the complete packed bank byte-for-byte and adds **384 unique
graphics bytes**; its palette was already owned/shared.

Across all 493 animations in the same bank, 450 are simple
one-frame/one-part/one-palette cases and 43 are multi-frame. Ownership is now
**405 / 450 simple** and **11 / 43 multi-frame**, for **416 / 493 total**.
**45 simple and 32 multi-frame animations remain unowned.** They are not an
anonymous export backlog. Trace the code/subsystem that owns or consumes each
family before promotion.

Other non-item resources and the opaque trailing region remain preserved from
`baserom.gba` until their ownership/semantics are recovered. This is intentional
incremental decompilation, not evidence that the entire `0x30080`-byte bank is semantically decoded.
