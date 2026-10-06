# TODO

## Active retail-decomp priority

- stop treating the remaining **77 packed-sprite animations** as the primary
  work queue. Preserve the open list and current family evidence, but resolve
  those IDs as a by-product of decompiling their owning systems;
- keep `tools/ches/decomp_inventory.json` / `DECOMP_QUEUE.md` regenerated after meaningful exact integrations; the unified remaining-function inventory, similarity clustering, and first class-map pipeline are already live;
- continue enriching TU/type/vtable/data ownership only when it improves the next coherent target rather than treating classification as an end in itself;
- use the resident-NPC integration as the model family workflow: prove one representative, parameterize siblings, batch scratch-compare, then promote only the exact family;
- current structural-continuity target: fix the declaration-only compile issues in `candidate-dtor-399c0-v1.cc`, then compare/promote `func_080399C0` (retail 0x70). Paired `39DA8/39E18`, factory `39A30`, and destructor `39F50` are exact. Constructor `39E98` is behavior-complete and exact-size 0xB8/109, parked on register allocation. Keep earlier large strategy/controller frontiers parked absent new type/compiler evidence;
- Child's +0x30 virtual at `0x08036F0C` remains understood but nonmatching assembly. Do not block throughput on it; return only if new structural/compiler evidence appears;
- re-rank after the next adjacent-entity integration or whenever a meaningful integration changes the inventory;
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
