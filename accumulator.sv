`include "pipelined_adder_tree.sv"

module accumulator #(parameter INPUT_NUM=16; parameter RESULT_WIDTH=8) ();
    output  [RESULT_WIDTH-1:0] out;
    input   clk;
    input   [INPUT_NUM-1:0] in;
    input   [RESULT_WIDTH-1:0] prev_result;

    // implement a tree adder
    


endmodule