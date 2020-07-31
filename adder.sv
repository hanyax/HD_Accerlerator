// source https://www.nandland.com/vhdl/modules/module-full-adder.html

module N_bit_adder #(parameter WIDTH=8) (input1,input2,out);
  input [WIDTH-1:0]   input1,input2;
  output [WIDTH-1:0]  out;
  
  wire  carry_out;
  wire [WIDTH-1:0] carry;
  genvar i;
  generate 
    for(i=0;i<WIDTH;i=i+1) begin: generate_N_bit_Adder
      if(i==0) 
        full_adder f(input1[0],input2[0], 0, out[0], carry[0]);
      else
        full_adder f(input1[i],input2[i],carry[i-1],out[i],carry[i]);
    end 
    assign carry_out = carry[WIDTH-1];
  endgenerate
endmodule 

module full_adder (i_bit1, i_bit2, i_carry, o_sum, o_carry);
  input logic i_bit1, i_bit2, i_carry;
  output logic o_sum, o_carry;

  assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  assign o_carry = ((i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
    
endmodule

module N_bit_adder_testbench;
 // Inputs
 reg [7:0] input1;
 reg [7:0] input2;
 // Outputs
 wire [7:0] answer;

 // Instantiate the Unit Under Test (UUT)
 N_bit_adder #(8) dut (
  .input1(input1), 
  .input2(input2), 
  .out(answer)
 );

 initial begin
  // Initialize Inputs
  input1 = 64; input2 = 64; #10;
  // Add stimulus here
  input1 = 65; input2 = 66; #100;

 end
      
endmodule