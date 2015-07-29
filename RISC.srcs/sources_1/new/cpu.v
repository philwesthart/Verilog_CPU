`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2015 04:38:58 PM
// Design Name: 
// Module Name: cpu
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


module cpu( input clk
        );
    
    //alu wires
    wire [15:0] alu_out;
    
    //rf mux wires
    wire [15:0] R_data;
    wire [8:0] RF_W_data;
    wire [15:0] in3;
    //wire [1:0] RF_s;
    
    //memory wires
    wire [7:0] addr;
    wire [15:0] W_data;
    
    //regfile wires
    wire [15:0] RF_in, Rp_data, Rq_data;
    
    //program counter wires
    wire [7:0] PC_addr;
    
    //control unit wires
    wire [15:0] IR;
    wire IR_load, PC_ld, PC_clr, PC_inc, D_addr_sel, rd, wr, W_wr, Rp_rd, Rq_rd, RF_Rp_zero;
    wire [1:0] RF_s, opcode;
    wire [3:0] W_addr, Rp_addr, Rq_addr;
    wire [7:0] D_addr;
    
    //control unit
    control_unit cpu_controlunit(clk, IR, RF_Rp_zero, IR_ld, PC_ld, PC_clr, PC_inc, D_addr_sel, 
    D_addr, rd, wr, RF_W_data, RF_s[1], RF_s[0], W_addr, W_wr, Rp_addr, 
    Rp_rd, Rq_addr, Rq_rd, opcode[1], opcode[0]);
        
    //instruction register
    ir cpu_ir(IR, clk, R_data, IR_load);
    
    //instantiate program counter
    pc cpu_pc(PC_addr, clk, IR[11:4], PC_load, PC_clr, PC_inc);
    
    //instantiate memory
    memory cpu_memory(clk, wr, rd, addr, W_data, R_data);
    
    //memory mux
    mux_2_to_1 cpu_mem_mux(PC_addr, D_addr, addr, D_addr_sel);
    
    //instantiate ALU
    ALU cpu_alu(opcode, Rp_data, Rq_data, alu_out);
    
    //instantiate register file
    regfile cpu_regfile(clk, W_wr, W_addr, RF_in, Rp_addr, Rq_addr, Rp_data, Rq_data, Rp_rd, Rq_rd, RF_Rp_zero);
    
    //regfile mux
    mux_4_to_1 cpu_rf_mux(alu_out, R_data, RF_W_data, in3, RF_in, RF_s);
    
    
endmodule
