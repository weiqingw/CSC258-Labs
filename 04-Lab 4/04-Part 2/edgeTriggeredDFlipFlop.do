vlib work

vlog -timescale 1ns/1ns edgeTriggeredDFlipFlop.v

vsim edgeTriggeredDFlipFlop

log {/*}
add wave {/*}
#1
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0
run 10ns
#2
force {KEY[0]} 0   
run 10ns
#3   A+1
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
run 10ns
#4
force {KEY[0]} 0    
run 10ns
#5      A+B
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
run 10ns
#6
force {KEY[0]} 0    
run 10ns
#7      A+B
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 0
 
force {SW[9]} 1
run 10ns
#8
force {KEY[0]} 0    
run 10ns
#9     XOR and OR 
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 0
force {SW[9]} 1
run 10ns
#10
force {KEY[0]} 0    
run 10ns
#11     any 1?
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
run 10ns
#12
force {KEY[0]} 0    
run 10ns
#13     reset
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 0
run 10ns
#14
force {KEY[0]} 0   
run 10ns
#15     A+1
force {KEY[0]} 1    
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
#ALU function selector
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[9]} 1
run 10ns
#16
force {KEY[0]} 0   
run 10ns
#17     left shift B by A bits
force {KEY[0]} 1    
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
#ALU function selector
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
run 10ns
#18
force {KEY[0]} 0    
run 10ns
#19     Right shift B by A bits
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
#ALU function selector
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 1
run 10ns
#20
force {KEY[0]} 0    
run 10ns
#21     A * B
force {KEY[0]} 1    
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
#ALU function selector
force {SW[5]} 1
force {SW[6]} 1
force {SW[7]} 1
force {SW[9]} 1
run 10ns
