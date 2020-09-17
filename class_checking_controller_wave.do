onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /class_checking_controller_testbench/class_addrs
add wave -noupdate -radix unsigned /class_checking_controller_testbench/dut/class_cur_cycle_count
add wave -noupdate /class_checking_controller_testbench/reset_out
add wave -noupdate /class_checking_controller_testbench/out_done
add wave -noupdate /class_checking_controller_testbench/clk
add wave -noupdate /class_checking_controller_testbench/reset_in
add wave -noupdate /class_checking_controller_testbench/write_data_done
add wave -noupdate /class_checking_controller_testbench/cur_encode_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {878281 ps} 0}
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
WaveRestoreZoom {2065 ps} {3065 ps}
