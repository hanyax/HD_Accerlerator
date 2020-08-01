onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -childformat {{{/mux_accumulator_testbench/out[15]} -radix unsigned} {{/mux_accumulator_testbench/out[14]} -radix unsigned} {{/mux_accumulator_testbench/out[13]} -radix unsigned} {{/mux_accumulator_testbench/out[12]} -radix unsigned} {{/mux_accumulator_testbench/out[11]} -radix unsigned} {{/mux_accumulator_testbench/out[10]} -radix unsigned} {{/mux_accumulator_testbench/out[9]} -radix unsigned} {{/mux_accumulator_testbench/out[8]} -radix unsigned} {{/mux_accumulator_testbench/out[7]} -radix unsigned} {{/mux_accumulator_testbench/out[6]} -radix unsigned} {{/mux_accumulator_testbench/out[5]} -radix unsigned} {{/mux_accumulator_testbench/out[4]} -radix unsigned} {{/mux_accumulator_testbench/out[3]} -radix unsigned} {{/mux_accumulator_testbench/out[2]} -radix unsigned} {{/mux_accumulator_testbench/out[1]} -radix unsigned} {{/mux_accumulator_testbench/out[0]} -radix unsigned}} -subitemconfig {{/mux_accumulator_testbench/out[15]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[14]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[13]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[12]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[11]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[10]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[9]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[8]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[7]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[6]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[5]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[4]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[3]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[2]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[1]} {-height 15 -radix unsigned} {/mux_accumulator_testbench/out[0]} {-height 15 -radix unsigned}} /mux_accumulator_testbench/out
add wave -noupdate -childformat {{{/mux_accumulator_testbench/features[15]} -radix binary} {{/mux_accumulator_testbench/features[10]} -radix binary}} -subitemconfig {{/mux_accumulator_testbench/features[15]} {-height 15 -radix binary} {/mux_accumulator_testbench/features[10]} {-height 15 -radix binary}} /mux_accumulator_testbench/features
add wave -noupdate /mux_accumulator_testbench/projections
add wave -noupdate /mux_accumulator_testbench/clk
add wave -noupdate /mux_accumulator_testbench/dut/selected_features
add wave -noupdate -expand -group Adder /mux_accumulator_testbench/dut/adder/inputs
add wave -noupdate -expand -group Adder /mux_accumulator_testbench/dut/adder/last_in
add wave -noupdate -expand -group Adder -radix unsigned -childformat {{{/mux_accumulator_testbench/dut/adder/out[15]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[14]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[13]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[12]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[11]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[10]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[9]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[8]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[7]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[6]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[5]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[4]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[3]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[2]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[1]} -radix unsigned} {{/mux_accumulator_testbench/dut/adder/out[0]} -radix unsigned}} -subitemconfig {{/mux_accumulator_testbench/dut/adder/out[15]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[14]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[13]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[12]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[11]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[10]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[9]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[8]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[7]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[6]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[5]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[4]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[3]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[2]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[1]} {-radix unsigned} {/mux_accumulator_testbench/dut/adder/out[0]} {-radix unsigned}} /mux_accumulator_testbench/dut/adder/out
add wave -noupdate /mux_accumulator_testbench/dut/adder/first_inter
add wave -noupdate /mux_accumulator_testbench/dut/adder/second_inter
add wave -noupdate /mux_accumulator_testbench/dut/adder/third_inter
add wave -noupdate /mux_accumulator_testbench/dut/adder/fourth_inter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {488 ps} 0}
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
WaveRestoreZoom {191 ps} {727 ps}
