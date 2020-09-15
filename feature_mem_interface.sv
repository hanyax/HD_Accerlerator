`include "memory_single.sv"

module feature_mem_interface #(Div_SIZE = 512, INOUT_WIDTH = 32, ADDR_WIDTH = 8) (clk, reset, feature_in, read_address, we, re, out0, out1, out2, out3, write_done); 
    input logic [INOUT_WIDTH-1:0] feature_in;
    input logic [ADDR_WIDTH-1:0] read_address;
    input logic clk, reset, we, re;

    output logic write_done;
    output logic [INOUT_WIDTH-1:0] out0, out1, out2, out3;

    shortint write_address, address_in, total_count_write;
    logic we0, we1, we2, we3;
    logic [1:0] i;

    memory_single ram0 (.clk, .address_0(address_in), .data_0_in(feature_in), .data_0_out(out0), .cs_0(1'b1), .we_0(we0 & we & !write_done), .oe_0(re)); 
    memory_single ram1 (.clk, .address_0(address_in), .data_0_in(feature_in), .data_0_out(out1), .cs_0(1'b1), .we_0(we1 & we & !write_done), .oe_0(re)); 
    memory_single ram2 (.clk, .address_0(address_in), .data_0_in(feature_in), .data_0_out(out2), .cs_0(1'b1), .we_0(we2 & we & !write_done), .oe_0(re)); 
    memory_single ram3 (.clk, .address_0(address_in), .data_0_in(feature_in), .data_0_out(out3), .cs_0(1'b1), .we_0(we3 & we & !write_done), .oe_0(re)); 

    always_comb begin
        if (we & !write_done) begin
            address_in = write_address;
        end else begin
            address_in = read_address;
        end
    end

    always_ff @(posedge clk) begin 
        if (reset) begin
            total_count_write <= 0;
            write_done <= 0;
            write_address <= -1;
            we0 <= 0; we1 <= 0; we2 <= 0; we3 <= 0;
            i <= 2'b00;
        end else if (we & !write_done) begin
            if (i == 2'b00) begin
                write_address <= write_address + 1;
                we0 <= 1;
                we3 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 2'b01;
            end else if (i == 2'b01) begin
                we1 <= 1;
                we0 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 2'b10;
            end else if (i == 2'b10) begin 
                we2 <= 1;
                we1 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 2'b11;
            end else if (i == 2'b11) begin
                we3 <= 1;
                we2 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 2'b00;
            end
        end 

        if (total_count_write >= Div_SIZE) begin
            write_done <= 1;
        end

    end
    
endmodule

module feature_mem_interface_testbench; 
    logic [31:0] feature_in;
    logic [7:0] read_address;
    logic [31:0] out0, out1, out2, out3;
    logic clk, reset, write_done, we, re;

    parameter period = 100;

    feature_mem_interface dut (.clk, .reset, .feature_in, .read_address, .we, .re, .out0, .out1, .out2, .out3, .write_done); 

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; re <= 0; @(posedge clk); 
        reset <= 0; we <= 1; @(posedge clk);

        for (int i = 0; i < 513; i++) begin
            feature_in <= i; @(posedge clk);
        end; 

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        we <= 0; re <= 1; @(posedge clk);

        for (int i = 0; i < 129; i++) begin
            read_address <= i; @(posedge clk);
        end; 

        $stop();
    end
    
endmodule