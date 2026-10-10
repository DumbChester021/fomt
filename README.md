# Harvest Moon: Friends of Mineral Town (US GBA) decompilation

This project reconstructs the **US retail Harvest Moon: Friends of Mineral Town** GBA game into readable C++ and editable data while rebuilding the original ROM **byte for byte**. It builds on [StanHash/fomt](https://github.com/StanHash/fomt). Reconstructed source is not the original commercial game source.

**For the current project state, next task, and directory map, read [START_HERE.md](START_HERE.md).** It is our single onboarding entry. Work on the retail save system currently takes priority; gameplay changes remain isolated to a separate `custom-game` worktree.

## Building

You must provide your own legally obtained US FoMT ROM as `baserom.gba`; no retail ROM is distributed here. Expected SHA1: `a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`.

```sh
tools/install_agbcp.sh
make -B -j4 compare
make progress
```

See [INSTALL.md](INSTALL.md) for full requirements. `make docs-check` and `make save-check` run lightweight documentation/save evidence validations.

## Contributing

Retail integration requires original assembly/ABI evidence, natural readable source, byte-exact function matching, and a passing full-ROM SHA1 comparison. Keep nonmatching experiments outside production and custom behavior off retail `main`. Standing agent/worktree rules are in [AGENTS.md](AGENTS.md); technical references are opened **only as needed** from [START_HERE.md](START_HERE.md).

Original upstream and related research: [StanHash/fomt](https://github.com/StanHash/fomt), [StanHash/FOMT-DOC](https://github.com/StanHash/FOMT-DOC), and [StanHash/mary](https://github.com/StanHash/mary).
