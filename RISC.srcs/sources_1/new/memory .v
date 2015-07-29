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


/*
=====================================================
    Assembly Code Syntax 
        ALU ops
                add   source_reg1 source_reg2 dest_reg
                sub   source_reg1 source_reg2 dest_reg
                mult  source_reg1 source_reg2 dest_reg
                shift source_reg1 source_reg2 dest_reg
        Load
            ld address destination_reg
        Save
            sv address source_reg
        
        Branch not equal zero
            bnez address test_register
=====================================================
    Program 1
    ld 0x10 r0
    ld 0x11 r1
    add r0 r1 r2
    sv 0x12 r2

=====================================================
    Initial Memory
    
    Start PC at 0x00
    0x00  0100 0001 0000 0000 (0x4100)
    0x01  0100 0001 0001 0001 (0x4111)
    0x02  0000 0000 0001 0010 (0x0012)
    0x03  0101 0001 0010 0010 (0x5122)
    ...
    0x10 7
    0x11 14
    0x12 21
    
=====================================================
    Expected Final Memory    


*/

    initial begin
        //Program 1
        memory[0] = 16'H4100;
        memory[1] = 16'H4111;
        memory[2] = 16'H0012;
        memory[3] = 16'H5122;
        
        memory[8'H10] = 7;
        memory[8'H11] = 14;
        //End Program 1    
    end
  
    always @(posedge clk) begin
	if (write) begin memory[addr] <= writeData; end 
     	if (read) begin readData = memory[addr]; end
     	else begin readData = 16'bz; end
   end
   
endmodule