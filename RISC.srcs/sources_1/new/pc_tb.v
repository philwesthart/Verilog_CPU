`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2015 04:59:17 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb(
    );
    reg [7:0] in;
    reg clk, load, reset, inc;
    
    wire [7:0] out;
    
    pc uut(out, clk, in, load, reset, inc);

    initial begin
        clk = 0;
    end
    always #10 clk = ~clk;
    
    initial begin
    load = 0;
    reset = 0;
    in = 8'hff;
    inc = 0;
    
    #100
    
    load = 1;
    
    #100
    
    load = 0;
    inc = 1;
    
    #100
    
    inc = 0;
    reset = 1;
    
    #100
    $stop;
    end
endmodule
