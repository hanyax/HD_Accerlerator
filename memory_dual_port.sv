module memory_dual_port (
    address_0 , // address_0 Input
    data_0_in , // data_0 bi-directional
    data_0_out, // data_0 bi-directional
    we_0      , // Write Enable/Read Enable
    oe_0      , // Output Enable
    address_1 , // address_1 Input
    data_1_in , // data_1 bi-directional
    data_1_out, // data_1 bi-directional
    we_1      , // Write Enable/Read Enable
    oe_1        // Output Enable
); 
 
parameter DATA_WIDTH = 16 ;
parameter ADDR_WIDTH = 5 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;
 
 //--------------Input Ports----------------------- 
input [ADDR_WIDTH-1:0] address_0 ;
input we_0 ;
input oe_0 ; 
input [ADDR_WIDTH-1:0] address_1 ;
input we_1 ;
input oe_1 ; 

//--------------Inout Ports----------------------- 
input logic [DATA_WIDTH-1:0] data_0_in ; 
input logic [DATA_WIDTH-1:0] data_1_in ;

//--------------Internal variables---------------- 
output logic [DATA_WIDTH-1:0] data_0_out ; 
output logic [DATA_WIDTH-1:0] data_1_out ;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

always @ (address_0 or we_0 or address_1 or we_1) begin : MEM_WRITE
    if ( we_0 ) begin
        mem[address_0] <= data_0_in;
    end else if (we_1) begin
        mem[address_1] <= data_1_in;
    end
end

always @ (address_0 or we_1 or oe_0) begin : MEM_READ_0
    if (! we_0 && oe_0) begin
        data_0_out <= mem[address_0];
    end else begin
        data_0_out <= 0; 
    end
end 

always @ (address_1 or we_1 or oe_1) begin : MEM_READ_1
    if (!we_1 && oe_1) begin
        data_1_out <= mem[address_1]; 
    end else begin
        data_1_out <= 0; 
    end
end

endmodule