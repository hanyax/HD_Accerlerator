// n is the feature size for each hardware MAC, m is the hyperparam produced by each hardware MAC
module encoding_controller #(parameter Dhv_SIZE = 4000, Div_SIZE = 512, PROJ_ADDR_WIDTH = 8, PROJ_OUT_WIDTH = 16, FEA_ADDR_WIDTH = 8) (projection_addrs, feature_addrs, out_done, out_reset, cur_encode_done, clk, reset_in, write_data_done);
    
    output logic [1:0][PROJ_ADDR_WIDTH-1:0] projection_addrs; 
    output logic [FEA_ADDR_WIDTH-1:0] feature_addrs;
    output logic out_done, out_reset;
    input logic clk, cur_encode_done, reset_in, write_data_done;

    shortint encoding_cycle_count;

    // 4000 projections
    shortint vertical_projection_mem_loc, horizontal_projection_mem_loc, max_horizontal_projection_mem_loc, bound, addr_after_bound;

    // 512 features
    shortint cur_feature_addr;
    
    assign max_horizontal_projection_mem_loc =  30;

    always_comb begin
        // For Projection
        projection_addrs[0] = 0;
        projection_addrs[1] = 0;
        if (vertical_projection_mem_loc < 219) begin
            projection_addrs[0] = vertical_projection_mem_loc + horizontal_projection_mem_loc;
            projection_addrs[1] = vertical_projection_mem_loc + horizontal_projection_mem_loc + 1;
        end else begin
            if (horizontal_projection_mem_loc + 1 < bound) begin            
                projection_addrs[0] = vertical_projection_mem_loc + horizontal_projection_mem_loc;
                projection_addrs[1] = vertical_projection_mem_loc + horizontal_projection_mem_loc + 1;
            end else if (horizontal_projection_mem_loc + 1 == bound) begin
                projection_addrs[0] = vertical_projection_mem_loc + horizontal_projection_mem_loc;
                projection_addrs[1] = 0;
            end else if (horizontal_projection_mem_loc >= bound) begin
                projection_addrs[0] = addr_after_bound;
                projection_addrs[1] = addr_after_bound + 1;        
            end 
        end

        // For Featrue
        feature_addrs = cur_feature_addr;
    end

    always_ff @(posedge clk) begin
        if (reset_in | !write_data_done) begin
            out_done <= 0;
            out_reset <= 1;
            encoding_cycle_count <= 0;

            // For Projection
            vertical_projection_mem_loc <= 0; 
            horizontal_projection_mem_loc <= 0;
            bound <= 31;
            addr_after_bound <= 0;

            // For Feature
            cur_feature_addr <= 0;
        end else begin
            if (cur_encode_done) begin
                out_reset <= 1;
                encoding_cycle_count <= -1;
            end else begin
                out_reset <= 0;
                if (encoding_cycle_count < 15) begin
                    if (write_data_done) begin
                        // Projection control
                        if (vertical_projection_mem_loc < 219) begin // = (Dhv_SIZE-Div_SIZE+PROJ_OUT_WIDTH)/PROJ_OUT_WIDTH
                            if (horizontal_projection_mem_loc < max_horizontal_projection_mem_loc) begin
                                horizontal_projection_mem_loc <= horizontal_projection_mem_loc + 2;
                            end else begin
                                horizontal_projection_mem_loc <= 0;
                                vertical_projection_mem_loc <= vertical_projection_mem_loc + 1;
                            end
                        end else begin
                            if (vertical_projection_mem_loc == 250) begin // 4000/16
                                out_done <= 1;
                            end else begin
                                if (horizontal_projection_mem_loc < max_horizontal_projection_mem_loc) begin
                                    if (horizontal_projection_mem_loc >= bound && horizontal_projection_mem_loc < max_horizontal_projection_mem_loc) begin
                                        addr_after_bound <= addr_after_bound + 2;
                                    end 
                                    horizontal_projection_mem_loc <= horizontal_projection_mem_loc + 2;
                                end else begin
                                    vertical_projection_mem_loc <= vertical_projection_mem_loc + 1; 
                                    horizontal_projection_mem_loc <= 0;
                                    addr_after_bound <= 0;
                                    bound <= bound-1;
                                end
                            end 
                        end

                        // Feature control
                        if (cur_feature_addr < 31) begin // 512/16
                            cur_feature_addr <=  cur_feature_addr + 1;
                        end else if (!out_done) begin
                            cur_feature_addr <= 0;
                        end

                    end
                    encoding_cycle_count <= encoding_cycle_count + 1;
                end
            end
        end
    end
endmodule

module encoding_controller_testbench;
    logic [1:0][7:0] projection_addrs;
    logic [7:0] feature_addrs;
    logic [12:0] class_addrs;
    logic out_done, out_reset;
    logic clk, cur_encode_done, reset_in, write_data_done;

    parameter period = 100;

    encoding_controller dut (.projection_addrs, .feature_addrs, .out_done, .out_reset, .cur_encode_done, .clk, .reset_in, .write_data_done);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset_in <= 1; write_data_done <= 0; @(posedge clk);
        reset_in <= 0; @(posedge clk);
        write_data_done <= 1; @(posedge clk);

        for (int i = 0; i < 251; i++) begin
            repeat (32) begin
                cur_encode_done <= 0; @(posedge clk);
            end
            cur_encode_done <= 1; @(posedge clk);
            cur_encode_done <= 1; @(posedge clk);
        end
        $stop();
    end 

endmodule