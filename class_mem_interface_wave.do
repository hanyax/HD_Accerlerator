onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /class_mem_interface_testbench/clk
add wave -noupdate /class_mem_interface_testbench/clk
add wave -noupdate /class_mem_interface_testbench/reset
add wave -noupdate /class_mem_interface_testbench/we
add wave -noupdate /class_mem_interface_testbench/write_done
add wave -noupdate /class_mem_interface_testbench/dut/address_in
add wave -noupdate /class_mem_interface_testbench/dut/write_address
add wave -noupdate -expand -group r0 /class_mem_interface_testbench/dut/ram0/mem
add wave -noupdate -expand -group r1 /class_mem_interface_testbench/dut/ram1/mem
add wave -noupdate -expand -group r2 /class_mem_interface_testbench/dut/ram2/mem
add wave -noupdate -expand -group r3 /class_mem_interface_testbench/dut/ram3/mem
add wave -noupdate -expand -group r4 /class_mem_interface_testbench/dut/ram4/mem
add wave -noupdate -expand -group r5 /class_mem_interface_testbench/dut/ram5/mem
add wave -noupdate -expand -group r6 /class_mem_interface_testbench/dut/ram6/mem
add wave -noupdate -expand -group r7 /class_mem_interface_testbench/dut/ram7/mem
add wave -noupdate -expand -group r8 /class_mem_interface_testbench/dut/ram8/mem
add wave -noupdate -expand -group r9 /class_mem_interface_testbench/dut/ram9/mem
add wave -noupdate -expand -group r10 /class_mem_interface_testbench/dut/ram10/mem
add wave -noupdate -expand -group r11 /class_mem_interface_testbench/dut/ram11/mem
add wave -noupdate -expand -group r12 /class_mem_interface_testbench/dut/ram12/mem
add wave -noupdate -expand -group r13 /class_mem_interface_testbench/dut/ram13/mem
add wave -noupdate -expand -group r14 /class_mem_interface_testbench/dut/ram14/mem
add wave -noupdate -expand -group r15 /class_mem_interface_testbench/dut/ram15/mem
add wave -noupdate /class_mem_interface_testbench/dut/re
add wave -noupdate /class_mem_interface_testbench/dut/read_address
add wave -noupdate /class_mem_interface_testbench/dut/class_out
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
