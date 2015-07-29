`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2015 03:05:18 PM
// Design Name: 
// Module Name: Subtractor16bit
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


module Subtractor16bit(
    input [15:0] a,
    input [15:0] b,
    input bin,
    output bout,
    output [15:0] d
    );
    
    wire bout1, bout2, bout3, bout4, bout5, bout6, bout7, bout8, bout9, bout10,
    bout11, bout12, bout13, bout14, bout15;
    
    FS fs1(a[0], b[0], bin, bout1, d[0]);
    FS fs2(a[1], b[1], bout1, bout2, d[1]);
    FS fs3(a[2], b[2], bout2, bout3, d[2]);
    FS fs4(a[3], b[3], bout3, bout4, d[3]);
  
    FS fs5(a[4], b[4], bout4, bout5, d[4]);
    FS fs6(a[5], b[5], bout5, bout6, d[5]);
    FS fs7(a[6], b[6], bout6, bout7, d[6]);
    FS fs8(a[7], b[7], bout7, bout8, d[7]);
    
    FS fs9(a[8], b[8], bout8, bout9, d[8]);
    FS fs10(a[9], b[9], bout9, bout10, d[9]);
    FS fs11(a[10], b[10], bout10, bout11, d[10]);
    FS fs12(a[11], b[11], bout11, bout12, d[11]);
    
    FS fs13(a[12], b[12], bout12, bout13, d[12]);
    FS fs14(a[13], b[13], bout13, bout14, d[13]);
    FS fs15(a[14], b[14], bout14, bout15, d[14]);
    FS fs16(a[15], b[15], bout15, bout, d[15]);
endmodule

//full subtractor module
module FS(
    input a,
    input b,
    input bin,
    output bout,
    output d
    );
    
    wire x1, n1, n2, a1, a2;
    
    xor xor1 ( x1, a, b);  
    xor xor2 ( d, bin, x1);   
   
    and and1 ( a1, b, n1); 
    and and2 ( a2, bin, n2);  
     
    not not1( n1, a);  
    not not2( n2, x1);  
     
    or or1( bout, a1, a2);
endmodule