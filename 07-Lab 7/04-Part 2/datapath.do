vlib work
vlog -timescale 1ns/1ns part2.v
vsim datapath
log {/*}
add wave {/*}
force {clk} 0 0, 1 10 -r 20
force {resetn} 0
run 20ns
force {resetn} 1
run 20ns
force {ld_x} 1
force {ld_y} 0
force {ld_color} 0
force {color_in[2:0]} 110
force {coordinate[6:0]} 1010101
run 20ns
force {ld_x} 0
run 5ns
force {ld_y} 1
force {ld_color} 1
force {color_in[2:0]} 110
force {coordinate[6:0]} 0001110
run 20ns
