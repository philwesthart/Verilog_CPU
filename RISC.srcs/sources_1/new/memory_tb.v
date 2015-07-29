`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2015 05:47:28 PM
// Design Name: 
// Module Name: memory_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_tb(
    );
    
    reg clk, write, read;
    reg [7:0] addr;
    reg [15:0] writeData;
    wire [15:0] readData;
    
    memory uut (clk, write, read, addr, writeData, readData);
    
    initial begin
        clk = 0;
    end
    always #10 clk = ~clk;
    
    initial begin
    write = 0;
    read = 0;
    addr = 8'b01010101;
    writeData = 16'hffff;
    
    #100
    
    write = 1;
    
    #100
    
    write = 0;
    read = 1;
    
    #100
    $stop;
    end
endmodule
