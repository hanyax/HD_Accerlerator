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
data_0_out, 
cs_0      , // Chip Select
we_0      , // Write Enable/Read Enable
oe_0      , // Output Enable
address_1 , // address_1 Input
data_1_in , // data_1
data_1_out,
cs_1      , // Chip Select
we_1      , // Write Enable/Read Enable
oe_1        // Output Enable
); 

//--------------Input Ports----------------------- 
input clk;
input [ADDR_WIDTH-1:0] address_0;
input cs_0 ;
input we_0 ;
input oe_0 ; 
input [ADDR_WIDTH-1:0] address_1;
input cs_1 ;
input we_1 ;
input oe_1 ; 

input [data_0_WIDTH-1:0] data_0_in; 
input [data_0_WIDTH-1:0] data_1_in;

//--------------Out Ports----------------------- 
output logic [data_0_WIDTH-1:0] data_0_out; 
output logic [data_0_WIDTH-1:0] data_1_out;

//--------------Internal variables---------------- 
reg [data_0_WIDTH-1:0] mem [0:RAM_DEPTH-1];

//--------------Code Starts Here------------------ 
// Memory Write Block 
// Write Operation : When we_0 = 1, cs_0 = 1
always_ff @(posedge clk)
begin : MEM_WRITE
  if ( cs_0 && we_0 ) begin
     mem[address_0] <= data_0_in;
  end 
  if (cs_1 && we_1) begin 
     mem[address_1] <= data_1_in;
  end
end

// Memory Read Block 
// Read Operation : When we_0 = 0, oe_0 = 1, cs_0 = 1
always_ff@ (posedge clk)
begin : MEM_READ_0
  if (cs_0 && !we_0 && oe_0) begin
    data_0_out <= mem[address_0]; 
  end else begin
    data_0_out <= 0; 
  end  
end 

// Memory Read Block 1 
// Read Operation : When we_1 = 0, oe_1 = 1, cs_1 = 1
always_ff @(posedge clk)
begin : MEM_READ_1
  if (cs_1 && !we_1 && oe_1) begin
    data_1_out <= mem[address_1]; 
  end else begin
    data_1_out <= 0;
  end
end

endmodule // End of Module ram_dp_sr_sw