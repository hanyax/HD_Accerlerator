onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /accelerator_top_testbench/clk
add wave -noupdate /accelerator_top_testbench/dut/all_write_done
add wave -noupdate /accelerator_top_testbench/all_done
add wave -noupdate /accelerator_top_testbench/max_val
add wave -noupdate /accelerator_top_testbench/max_index
add wave -noupdate -radix unsigned -childformat {{{/accelerator_top_testbench/dut/cur_projections[31]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[30]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[29]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[28]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[27]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[26]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[25]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[24]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[23]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[22]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[21]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[20]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[19]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[18]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[17]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[16]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[15]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[14]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[13]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[12]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[11]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[10]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[9]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[8]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[7]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[6]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[5]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[4]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[3]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[2]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[1]} -radix unsigned} {{/accelerator_top_testbench/dut/cur_projections[0]} -radix unsigned}} -subitemconfig {{/accelerator_top_testbench/dut/cur_projections[31]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[30]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[29]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[28]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[27]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[26]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[25]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[24]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[23]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[22]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[21]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[20]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[19]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[18]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[17]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[16]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[15]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[14]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[13]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[12]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[11]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[10]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[9]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[8]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[7]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[6]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[5]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[4]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[3]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[2]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[1]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/cur_projections[0]} {-height 15 -radix unsigned}} /accelerator_top_testbench/dut/cur_projections
add wave -noupdate -radix unsigned -childformat {{{/accelerator_top_testbench/dut/projection_addrs[1]} -radix unsigned} {{/accelerator_top_testbench/dut/projection_addrs[0]} -radix unsigned}} -subitemconfig {{/accelerator_top_testbench/dut/projection_addrs[1]} {-height 15 -radix unsigned} {/accelerator_top_testbench/dut/projection_addrs[0]} {-height 15 -radix unsigned}} /accelerator_top_testbench/dut/projection_addrs
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/ram/mem
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/out0
add wave -noupdate -group Projections /accelerator_top_testbench/dut/projection_mem/out1
add wave -noupdate -group Projections -radix unsigned /accelerator_top_testbench/dut/projection_mem/address_0_in
add wave -noupdate -group Projections -radix unsigned /accelerator_top_testbench/dut/projection_mem/address_1_in
add wave -noupdate -group Control -radix unsigned /accelerator_top_testbench/dut/encode_control/projection_addrs
add wave -noupdate -group Control -radix unsigned /accelerator_top_testbench/dut/encode_control/feature_addrs
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/out_done
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/out_reset
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/cur_encode_done
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/reset_in
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/write_data_done
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/vertical_projection_mem_loc
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/horizontal_projection_mem_loc
add wave -noupdate -group Control /accelerator_top_testbench/dut/encode_control/encoding_cycle_count
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/reset
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/out
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/done
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/projections
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/features
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/out_temp
add wave -noupdate -group Mac /accelerator_top_testbench/dut/mac/count
add wave -noupdate -group Class /accelerator_top_testbench/dut/class_mem/re
add wave -noupdate -group Class /accelerator_top_testbench/dut/class_mem/write_done
add wave -noupdate -group Class /accelerator_top_testbench/dut/class_mem/class_out
add wave -noupdate -group Class /accelerator_top_testbench/dut/class_mem/address_in
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/reset_out
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/total_count
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/out_done
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/write_data_done
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/cur_encode_done
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/encode_done_cur_cycle
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/cur_class_addr
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/encoding_cycle_count
add wave -noupdate -group {Class Control} /accelerator_top_testbench/dut/class_check_control/class_cur_cycle_count
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/encode_vector_in
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/class_in
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/coeffs_in
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/reset
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/cur_encode_done
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/read_class_done
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/max_val
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/max_index
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/done
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/results
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/we
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/coeffs
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/i
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/j
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/k
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/max_index_temp
add wave -noupdate -group Sim_Check /accelerator_top_testbench/dut/similarity_check/max
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11391932 ps} 0}
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
WaveRestoreZoom {11391680 ps} {11392552 ps}
