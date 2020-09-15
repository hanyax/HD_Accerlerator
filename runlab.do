# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./adder.sv"
vlog "./pipelined_adder_tree.sv"
vlog "./accumulator.sv"
vlog "./encoding_module.sv"
vlog "./encoding_controller.sv"
vlog "./memory_single.sv"
vlog "./memory_double.sv"
vlog "./projection_mem_interface.sv"
vlog "./feature_mem_interface.sv"
vlog "./class_mem_interface.sv"
vlog "./accelerator_top.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.

#vsim -voptargs="+acc" -t 1ps -lib work N_bit_adder_testbench
#vsim -voptargs="+acc" -t 1ps -lib work pipelined_adder_tree_testbench
#vsim -voptargs="+acc" -t 1ps -lib work mux_accumulator_testbench
#vsim -voptargs="+acc" -t 1ps -lib work encoding_testbench
#vsim -voptargs="+acc" -t 1ps -lib work controller_testbench
#vsim -voptargs="+acc" -t 1ps -lib work projection_mem_interface_testbench
#vsim -voptargs="+acc" -t 1ps -lib work feature_mem_interface_testbench
#vsim -voptargs="+acc" -t 1ps -lib work class_mem_interface_testbench
vsim -voptargs="+acc" -t 1ps -lib work accelerator_top_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.

#do N_bit_adder_wave.do
#do pipelined_adder_tree_wave.do
#do mux_accumulator_wave.do
#do encoding_wave.do
#do controller_wave.do
#do projection_mem_interface_wave.do
#do feature_mem_interface_wave.do
#do class_mem_interface_wave.do
do accelerator_top_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
