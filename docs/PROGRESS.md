# Decompilation and expansion progress

Run `make progress` for the current matching-code totals, retail ROM check,
branch, and commit. The code percentage is calculated from linked executable
sections in `fomt.map`; it does not use source line counts.

At commit `2ebe870`, the baseline is:

```text
940036 total bytes of code
49248 bytes of code in src (5.2389%)
890788 bytes of code in asm (94.7611%)
```

The percentage measures machine-code reconstruction only. Decompiled event
bytecode, named data, documented formats, extraction tools, and modding APIs can
substantially improve expansion support without changing this percentage.

## Expansion milestones

| Area | Current state | Next useful boundary |
| --- | --- | --- |
| Matching build | Retail SHA1 reproduced | Keep every baseline contribution matching |
| Input | Polling and new-press helpers are matching C++ | Extend only for a concrete control feature |
| Save data | Slot geometry is public; each slot has a proven unused 0xAF0-byte extension tail | Define a versioned extension record when the first persistent mod system needs it |
| Characters | Retail IDs 0..42 and the special child slot are mapped in research | Expose the character-name table/accessor and identify every hard-coded roster boundary |
| Scenes and dialogue | Event bytecode can be inspected with the existing Mary tooling | Document a reproducible add/compile/insert workflow |
| Maps | Logical-to-physical map resolution and TerrainInfo layout are researched | Publish editable map resource structures and a safe insertion workflow |
| Graphics | Expansion workflow not yet mapped | Identify tileset, palette, sprite, and portrait resource registries |
| Sound and music | Expansion workflow not yet mapped | Identify sequence/sample tables, IDs, and insertion limits |

Milestone claims should link back to exact source, assembly, ROM data, or tool
output. Gameplay interpretations should also be checked against documentation
for the original GBA release. Matching status proves binary preservation; it
does not by itself prove a semantic name or mechanic.
