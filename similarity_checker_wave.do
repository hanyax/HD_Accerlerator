onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /similarity_checker_testbench/dut/clk
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/encode_vector_in
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/class_in
add wave -noupdate /similarity_checker_testbench/dut/reset
add wave -noupdate /similarity_checker_testbench/dut/cur_encode_done
add wave -noupdate /similarity_checker_testbench/dut/read_class_done
add wave -noupdate /similarity_checker_testbench/done
add wave -noupdate -radix unsigned /similarity_checker_testbench/max_val
add wave -noupdate -radix unsigned /similarity_checker_testbench/max_index
add wave -noupdate /similarity_checker_testbench/dut/j
add wave -noupdate /similarity_checker_testbench/dut/max_index_temp
add wave -noupdate /similarity_checker_testbench/dut/max
add wave -noupdate /similarity_checker_testbench/dut/k
add wave -noupdate /similarity_checker_testbench/coeffs_in
add wave -noupdate /similarity_checker_testbench/dut/enble_write
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/read_addr
add wave -noupdate /similarity_checker_testbench/dut/read_data
add wave -noupdate -radix unsigned /similarity_checker_testbench/dut/write_addr
add wave -noupdate /similarity_checker_testbench/dut/write_data
add wave -noupdate -expand -group Mem /similarity_checker_testbench/dut/result_mem/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8497 ps} 0}
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
WaveRestoreZoom {7750 ps} {8750 ps}
