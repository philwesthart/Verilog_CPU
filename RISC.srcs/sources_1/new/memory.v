//memory
module memory (clk, write, read, addr, writeData, readData);

input clk;
input write;
input read;
input [7:0] addr;
input [15:0] writeData;
output [15:0] readData;

reg [15:0] memory [0:256];
reg [15:0] readData;
wire[15:0] Z;

   always @(posedge clk) begin
	if (write) begin memory[addr] <= writeData; end 
     	if (read) begin readData = memory[addr]; end
     	else begin readData = 16'bz; end
   end
   
endmodule