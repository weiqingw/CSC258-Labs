# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns FourToOneMux.v

# Load simulation using mux as the top level simulation module.
vsim FourToOneMux

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# In the next 16 cases, control s1s0 = 00. Then SW[0] control LEDR[0].
# The first 8 should get 0 output, and the later 8 should get 1 output.

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 4ns

# In the next 16 cases, control s1s0 = 01. Then SW[1] controls LEDR[0].
# Test case 5 6 7 8 13 14 15 16 should have 1 output and others have output 0.

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 4ns

# In the next 8 cases, control s1s0 = 10. Then SW[2] control LEDR[0].
# Test case 3 4 7 8 11 12 15 16 should have output 1 and others should have output 0.

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 4ns

# In the next 16 cases, control s1s0 = 11. Then SW[3] control LEDR[0].
# Odd test cases should return 0 and even test cases should return 1.

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 4ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 4ns
