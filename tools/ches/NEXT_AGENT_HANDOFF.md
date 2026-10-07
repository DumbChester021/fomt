# Current FoMT continuation - October 7, 2026

## Current exact checkpoint

- Retail branch: **`main`**, tracking **`ches/main`**.
- Latest exact code checkpoint: **45dfb3f06eb800a152e967daa3f1a2a0efd2a561** (`decompile logical map resource resolver`).
- Base repository checkpoint: `07755a233018e46801a5e43c79a8a5c2cfe83b22`.
- `GetMapResourceId` / `func_0803A8A4` is exact source over **`0x0803A8A4..0x0803AB30`, 652 bytes**.
- Shared declarations: `include/map_data.hh`; source: `src/map_resource.cc`; stable architecture: `docs/MAP_DATA.md`.
- The renderer caller uses the named interface. Original assembly symbol and all neighboring positions remain intact.
- Fresh tracked compiler installation and detached `make -B -j4 compare`: **PASS**.
- Production `make -B -j4 compare`, full-byte verifier, `make progress`: **PASS**.
- Retail ROM: **8,388,608 bytes**, SHA1 **`a2fc3574f0a65a4fcf7682fb274b9d7eebdef963`**.
- Compiler unchanged: tracked installer plus thirteen-rule patch, SHA256 `aa7cc6df0efbd066e9c33deb887731e1d0210babfaeba4c9b64f3e8bc35c4256`.

## Exact progress and inventory

- code: **72,600 / 940,036 = 7.7231%**
- assembly remaining: **867,436 bytes**
- data/assets: **75,334 / 6,777,404 = 1.1115%**
- overall meaningful ROM: **148,330 / 7,717,440 = 1.9220%**
- free tail: **671,168 bytes**
- linked assembly functions: **2,333**
- inferred ranges: **866,272 / 867,436 = 99.8658%**
- unattributed assembly: **1,164 bytes**
- parked functions: **17**; retained runtime/library functions: **33**
- repeated shape clusters: **184**, containing **864** functions
- exact normalized clusters: **176**

Inventory, queue and NPC class map were regenerated. The only removed assembly
function is `func_0803A8A4`; every other function address and size is unchanged.
The NPC class-map outputs are unchanged.

## Proof and closed work

Checkpoint: `tools/ches/checkpoints/map-resolver-0803A8A4-2026-10-07/`.

- V1: 652 bytes / 217 differences; V2: 652 / 24; V3: **652 / 0**.
- V3 inverts only eight seasonal ternaries and retains case 2. The named final source uses the existing `SEASON_WINTER` constant.
- Both the older private compiler and the explicit tracked compiler produce exact V3. The matcher now defaults to `tools/agbcc/bin/agbcp`; keep diagnostic compiler selection explicit.
- `isolated-proof.json` and `production-proof.json` record whole-ROM equality, six symbol checks and matching contribution-input hashes.
- Logs: `isolated-compiler-install.log`, `isolated-compare.log`, `production-compare.log`, `production-progress.log`.
- `inventory-audit.json` confirms only the intended function removal.
- Detached `/tmp/fomt-map-resolver-integration` preserves the isolated proof.
- `handoff-before-final.md` preserves the prior local handoff, including the original V2 research. No original research or custom-game work was discarded.

Do not rematch the resolver, rerun its compiler install, or replay its completed
integration. No compiler behavior change, fixed register, padding, volatile or
inline assembly was introduced.

## Exact next action

Continue with the coherent **`0x0803AB30..0x0803AEA0` resource-owner family**
in `asm/code_0803A8A4.s`, now `.text.after_map_resource`:

| Target | Bounded size | Role evidence |
| --- | ---: | --- |
| `func_0803AB30` | 328 | Constructor initializes three 0x2C-stride records and shared provider/value state |
| `func_0803AC78` | 96 | Destructor releases the provider value and destroys three handle clients backwards |
| `func_0803ACD8` | 384 | Update/resource-transfer path, called by GameObject update |
| `func_0803AE58` | 72 | Entity-facing virtual forwarding helper |

These **880 bounded bytes remain assembly**; no new candidate or gain is claimed.
`next-family-selection.json` records exact bounds, callers/callees and source anchors.

1. Inspect current dirty state and the saved selection before new work.
2. Recover provider virtual contracts, the 0x20-byte descriptor fields and the 0x2C record layout from callers and existing exact resource/transfer code. Keep gameplay identity neutral until proven.
3. Start with the bounded `0803AC78` destructor as an ownership/ABI oracle; account for hidden destructor flags and the backward three-element walk before a natural scratch candidate.
4. Compare with the tracked compiler; then reuse the proven type/ownership model for `AB30`, `ACD8`, `AE58` and the related `0803B128` path.
5. Integrate only exact coherent source. Preserve parked codegen islands and rotate if source variants canonicalize.
6. Require full ROM/hash/progress, regenerate inventory when ownership changes, update concise canonical state, review explicit paths, commit/push to `ches/main` and verify the remote ref.

Custom-game remains separate at `60eacca`; its existing documentation changes
remain untouched. Do not reopen `3A180`, `3A394`, `39F90`, `39E98`, the legacy
save/UI islands or other parked work without new structural evidence.
