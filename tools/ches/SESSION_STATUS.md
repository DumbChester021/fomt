# FoMT Session Status

## Authoritative current snapshot - October 7, 2026

Retail main tracks ches/main. Run git log -1 for the saved checkpoint.
This fishing-record unit began at d9e95f5f4ebacc07d3b9f3aabae26f0809d63dd0.
Custom-game was not modified. Compiler inputs are unchanged.

## Exact production progress

- Code: 73,556 / 940,036 = 7.8248%; assembly 866,480 bytes
- Data/assets: 75,334 / 6,777,404 = 1.1115%
- Overall meaningful ROM: 149,286 / 7,717,440 = 1.9344%
- Free tail: 671,168 bytes
- Linked assembly functions: 2,321; inferred bytes 865,316 (99.8657%)
- Unattributed bytes: 1,164; parked functions 17; runtime/library 33
- Regions 151; shape clusters 184, members 864, exact normalized clusters 176

## Latest integrated source

Eight fishing-record methods at 0809CD78..0809CE8C add 276 linked bytes.
The typed 59-entry block occupies GameState+2C80..2E58 (472 bytes).
Header: include/fishing_records.hh. Source: src/fishing_records.cc.
Architecture: docs/FISHING_RECORDS.md.

All eight true bodies and the complete linked block match. Isolated and
production make -B -j4 compare PASS. ROM size 8,388,608; SHA1
a2fc3574f0a65a4fcf7682fb274b9d7eebdef963. Twelve function/neighbor addresses
and eight body sizes pass. Production execution sh_muy2r4k7_d5f6424d completed
with exit 0; no build remains running.

The isolated checkout uses the unchanged compiler installed and verified in
the preceding resource-owner checkpoint. No fresh compiler change was needed.
Only the eight intended functions leave the assembly inventory.

## Continuation

The old C6BC-before-fishing integration barrier is obsolete. The natural
Fish King switch now matches; do not replay old switch variants.

Next assess the adjacent persistent mine-floor initializer 0809CE8C and its
0x628-byte layout, starting with saved failures and existing mine_floor.cc.
That existing source has private incomplete types and legacy fixed-register/
inline-assembly reconstruction; do not copy those techniques or silently change
its ABI. Recover field boundaries from initializer and consumers before naming.

The full save loader remains parked. Resource-owner constructors/B128 remain
parked at prior documented mismatches. NEXT_AGENT_HANDOFF.md owns next actions.
Local proofs are in tools/ches/checkpoints/fishing-records-2026-10-07/.
