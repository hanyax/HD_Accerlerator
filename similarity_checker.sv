`include "memory_single.sv"
`include "memory_dual_port.sv"

module similarity_checker #(parameter Dhv_SIZE = 4000, M_SIZE = 16, DIM_WIDTH = 16, FTWIDTH = 8, CLASS_NUM = 26) (encode_vector_in, class_in, coeffs_in, clk, reset, cur_encode_done, read_class_done, we, max_val, max_index, done);
    input logic [M_SIZE-1:0][DIM_WIDTH-1:0] encode_vector_in;
    input logic [M_SIZE-1:0][FTWIDTH-1:0] class_in;
    input logic [DIM_WIDTH-1:0] coeffs_in;
    input logic clk, reset, cur_encode_done, read_class_done, we;
    output logic [15:0] max_val;
    output logic [15:0] max_index;
    output logic done;
    
    logic [4:0] coeffs_addr;
    logic [DIM_WIDTH-1:0] coeff_data_in, coeff_data_out;
    logic coeff_we;
    memory_single #(.data_0_WIDTH(16), .ADDR_WIDTH(5)) coeffs_mem (.clk, .address(coeffs_addr), .data_in(coeff_data_in), .data_out(coeff_data_out), .we(coeff_we)); 

    logic enble_write;
    logic [4:0] read_addr, write_addr;
    logic [DIM_WIDTH-1:0] write_data, read_data, data_1_out_holder;
    memory_dual_port result_mem (.address_0(read_addr), .data_0_in(16'b0), .data_0_out(read_data), .we_0(1'b0), .oe_0(1'b1), .address_1(write_addr), .data_1_in(write_data), .data_1_out(data_1_out_holder), .we_1(enble_write), .oe_1(1'b0)); 

    shortint j, k, max_index_temp;

    logic [DIM_WIDTH-1:0] max;
    logic [DIM_WIDTH-1:0] result_temp;

    logic encode_start;
    assign max_val = max;
    assign max_index = max_index_temp;

    always_ff @(posedge clk) begin
        if (reset) begin
            coeff_we <= 1;
            coeffs_addr <= 5'b0;
            coeff_data_in <= coeffs_in;
            encode_start <= 0;
            enble_write <= 1;
            j <= 0;
            k <= 0;
            done <= 0;
            max <= 0;
            max_index_temp <= 0;
        end else begin
            if (k < 32 & we) begin
                coeff_we <= 1;
                coeffs_addr <= k;
                write_addr <= k;
                coeff_data_in <= coeffs_in;
                write_data <= 0;
                k <= k+1;
            end else begin
                coeffs_addr <= 0;
                coeff_we <= 0;
            end

            if (!read_class_done) begin
                if (encode_start == 0) begin
                    if (cur_encode_done) begin
                        encode_start <= 1;
                    end
                end else if (cur_encode_done) begin
                    read_addr <= 0;
                    enble_write <= 0;
                end else begin                    
                    if (read_addr < 32) begin
                        write_data <= read_data + (class_in[0] * encode_vector_in[0]) + 
                        (class_in[1] * encode_vector_in[1]) + 
                        (class_in[2] * encode_vector_in[2]) + 
                        (class_in[3] * encode_vector_in[3]) + 
                        (class_in[4] * encode_vector_in[4]) + 
                        (class_in[5] * encode_vector_in[5]) + 
                        (class_in[6] * encode_vector_in[6]) + 
                        (class_in[7] * encode_vector_in[7]) + 
                        (class_in[8] * encode_vector_in[8]) + 
                        (class_in[9] * encode_vector_in[9]) + 
                        (class_in[10] * encode_vector_in[10]) + 
                        (class_in[11] * encode_vector_in[11]) + 
                        (class_in[12] * encode_vector_in[12]) + 
                        (class_in[13] * encode_vector_in[13]) + 
                        (class_in[14] * encode_vector_in[14]) + 
                        (class_in[15] * encode_vector_in[15]);

                        if (read_addr == 0) begin
                            enble_write <= 1'b1;
                        end

                        write_addr <= read_addr;
                        read_addr <= read_addr + 1;
                    end else begin
                    end
                end
            end else begin
                
                if (j == 0) begin
                    max <= coeff_data_out;
                    read_addr <= j;
                    coeffs_addr <= j;
                    j <= j+1;
                end else begin
                    if (j > 31) begin
                        read_addr <= 0;
                        coeffs_addr <= 0;
                        done <= 1;
                    end else begin
                        read_addr <= j;
                        coeffs_addr <= j;
                        if ((read_data * coeff_data_out) > max) begin
                            max <= (read_data * coeff_data_out);
                            max_index_temp <= j;
                        end
                        j <= j+1;
                    end
                end
                 
            end 
        end
    end
endmodule

module similarity_checker_testbench;
    logic [15:0][15:0] encode_vector_in;
    logic [15:0][7:0] class_in;
    logic [15:0] coeffs_in;
    logic clk, reset, cur_encode_done, read_class_done, done, we;
    logic [15:0] max_val;
    logic [15:0] max_index;

    similarity_checker dut (.encode_vector_in, .class_in, .coeffs_in, .clk, .reset, .cur_encode_done, .read_class_done, .we, .max_val, .max_index, .done); 

    parameter period = 100;
    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1;  read_class_done <= 0; @(posedge clk);
        
        for (int i = 0; i < 27; i+=1) begin
            reset <= 0; we <= 1; cur_encode_done <= 0; coeffs_in <= 1; @(posedge clk);
        end;  
        
        cur_encode_done <= 1; @(posedge clk); @(posedge clk);
        cur_encode_done <= 0;

        for (int i = 0; i < 16; i++) begin
           encode_vector_in[i] <= i; 
           class_in[i] <= 1;
        end @(posedge clk);

        for (int j = 1; j < 26; j++) begin
            for (int i = 0; i < 16; i++) begin
                class_in[i] <= j;
            end;  @(posedge clk);
        end 
        @(posedge clk);
        
        read_class_done <= 1; @(posedge clk);
        repeat (30) begin
            @(posedge clk);
        end 

        $stop();
    end 

endmodule