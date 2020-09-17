onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /similarity_checker_testbench/dut/clk
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/encode_vector_in
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/class_in
add wave -noupdate /similarity_checker_testbench/dut/reset
add wave -noupdate /similarity_checker_testbench/dut/cur_encode_done
add wave -noupdate /similarity_checker_testbench/dut/read_class_done
add wave -noupdate -radix unsigned -childformat {{{/similarity_checker_testbench/dut/results[25]} -radix unsigned} {{/similarity_checker_testbench/dut/results[24]} -radix unsigned} {{/similarity_checker_testbench/dut/results[23]} -radix unsigned} {{/similarity_checker_testbench/dut/results[22]} -radix unsigned} {{/similarity_checker_testbench/dut/results[21]} -radix unsigned} {{/similarity_checker_testbench/dut/results[20]} -radix unsigned} {{/similarity_checker_testbench/dut/results[19]} -radix unsigned} {{/similarity_checker_testbench/dut/results[18]} -radix unsigned} {{/similarity_checker_testbench/dut/results[17]} -radix unsigned} {{/similarity_checker_testbench/dut/results[16]} -radix unsigned} {{/similarity_checker_testbench/dut/results[15]} -radix unsigned} {{/similarity_checker_testbench/dut/results[14]} -radix unsigned} {{/similarity_checker_testbench/dut/results[13]} -radix unsigned} {{/similarity_checker_testbench/dut/results[12]} -radix unsigned} {{/similarity_checker_testbench/dut/results[11]} -radix unsigned} {{/similarity_checker_testbench/dut/results[10]} -radix unsigned} {{/similarity_checker_testbench/dut/results[9]} -radix unsigned} {{/similarity_checker_testbench/dut/results[8]} -radix unsigned} {{/similarity_checker_testbench/dut/results[7]} -radix unsigned} {{/similarity_checker_testbench/dut/results[6]} -radix unsigned} {{/similarity_checker_testbench/dut/results[5]} -radix unsigned} {{/similarity_checker_testbench/dut/results[4]} -radix unsigned} {{/similarity_checker_testbench/dut/results[3]} -radix unsigned} {{/similarity_checker_testbench/dut/results[2]} -radix unsigned} {{/similarity_checker_testbench/dut/results[1]} -radix unsigned} {{/similarity_checker_testbench/dut/results[0]} -radix unsigned}} -subitemconfig {{/similarity_checker_testbench/dut/results[25]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[24]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[23]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[22]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[21]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[20]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[19]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[18]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[17]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[16]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[15]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[14]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[13]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[12]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[11]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[10]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[9]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[8]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[7]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[6]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[5]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[4]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[3]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[2]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[1]} {-height 15 -radix unsigned} {/similarity_checker_testbench/dut/results[0]} {-height 15 -radix unsigned}} /similarity_checker_testbench/dut/results
add wave -noupdate /similarity_checker_testbench/dut/i
add wave -noupdate /similarity_checker_testbench/done
add wave -noupdate -radix unsigned /similarity_checker_testbench/max_val
add wave -noupdate -radix unsigned /similarity_checker_testbench/max_index
add wave -noupdate /similarity_checker_testbench/dut/j
add wave -noupdate /similarity_checker_testbench/dut/coeffs
add wave -noupdate /similarity_checker_testbench/dut/max_index_temp
add wave -noupdate /similarity_checker_testbench/dut/max
add wave -noupdate /similarity_checker_testbench/dut/k
add wave -noupdate /similarity_checker_testbench/coeffs_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
