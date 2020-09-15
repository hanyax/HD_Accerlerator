onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controller_testbench/clk
add wave -noupdate /controller_testbench/write_data_done
add wave -noupdate -expand -group Projection -radix unsigned /controller_testbench/projection_addrs
add wave -noupdate -expand -group Projection /controller_testbench/out_done
add wave -noupdate -expand -group Projection /controller_testbench/out_reset
add wave -noupdate -expand -group Projection -radix unsigned /controller_testbench/dut/vertical_projection_mem_loc
add wave -noupdate -expand -group Projection -radix unsigned /controller_testbench/dut/horizontal_projection_mem_loc
add wave -noupdate -expand -group Projection -radix unsigned /controller_testbench/dut/bound
add wave -noupdate -expand -group Projection -radix unsigned /controller_testbench/dut/addr_after_bound
add wave -noupdate -expand -group Class /controller_testbench/cur_encode_done
add wave -noupdate -expand -group Class -radix unsigned /controller_testbench/dut/class_cur_cycle_count
add wave -noupdate -expand -group Class -radix unsigned /controller_testbench/class_addrs
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
WaveRestoreZoom {852756 ps} {853645 ps}
