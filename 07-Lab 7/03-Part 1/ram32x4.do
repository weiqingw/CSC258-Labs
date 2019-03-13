vlib work
vlog -timescale 1ns/1ns ram.v
vsim -L altera_mf_ver ram
log {/*}
add wave {/*}
force {KEY[0]} 0 0, 1 10 -r 20
#write
force {SW[9]} 1
force {SW[8:4]} 11111
force {SW[3:0]} 1111
run 20ns
force {SW[8:4]} 00001
force {SW[3:0]} 0001
run 20ns
force {SW[8:4]} 00010
force {SW[3:0]} 0010
run 20ns
force {SW[8:4]} 00011
force {SW[3:0]} 0011
run 20ns
#read
force {SW[9]} 0
force {SW[8:4]} 00000
run 20ns
force {SW[8:4]} 00001
run 20ns
force {SW[8:4]} 00010
run 20ns
force {SW[8:4]} 00011
run 20ps
