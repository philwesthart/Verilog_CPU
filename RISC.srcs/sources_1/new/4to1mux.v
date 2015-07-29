`timescale 1ns / 1ps
module mux_4_to_1(in0, in1, in2, in3, out, sel);
    input[15:0] in0, in1, in2, in3;
    input [1:0] sel;
    output[15:0] out;
    reg[15:0] out;
    
    assign in3 = 16'bz;
    
    always @ (*)begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            default: out = in3;
        endcase
    end
endmodule
