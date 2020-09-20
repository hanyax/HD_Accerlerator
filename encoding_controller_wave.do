onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -childformat {{{/encoding_controller_testbench/dut/projection_addrs[1]} -radix unsigned} {{/encoding_controller_testbench/dut/projection_addrs[0]} -radix unsigned}} -expand -subitemconfig {{/encoding_controller_testbench/dut/projection_addrs[1]} {-radix unsigned} {/encoding_controller_testbench/dut/projection_addrs[0]} {-radix unsigned}} /encoding_controller_testbench/dut/projection_addrs
add wave -noupdate /encoding_controller_testbench/dut/feature_addrs
add wave -noupdate /encoding_controller_testbench/dut/out_done
add wave -noupdate /encoding_controller_testbench/dut/out_reset
add wave -noupdate /encoding_controller_testbench/dut/clk
add wave -noupdate /encoding_controller_testbench/dut/cur_encode_done
add wave -noupdate /encoding_controller_testbench/dut/reset_in
add wave -noupdate /encoding_controller_testbench/dut/write_data_done
add wave -noupdate /encoding_controller_testbench/dut/encoding_cycle_count
add wave -noupdate /encoding_controller_testbench/dut/vertical_projection_mem_loc
add wave -noupdate /encoding_controller_testbench/dut/horizontal_projection_mem_loc
add wave -noupdate /encoding_controller_testbench/dut/max_horizontal_projection_mem_loc
add wave -noupdate /encoding_controller_testbench/dut/bound
add wave -noupdate /encoding_controller_testbench/dut/addr_after_bound
add wave -noupdate /encoding_controller_testbench/dut/cur_feature_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {853510 ps} 0}
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
WaveRestoreZoom {372949 ps} {373838 ps}
