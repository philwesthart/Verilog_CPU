`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2015 05:38:00 PM
// Design Name: 
// Module Name: registerfile_tb
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


module registerfile_tb(
    );
    reg clk;
    reg W_wr, Rp_rd, Rq_rd;
    reg [3:0] W_addr, Rp_addr, Rq_addr;
    reg [15:0] W_data;
    wire [15:0] Rp_data, Rq_data;
   
    regfile uut(clk, W_wr, W_addr, W_data, Rp_addr, Rq_addr, Rp_data, Rq_data, Rp_rd, Rq_rd);
    
    initial begin
        clk = 0;
    end
    always #10 clk = ~clk;
    
    initial begin
    W_wr = 0;
    Rp_rd = 0;
    Rq_rd = 0;
    W_addr = 0;
    Rp_addr = 0;
    Rq_addr = 0;
    W_data = 16'hffff;
    
    #100
    
    W_wr = 1;
    W_addr = 4'b0100;
    
    #100
    
    W_wr = 0;
    Rp_addr = 4'b0100;
    Rq_addr = 4'b0100;
    Rp_rd = 1;
    Rq_rd = 0;
    
    #100
    
    W_wr = 0;
    Rp_addr = 4'b0100;
    Rq_addr = 4'b0100;
    Rq_rd = 1;
    
    #100
    $stop;
    end
endmodule
