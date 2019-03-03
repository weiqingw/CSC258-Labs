vlib work

vlog -timescale 1ns/1ns flashes.v

vsim flashes

log {/*}
add wave {/*}

force {CLOCK_50} 0 0, 1 10 -repeat 20
force {SW[0]} 0 
force {SW[1]} 0 
force {SW[2]} 0 0, 1 15
run 8000000020ns

force {CLOCK_50} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0 0, 1 15
run 16000000020ns

force {CLOCK_50} 0 0, 1 10 -repeat 20
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0 0, 1 15
run 32000000020ns

force {CLOCK_50} 0 0, 1 10 -repeat 20
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0 0, 1 15
run 64000000020ns
