vlib work

vlog -timescale 1ns/1ns Morse.v

vsim Morse

log {/*}
add wave {/*}

force {CLOCK_50} 0 0, 1 10 -repeat 20
force {SW[0]} 0 0, 1 7000000020 -repeat 14000000040
force {SW[1]} 0 0, 1 14000000040 -repeat 28000000080
force {SW[2]} 0 0, 1 28000000080 -repeat 56000000160
force {KEY[0]} 1
force {KEY[1]} 0 0, 1 20 -repeat 7000000020
run 56000000160ns
