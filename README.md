# Friends of Mineral Town

This is a decompilation of the 2003 GBA game "Harvest Moon: Friends of Mineral Town" (US).

> New to this repository? Start with **[START_HERE.md](./START_HERE.md)** for a plain-English map of the folders, game systems, build flow, and recommended reading order.

It builds the following ROM:

* **[fomt.gba]** `sha1: a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`

[fomt.gba]: https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=1249

## Setting up

See [INSTALL.md](./INSTALL.md).

## Reconstruction progress

Run `make progress` for separate code, data/assets, overall meaningful-ROM, and
PRET-style contiguous tail free-space metrics. Asset progress counts only bytes
that are actually regenerated from editable project-side sources; opaque copied
`.incbin` data does not count. Asset reconstruction also pairs promotion with
the runtime code that owns, interprets, loads, or renders the resource rather
than harvesting anonymous assets for percentage alone. See
[`docs/ASSET_DECOMPILATION.md`](./docs/ASSET_DECOMPILATION.md).

## Editable item graphics

The retail Tool/Food/Article icon set is available as indexed PNG source under
`assets/item_icons/`. The normal build recompiles those assets into the packed
GBA sprite bank while preserving the matching retail ROM. See
[`assets/item_icons/README.md`](./assets/item_icons/README.md) for the
round-trip and editing workflow.

## Contributing

Please do. Feel free to yell at me if you need naming/style/formatting guidelines.

If you're looking for things that need to be done, check out [TODO.md](./TODO.md).

## Contact

You can find me over at the [Fire Emblem Universe Discord](https://feuniverse.us/t/feu-discord-server/1480?u=stanh) under the handle `nat_776`. I also lurk other places such as the pret Discord.

See also my other stuff:

* [**StanHash/FOMT-DOC**](https://github.com/StanHash/FOMT-DOC), my old documentation of this game's internals.
* [**StanHash/fe6**](https://github.com/StanHash/fe6), a decompilation of Fire Emblem: The Binding Blade (JP)
