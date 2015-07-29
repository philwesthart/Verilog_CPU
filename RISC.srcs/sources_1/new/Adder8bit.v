`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2015 02:51:43 PM
// Design Name: 
// Module Name: Adder8bit
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
//carry-select adder module
module CSA(input [7:0] a,
           input [7:0] b,
           input cin,
           output cout,
           output [7:0] sum);
    
    wire cout_r1, cout_r2, cout_r3;
    wire [3:0] sum_low, sum_high;
    
    parameter high = 1;
    parameter low = 0;
    
    //rca(a,b,cin,cout,sum)
    RCA_4 r1(a[3:0], b[3:0], cin, cout_r1, sum[3:0]);
    
    //assume carry = 0
    RCA_4 r2(a[7:4], b[7:4], low, cout_r2, sum_low);
    
    //assume carry = 1
    RCA_4 r3(a[7:4], b[7:4], high, cout_r3, sum_high);
    
    //mux for sum bits
    //mux(a,b,sel,out); 0 = b; 1 = a;
    MUX_2_1 s4(sum_high[0], sum_low[0], cout_r1, sum[4]);
    MUX_2_1 s5(sum_high[1], sum_low[1], cout_r1, sum[5]);
    MUX_2_1 s6(sum_high[2], sum_low[2], cout_r1, sum[6]);
    MUX_2_1 s7(sum_high[3], sum_low[3], cout_r1, sum[7]);
    
    //mux for cout
    MUX_2_1 c(cout_r3, cout_r2, cout_r1, cout);
    
endmodule

//4-bit RCA module
module RCA_4(input [3:0] a,
               input [3:0] b,
               input cin,
               output cout,
               output [3:0] sum);
    //fa(a,b,cin,cout,sum)
    wire cout1, cout2, cout3;
    FA fa1(a[0], b[0], cin, sum[0], cout1);
    FA fa2(a[1], b[1], cout1, sum[1], cout2);
    FA fa3(a[2], b[2], cout2, sum[2], cout3);
    FA fa4(a[3], b[3], cout3, sum[3], cout);                   
endmodule

//full adder module
module FA(input a,
          input b,
          input cin,
          output sum,
          output cout);

    wire n0, n1, n2;
    
    xor x1(n0, a, b);
    xor x2(sum, n0, cin);
    and a1(n1, n0, cin);
    and a2(n2, a, b);
    or o1(cout, n1, n2);                
endmodule
               
//2 to 1 mux
module MUX_2_1(
    input a,
    input b,
    input sel,
    output out);
    
    wire a1, a2, n1;
    
    and and1(a1, a, sel);
    not not1(n1, sel);
    and and2(a2, b, n1);
    or or1(out, a1, a2);    
endmodule

