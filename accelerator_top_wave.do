onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /accelerator_top_testbench/dut/out
add wave -noupdate /accelerator_top_testbench/dut/all_write_done
add wave -noupdate -radix unsigned /accelerator_top_testbench/dut/cur_projections
add wave -noupdate -radix unsigned -childformat {{{/accelerator_top_testbench/dut/projection_addrs[1]} -radix unsigned} {{/accelerator_top_testbench/dut/projection_addrs[0]} -radix unsigned}} -subitemconfig {{/accelerator_top_testbench/dut/projection_addrs[1]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/projection_addrs[0]} {-height 15 -radix unsigned}} /accelerator_top_testbench/dut/projection_addrs
add wave -noupdate -group Projections -radix unsigned /accelerator_top_testbench/dut/projection_mem/proj_ins
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/read_address0
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/read_address1
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/write_done
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/out0
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/out1
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/write_address
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/address_0_in
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/address_1_in
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/feature_in
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/read_address
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/we
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/re
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/write_done
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/out0
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/out1
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/out2
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/out3
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/write_address
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/address_in
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/total_count_write
add wave -noupdate -group Feature /accelerator_top_testbench/dut/feature_mem/i
add wave -noupdate -expand -group Control -radix unsigned /accelerator_top_testbench/dut/encode_control/projection_addrs
add wave -noupdate -expand -group Control -radix unsigned /accelerator_top_testbench/dut/encode_control/feature_addrs
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/class_addrs
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/out_done
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/out_reset
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/cur_encode_done
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/reset_in
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/write_data_done
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/vertical_projection_mem_loc
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/horizontal_projection_mem_loc
add wave -noupdate -expand -group Control /accelerator_top_testbench/dut/encode_control/encoding_cycle_count
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/reset
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/out
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/done
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/projections
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/features
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/out_temp
add wave -noupdate -expand -group Mac /accelerator_top_testbench/dut/mac/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61759 ps} 0}
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
WaveRestoreZoom {61338 ps} {62304 ps}
