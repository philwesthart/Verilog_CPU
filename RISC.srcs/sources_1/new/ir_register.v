`timescale 1ns / 1ps

//instruction register module
module ir (out, clk, in, load);
    input clk;
    input load;
    input [15:0] in;
    output reg [15:0] out;

    always @ (posedge clk) begin
        if (load == 1) begin
            out <= in; end
        else begin
            out <= out; end
    end
endmodule