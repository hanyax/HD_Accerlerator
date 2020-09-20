`include "two_to_one_mux.sv"
`include "pipelined_adder_tree_64.sv"

module mux_accumulator_64 #(parameter INPUT_NUM = 64, INPUT_WIDTH = 8,  DIM_WIDTH = 16) (out, clk, reset, features, projections, prev_result);
    output  [DIM_WIDTH-1:0] out;
    input   clk, reset;
    input   [INPUT_NUM-1:0][INPUT_WIDTH-1:0] features;
    input   [INPUT_NUM-1:0] projections;
    input   [DIM_WIDTH-1:0] prev_result;

    logic   [INPUT_NUM-1:0][INPUT_WIDTH-1:0] selected_features;

    // implement a tree adder
    genvar i;
    generate
        for (i=0;i<INPUT_NUM;i++) begin: muxes
            mux_two_one mux(.out(selected_features[i]), .in0(-features[i]), .in1(features[i]), .sel(projections[i]));
        end
    endgenerate

    pipelined_adder_tree_64 adder (.out, .clk, .reset, .inputs(selected_features), .last_in(prev_result));

endmodule


module mux_accumulator_64_testbench;
    logic [15:0] out;
    logic [63:0][7:0] features;
    logic [63:0] projections;
    logic clk, reset;
    logic [15:0] prev_result;

    parameter period = 100;

    mux_accumulator_64 dut(.out, .clk, .reset, .features, .projections, .prev_result(3));

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1;  @(posedge clk); 
        reset <= 0;  @(posedge clk); 

        for (int i = 0; i < 64;i++) begin 
            features[i] <= i;
            projections[i] <= 1;
        end;  @(posedge clk);
        @(posedge clk);

        for (int i = 0; i < 64;i++) begin 
            features[i] <= 10;
            projections[i] <= 1;
        end;  @(posedge clk);
        @(posedge clk);

        for (int i = 0; i < 64;i++) begin 
            features[i] <= 10;
            if (i < 16) begin
                projections[i] <= 0;
            end else begin
                projections[i] <= 1;
            end
        end;  @(posedge clk);
        @(posedge clk);

        $stop();
    end 


endmodule