`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2015 02:53:19 PM
// Design Name: 
// Module Name: Adder16bit
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


module Adder16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output cout,
    output [15:0] s
    );
    
    wire cout1, cout2, cout3;
    
    CSA csa1(a[7:0], b[7:0], cin, cout1, s[7:0]);
    CSA csa2(a[15:8], b[15:8], cout1, cout2, s[15:8]);
    
endmodule
