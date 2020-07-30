module adder  #(parameter WIDTH=4) (A, B, SUM, CO);  
    output logic [WIDTH-1:0] SUM;  
    output logic CO;  
    input  logic [WIDTH-1:0] A, [WIDTH-1:0] B;  

    logic [WIDTH:0] tmp; 

    assign tmp = A + B;  
    assign SUM = tmp [WIDTH-1:0];  
    assign CO  = tmp [WIDTH];  

endmodule 