vlib work
vlog -timescale 1ns/1ns part2.v
vsim combination
log {/*}
add wave {/*}
force {clk} 0 0, 1 5 -r 10
force {resetn} 0
force {load} 0
force {go} 0
run 20ns
force {resetn} 1
force {color_in[2:0]} 101
run 20ns
force {coordinate[6:0]} 0001110
force {load} 1
run 20ns
force {load} 0
run 20ns
force {coordinate[6:0]} 0011001
force {go} 1
run 20ns
force{go} 0
run 20ns

