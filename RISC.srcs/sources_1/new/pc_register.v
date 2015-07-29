`timescale 1ns / 1ps

//instruction register module
module pc (out, clk, in, load, reset, inc);
    input clk;
    input load;
    input reset;
    input inc;
    input [7:0] in;
    output reg [7:0] out;
    
    always @ (posedge clk) begin
        if (reset == 1) begin
            out <= 16'b0; end 
        if (load == 1) begin
            out <= in; end  
        if (inc == 1) begin
            out <= out + 1; end 
    end
endmodule