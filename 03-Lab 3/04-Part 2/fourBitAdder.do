vlib work
vlog -timescale 1ns/1ns fourBitAdder.v
vsim fourBitAdder
log {/*}
add wave {/*}

force {SW[0]} 0 0, 1 1 -repeat 2
force {SW[1]} 0 0, 1 2 -repeat 4
force {SW[2]} 0 0, 1 4 -repeat 8
force {SW[3]} 0 0, 1 8 -repeat 16
force {SW[4]} 0 0, 1 16 -repeat 32
force {SW[5]} 0 0, 1 32 -repeat 64
force {SW[6]} 0 0, 1 64 -repeat 128
force {SW[7]} 0 0, 1 128 -repeat 256
force {SW[8]} 0 0, 1 256 -repeat 256

run 128ns

