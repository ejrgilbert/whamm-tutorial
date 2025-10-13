// The naive hotness monitor:
// Counts the number of times *each* instruction gets reached and executed in a program run.

// TO RUN (rewriting):
// ./bin/whamm/whamm-mac instr --script monitors/2-hotness_naive.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/2-hotness_naive.mm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/branches.wasm

// HINT: You should be able to accomplish this with a slight change to the contents of 1-icount.mm

// TODO: Write your code here.
