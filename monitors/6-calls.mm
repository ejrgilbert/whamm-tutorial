// The call-graph monitor.
// Creates a dynamic call graph of direct and indirect calls.

// HINT: To track an indirect call, you can use the function entry probe.
//       See: `whamm info --rule 'wasm:func:*' -fv`

// Store your data in the following variable:
// (from, to) -> count
report var call_graph: map<(u32, u32), u32>;

// TODO: Write your code here.
