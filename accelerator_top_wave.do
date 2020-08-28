onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /accelerator_top_testbench/clk
add wave -noupdate /accelerator_top_testbench/reset
add wave -noupdate /accelerator_top_testbench/projections
add wave -noupdate /accelerator_top_testbench/features
add wave -noupdate -radix decimal /accelerator_top_testbench/dut/out
add wave -noupdate -radix binary /accelerator_top_testbench/dut/cur_projections
add wave -noupdate -radix decimal /accelerator_top_testbench/dut/cur_features
add wave -noupdate /accelerator_top_testbench/dut/reset_mac
add wave -noupdate /accelerator_top_testbench/dut/mac_done
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/controll/cur_x
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/controll/cur_y
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/out
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/done
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/reset
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/projections
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/features
add wave -noupdate -expand -group MAC /accelerator_top_testbench/dut/mac/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11259 ps} 0}
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
WaveRestoreZoom {10719 ps} {11719 ps}
