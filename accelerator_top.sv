`include "encoding_module.sv"
`include "controller.sv"

module accelerator_top #(parameter Dhv_SIZE = 4000, Div_SIZE = 512, N_SIZE = 16, M_SIZE = 16, DIM_WIDTH = 16, FTWIDTH = 8) (clk, reset, projections, features);
    input logic [Dhv_SIZE-1:0] projections;
    input logic [Div_SIZE-1:0][FTWIDTH-1:0] features;
    input logic clk, reset;

    logic [N_SIZE+M_SIZE-1:0] cur_projections; 
    logic [N_SIZE-1:0][FTWIDTH-1:0] cur_features;
    logic [M_SIZE-1:0][DIM_WIDTH-1:0] out; 
    
    logic reset_mac;
    logic encoding_done, mac_done;

    controller controll (.out_projections(cur_projections), .out_features(cur_features), .out_done(encoding_done), .out_reset(reset_mac), .projections, .features, .done(mac_done), .clk, .reset_in(reset));
    encoding mac (.out, .done(mac_done), .clk, .reset(reset_mac || reset), .projections(cur_projections), .features(cur_features));

endmodule 


module accelerator_top_testbench;
    logic [3999:0] projections;
    logic [511:0][7:0] features;
    logic clk, reset;

    parameter period = 100;

    accelerator_top dut (clk, reset, projections, features);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; @(posedge clk);
        for (int i = 0; i < 4000; i++) begin
            projections[i] <= 1;
        end; 

        for (int i = 0; i < 512; i++) begin
            features[i] <= 1;
        end; @(posedge clk);

        reset <= 0; @(posedge clk);

        repeat (4000) begin
            @(posedge clk);
        end

        $stop();
    end 

endmodule