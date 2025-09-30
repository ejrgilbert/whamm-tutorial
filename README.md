<picture>
  <img width="175" alt="The logo for whamm!. Shows a spice jar with the WebAssembly logo, but with the 'h' and 'mm' letters written in between the 'wa' to spell 'whamm'."  src="/logos/whamm!_logo.png">
</picture>

# whamm-tutorial
A tutorial of the Whamm instrumentation framework, see repository at: https://github.com/ejrgilbert/whamm.

## How to run

We will be using `wasm-tools` throughout this tutorial to inspect Wasm binaries, please install on your machine: https://crates.io/crates/wasm-tools.

Binaries are located in the `bin/` folder.
The binaries in this repository only work on Mac or linux machines.
Choose the appropriate `whamm` and `wizeng` (wizard engine) binary for you based on your machine architecture.
If you are on a Mac, use wizard engine's `wizeng.jvm`.

To test:
```shell
./bin/whamm/whamm-<arch> --help
./bin/wizeng/wizeng.<arch> --help
```

## Whamm Instrumentation: _the whamm engine interface (`wei`)_

### Generating a portable monitor.
To generate a self-contained, portable monitor against `wei`, you will use the `wei` backend of the `whamm` compiler.
This is under the `instr` command of the `whamm` binary, see: `whamm instr --help`.
I need to rename the command line option for this (it's out-of-date), but for now, this option is `--wizard`.

Here is an example command that generates a portable monitor to run on an application via dynamic instrumentation:
```shell
whamm instr --script path/to/script.mm --core-lib libs/whamm_core.wasm --user-libs path/to/user_lib.wasm --wizard
```

### Running the monitor on an application.
TODO

##  Whamm Instrumentation: _bytecode rewriting_

### Instrumenting an application.
To instrument an application via bytecode rewriting, you will use the bytecode rewriting backend of the `whamm` compiler.
This is under the `instr` command of the `whamm` binary, see: `whamm instr --help`.

Here is an example command that rewrites an application's bytecode to inject instrumentation logic:
```shell
whamm instr --app path/to/app.wasm --script path/to/script.mm --core-lib libs/whamm_core.wasm --user-libs path/to/user_lib.wasm
```

### Running the instrumented application.
TODO


## A Full Example with the branches monitor.

### `wei`

1) Generate the monitor:
```shell
whamm instr --script monitors/0-branches.mm --core-lib libs/whamm_core.wasm --wizard

# To take a look at the WAT:
wasm-tools print output.wasm -o output.wat
```

2) Run on a Wasm application via dynamic instrumentation:
```shell
wizard  --env=TO_CONSOLE=true --monitors=output.wasm+libs/whamm_core.wasm apps/cf.wasm
```

### rewriting

1) Rewrite the application binary:
```shell
whamm instr --script monitors/0-branches.mm --core-lib libs/whamm_core.wasm --app apps/cf.wasm

# To take a look at the WAT:
wasm-tools print output.wasm -o output.wat
```

2) Run the instrumented Wasm application:
```shell
wizard --env=TO_CONSOLE=true output.wasm libs/whamm_core.wasm
```
