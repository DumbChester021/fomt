# Building the FoMT decompilation

This repository targets the US Game Boy Advance release of **Harvest Moon: Friends of Mineral Town** and verifies the generated ROM against the retail SHA1.

The retail ROM is not distributed with the project. Supply your own legally obtained copy.

## Requirements

Install:

- Git
- Python 3
- Pillow
- an ARM `arm-none-eabi` binutils/toolchain environment

On Debian/Ubuntu, Pillow can normally be installed from the distribution package or with Python packaging tools, for example:

```sh
python3 -m pip install Pillow
```

A devkitARM installation is also suitable for the surrounding ARM/GBA tools.

## 1. Provide the base ROM

Place the US retail ROM in the repository root as:

```text
baserom.gba
```

The expected retail ROM is 8,388,608 bytes and has SHA1:

```text
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963
```

## 2. Install the pinned matching compiler

Run:

```sh
tools/install_agbcp.sh
```

The installer checks out the pinned `notyourav/agbcc` revision, applies the tracked FoMT compatibility patch, builds it, and installs the generated compiler under `tools/agbcc`.

The tracked compatibility patch is part of this repository. Generated compiler binaries are not committed. For source comparison with historical compiler experiments, use the shared `/mnt/data/Compilers/` archive and its `README.md`/relocation manifest; do not substitute an archived compiler for this pinned build automatically.

## 3. Build and verify

Run the authoritative forced comparison:

```sh
make -B -j4 compare
```

A successful matching build ends with:

```text
fomt.gba: OK
```

You can independently check the generated ROM with:

```sh
sha1sum fomt.gba
```

## 4. View reconstruction progress

Run:

```sh
make progress
```

This reports code reconstruction, editable data/assets, overall meaningful-ROM reconstruction, and contiguous tail free space.

## Asset build dependency

The normal build runs `tools/packed_sprite_bank.py` to regenerate the packed item/UI sprite bank from editable sources under `assets/item_icons/`. Pillow is therefore a normal build dependency, not just an optional inspection tool.

## Troubleshooting

If source that was previously exact suddenly moves by a few bytes across unrelated functions, verify compiler provenance before changing source. Re-run `tools/install_agbcp.sh` rather than copying a generated `tools/agbcc` directory from another worktree.

For project-specific validation and matching rules, see [docs/DECOMP_PLAYBOOK.md](docs/DECOMP_PLAYBOOK.md).
