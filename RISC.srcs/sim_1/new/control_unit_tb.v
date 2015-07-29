`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2015 05:57:11 PM
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb();
    reg clk;
    reg [15:0] IR;
    reg RF_Rp_zero;
    wire IR_ld; 
    wire PC_ld;
    wire PC_clr;
    wire PC_inc;
    wire D_addr_sel;
    wire D_rd;
    wire D_wr;
    wire RF_W_data;
    wire RF_s1;
    wire RF_s0;
    wire [3:0] RF_W_addr;
    wire W_wr;
    wire [3:0] RF_Rp_addr;
    wire Rp_rd;
    wire [3:0] RF_Rq_addr;
    wire Rq_rd;
    wire alu_s1;
    wire alu_s0;    

    control_unit uut(.clk(clk), 
                        .IR(IR), 
                        .RF_Rp_zero(RF_Rp_zero),
                        .IR_ld (IR_ld ),
                        .PC_ld (PC_ld), 
                        .PC_clr (PC_clr),
                        .PC_inc (PC_inc), 
                        .D_addr_sel (D_addr_sel),
                        .D_rd (D_rd),
                        .D_wr (D_wr), 
                        .RF_W_data (RF_W_data),
                        .RF_s1 (RF_s1),
                        .RF_s0 (RF_s0),
                        .RF_W_addr (RF_W_addr),
                        .W_wr (W_wr),
                        .RF_Rp_addr (RF_Rp_addr), 
                        .Rp_rd (Rp_rd),
                        .RF_Rq_addr (RF_Rq_addr),
                        .Rq_rd (Rq_rd),
                        .alu_s1 (alu_s1),
                        .alu_s0 (alu_s0)); 

    initial begin
        IR = 16'b0000111101011110;
        clk = 0;
        #200;
        IR = 16'b0001111101011110;
        #200;
        
        IR = 16'b0010111101011110;
        #200;
        
        IR = 16'b0011111101011110;
        #200;
        
        IR = 16'b0100111101011110;
        #200;
        
        IR = 16'b0101111101011110;
        #200;
    end
    
    always begin
        clk = clk + 1;
        #25;
    end
endmodule
