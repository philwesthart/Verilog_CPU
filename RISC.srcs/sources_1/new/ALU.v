`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2015 02:11:47 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [1:0] opcode,
    input [15:0] in0,
    input [15:0] in1,
    output reg [15:0] out
	 //output reg [3:0] operation
    );
    
    parameter low = 0;
    
    //subtractor wires
    wire bin, bout;
    wire [15:0] difference;
    
    //adder wires
    wire cin, cout;
    wire [15:0] sum;
    
    //multiplier wires
    wire [15:0] product;
    
    //arithmetic modules
    Subtractor16bit subtractor(in0, in1, bin, bout, difference);
    Adder16bit adder(in0, in1, cin, cout, sum);
    Multiply8 multiplier(in0, in1, product);
    
    assign bin = low;
    assign bout = low;
    assign cin = low;
    assign cout = low;
    
    //opcode logic
    always @ (*) begin
        case (opcode) 
            2'b00: out = sum;
                            //operation = 4'b0000; end
            2'b01: out = difference;
                            //operation = 4'b0001; end
            2'b10: out = product;
                            //operation = 4'b0010; end
            2'b11: out = in0 << in1;
                            //operation = 4'b0011; end
            default: out = out;       
        endcase
    end
endmodule
