`include "memory_double.sv"

module projection_mem_interface #(parameter Dhv_SIZE = 4000, IN_WIDTH = 16, ADDR_WIDTH = 8) (clk, reset, proj_ins, read_address0, read_address1, we, re, out0, out1, write_done); 
    input logic [1:0][IN_WIDTH-1:0] proj_ins;
    input logic [ADDR_WIDTH-1:0]  read_address0, read_address1;
    input logic clk, reset, we, re;

    output logic write_done;
    output logic [IN_WIDTH-1:0] out0, out1;
    shortint write_address, address_0_in, address_1_in;

    memory_double ram (.clk, .address_0(address_0_in), .data_0_in(proj_ins[0]), .data_0_out(out0), .cs_0(1'b1), .we_0(we & (!write_done)), .oe_0(re), 
    .address_1(address_1_in), .data_1_in(proj_ins[1]), .data_1_out(out1), .cs_1(1'b1), .we_1(we & (!write_done)), .oe_1(re)); 

    always_comb begin
        if (we & !write_done) begin
            address_0_in = write_address;
            address_1_in = write_address + 1;
        end else begin
            address_0_in = read_address0;
            address_1_in = read_address1;
        end 
    end

    always_ff @(posedge clk) begin 
        if (reset) begin
            write_done <= 0;
            write_address <= 0;
        end else begin
            if (we) begin
                if (write_address >= (Dhv_SIZE/IN_WIDTH)-2) begin 
                    write_done <= 1;
                end else begin 
                    write_address <= write_address + 2;
                end
            end 
        end
    end
    
endmodule

module projection_mem_interface_testbench; 
    logic [1:0][15:0] proj_ins;
    logic [7:0]  read_address0, read_address1;
    logic [15:0] out0, out1;
    logic clk, reset, write_done, we, re;

    parameter period = 100;

    projection_mem_interface dut (.clk, .reset, .proj_ins, .read_address0, .read_address1, .we, .re, .out0, .out1, .write_done); 

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; @(posedge clk);

        for (int i = 0; i < 250; i+=2) begin
            reset <= 0; we <= 1; proj_ins[0] <= i; proj_ins[1] <= i+1;  @(posedge clk);
        end; 

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        we <= 0; re <= 1; @(posedge clk);

        for (int i = 0; i < 130; i+=2) begin
            read_address0 <= i;  read_address1 <= i + 1; @(posedge clk);
        end; 

        $stop();
    end
    
endmodule