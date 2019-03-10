vlib work
vlog -timescale 1ns/1ns sequence_detector.v
vsim sequence_detector
log {/*}
add wave {/*}

force {KEY[0]} 0
force {SW[0]} 0
force {SW[1]} 1
run 1ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 0
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns

force {KEY[0]} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
run 20ns
