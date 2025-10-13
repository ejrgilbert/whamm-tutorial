// The instruction count monitor:
// Counts the number of instructions executed in a program run.

// TO RUN (rewriting):
// ./bin/whamm/whamm-mac instr --script monitors/1-icount.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/1-icount.mm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/branches.wasm

// HINT: You should be able to write this monitor with a single probe directive.

// TODO: Write your code here.
