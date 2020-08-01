onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /encoding_testbench/clk
add wave -noupdate /encoding_testbench/reset
add wave -noupdate /encoding_testbench/done
add wave -noupdate -radix unsigned -childformat {{{/encoding_testbench/out[15]} -radix unsigned} {{/encoding_testbench/out[14]} -radix unsigned} {{/encoding_testbench/out[13]} -radix unsigned} {{/encoding_testbench/out[12]} -radix unsigned} {{/encoding_testbench/out[11]} -radix unsigned} {{/encoding_testbench/out[10]} -radix unsigned} {{/encoding_testbench/out[9]} -radix unsigned} {{/encoding_testbench/out[8]} -radix unsigned} {{/encoding_testbench/out[7]} -radix unsigned} {{/encoding_testbench/out[6]} -radix unsigned} {{/encoding_testbench/out[5]} -radix unsigned} {{/encoding_testbench/out[4]} -radix unsigned} {{/encoding_testbench/out[3]} -radix unsigned} {{/encoding_testbench/out[2]} -radix unsigned} {{/encoding_testbench/out[1]} -radix unsigned} {{/encoding_testbench/out[0]} -radix unsigned}} -subitemconfig {{/encoding_testbench/out[15]} {-radix unsigned} {/encoding_testbench/out[14]} {-radix unsigned} {/encoding_testbench/out[13]} {-radix unsigned} {/encoding_testbench/out[12]} {-radix unsigned} {/encoding_testbench/out[11]} {-radix unsigned} {/encoding_testbench/out[10]} {-radix unsigned} {/encoding_testbench/out[9]} {-radix unsigned} {/encoding_testbench/out[8]} {-radix unsigned} {/encoding_testbench/out[7]} {-radix unsigned} {/encoding_testbench/out[6]} {-radix unsigned} {/encoding_testbench/out[5]} {-radix unsigned} {/encoding_testbench/out[4]} {-radix unsigned} {/encoding_testbench/out[3]} {-radix unsigned} {/encoding_testbench/out[2]} {-radix unsigned} {/encoding_testbench/out[1]} {-radix unsigned} {/encoding_testbench/out[0]} {-radix unsigned}} /encoding_testbench/out
add wave -noupdate -radix binary -childformat {{{/encoding_testbench/projections[15]} -radix unsigned} {{/encoding_testbench/projections[14]} -radix unsigned} {{/encoding_testbench/projections[13]} -radix unsigned} {{/encoding_testbench/projections[12]} -radix unsigned} {{/encoding_testbench/projections[11]} -radix unsigned} {{/encoding_testbench/projections[10]} -radix unsigned} {{/encoding_testbench/projections[9]} -radix unsigned} {{/encoding_testbench/projections[8]} -radix unsigned} {{/encoding_testbench/projections[7]} -radix unsigned} {{/encoding_testbench/projections[6]} -radix unsigned} {{/encoding_testbench/projections[5]} -radix unsigned} {{/encoding_testbench/projections[4]} -radix unsigned} {{/encoding_testbench/projections[3]} -radix unsigned} {{/encoding_testbench/projections[2]} -radix unsigned} {{/encoding_testbench/projections[1]} -radix unsigned} {{/encoding_testbench/projections[0]} -radix unsigned}} -subitemconfig {{/encoding_testbench/projections[15]} {-height 15 -radix unsigned} {/encoding_testbench/projections[14]} {-height 15 -radix unsigned} {/encoding_testbench/projections[13]} {-height 15 -radix unsigned} {/encoding_testbench/projections[12]} {-height 15 -radix unsigned} {/encoding_testbench/projections[11]} {-height 15 -radix unsigned} {/encoding_testbench/projections[10]} {-height 15 -radix unsigned} {/encoding_testbench/projections[9]} {-height 15 -radix unsigned} {/encoding_testbench/projections[8]} {-height 15 -radix unsigned} {/encoding_testbench/projections[7]} {-height 15 -radix unsigned} {/encoding_testbench/projections[6]} {-height 15 -radix unsigned} {/encoding_testbench/projections[5]} {-height 15 -radix unsigned} {/encoding_testbench/projections[4]} {-height 15 -radix unsigned} {/encoding_testbench/projections[3]} {-height 15 -radix unsigned} {/encoding_testbench/projections[2]} {-height 15 -radix unsigned} {/encoding_testbench/projections[1]} {-height 15 -radix unsigned} {/encoding_testbench/projections[0]} {-height 15 -radix unsigned}} /encoding_testbench/projections
add wave -noupdate -radix binary -childformat {{{/encoding_testbench/dut/proj_ins[15]} -radix binary} {{/encoding_testbench/dut/proj_ins[14]} -radix binary} {{/encoding_testbench/dut/proj_ins[13]} -radix binary} {{/encoding_testbench/dut/proj_ins[12]} -radix binary} {{/encoding_testbench/dut/proj_ins[11]} -radix binary} {{/encoding_testbench/dut/proj_ins[10]} -radix binary} {{/encoding_testbench/dut/proj_ins[9]} -radix binary} {{/encoding_testbench/dut/proj_ins[8]} -radix binary} {{/encoding_testbench/dut/proj_ins[7]} -radix binary} {{/encoding_testbench/dut/proj_ins[6]} -radix binary} {{/encoding_testbench/dut/proj_ins[5]} -radix binary} {{/encoding_testbench/dut/proj_ins[4]} -radix binary} {{/encoding_testbench/dut/proj_ins[3]} -radix binary} {{/encoding_testbench/dut/proj_ins[2]} -radix binary} {{/encoding_testbench/dut/proj_ins[1]} -radix binary} {{/encoding_testbench/dut/proj_ins[0]} -radix binary}} -subitemconfig {{/encoding_testbench/dut/proj_ins[15]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[14]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[13]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[12]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[11]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[10]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[9]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[8]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[7]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[6]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[5]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[4]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[3]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[2]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[1]} {-height 15 -radix binary} {/encoding_testbench/dut/proj_ins[0]} {-height 15 -radix binary}} /encoding_testbench/dut/proj_ins
add wave -noupdate -radix decimal /encoding_testbench/dut/count
add wave -noupdate -childformat {{{/encoding_testbench/dut/out_temp[15]} -radix unsigned} {{/encoding_testbench/dut/out_temp[14]} -radix unsigned} {{/encoding_testbench/dut/out_temp[13]} -radix unsigned} {{/encoding_testbench/dut/out_temp[12]} -radix unsigned} {{/encoding_testbench/dut/out_temp[11]} -radix unsigned} {{/encoding_testbench/dut/out_temp[10]} -radix unsigned} {{/encoding_testbench/dut/out_temp[9]} -radix unsigned} {{/encoding_testbench/dut/out_temp[8]} -radix unsigned} {{/encoding_testbench/dut/out_temp[7]} -radix unsigned} {{/encoding_testbench/dut/out_temp[6]} -radix unsigned} {{/encoding_testbench/dut/out_temp[5]} -radix unsigned} {{/encoding_testbench/dut/out_temp[4]} -radix unsigned} {{/encoding_testbench/dut/out_temp[3]} -radix unsigned} {{/encoding_testbench/dut/out_temp[2]} -radix unsigned} {{/encoding_testbench/dut/out_temp[1]} -radix unsigned} {{/encoding_testbench/dut/out_temp[0]} -radix unsigned}} -subitemconfig {{/encoding_testbench/dut/out_temp[15]} {-radix unsigned} {/encoding_testbench/dut/out_temp[14]} {-radix unsigned} {/encoding_testbench/dut/out_temp[13]} {-radix unsigned} {/encoding_testbench/dut/out_temp[12]} {-radix unsigned} {/encoding_testbench/dut/out_temp[11]} {-radix unsigned} {/encoding_testbench/dut/out_temp[10]} {-radix unsigned} {/encoding_testbench/dut/out_temp[9]} {-radix unsigned} {/encoding_testbench/dut/out_temp[8]} {-radix unsigned} {/encoding_testbench/dut/out_temp[7]} {-radix unsigned} {/encoding_testbench/dut/out_temp[6]} {-radix unsigned} {/encoding_testbench/dut/out_temp[5]} {-radix unsigned} {/encoding_testbench/dut/out_temp[4]} {-radix unsigned} {/encoding_testbench/dut/out_temp[3]} {-radix unsigned} {/encoding_testbench/dut/out_temp[2]} {-radix unsigned} {/encoding_testbench/dut/out_temp[1]} {-radix unsigned} {/encoding_testbench/dut/out_temp[0]} {-radix unsigned}} /encoding_testbench/dut/out_temp
add wave -noupdate /encoding_testbench/features
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25145 ps} 0}
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
WaveRestoreZoom {24645 ps} {25645 ps}
