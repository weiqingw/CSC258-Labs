vlib work
vlog -timescale 1ns/1ns eightBitCounter.v
vsim eightBitCounter
log {/*}
add wave {/*}
force {KEY[0]} 1 0, 0 10 -repeat 20
force {SW[1]} 0 0, 1 10 
force {SW[0]} 0 0, 1 10
run 5120ns

force {KEY[0]} 1 0, 0 10 -repeat 20
force {SW[1]} 0 0, 1 10 
force {SW[0]} 0 
run 100ns
