onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_adder_tree_testbench/period
add wave -noupdate -radix unsigned -childformat {{{/pipelined_adder_tree_testbench/out[15]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[14]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[13]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[12]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[11]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[10]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[9]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[8]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[7]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[6]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[5]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[4]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[3]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[2]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[1]} -radix unsigned} {{/pipelined_adder_tree_testbench/out[0]} -radix unsigned}} -subitemconfig {{/pipelined_adder_tree_testbench/out[15]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[14]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[13]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[12]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[11]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[10]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[9]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[8]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[7]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[6]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[5]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[4]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[3]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[2]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[1]} {-height 15 -radix unsigned} {/pipelined_adder_tree_testbench/out[0]} {-height 15 -radix unsigned}} /pipelined_adder_tree_testbench/out
add wave -noupdate /pipelined_adder_tree_testbench/inputs
add wave -noupdate /pipelined_adder_tree_testbench/clk
add wave -noupdate /pipelined_adder_tree_testbench/dut/first_inter
add wave -noupdate {/pipelined_adder_tree_testbench/dut/first_results[0]/adder_first/input1}
add wave -noupdate {/pipelined_adder_tree_testbench/dut/first_results[0]/adder_first/input2}
add wave -noupdate {/pipelined_adder_tree_testbench/dut/first_results[0]/adder_first/out}
add wave -noupdate {/pipelined_adder_tree_testbench/dut/first_results[0]/adder_first/carry_out}
add wave -noupdate {/pipelined_adder_tree_testbench/dut/first_results[0]/adder_first/carry}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {183 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {184 ps} {622 ps}
