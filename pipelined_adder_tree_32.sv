// Fully pipelined adder and fully combinational adder

`include "adder.sv"

module pipelined_adder_tree_32 #(parameter INPUT_WIDTH = 8, DIM_WIDTH = 16, FTSIZE = 32) (out, clk, reset, inputs, last_in);
    output  logic [DIM_WIDTH-1:0] out;
    input   logic clk, reset;
    input   logic [FTSIZE-1:0][INPUT_WIDTH-1:0] inputs;
    input   logic [DIM_WIDTH-1:0] last_in;

    logic [15:0][DIM_WIDTH-1:0]    first_inter, first_store;
    logic [7:0][DIM_WIDTH-1:0]    second_inter, second_store;
    logic [3:0][DIM_WIDTH-1:0]    third_inter, third_store;
    logic [1:0][DIM_WIDTH-1:0]    fourth_inter, fourth_store;
    logic [DIM_WIDTH-1:0]         fifth_inter, fifth_store, lastIn_first, lastIn_second, lastIn_third, lastIn_fourth, temp_out;

    genvar i;
    generate
        /*
        for(i=0; i<16; i+=2) begin : first_results
            N_bit_adder #(16) adder (.input1(DIM_WIDTH'(inputs[i]), .input1(DIM_WIDTH'(inputs[i+1])), .out(first_inter[i/2]));
        end
        */
        for(i=0; i<32; i+=2) begin : first_results
            N_bit_adder #(16) adder_first (.input1({ {8{inputs[i][INPUT_WIDTH-1]}}, inputs[i] }), .input2({ {8{inputs[i+1][INPUT_WIDTH-1]}}, inputs[i+1] }), .out(first_inter[i/2]));
        end
    endgenerate

    generate
        /*
        for(i=0; i<8; i+=2) begin : second_results
            N_bit_adder #(16) adder (.input1(first_store[i]),.input2(first_store[i+1]),.out(second_inter[i/2]));
        end
        */

        for(i=0; i<16; i+=2) begin : second_results
            N_bit_adder #(16) adder (.input1(first_inter[i]),.input2(first_inter[i+1]),.out(second_inter[i/2]));
        end
    endgenerate

    generate
        /*
        for(i=0; i<16; i+=2) begin : third_results
            N_bit_adder #(16) adder (.input1(second_store[i]),.input2(second_store[i+1]),.out(third_inter[i/2]));
        end
        */

        for(i=0; i<8; i+=2) begin : third_results
            N_bit_adder #(16) adder (.input1(second_inter[i]),.input2(second_inter[i+1]),.out(third_inter[i/2]));
        end
    endgenerate

    generate

        for(i=0; i<4; i+=2) begin : fourth_results
            N_bit_adder #(16) adder (.input1(third_inter[i]),.input2(third_inter[i+1]),.out(fourth_inter[i/2]));
        end
    endgenerate

    /*
    N_bit_adder #(16) adder_fourth (.input1(third_store[0]),.input2(third_store[1]),.out(fourth_inter));
    N_bit_adder #(16) adder_final (.input1(fourth_store),.input2(lastIn_fourth),.out(out));
    */

    N_bit_adder #(16) adder_fourth (.input1(fourth_inter[0]),.input2(fourth_inter[1]),.out(fifth_inter));
    N_bit_adder #(16) adder_final (.input1(fifth_inter),.input2(last_in),.out(temp_out));

    always_ff @(posedge clk) begin
        /*
        if (reset) begin
            temp_out <= DIM_WIDTH'('b0);
        end
        
        first_store <= first_inter;
        second_store <= second_inter;
        third_store <= third_inter;
        fourth_store <= fourth_inter;

        lastIn_first <= last_in;
        lastIn_second <= lastIn_first;
        lastIn_third <= lastIn_second;
        lastIn_fourth <= lastIn_third;
        */

        if (reset) begin
            out <= 0;
        end else begin
            out <= temp_out;
        end 

    end

endmodule

module pipelined_adder_tree_32_testbench;
    logic [15:0] out;
    logic [31:0][7:0] inputs;
    logic clk, reset;
    logic [15:0] last_in;

    parameter period = 100;

    pipelined_adder_tree_32 dut(.out, .clk, .reset, .inputs, .last_in(3));

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1;  @(posedge clk); 
        reset <= 0;  @(posedge clk); 
        /*
        inputs[0] <= 0; inputs[1] <= 1; inputs[2] <= 2; inputs[3] <= 3; inputs[4] <= 4; inputs[5] <= 5; inputs[6] <= 6; inputs[7] <= 7; 
        inputs[8] <= 8; inputs[9] <= 9; inputs[10] <= 10; inputs[11] <= 11; inputs[12] <= 12; inputs[13] <= 13; inputs[14] <= 14; inputs[15] <= 15; @(posedge clk); 

        inputs[0] <= 10; inputs[1] <= 10; inputs[2] <= 10; inputs[3] <= 10; inputs[4] <= 10; inputs[5] <= 10; inputs[6] <= 10; inputs[7] <= 10; 
        inputs[8] <= 10; inputs[9] <= 10; inputs[10] <= 10; inputs[11] <= 10; inputs[12] <= 10; inputs[13] <= 10; inputs[14] <= 10; inputs[15] <= 10; @(posedge clk); 
        */

        inputs[0] <= -1; inputs[1] <= -1; inputs[2] <= -1; inputs[3] <= -1; inputs[4] <= 1; inputs[5] <= 1; inputs[6] <= 1; inputs[7] <= 1; 
        inputs[8] <= -1; inputs[9] <= -1; inputs[10] <= -1; inputs[11] <= -1; inputs[12] <= 1; inputs[13] <= 1; inputs[14] <= 1; inputs[15] <= 1; 
        inputs[16] <= -1; inputs[17] <= -1; inputs[18] <= -1; inputs[19] <= -1; inputs[20] <= 1; inputs[21] <= 1; inputs[22] <= 1; inputs[23] <= 1; 
        inputs[24] <= -1; inputs[25] <= -1; inputs[26] <= -1; inputs[27] <= -1; inputs[28] <= 1; inputs[29] <= 1; inputs[30] <= 1; inputs[31] <= 1; @(posedge clk); 
        
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop();
    end 


endmodule