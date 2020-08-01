`include "accumulator.sv"

module encoding #(parameter HVSIZE = 16, FTSIZE = 16, FTWIDTH = 8, DIM_WIDTH = 16, FTTOTALSIZE = 4000) (out, done, clk, reset, projections, features);
    output logic [HVSIZE-1:0][DIM_WIDTH-1:0] out; 
    output logic done;
    input logic clk, reset;
    input logic [HVSIZE-1:0] projections;
    input logic [FTSIZE-1:0] [FTWIDTH-1:0] features;

    logic [HVSIZE-1:0][DIM_WIDTH-1:0] out_temp;
    logic [HVSIZE-1:0][FTSIZE-1:0] proj_ins;
    shortint count;

    // System Verilog seems to not allow unknown i to be in the range value so for loop have some problem with this
    // hard code for now
    // Push projections array to the left every time to feed into the adders
    always_comb begin
        proj_ins[0] = projections;
        proj_ins[1][15] = projections[0]; proj_ins[1][14:0] = projections[15:1];
        proj_ins[2][15:14] = projections[1:0]; proj_ins[2][13:0] = projections[15:2];
        proj_ins[3][15:13] = projections[2:0]; proj_ins[3][12:0] = projections[15:3];
        proj_ins[4][15:12] = projections[3:0]; proj_ins[4][11:0] = projections[15:4];
        proj_ins[5][15:11] = projections[4:0]; proj_ins[5][10:0] = projections[15:5];
        proj_ins[6][15:10] = projections[5:0]; proj_ins[6][9:0] = projections[15:6];
        proj_ins[7][15:9] = projections[6:0]; proj_ins[7][8:0] = projections[15:7];
        proj_ins[8][15:8] = projections[7:0]; proj_ins[8][7:0] = projections[15:8];
        proj_ins[9][15:7] = projections[8:0]; proj_ins[9][6:0] = projections[15:9];
        proj_ins[10][15:6] = projections[9:0]; proj_ins[10][5:0] = projections[15:10];
        proj_ins[11][15:5] = projections[10:0]; proj_ins[11][4:0] = projections[15:11];
        proj_ins[12][15:4] = projections[11:0]; proj_ins[12][3:0] = projections[15:12];
        proj_ins[13][15:3] = projections[12:0]; proj_ins[13][2:0] = projections[15:13];
        proj_ins[14][15:2] = projections[13:0]; proj_ins[14][1:0] = projections[15:14];
        proj_ins[15][15:1] = projections[14:0]; proj_ins[15][0:0] = projections[15:15];
    end

    genvar i;
    generate
        for (i=0;i<HVSIZE;i++) begin
            mux_accumulator adder_mod (.out(out_temp[i]), .clk, .reset, .features, .projections(proj_ins[i]), .prev_result(out_temp[i]));
        end
    endgenerate

    always_ff @(posedge clk) begin
        if (reset) begin
            for (int i = 0; i < HVSIZE; i++) begin
                out_temp[i] <= 0;
            end
            done <= 0;
            count <= 0;
        end else begin
            count <= count + FTSIZE;
            if (count > FTTOTALSIZE) begin
                done <= 1;
                out <= out_temp;
            end
            if (done) begin 
                out <= out;
            end
        end 

    end

endmodule

module encoding_testbench;
    logic [15:0] [15:0] out;
    logic [15:0][7:0] features;
    logic [15:0] projections;
    logic clk, done, reset;

    parameter period = 100;

    encoding dut(.out, .done, .clk, .reset, .projections, .features);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; @(posedge clk);
        reset <= 0; @(posedge clk);
        for (int i = 0; i < 16; i++) begin
            projections[i] <= 1;
        end; 

        for (int i = 0; i < 16; i++) begin
            features[i] <= 1;
        end; @(posedge clk);
        
        repeat (251) begin
            @(posedge clk);
        end

        $stop();
    end 

endmodule
