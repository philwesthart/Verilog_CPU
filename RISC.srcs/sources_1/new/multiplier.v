`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2015 07:15:28 PM
// Design Name: 
// Module Name: Multiply8
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


module Multiply8(
    input [7:0] a,
    input [7:0] b,
    output [15:0] out
    );
    
    
    wire [7:0] cout_0;
    wire [7:0] cout_1;
    wire [7:0] cout_2;
    wire [7:0] cout_3;
    wire [7:0] cout_4;
    wire [7:0] cout_5;
    wire [7:0] cout_6;
    wire [7:0] cout_7;
    wire [6:0] cout_8;
    wire [6:0] sum_0;
    wire [6:0] sum_1;
    wire [6:0] sum_2;
    wire [6:0] sum_3;
    wire [6:0] sum_4;
    wire [6:0] sum_5;
    wire [6:0] sum_6;
    wire [6:0] sum_7;
    
    
    //FA full_adder(a, b, cin, sum, cout);
    FA fa_0_0(a[0]* b[0], 0, 0,   out[0], cout_0[0]);
    FA fa_0_1(a[0]* b[1], 0, 0, sum_0[0], cout_0[1]);
    FA fa_0_2(a[0]* b[2], 0, 0, sum_0[1], cout_0[2]);
    FA fa_0_3(a[0]* b[3], 0, 0, sum_0[2], cout_0[3]);
    FA fa_0_4(a[0]* b[4], 0, 0, sum_0[3], cout_0[4]);
    FA fa_0_5(a[0]* b[5], 0, 0, sum_0[4], cout_0[5]);
    FA fa_0_6(a[0]* b[6], 0, 0, sum_0[5], cout_0[6]);
    FA fa_0_7(a[0]* b[7], 0, 0, sum_0[6], cout_0[7]);
        
    FA fa_1_0(a[1]* b[0], sum_0[0], cout_0[0],   out[1], cout_1[0]);
    FA fa_1_1(a[1]* b[1], sum_0[1], cout_0[1], sum_1[0], cout_1[1]);
    FA fa_1_2(a[1]* b[2], sum_0[2], cout_0[2], sum_1[1], cout_1[2]);
    FA fa_1_3(a[1]* b[3], sum_0[3], cout_0[3], sum_1[2], cout_1[3]);
    FA fa_1_4(a[1]* b[4], sum_0[4], cout_0[4], sum_1[3], cout_1[4]);
    FA fa_1_5(a[1]* b[5], sum_0[5], cout_0[5], sum_1[4], cout_1[5]);
    FA fa_1_6(a[1]* b[6], sum_0[6], cout_0[6], sum_1[5], cout_1[6]);
    FA fa_1_7(a[1]* b[7], 0,        cout_0[7], sum_1[6], cout_1[7]);
    
    
    FA fa_2_0(a[2]* b[0], sum_1[0], cout_1[0],   out[2], cout_2[0]);
    FA fa_2_1(a[2]* b[1], sum_1[1], cout_1[1], sum_2[0], cout_2[1]);
    FA fa_2_2(a[2]* b[2], sum_1[2], cout_1[2], sum_2[1], cout_2[2]);
    FA fa_2_3(a[2]* b[3], sum_1[3], cout_1[3], sum_2[2], cout_2[3]);
    FA fa_2_4(a[2]* b[4], sum_1[4], cout_1[4], sum_2[3], cout_2[4]);
    FA fa_2_5(a[2]* b[5], sum_1[5], cout_1[5], sum_2[4], cout_2[5]);
    FA fa_2_6(a[2]* b[6], sum_1[6], cout_1[6], sum_2[5], cout_2[6]);
    FA fa_2_7(a[2]* b[7], 0,        cout_1[7], sum_2[6], cout_2[7]);
  
    
    FA fa_3_0(a[3]* b[0], sum_2[0], cout_2[0],   out[3], cout_3[0]);
    FA fa_3_1(a[3]* b[1], sum_2[1], cout_2[1], sum_3[0], cout_3[1]);
    FA fa_3_2(a[3]* b[2], sum_2[2], cout_2[2], sum_3[1], cout_3[2]);
    FA fa_3_3(a[3]* b[3], sum_2[3], cout_2[3], sum_3[2], cout_3[3]);
    FA fa_3_4(a[3]* b[4], sum_2[4], cout_2[4], sum_3[3], cout_3[4]);
    FA fa_3_5(a[3]* b[5], sum_2[5], cout_2[5], sum_3[4], cout_3[5]);
    FA fa_3_6(a[3]* b[6], sum_2[6], cout_2[6], sum_3[5], cout_3[6]);
    FA fa_3_7(a[3]* b[7], 0,        cout_2[7], sum_3[6], cout_3[7]);
 
    
    FA fa_4_0(a[4]* b[0], sum_3[0], cout_3[0],   out[4], cout_4[0]);
    FA fa_4_1(a[4]* b[1], sum_3[1], cout_3[1], sum_4[0], cout_4[1]);
    FA fa_4_2(a[4]* b[2], sum_3[2], cout_3[2], sum_4[1], cout_4[2]);
    FA fa_4_3(a[4]* b[3], sum_3[3], cout_3[3], sum_4[2], cout_4[3]);
    FA fa_4_4(a[4]* b[4], sum_3[4], cout_3[4], sum_4[3], cout_4[4]);
    FA fa_4_5(a[4]* b[5], sum_3[5], cout_3[5], sum_4[4], cout_4[5]);
    FA fa_4_6(a[4]* b[6], sum_3[6], cout_3[6], sum_4[5], cout_4[6]);
    FA fa_4_7(a[4]* b[7], 0,        cout_3[7], sum_4[6], cout_4[7]);
   
   
    FA fa_5_0(a[5]* b[0], sum_4[0], cout_4[0],   out[5], cout_5[0]);
    FA fa_5_1(a[5]* b[1], sum_4[1], cout_4[1], sum_5[0], cout_5[1]);
    FA fa_5_2(a[5]* b[2], sum_4[2], cout_4[2], sum_5[1], cout_5[2]);
    FA fa_5_3(a[5]* b[3], sum_4[3], cout_4[3], sum_5[2], cout_5[3]);
    FA fa_5_4(a[5]* b[4], sum_4[4], cout_4[4], sum_5[3], cout_5[4]);
    FA fa_5_5(a[5]* b[5], sum_4[5], cout_4[5], sum_5[4], cout_5[5]);
    FA fa_5_6(a[5]* b[6], sum_4[6], cout_4[6], sum_5[5], cout_5[6]);
    FA fa_5_7(a[5]* b[7], 0,        cout_4[7], sum_5[6], cout_5[7]);
  
    FA fa_6_0(a[6]* b[0], sum_5[0], cout_5[0],   out[6], cout_6[0]);
    FA fa_6_1(a[6]* b[1], sum_5[1], cout_5[1], sum_6[0], cout_6[1]);
    FA fa_6_2(a[6]* b[2], sum_5[2], cout_5[2], sum_6[1], cout_6[2]);
    FA fa_6_3(a[6]* b[3], sum_5[3], cout_5[3], sum_6[2], cout_6[3]);
    FA fa_6_4(a[6]* b[4], sum_5[4], cout_5[4], sum_6[3], cout_6[4]);
    FA fa_6_5(a[6]* b[5], sum_5[5], cout_5[5], sum_6[4], cout_6[5]);
    FA fa_6_6(a[6]* b[6], sum_5[6], cout_5[6], sum_6[5], cout_6[6]);
    FA fa_6_7(a[6]* b[7], 0,        cout_5[7], sum_6[6], cout_6[7]);
   
    FA fa_7_0(a[7]* b[0], sum_6[0], cout_6[0],   out[7], cout_7[0]);
    FA fa_7_1(a[7]* b[1], sum_6[1], cout_6[1], sum_7[0], cout_7[1]);
    FA fa_7_2(a[7]* b[2], sum_6[2], cout_6[2], sum_7[1], cout_7[2]);
    FA fa_7_3(a[7]* b[3], sum_6[3], cout_6[3], sum_7[2], cout_7[3]);
    FA fa_7_4(a[7]* b[4], sum_6[4], cout_6[4], sum_7[3], cout_7[4]);
    FA fa_7_5(a[7]* b[5], sum_6[5], cout_6[5], sum_7[4], cout_7[5]);
    FA fa_7_6(a[7]* b[6], sum_6[6], cout_6[6], sum_7[5], cout_7[6]);
    FA fa_7_7(a[7]* b[7], 0,        cout_6[7], sum_7[6], cout_7[7]);    

    FA fa_8_0(0,         sum_7[0], cout_7[0],   out[8], cout_8[0]);
    FA fa_8_1(cout_8[0], sum_7[1], cout_7[1],   out[9], cout_8[1]);
    FA fa_8_2(cout_8[1], sum_7[2], cout_7[2],   out[10], cout_8[2]);
    FA fa_8_3(cout_8[2], sum_7[3], cout_7[3],   out[11], cout_8[3]);
    FA fa_8_4(cout_8[3], sum_7[4], cout_7[4],   out[12], cout_8[4]);
    FA fa_8_5(cout_8[4], sum_7[5], cout_7[5],   out[13], cout_8[5]);
    FA fa_8_6(cout_8[5], sum_7[6], cout_7[6],   out[14], cout_8[6]);
    FA fa_8_7(cout_8[6], 0,        cout_7[7],   out[15], cout);  
  
endmodule
