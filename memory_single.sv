//-----------------------------------------------------
// Design Name : ram_dp_sr_sw
// File Name   : ram_dp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module memory_single #(parameter data_0_WIDTH = 32, ADDR_WIDTH = 8, RAM_DEPTH = 1 << ADDR_WIDTH) (
clk, // Clock Input
address, // address_0 Input
data_in, // data_0
data_out, 
we // Write Enable/Read Enable
); 

//--------------Input Ports----------------------- 
input clk;
input [ADDR_WIDTH-1:0] address;
input we;
input [data_0_WIDTH-1:0] data_in; 

//--------------Out Ports----------------------- 
output logic [data_0_WIDTH-1:0] data_out; 

//--------------Internal variables---------------- 
reg [data_0_WIDTH-1:0] mem [0:RAM_DEPTH-1];

//--------------Code Starts Here------------------ 
// Memory Write Block 
// Write Operation : When we_0 = 1, cs_0 = 1
always_ff @(posedge clk) begin
  if (we) begin
    mem[address] <= data_in;
  end
end

assign data_out = mem[address];

endmodule // End of Module ram_dp_sr_sw