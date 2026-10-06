# TODO

## Active retail-decomp priority

- stop treating the remaining **77 packed-sprite animations** as the primary
  work queue. Preserve the open list and current family evidence, but resolve
  those IDs as a by-product of decompiling their owning systems;
- build a complete machine-readable inventory of the remaining assembly:
  function address/size, callers/callees, data/global xrefs, inferred TU and
  subsystem, vtable/class links, similarity cluster, exact/understood status,
  and compiler-difficulty evidence;
- infer original translation-unit boundaries from address/section locality,
  padding/literal pools, local static data, call locality, vtables, and
  constructor/destructor groupings;
- normalize remaining assembly and cluster similar functions. Prioritize
  repeated families where one exact source/type oracle can unlock many sibling
  functions;
- build a global vtable/class/constructor/destructor and data-ownership map, then
  feed those facts back into the function inventory;
- score and rank coherent TUs/clusters by recoverable bytes, downstream unlock
  value, type readiness, subsystem coherence, and estimated matching
  difficulty. Re-rank after meaningful integrations;
- use the ranked queue rather than a fixed five-function batch size. Complete as
  much of one coherent TU/cluster as remains high-throughput, parking individual
  compiler-sensitive islands with preserved candidates/evidence;
- keep production `src/` exact-only. Track semantically reconstructed but
  nonmatching functions separately in private research until an explicit
  supported NONMATCHING convention is deliberately adopted;
- retain `/mnt/data/Ches/runtime-saves/fomt/opening-farm.ss1` as the first
  runtime-scenario asset. Build deterministic savestate + scripted-input
  coverage collection so emulator work records function hits, indirect
  caller/callee targets, and targeted RAM changes in bulk;
- use watchpoints only for focused ownership/field questions. Do not manually
  wander gameplay waiting for one unknown resource ID;
- for data/assets, bulk-catalog recognizable pointer tables, fixed-stride
  records, palettes, tile banks, script tables, and resource headers when cheap,
  then use their consumers to establish semantics and ownership;
- keep asset progress honest: opaque copied blobs do not count, and anonymous
  packed-sprite promotion remains prohibited;
- keep `func_08011650`, `func_080455D8`, `func_08092A70`,
  `func_080CAC7C` / `func_080CAD18`, and `func_08092940` parked unless new
  structural evidence makes them high-value again;
- preserve all completed packed-sprite families and the exact current ownership
  total (**416 / 493 = 405 / 450 simple + 11 / 43 multi-frame**). The direct
  provider/consumer census, Mary namespace-collision result, and OnCall-320
  resource-ID result remain closed evidence, not active rediscovery tasks;
- after the database/TU/similarity/classification pipeline exists, select the
  highest-ranked coherent units and resume exact retail decompilation from that
  queue.

## Longer-term cleanup

- remove/replace "libsix" and "libagbc++";
- maybe replace offset labels in m4a as they are from pokeemerald;
- decompile the rest of the game.
