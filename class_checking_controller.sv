module class_checking_controller ();
    
    output logic [CLA_ADDR_WIDTH-1:0] class_addrs;
    input logic clk, reset_in, write_data_done;
    input logic [4:0] class_num;

    // class_num classes
    shortint cur_class_addr, encoding_cycle_count;
    logic [4:0] class_cur_cycle_count;
    logic added_one;

    assign class_addrs = cur_class_addr;

    always_ff @(posedge clk) begin
        if (reset_in | !write_data_done) begin
            // For Class
            cur_class_addr <= 0;
            class_cur_cycle_count <= 0;
            added_one <= 1'b0;
        end else begin
            // Class control
            if (class_cur_cycle_count < class_num-1) begin
                cur_class_addr <= cur_class_addr + 1;
                class_cur_cycle_count <= class_cur_cycle_count + 1;
                added_one <= 1'b0;
            end else if (cur_encode_done) begin
                class_cur_cycle_count <= 0;
                if (!added_one) begin
                    cur_class_addr <= cur_class_addr + 1;
                    added_one <= 1'b1;
                end 
            end

        end

    end

endmodule