//-----------------------------------------------------
// Design Name : ram_dp_sr_sw
// File Name   : ram_dp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module memory_double #(parameter data_0_WIDTH = 16, ADDR_WIDTH = 8, RAM_DEPTH = 1 << ADDR_WIDTH) (
clk       , // Clock Input
address_0 , // address_0 Input
data_0_in , // data_0
data_0_out, // Chip Select
we_0      , // Write Enable/Read Enable
address_1 , // address_1 Input
data_1_in , // data_1
data_1_out,
we_1); 

//--------------Input Ports----------------------- 
input clk;
input [ADDR_WIDTH-1:0] address_0;
input we_0 ;
input [ADDR_WIDTH-1:0] address_1;
input we_1 ;

input [data_0_WIDTH-1:0] data_0_in; 
input [data_0_WIDTH-1:0] data_1_in;

//--------------Out Ports----------------------- 
output logic [data_0_WIDTH-1:0] data_0_out; 
output logic [data_0_WIDTH-1:0] data_1_out;

//--------------Internal variables---------------- 
reg [data_0_WIDTH-1:0] mem [0:RAM_DEPTH-1];

assign data_0_out = mem[address_0];
assign data_1_out = mem[address_1];

//--------------Code Starts Here------------------ 
// Memory Write Block 
// Write Operation : When we_0 = 1, cs_0 = 1
always_ff @(posedge clk)
begin : MEM_WRITE
  if (we_0) begin
    mem[address_0] <= data_0_in;
  end 

  if (we_1) begin 
    mem[address_1] <= data_1_in;
  end 
end

endmodule // End of Module ram_dp_sr_sw