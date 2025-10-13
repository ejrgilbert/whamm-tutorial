// The coverage monitor.
// Determines whether each basic block was reached during program execution.

// TO RUN (rewriting):
// ./bin/whamm/whamm-mac instr --script monitors/4-coverage.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/4-coverage.mm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/branches.wasm

// HINT: You should be able to accomplish this with a slight change to the contents of 3-hotness_block.mm

wasm:block:end {
    report unshared var reached: bool;
    reached = true;
}
