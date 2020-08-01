onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /encoding_testbench/clk
add wave -noupdate -radix binary -childformat {{{/encoding_testbench/projections[15]} -radix unsigned} {{/encoding_testbench/projections[14]} -radix unsigned} {{/encoding_testbench/projections[13]} -radix unsigned} {{/encoding_testbench/projections[12]} -radix unsigned} {{/encoding_testbench/projections[11]} -radix unsigned} {{/encoding_testbench/projections[10]} -radix unsigned} {{/encoding_testbench/projections[9]} -radix unsigned} {{/encoding_testbench/projections[8]} -radix unsigned} {{/encoding_testbench/projections[7]} -radix unsigned} {{/encoding_testbench/projections[6]} -radix unsigned} {{/encoding_testbench/projections[5]} -radix unsigned} {{/encoding_testbench/projections[4]} -radix unsigned} {{/encoding_testbench/projections[3]} -radix unsigned} {{/encoding_testbench/projections[2]} -radix unsigned} {{/encoding_testbench/projections[1]} -radix unsigned} {{/encoding_testbench/projections[0]} -radix unsigned}} -expand -subitemconfig {{/encoding_testbench/projections[15]} {-radix unsigned} {/encoding_testbench/projections[14]} {-radix unsigned} {/encoding_testbench/projections[13]} {-radix unsigned} {/encoding_testbench/projections[12]} {-radix unsigned} {/encoding_testbench/projections[11]} {-radix unsigned} {/encoding_testbench/projections[10]} {-radix unsigned} {/encoding_testbench/projections[9]} {-radix unsigned} {/encoding_testbench/projections[8]} {-radix unsigned} {/encoding_testbench/projections[7]} {-radix unsigned} {/encoding_testbench/projections[6]} {-radix unsigned} {/encoding_testbench/projections[5]} {-radix unsigned} {/encoding_testbench/projections[4]} {-radix unsigned} {/encoding_testbench/projections[3]} {-radix unsigned} {/encoding_testbench/projections[2]} {-radix unsigned} {/encoding_testbench/projections[1]} {-radix unsigned} {/encoding_testbench/projections[0]} {-radix unsigned}} /encoding_testbench/projections
add wave -noupdate -radix binary -childformat {{{/encoding_testbench/dut/proj_ins[15]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[14]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[13]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[12]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[11]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[10]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[9]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[8]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[7]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[6]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[5]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[4]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[3]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[2]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[1]} -radix unsigned} {{/encoding_testbench/dut/proj_ins[0]} -radix unsigned}} -expand -subitemconfig {{/encoding_testbench/dut/proj_ins[15]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[14]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[13]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[12]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[11]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[10]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[9]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[8]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[7]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[6]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[5]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[4]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[3]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[2]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[1]} {-radix unsigned} {/encoding_testbench/dut/proj_ins[0]} {-radix unsigned}} /encoding_testbench/dut/proj_ins
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
