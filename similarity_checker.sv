module similarity_checker #(parameter Dhv_SIZE = 4000, M_SIZE = 16, DIM_WIDTH = 16, FTWIDTH = 8, CLASS_NUM = 26)(encode_vector_in, class_in, coeffs_in, clk, reset, cur_encode_done, read_class_done, we, max_val, max_index, done);
    input logic [M_SIZE-1:0][DIM_WIDTH-1:0] encode_vector_in;
    input logic [M_SIZE-1:0][FTWIDTH-1:0] class_in;
    input logic [DIM_WIDTH-1:0] coeffs_in;
    input logic clk, reset, cur_encode_done, read_class_done, we;
    output logic [15:0] max_val;
    output logic [15:0] max_index;
    output logic done;

    logic [25:0][DIM_WIDTH-1:0] results;
    logic [25:0][DIM_WIDTH-1:0] coeffs;
    shortint i, j, k, max_index_temp;

    logic [DIM_WIDTH-1:0] max;
    logic [DIM_WIDTH-1:0] result_temp;
    logic encode_start;
    assign max_val = max;
    assign max_index = max_index_temp;

    always_ff @(posedge clk) begin
        if (reset) begin
            encode_start <= 0;
            i <= 0;
            j <= 0;
            k <= 0;
            done <= 0;
            max <= 0;
            max_index_temp <= 0;
            results[0] <= 0; results[1] <= 0; results[2] <= 0; results[3] <= 0; results[4] <= 0; results[5] <= 0; results[6] <= 0; results[7] <= 0; results[8] <= 0; results[9] <= 0; results[10] <= 0; results[11] <= 0; results[12] <= 0; 
            results[13] <= 0; results[14] <= 0; results[15] <= 0; results[16] <= 0; results[17] <= 0; results[18] <= 0; results[19] <= 0; results[20] <= 0; results[21] <= 0; results[22] <= 0; results[23] <= 0; results[24] <= 0; results[25] <= 0; 
        end else begin
            if (k < 26 & we) begin
                coeffs[k] <= coeffs_in;
                k <= k+1;
            end

            if (!read_class_done) begin
                if (encode_start == 0) begin
                    if (cur_encode_done) begin
                        encode_start <= 1;
                    end
                end else if (cur_encode_done) begin
                    i <= 0;
                end else begin                    
                    if (i < 26) begin
                        results[i] <= results[i] + (class_in[0] * encode_vector_in[0]) + 
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
                        i<=i+1;
                    end  
                end
            end else begin
                if (j == 0) begin
                    max <= results[0];
                    j <= j+1;
                end else begin
                    if (j > 25) begin
                        done <= 1;
                    end else begin
                        //result_temp = results[j] * coeffs[j];
                        if ((results[j] * coeffs[j]) > max) begin
                            max <= (results[j] * coeffs[j]);
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
