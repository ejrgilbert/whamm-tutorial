// The branch profiler:
// Profiles the branches taken during program execution for the `select`, `br`, `br_if`, and `br_table`
// opcodes. Can be used for branch coverage.

// TO RUN:
// ./bin/whamm/whamm-mac instr --script monitors/0-branches.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// Matches _if and br_if events using glob matching.
wasm::*if:before {
  // Uses probe-local storage
  // (one instance of these variables per probe location).
  report unshared var taken: i32;
  report unshared var total: i32;

  // Determines which branch was taken.
  // Access the top-of-stack using the bound `arg0` variable.
  var was_taken: bool = arg0 != 0;
  taken = taken + (was_taken as i32);
  total++;
}

wasm::br_table:before {
  report unshared var taken_branches: map<u32, u32>;

  // Determines which branch was taken.
  var index: u32 = arg0 <= (num_targets - 1) ? arg0 : num_targets;
  taken_branches[index]++;
}
