# Fishing records in persistent state

The 0x1D8-byte block at GameState+0x2C80 is the fishing collection, reconstructed
in include/fishing_records.hh and src/fishing_records.cc. Both new-game
initialization and the save loader pass this address to InitFishingRecords.
The next persistent object begins at +0x2E58.

## Serialized layout

There are 59 records, each eight bytes. No pointers or runtime-only fields are
stored in this block.

| Field | Record offset | Type | Meaning |
| --- | --- | --- | --- |
| count | +0 | u32 | Number of catches of this record |
| max_size | +4 | u32 | Largest recorded catch size |

For index i, the payload count is at 0x2C80 + 8*i and max_size at 0x2C84 + 8*i.
A slot record includes a four-byte length prefix, so its corresponding offsets
are 0x2C84 + 8*i and 0x2C88 + 8*i. Both words are little-endian. Preserve all
59 entries and the eight-byte stride for retail save compatibility.

| Indices | Meaning |
| --- | --- |
| 0..7 | Pirate Fortune, Fossil of Fish, Power Berry, Message Bottle, Empty Can, Branch, Fish Bones, Boots |
| 8..52 | Ordinary fish |
| 53..58 | Jp. Huchen, Monkfish, Catfish, Carp, Coelacanth, Squid |

The ROM name-pointer table gUnk_08103A18 supplies these names; it remains binary
data. Its duplicate Silver Carp labels at indices 22 and 37 are preserved.
The size unit is not established here.

## Recovered operations

| Function | Retail address | Behavior |
| --- | --- | --- |
| InitFishingRecords | 0809CD78 | Clears count and max_size in all 59 records; returns self |
| RecordFishingCatch | 0809CD98 | Increments count up to 1,000,000,000; records a strictly larger size; returns whether max_size changed |
| HasCaughtAllFish | 0809CDCC | Checks nonzero counts for all 51 fish records, indices 8..58 |
| GetTotalFishCaught | 0809CDEC | Sums counts for indices 8..58, saturating after each addition at 1,000,000,000 |
| GetFishingCatchCount | 0809CE1C | Returns the indexed count |
| GetFishingMaxSize | 0809CE24 | Returns the indexed maximum size |
| GetFishKingSpriteId | 0809CE30 | Converts the six King indices to packed animation IDs |
| GetFishingRecordName | 0809CE7C | Returns the indexed name-table pointer |

The getters and catch updater do not bounds-check indices. Count saturation
assumes normally initialized state; values already above the cap are not
repaired by the updater. The total uses retail u32 addition, including wrap
behavior for corrupt or externally edited values.

King sprite IDs for indices 53..58 are 252, 249, 254, 253, 250 and 251. Inputs
outside that range return 252. The function retains its unused state argument
to preserve the original calling convention.

The fishing-result path around 080A454C reads the prior maximum, passes the
caught size to RecordFishingCatch, and marks a new record only when a previous
nonzero maximum existed and the updater reports improvement. Collection display
code calls the count, size, name and King-sprite helpers.

## Exactness boundary

All eight methods occupy 0809CD78..0809CE8C: 270 function-body bytes and six
alignment bytes, 276 linked bytes. Typed-source target comparison, isolated
forced full-ROM comparison and production forced full-ROM comparison pass.
Assembly callers retain their original func_ symbols. The neighboring packed
state and mine-floor constructors remain assembly.

This recovers one persistent subobject. The complete GameState type and legacy
save-loader source are still unfinished. See SAVE_FORMAT.md for slot geometry.
