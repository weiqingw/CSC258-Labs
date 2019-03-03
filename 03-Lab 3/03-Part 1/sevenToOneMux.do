vlib work

vlog -timescale 1ns/1ns sevenToOneMux.v

vsim sevenToOneMux

log {/*}

add wave {/*}

force {SW[0]} 1
force {SW[1]} 0 
force {SW[2]} 0 
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 1 
force {SW[2]} 0 
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 0 
force {SW[2]} 1 
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 0 
force {SW[2]} 0 
force {SW[3]} 1
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 0 
force {SW[2]} 0 
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 0 
force {SW[2]} 0 
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns

force {SW[0]} 0
force {SW[1]} 0 
force {SW[2]} 0 
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 1
force {SW[9]} 0 0, 1 4 -repeat 8
force {SW[8]} 0 0, 1 2 -repeat 4
force {SW[7]} 0 0, 1 1 -repeat 2
run 8ns
