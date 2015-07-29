`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2015 07:00:55 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
    
    reg [15:0] in0, in1;
    reg [1:0] opcode;
    reg reset;
    
    wire [15:0] out;
    
    ALU uut(opcode, in0, in1, reset, out);
    
    initial begin
    in0 = 16'b1010101010101010;
    in1 = 16'b0101010101010101;
    opcode = 2'b0;
    shift_sel = 0;
    shift = 4'b1000;
    reset = 0;
    
    #10;
    
    in0 = 16'hffff;
    in1 = 16'h00ff;
    opcode = 2'b01;
    
    #10;
    
    in0 = 16'h00ff;
    in1 = 16'd8;
    opcode = 2'b10;
    
    #10
    
    opcode = 2'b11;
    
    #10;
    
    reset = 1;
    
    #10
    $stop;
    end
endmodule
