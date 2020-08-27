onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controller_testbench/out_projections
add wave -noupdate /controller_testbench/out_features
add wave -noupdate /controller_testbench/out_done
add wave -noupdate /controller_testbench/out_reset
add wave -noupdate /controller_testbench/projections
add wave -noupdate /controller_testbench/features
add wave -noupdate /controller_testbench/clk
add wave -noupdate /controller_testbench/done
add wave -noupdate /controller_testbench/reset_in
add wave -noupdate /controller_testbench/dut/cur_x
add wave -noupdate /controller_testbench/dut/cur_y
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
