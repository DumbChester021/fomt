# Installation

## New instructions

Better instructions will come eventually.

- get a `arm-none-eabi` toolchain (devkitARM probably works)
- install Python 3 and Pillow. For example, use your distro's `python3-pil` package or `python3 -m pip install Pillow`.
- run `tools/install_agbcp.sh`. The script checks out the pinned [notyourav/agbcc] revision required by this project, applies the tracked FoMT compatibility patch, builds the toolchain, and installs it under `tools/agbcc`.
- get the base rom, put it in root directory as `baserom.gba`
- `make compare`

The C++ compiler compatibility patch is part of this repository so a fresh checkout can reproduce the matching build. The installed compiler files under `tools/agbcc` remain generated and are not committed.

The normal build also runs `tools/packed_sprite_bank.py` to rebuild the packed
item-icon bank from `assets/item_icons/`. Pillow is therefore a build
dependency, not only an optional graphics-inspection tool.

[notyourav/agbcc]: https://github.com/notyourav/agbcc

## Old instructions

Install the devkitARM toolchain of devkitPro as per [the instructions on their wiki](https://devkitpro.org/wiki/devkitPro_pacman).

Inside the included MSYS2 environment run:

    pacman -S gcc git

To set up the repository:

	git clone https://github.com/not-alons/hmfomt
	git clone https://github.com/pret/agbcc

	cd ./agbcc
	./build.sh
	./install.sh ../hmfomt

	cd ../hmfomt

Place a .gba ROM of Harvest Moon: Friends of Mineral Town (USA) in your hmfomt folder and rename it to "baserom".

To build **hmfomt.gba** and confirm it matches the official ROM image:

	make compare

If an OK is returned, then the installation went smoothly.
