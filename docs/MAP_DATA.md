# Logical maps and physical map resources

`GetMapResourceId` in [map_resource.cc](../src/map_resource.cc) maps logical
`Location.map` IDs to the physical resource index consumed by `GetMapData`.
The shared declarations are in [map_data.hh](../include/map_data.hh).

The namespaces are distinct:

- logical maps: `0x000..0x233`, stored in the packed `Location` field;
- `MAP_NONE`: `0x234`, the logical-location sentinel;
- physical resources: `0x00..0x41`, the 66 entries in `gMapData`;
- each physical `MapData` record is `0x28` bytes.

Passing a logical ID directly to `GetMapData` bypasses the resolver and can
index outside the physical table. `GetMapData` itself performs no bounds check.

## Resolver inputs

The resolver takes a signed logical ID, effective season, farmhouse upgrade,
coop upgrade and barn upgrade, in that order. It retains the original C symbol
`func_0803A8A4`; the fifth argument uses the stack under the GBA calling convention.

Game-state callers obtain the effective season from `func_0800E324`. That helper
treats day zero before 06:00 as belonging to the previous season. The resolver
only tests whether the supplied season is `SEASON_WINTER`.

| Logical map | Normal resource | Winter resource |
| ---: | ---: | ---: |
| 0 | `0x0E` | `0x0F` |
| 1 | `0x08` | `0x09` |
| 2 | `0x00` | `0x01` |
| 3 | `0x0C` | `0x0D` |
| 4 | `0x0A` | `0x0B` |
| 5 | `0x04` | `0x05` |
| 6 | `0x02` | `0x03` |
| 7 | `0x06` | `0x07` |
| 8 | `0x10` | `0x11` |

| Logical map | Variant input | Resources by upgrade level |
| ---: | --- | --- |
| 17 | Coop | 0: `0x24`, 1: `0x25` |
| 29 | Farmhouse | 0: `0x29`, 1: `0x2A`, 2: `0x2B` |
| 37 | Barn | 0: `0x26`, 1: `0x27` |

Unsupported levels for these three maps return resource zero. Other non-mine
maps use fixed resource selections; maps 44..46 always select `0x10`, and map
47 always selects `0x11`. Unrecognized non-mine IDs, including `MAP_NONE`,
also return zero. Zero is a real physical resource, not an error sentinel.

## Mine-floor grouping

Logical IDs `0x34..0x133` form the first 256-floor range; `0x134..0x233` form
the second. Subtract the corresponding range start to obtain a zero-based
floor index. Season and building levels do not affect these selections.

Selection order is significant:

1. floor zero selects `0x38`;
2. floor nine in the second mine selects `0x3D`;
3. floors divisible by five select `0x39`;
4. remaining floors divisible by three select `0x3A`;
5. all other floors select `0x3B`.

The resolver groups many logical floors onto shared physical resources. It
does not load assets or perform a scene transition.

## Recovered boundaries

`GetMapResourceId` replaces the exact 652-byte range at
`0x0803A8A4..0x0803AB30`; the following assembly function remains at `0x0803AB30`.
`GetMapData` remains at `0x080A4698` and indexes the existing physical table at
`0x08105EDC`. Existing table bytes, resource pointers and `MapData` layout remain
unchanged. Several resource fields and map names still have unresolved semantics.
