`include "memory_single.sv"

module class_mem_interface #(Div_SIZE = 512, FTWIDTH = 8, M_SIZE = 16, ADDR_WIDTH = 13) (clk, reset, class_in, read_address, we, re, class_num, class_out, write_done); 
    input logic [FTWIDTH-1:0] class_in;
    input logic [ADDR_WIDTH-1:0] read_address;
    input logic clk, reset, we, re;
    input logic [4:0] class_num;
 
    output logic write_done;
    output logic [M_SIZE - 1:0][FTWIDTH-1:0] class_out;

    shortint write_address;
    int address_in;
    int total_count_write;
    logic we0, we1, we2, we3, we4, we5, we6, we7, we8, we9, we10, we11, we12, we13, we14, we15;
    logic [3:0] i;

    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram0 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[0]), .cs_0(1'b1), .we_0(we0 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram1 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[1]), .cs_0(1'b1), .we_0(we1 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram2 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[2]), .cs_0(1'b1), .we_0(we2 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram3 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[3]), .cs_0(1'b1), .we_0(we3 & we & !write_done), .oe_0(re));
    
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram4 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[4]), .cs_0(1'b1), .we_0(we4 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram5 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[5]), .cs_0(1'b1), .we_0(we5 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram6 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[6]), .cs_0(1'b1), .we_0(we6 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram7 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[7]), .cs_0(1'b1), .we_0(we7 & we & !write_done), .oe_0(re)); 

    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram8 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[8]), .cs_0(1'b1), .we_0(we8 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram9 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[9]), .cs_0(1'b1), .we_0(we9 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram10 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[10]), .cs_0(1'b1), .we_0(we10 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram11 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[11]), .cs_0(1'b1), .we_0(we11 & we & !write_done), .oe_0(re)); 
    
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram12 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[12]), .cs_0(1'b1), .we_0(we12 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram13 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[13]), .cs_0(1'b1), .we_0(we13 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram14 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[14]), .cs_0(1'b1), .we_0(we14 & we & !write_done), .oe_0(re)); 
    memory_single #(.data_0_WIDTH(FTWIDTH), .ADDR_WIDTH(11)) ram15 (.clk, .address_0(address_in), .data_0_in(class_in), .data_0_out(class_out[15]), .cs_0(1'b1), .we_0(we15 & we & !write_done), .oe_0(re)); 

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
            we0 <= 0; we1 <= 0; we2 <= 0; we3 <= 0; we4 <= 0; we5 <= 0; we6 <= 0; we7 <= 0; we8 <= 0; we9 <= 0; we10 <= 0; we11 <= 0; we12 <= 0; we13 <= 0; we14 <= 0; we15 <= 0;
            i <= 4'b0000;
        end else if (we & !write_done) begin
            if (i == 4'b0000) begin
                write_address <= write_address + 1;
                we0 <= 1;
                we15 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0001;
            end else if (i == 4'b0001) begin
                we1 <= 1;
                we0 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0010;
            end else if (i == 4'b0010) begin 
                we2 <= 1;
                we1 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0011;
            end else if (i == 4'b0011) begin
                we3 <= 1;
                we2 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0100;
            end else if (i == 4'b0100) begin
                we4 <= 1;
                we3 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0101;
            end else if (i == 4'b0101) begin
                we5 <= 1;
                we4 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0110;
            end else if (i == 4'b0110) begin
                we6 <= 1;
                we5 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0111;
            end else if (i == 4'b0111) begin
                we7 <= 1;
                we6 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1000;
            end else if (i == 4'b1000) begin
                we8 <= 1;
                we7 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1001;
            end else if (i == 4'b1001) begin
                we9 <= 1;
                we8 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1010;
            end else if (i == 4'b1010) begin
                we10 <= 1;
                we9 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1011;
            end else if (i == 4'b1011) begin
                we11 <= 1;
                we10 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1100;
            end else if (i == 4'b1100) begin
                we12 <= 1;
                we11 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1101;
            end else if (i == 4'b1101) begin
                we13 <= 1;
                we12 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1110;
            end else if (i == 4'b1110) begin
                we14 <= 1;
                we13 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b1111;
            end else if (i == 4'b1111) begin
                we15 <= 1;
                we14 <= 0;
                total_count_write <= total_count_write + 1;
                i <= 4'b0000;
            end
        end

        if (total_count_write >= 104000) begin // 4000 * 26
            write_done <= 1;
        end
    end
    
endmodule

module class_mem_interface_testbench; 
    logic [7:0] class_in;
    logic [12:0] read_address;
    logic [15:0][7:0] class_out;
    logic clk, reset, write_done, we, re;

    parameter period = 100;

    class_mem_interface dut (.clk, .reset, .class_in, .read_address, .we, .re, .class_num(26), .class_out, .write_done); 

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; re <= 0; @(posedge clk); 
        reset <= 0; we <= 1; @(posedge clk);

        for (int i = 0; i < 104000; i++) begin
            class_in <= 1; @(posedge clk);
        end; 

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        we <= 0; re <= 1; @(posedge clk);

        for (int i = 0; i < 6500; i++) begin
            read_address <= i; @(posedge clk);
        end; 

        $stop();
    end
    
endmodule