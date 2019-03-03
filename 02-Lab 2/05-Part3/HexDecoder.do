# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in HexDecoder.v to working dir;
vlog -timescale 1ns/1ns HexDecoder.v

# Load simulation using mux as the top level simulation module.
vsim HexDecoder

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# By lab room is in BA3155

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
run 4ns

