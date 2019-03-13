vlib work
vlog -timescale 1ns/1ns part2.v
vsim control
log {/*}
add wave {/*}
force {clk} 0 0, 1 10 -r 20
force {resetn} 0
run 20ns
force {resetn} 1
force {go} 1
force {load} 1
run 20ns
force {load} 0
run 20ns
force {load} 1
run 20ns    
force {go} 0
run 20ns
force {go} 1
run 20ns
