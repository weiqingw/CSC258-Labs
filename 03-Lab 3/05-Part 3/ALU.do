vlib work

vlog -timescale 1ns/1ns ALU.v

vsim ALU

log {/*}
add wave {/*}
force {KEY[2]} 0
force {KEY[1]} 0
force {KEY[0]} 0
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 00001000
run 10ns
force {KEY[2]} 0
force {KEY[1]} 0
force {KEY[0]} 1
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 00010001
run 10ns
force {KEY[2]} 0
force {KEY[1]} 1
force {KEY[0]} 0
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 00010001
run 10ns
force {KEY[2]} 0
force {KEY[1]} 1
force {KEY[0]} 1
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 1111_1101
run 10ns
force {KEY[2]} 1
force {KEY[1]} 0
force {KEY[0]} 0
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 00000001
run 10ns
force {KEY[2]} 1
force {KEY[1]} 0
force {KEY[0]} 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
#LEDR[7:0] == 00000000
run 10ns
force {KEY[2]} 1
force {KEY[1]} 0
force {KEY[0]} 1
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
#LEDR[7:0] == 01111010
run 10ns
