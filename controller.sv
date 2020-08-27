`include "encoding_module.sv"

// n is the feature size for each hardware MAC, m is the hyperparam produced by each hardware MAC
module controller #(parameter Dhv_SIZE = 4000, Div_SIZE = 512, N_SIZE = 16, M_SIZE = 16, FTWIDTH = 8) (out_projections, out_features, out_done, out_reset, projections, features, done, clk, reset_in);
    output logic [N_SIZE+M_SIZE-1:0] out_projections; 
    output logic [N_SIZE-1:0][FTWIDTH-1:0] out_features;
    output logic out_done, out_reset;
    input logic [Dhv_SIZE-1:0] projections;
    input logic [Div_SIZE-1:0][FTWIDTH-1:0] features;
    input logic clk, done, reset_in;

    shortint cur_x, cur_y;

    always_ff @(posedge clk) begin
        if (reset_in) begin
            cur_x <= 0;
            cur_y <= 0;
            out_done <= 0;
            out_reset <= 0;

        end else begin
            if (cur_y == 4000 - Div_SIZE && done) begin
                out_done <= 1;
            end else begin
                for (int i=0; i < N_SIZE + M_SIZE; i++) begin
                    out_projections[i] <= projections[cur_x+cur_y+i];
                end
                //out_projections <= projections[cur_x+cur_y+N_SIZE+M_SIZE-1:cur_x+cur_y];
                for (int i=0; i < N_SIZE; i++) begin
                    out_features[i] <= features[cur_x+i];
                end

                cur_x <= cur_x + N_SIZE;

                if (done) begin
                    out_reset <= 1;
                end else begin
                    if (out_reset) begin
                        out_reset <= 0;
                        cur_x <= 0;
                        cur_y <= cur_y + M_SIZE;
                    end else begin
                        cur_x <= cur_x + N_SIZE;
                    end 
                end
            end
        end


    end
endmodule

module controller_testbench;
    logic [31:0] out_projections; 
    logic [15:0][7:0] out_features;
    logic out_done, out_reset;
    logic [3999:0] projections;
    logic [511:0][7:0] features;
    logic clk, done, reset_in;

    parameter period = 100;

    controller dut (.out_projections, .out_features, .out_done, .out_reset, .projections, .features, .done, .clk, .reset_in);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset_in <= 1; done <= 0; @(posedge clk);
        for (int i = 0; i < 4000; i++) begin
            projections[i] <= 1;
        end; 

        for (int i = 0; i < 512; i++) begin
            features[i] <= i;
        end; @(posedge clk);

        reset_in <= 0; @(posedge clk);

        for (int i = 0; i < 252; i++) begin
            repeat (34) begin
                done <= 0;
                @(posedge clk);
            end
            done <= 1;  @(posedge clk);
        end
        $stop();
    end 

endmodule