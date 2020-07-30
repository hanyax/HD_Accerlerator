// source https://www.nandland.com/vhdl/modules/module-full-adder.html

module full_adder (i_bit1, i_bit2, i_carry, o_sum, o_carry);
  input logic i_bit1, i_bit2, i_carry;
  output logic o_sum, o_carry;

  assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
  assign o_carry = (i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
    
endmodule