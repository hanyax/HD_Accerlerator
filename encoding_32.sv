`include "accumulator.sv"

module encoding_32 #(parameter M_SIZE = 32, N_SIZE = 32, FTWIDTH = 8, DIM_WIDTH = 16, Div_SIZE = 512) (out, done, clk, reset, projections, features);
    output logic [M_SIZE-1:0][DIM_WIDTH-1:0] out; 
    output logic done;
    input logic clk, reset;
    input logic [M_SIZE+N_SIZE-1:0] projections;
    input logic [M_SIZE-1:0] [FTWIDTH-1:0] features;

    logic [M_SIZE-1:0][DIM_WIDTH-1:0] in_temp, out_temp;
    shortint count;
    logic temp;
    
    assign in_temp = out_temp;

    genvar i;
    generate
        for (i=0;i<M_SIZE;i++) begin
            mux_accumulator_32 adder_mod (.out(out_temp[i]), .clk, .reset, .features, .projections(projections[i+N_SIZE-1:i]), .prev_result(in_temp[i]));
        end
    endgenerate

    always_ff @(posedge clk) begin
        if (reset) begin
            /*
            for (int i = 0; i < M_SIZE; i++) begin
                out_temp[i] <= 0;
            end */
            done <= 0;
            count <= 0;
        end else begin
            if (done) begin 
                out <= out;
            end else begin
                count <= count + 32;
                //out_temp <= out;
                if (count > Div_SIZE - 32) begin
                    done <= 1;
                    out <= out_temp;
                end 
            end
        end 
    end
endmodule

module encoding_32_testbench;
    logic [31:0] [15:0] out;
    logic [31:0][7:0] features;
    logic [63:0] projections;
    logic clk, done, reset;

    parameter period = 100;

    encoding_32 dut(.out, .done, .clk, .reset, .projections, .features);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; @(posedge clk);
        for (int i = 0; i < 64; i++) begin
            projections[i] <= 1;
        end; 

        for (int i = 0; i < 32; i++) begin
            features[i] <= 1;
        end; @(posedge clk);

        reset <= 0; @(posedge clk);
        repeat (17) begin
            @(posedge clk);
        end

        $stop();
    end 

endmodule
