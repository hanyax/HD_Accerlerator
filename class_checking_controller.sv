module class_checking_controller #(parameter Dhv_SIZE = 4000, CLA_ADDR_WIDTH = 13) (clk, reset_in, write_data_done, cur_encode_done, class_num, class_addrs, reset_out, out_done);
    output logic [CLA_ADDR_WIDTH-1:0] class_addrs;
    output logic reset_out, out_done;
    input logic clk, reset_in, write_data_done, cur_encode_done;
    input logic [5:0] class_num;

    // class_num classes
    shortint cur_class_addr, encoding_cycle_count, total_count;
    logic [5:0] class_cur_cycle_count;
    logic added_one, encode_done_cur_cycle;

    assign class_addrs = cur_class_addr;

    always_ff @(posedge clk) begin
        if (reset_in | !write_data_done) begin
            reset_out <= 0;
            out_done <= 0;
            cur_class_addr <= 0;
            class_cur_cycle_count <= 1;
            added_one <= 1'b0;
            encode_done_cur_cycle <= 0;
            total_count <= 0;
        end else begin
            if (cur_encode_done & total_count < 500) begin
                encode_done_cur_cycle <= 1;
                class_cur_cycle_count <= 1;
                total_count <= total_count+1;
                if (!added_one) begin
                    cur_class_addr <= cur_class_addr + 1;
                    added_one <= 1'b1;
                end 
            end

            if (total_count == 500 & (class_cur_cycle_count + 1)== class_num) begin // should be 250 but total count increase 3 for each encode done
                out_done <= 1'b1;
            end else begin
                // Class control
                if (encode_done_cur_cycle) begin
                    if (class_cur_cycle_count < class_num) begin
                        cur_class_addr <= cur_class_addr + 1;
                        class_cur_cycle_count <= class_cur_cycle_count + 1;
                        added_one <= 1'b0;
                    end else begin
                        encode_done_cur_cycle <= 0;
                    end
                end
            end
        
        end
    end
endmodule

module class_checking_controller_testbench;
    logic [12:0] class_addrs;
    logic reset_out, out_done;
    logic clk, reset_in, write_data_done, cur_encode_done;
    logic [5:0] class_num;

    parameter period = 100;

    class_checking_controller dut (.clk, .reset_in, .write_data_done, .cur_encode_done, .class_num(6'b100000), .class_addrs, .reset_out, .out_done);

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
            cur_encode_done <= 1; @(posedge clk); @(posedge clk);
        end
        $stop();
    end 

endmodule