// The loop tracer.
// Counts the occurrence of loopy traces in a program.

// To accomplish this, you will use the `libs/tracer.wasm` library.

// How the library works:
// Anchors should be placed at function entry and right before loop opcodes.
//    -- To create a new anchor, call `init_anchor` and pass the fid and pc of the instrumented location.
//       One unique anchor ID should be created per probe location.
//    -- When an anchor point is reached, call `on_anchor` and pass the anchor_id returned by the `init_anchor` call.
// On `if` and `br_if` opcodes, `on_if` should be called and passed the top-of-stack.
// On `br_table` opcodes, `on_br_table` should be called with the actual target of the instruction.

// TODO: Write your code here.
