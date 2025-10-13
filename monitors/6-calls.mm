// The call-graph monitor.
// Creates a dynamic call graph of direct and indirect calls.

// TO RUN (rewriting):
// ./bin/whamm/whamm-mac instr --script monitors/6-calls.mm --app apps/branches.wasm
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true libs/whamm_core.wasm output.wasm

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/6-calls.mm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/branches.wasm

// HINT: To track an indirect call, you can use the function entry probe.
//       See: `whamm info --rule 'wasm:func:*' -fv`

// Store your data in the following variable:
// (from, to) -> count
report var call_graph: map<(u32, u32), u32>;

// TODO: Write your code here.
