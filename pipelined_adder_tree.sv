// Fully pipelined adder and fully combinational adder

`include "adder.sv"

module pipelined_adder_tree #(parameter INPUT_WIDTH = 8) (out, clk, inputs, last_in);
    output  logic [INPUT_WIDTH-1:0] out;
    input   logic clk;
    input   logic [15:0][INPUT_WIDTH-1:0] inputs;
    input   logic [INPUT_WIDTH-1:0] last_in;

    logic [7:0][INPUT_WIDTH-1:0]    first_inter, first_store;
    logic [3:0][INPUT_WIDTH-1:0]    second_inter, second_store;
    logic [1:0][INPUT_WIDTH-1:0]    third_inter, third_store;
    logic [INPUT_WIDTH-1:0]         fourth_inter, fourth_store, lastIn_first, lastIn_second, lastIn_third, lastIn_fourth, temp_out;

    genvar i;
    generate
        /*
        for(i=0; i<16; i+=2) begin : first_results
            N_bit_adder #(8) adder (.input1(inputs[i]), .input2(inputs[i+1]), .out(first_inter[i/2]));
        end
        */
        for(i=0; i<16; i+=2) begin : first_results
            N_bit_adder #(8) adder (.input1(inputs[i]), .input2(inputs[i+1]), .out(first_inter[i/2]));
        end
    endgenerate

    generate
        /*
        for(i=0; i<8; i+=2) begin : second_results
            N_bit_adder #(8) adder (.input1(first_store[i]),.input2(first_store[i+1]),.out(second_inter[i/2]));
        end
        */

        for(i=0; i<8; i+=2) begin : second_results
            N_bit_adder #(8) adder (.input1(first_inter[i]),.input2(first_inter[i+1]),.out(second_inter[i/2]));
        end
    endgenerate

    generate
        /*
        for(i=0; i<16; i+=2) begin : third_results
            N_bit_adder #(8) adder (.input1(second_store[i]),.input2(second_store[i+1]),.out(third_inter[i/2]));
        end
        */

        for(i=0; i<16; i+=2) begin : third_results
            N_bit_adder #(8) adder (.input1(second_inter[i]),.input2(second_inter[i+1]),.out(third_inter[i/2]));
        end
    endgenerate

    /*
    N_bit_adder #(8) adder_fourth (.input1(third_store[0]),.input2(third_store[1]),.out(fourth_inter));
    N_bit_adder #(8) adder_final (.input1(fourth_store),.input2(lastIn_fourth),.out(out));
    */

    N_bit_adder #(8) adder_fourth (.input1(third_inter[0]),.input2(third_inter[1]),.out(fourth_inter));
    N_bit_adder #(8) adder_final (.input1(fourth_inter),.input2(last_in),.out(temp_out));

    always_ff @(posedge clk) begin
        /*
        first_store <= first_inter;
        second_store <= second_inter;
        third_store <= third_inter;
        fourth_store <= fourth_inter;

        lastIn_first <= last_in;
        lastIn_second <= lastIn_first;
        lastIn_third <= lastIn_second;
        lastIn_fourth <= lastIn_third;
        */
        out <= temp_out;

    end

endmodule

module pipelined_adder_tree_testbench;
    logic [7:0] out;
    logic [15:0][7:0] inputs;
    logic clk;
    logic [7:0] last_in;

    parameter period = 100;

    pipelined_adder_tree #(8) dut(.out, .clk, .inputs, .last_in(3));

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        inputs[0] <= 0; inputs[1] <= 1; inputs[2] <= 2; inputs[3] <= 3; inputs[4] <= 4; inputs[5] <= 5; inputs[6] <= 6; inputs[7] <= 7; 
        inputs[8] <= 8; inputs[9] <= 9; inputs[10] <= 10; inputs[11] <= 11; inputs[12] <= 12; inputs[13] <= 13; inputs[14] <= 14; inputs[15] <= 15; @(posedge clk); 
        inputs[0] <= 10; inputs[1] <= 10; inputs[2] <= 10; inputs[3] <= 10; inputs[4] <= 10; inputs[5] <= 10; inputs[6] <= 10; inputs[7] <= 10; 
        inputs[8] <= 10; inputs[9] <= 10; inputs[10] <= 10; inputs[11] <= 10; inputs[12] <= 10; inputs[13] <= 10; inputs[14] <= 10; inputs[15] <= 10; @(posedge clk); 
        inputs[0] <= 1; inputs[1] <= 1; inputs[2] <= 1; inputs[3] <= 1; inputs[4] <= 11; inputs[5] <= 11; inputs[6] <= 11; inputs[7] <= 11; 
        inputs[8] <= 1; inputs[9] <= 1; inputs[10] <= 1; inputs[11] <= 1; inputs[12] <= 11; inputs[13] <= 11; inputs[14] <= 11; inputs[15] <= 11; @(posedge clk); 
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop();
    end 


endmodule