`include "encoding_module.sv"
`include "encoding_controller.sv"

module accelerator_top #(parameter Dhv_SIZE = 4000, Div_SIZE = 512, N_SIZE = 16, M_SIZE = 16, DIM_WIDTH = 16, FTWIDTH = 8, PROJ_ADDR_WIDTH = 8, PROJ_IN_WIDTH = 16, FEA_ADDR_WIDTH = 8, FEA_INOUT_WIDTH = 32, CLA_ADDR_WIDTH = 13) (clk, reset, projection_write, feature_write, class_write, coeffs_in, projections_in, feature_in, class_in, max_val, max_index, all_done);
    input logic [1:0][PROJ_IN_WIDTH-1:0] projections_in;
    input logic [FTWIDTH*4-1:0] feature_in;
    input logic [FTWIDTH-1:0] class_in;
    input logic [DIM_WIDTH-1:0] coeffs_in;
    input logic clk, reset, projection_write, feature_write, class_write;

    output logic [15:0] max_val;
    output logic [15:0] max_index;
    output logic all_done;

    // For Projection
    logic [N_SIZE+M_SIZE-1:0] cur_projections; 
    logic [1:0][PROJ_ADDR_WIDTH-1:0] projection_addrs;

    // For Feature
    logic [FEA_ADDR_WIDTH-1:0] feature_addrs;
    logic [N_SIZE-1:0][FTWIDTH-1:0] cur_features;
    logic [3:0][FEA_INOUT_WIDTH-1:0] cur_features_32bit;
    
    // For Class/Simi check
    logic [CLA_ADDR_WIDTH-1:0] class_addrs;
    logic [M_SIZE - 1:0][FTWIDTH-1:0] class_out;

    logic [M_SIZE-1:0][DIM_WIDTH-1:0] encoding_out;  

    logic reset_mac, reset_checker;
    logic encoding_done, mac_done;

    logic projection_write_done, feature_write_done, class_write_done, all_write_done;

    assign all_write_done = projection_write_done & feature_write_done & class_write_done;
    
    // feature reassign 
    assign cur_features[0] = cur_features_32bit[0][7:0];  assign cur_features[1] = cur_features_32bit[0][15:8];  assign cur_features[2] = cur_features_32bit[0][23:16];  assign cur_features[3] = cur_features_32bit[0][31:24];
    assign cur_features[4] = cur_features_32bit[1][7:0];  assign cur_features[5] = cur_features_32bit[1][15:8];  assign cur_features[6] = cur_features_32bit[1][23:16];  assign cur_features[7] = cur_features_32bit[1][31:24];
    assign cur_features[8] = cur_features_32bit[2][7:0];  assign cur_features[9] = cur_features_32bit[2][15:8];  assign cur_features[10] = cur_features_32bit[2][23:16];  assign cur_features[11] = cur_features_32bit[2][31:24];
    assign cur_features[12] = cur_features_32bit[3][7:0];  assign cur_features[13] = cur_features_32bit[3][15:8];  assign cur_features[14] = cur_features_32bit[3][23:16];  assign cur_features[15] = cur_features_32bit[3][31:24];
    
    projection_mem_interface projection_mem (.clk, .reset, .proj_ins(projections_in), .read_address0(projection_addrs[0]), .read_address1(projection_addrs[1]), .we(projection_write & !all_write_done), .re(all_write_done), .out0(cur_projections[15:0]), .out1(cur_projections[31:16]), .write_done(projection_write_done)); 
    feature_mem_interface feature_mem (.clk, .reset, .feature_in, .read_address(feature_addrs), .we(feature_write &!all_write_done), .re(all_write_done), .out0(cur_features_32bit[0]), .out1(cur_features_32bit[1]), .out2(cur_features_32bit[2]), .out3(cur_features_32bit[3]), .write_done(feature_write_done)); 
    encoding_controller encode_control (.projection_addrs, .feature_addrs, .out_done(encoding_done), .out_reset(reset_mac), .cur_encode_done(mac_done), .clk, .reset_in(reset), .write_data_done(all_write_done));
    encoding mac (.out(encoding_out), .done(mac_done), .clk, .reset(reset_mac | reset), .projections(cur_projections), .features(cur_features));
    
    //similarity_checker check();
    logic read_class_done;
    class_mem_interface class_mem (.clk, .reset, .class_in, .read_address(class_addrs), .we(class_write & !all_write_done), .re(all_write_done), .class_out, .write_done(class_write_done)); 
    class_checking_controller class_check_control (.clk, .reset_in(reset), .write_data_done(all_write_done), .cur_encode_done(mac_done), .class_num(5'b11010), .class_addrs, .reset_out(reset_checker), .out_done(read_class_done));
    similarity_checker similarity_check (.encode_vector_in(encoding_out), .class_in(class_out), .coeffs_in, .clk, .reset, .cur_encode_done(mac_done), .read_class_done, .we(class_write & !all_write_done), .max_val, .max_index, .done(all_done));

endmodule 


module accelerator_top_testbench; 
    logic [1:0][15:0] projections_in;
    logic [31:0] feature_in;
    logic [7:0] class_in;
    logic [15:0] coeffs_in;
    logic clk, reset, projection_write, feature_write, class_write;
    logic [15:0] max_val;
    logic [15:0] max_index;
    logic all_done;
    parameter period = 100;

    accelerator_top dut (.clk, .reset, .projection_write, .feature_write, .class_write, .coeffs_in, .projections_in, .feature_in, .class_in, .max_val, .max_index, .all_done);

    initial begin
        clk <= 1;
        forever #(period/2) clk <= ~clk;
    end

    initial begin
        reset <= 1; projection_write <= 0; feature_write <= 0; class_write <= 0; @(posedge clk); reset <= 0; @(posedge clk);
        
        projection_write <= 1;
        for (int i = 0; i < 250; i+=2) begin
            reset <= 0; projections_in[0] <= i; projections_in[1] <= i+1;  @(posedge clk);
        end; 
        
        feature_write <= 1;
        for (int i = 0; i < 514; i++) begin
            feature_in <= i; @(posedge clk);
        end; 

        class_write <= 1;
        for (int i = 0; i < 104000; i++) begin
            if (i < 26) begin
                coeffs_in <= i;
            end
            class_in <= 2; @(posedge clk);
        end;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        repeat (9027) begin // 16250
            @(posedge clk);
        end

        $stop();
    end 

endmodule