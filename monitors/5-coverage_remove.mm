// The coverage monitor.
// Determines whether each basic block was reached during program execution.
// When it's reached, remove the probe so it's not re-executed.

// Wizard's `dyninstr` host module contains a `remove_probe` function just for this!
// See: https://github.com/titzer/wizard-engine/blob/a3bc0669550a874d29742a168a5bc8e5b461d6ab/apis/whamm_dyninstr.v3#L6
// To use this as a whamm library, we supply the API definition in the libs/dyninstr.wasm module.

// TO RUN (dynamic probe removal is not possible with rewriting)

// TO RUN (engine):
// ./bin/whamm/whamm-mac instr --script monitors/5-coverage_remove.mm --user-libs dyninstr=./libs/dyninstr.wasm --wizard
// bin/wizeng/wizeng.jvm --ext:multi-memory --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm+libs/dyninstr.wasm apps/branches.wasm

// HINT: You should be able to accomplish this with a slight change to the contents of 3-coverage.mm

use dyninstr;
wasm:block:end {
    report unshared var reached: bool;
    reached = true;

    dyninstr.remove_probe(probe_id);
}
