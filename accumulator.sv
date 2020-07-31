`include "two_to_one_mux.sv"
`include "pipelined_adder_tree.sv"

module mux_accumulator #(parameter INPUT_NUM=16, parameter INPUT_WIDTH=8) (out, clk, features, projections, prev_result);
    output  [INPUT_WIDTH-1:0] out;
    input   clk;
    input   [INPUT_NUM-1:0][INPUT_WIDTH-1:0] features;
    input   [INPUT_NUM-1:0] projections;
    input   [INPUT_WIDTH-1:0] prev_result;

    logic   [INPUT_NUM-1:0][INPUT_WIDTH-1:0] selected_features;

    // implement a tree adder
    genvar i;
    generate
        for (i=0;i<INPUT_NUM;i++) begin: muxes
            mux_two_one mux(.out(selected_features[i]), .in0(-features[i]), .in1(features[i]), .sel(projections[i]));
        end
    endgenerate

    pipelined_adder_tree adder (.out, .clk, .inputs(selected_features), .last_in(prev_result));

endmodule


module mux_accumulator_testbench;
    logic [7:0] out;
    logic [15:0][7:0] features;
    logic [15:0] projections;
    logic clk;
    logic [7:0] prev_result;

    parameter period = 100;

    mux_accumulator dut(.out, .clk, .features, .projections, .prev_result(3));

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        for (int i = 0; i < 16;i++) begin 
            features[i] <= i;
            projections[i] <= 1;
        end;  @(posedge clk);
        @(posedge clk);

        for (int i = 0; i < 16;i++) begin 
            features[i] <= 10;
            projections[i] <= 1;
        end;  @(posedge clk);
        @(posedge clk);

        for (int i = 0; i < 16;i++) begin 
            features[i] <= 10;
            if (i < 8) begin
                projections[i] <= 0;
            end else begin
                projections[i] <= 1;
            end
        end;  @(posedge clk);
        @(posedge clk);



        $stop();
    end 


endmodule