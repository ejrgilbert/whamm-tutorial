// The better hotness monitor:
// Counts the number of times a basic block gets reached and executed in a program run.

// TO RUN (rewriting):
// ./bin/whamm/whamm-mac instr --script monitors/3-hotness_block.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/3-hotness_block.mm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/branches.wasm

// HINT: Whamm has support for basic blocks! Try running `whamm info --rule 'wasm:block:*' -fv`

wasm:block:end {
  report unshared var count: u32;
  count++;
}
