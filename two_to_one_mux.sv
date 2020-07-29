module mux_two_one #(parameter WIDTH=16) (out, in0, in1, sel);
    output logic [WIDTH-1:0] out;
    input logic [WIDTH-1 : 0] in0, in1;
    input logic sel;

    alway_comb begin
        if (sel == 0) begin
            out = in0;
        end else begin
            out = in1;
        end
    end

endmodule