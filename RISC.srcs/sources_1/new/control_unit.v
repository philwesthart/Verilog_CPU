`timescale 1ns / 1ps
`define ADD_REG_OP   4'b0000
`define SUB_REG_OP   4'b0001
`define MULT_REG_OP  4'b0010
`define SHIFT_REG_OP 4'b0011
`define LOAD_OP      4'b0100
`define SAVE_OP      4'b0101
`define BNEZ_OP      4'b0110

module control_unit(
    input clk,
    input [15:0] IR,
    input RF_Rp_zero,
    output reg IR_ld, 
    output reg PC_ld, 
    output reg PC_clr,
    output reg PC_inc,
    output reg D_addr_sel,
    output reg [3:0] D_addr,
    output reg D_rd,
    output reg D_wr, 
    output reg RF_W_data,
    output reg RF_s1,
    output reg RF_s0,
    output reg [3:0] RF_W_addr,
    output reg W_wr,
    output reg [3:0] RF_Rp_addr,
    output reg Rp_rd,
    output reg [3:0] RF_Rq_addr,
    output reg Rq_rd, 
    output reg alu_s1,
    output reg alu_s0    
    );
    reg [1:0] state;
    reg [3:0] src1, src2, dest, opcode;
    reg [15:0] addr;

    
    initial begin
        state = 0;
        IR_ld = 0;
        D_addr_sel = 0;        
    end
    
    always @ (posedge clk) begin
        case(state) 
        //FSM
            2'b00 : begin
            //Instruction Fetch
                IR_ld = 1; // load into instruction reg
                PC_ld = 0; 
                PC_clr = 0;
                PC_inc = 0;
                D_addr_sel = 0; // Use PC address to access memory 
                D_rd = 1; // Read from memory
                D_wr = 0; 
                RF_W_data = 0;
                RF_s1 = 0;
                RF_s0 = 0;
                RF_W_addr = 0;
                W_wr = 0;
                RF_Rp_addr = 0;
                Rp_rd = 0;
                RF_Rq_addr = 0;
                Rq_rd = 0;
                alu_s1 = 0;
                alu_s0 = 0;
            end
            
            2'b01 : begin
            //Instruction Decode
                IR_ld = 0; // Do not load into IR 
                PC_ld = 1; // Increment PC
                PC_clr = 0; 
                PC_inc = 1; // Increment PC
                D_addr_sel = 0; 
                D_rd = 0; 
                D_wr = 0; 
                RF_W_data = 0;
                RF_s1 = 0;
                RF_s0 = 0;
                RF_W_addr = 0;
                W_wr = 0;
                RF_Rp_addr = 0;
                Rq_rd = 0;
                RF_Rq_addr = 0;
                Rq_rd = 0;
                alu_s1 = 0;
                alu_s0 = 0;
                
                opcode = IR[15:12];
                case (opcode)
                    `ADD_REG_OP : begin 
                    src1 = IR[11:8];
                    src2 = IR[7:4];
                    dest = IR[3:0];
                    RF_Rp_addr = src1;
                    Rp_rd = 1;
                    RF_Rq_addr = src2;
                    Rq_rd = 1;
                    alu_s1 = 0;
                    alu_s0 = 0;                    
                    end
                    `SUB_REG_OP : begin 
                    src1 = IR[11:8];
                    src2 = IR[7:4];
                    dest = IR[3:0];
                    RF_Rp_addr = src1;
                    Rp_rd = 1;
                    RF_Rq_addr = src2;
                    Rq_rd = 1;
                    alu_s1 = 0;
                    alu_s0 = 1;                    
                    end
                    `MULT_REG_OP : begin 
                    src1 = IR[11:8];
                    src2 = IR[7:4];
                    dest = IR[3:0];
                    RF_Rp_addr = src1;
                    Rp_rd = 1;
                    RF_Rq_addr = src2;
                    Rq_rd = 1;
                    alu_s1 = 1;
                    alu_s0 = 0;                    
                    end
                    `SHIFT_REG_OP : begin 
                    src1 = IR[11:8];
                    src2 = IR[7:4];
                    dest = IR[3:0];
                    RF_Rp_addr = src1;
                    Rp_rd = 1;
                    RF_Rq_addr = src2;
                    Rq_rd = 1;
                    alu_s1 = 1;
                    alu_s0 = 1;                    
                    end    
                    
                    `LOAD_OP : begin 
                    addr = IR[11:4];
                    dest = IR[3:0];         
                    end                        
                    `SAVE_OP : begin 
                    addr = IR[11:4];
                    src1 = IR[3:0];           
                    end                                             
                    `BNEZ_OP : begin 
                    addr = IR[11:4];
                    src1 = IR[3:0];           
                    end      
                                
                endcase
            end
            
            2'b10 : begin
            //Instruction Execute
                IR_ld = 0; 
                PC_ld = 0; 
                PC_clr = 0;
                PC_inc = 0;
                D_addr_sel = 0; 
                D_rd = 0; 
                D_wr = 0; 
                RF_W_data = 0;
                RF_s1 = 0;
                RF_s0 = 0;
                RF_W_addr = 0;
                W_wr = 0;
                RF_Rp_addr = 0;
                Rq_rd = 0;
                RF_Rq_addr = 0;
                Rq_rd = 0;
                alu_s1 = 0;
                alu_s0 = 0;
                case (opcode)
                    `ADD_REG_OP: begin
                        RF_s1 = 0;
                        RF_s0 = 0;    
                    end                    
                    `SUB_REG_OP: begin
                        RF_s1 = 0;
                        RF_s0 = 0;    
                    end                    
                    `MULT_REG_OP: begin
                        RF_s1 = 0;
                        RF_s0 = 0;    
                    end                                        
                    `SHIFT_REG_OP: begin
                    RF_s1 = 0;
                    RF_s0 = 0;    
                    end             
                                            
                    `LOAD_OP: begin
                    D_addr_sel = 1; 
                    D_addr = addr;
                    D_rd = 1;
                    RF_s1 = 0;
                    RF_s0 = 1;      
                    end             
                                    
                    `SAVE_OP: begin                    
                    D_addr_sel = 1; 
                    D_addr = addr;
                    D_wr = 1;
                    RF_Rp_addr = src1;
                    Rp_rd = 1;         
                    end 
                                                 
                    `BNEZ_OP: begin    
                    RF_Rp_addr = src1;
                    Rp_rd = 1;
                    end                 
                endcase
            end
            
            2'b11 : begin
            //Writeback
                IR_ld = 0; 
                PC_ld = 0; 
                PC_clr = 0;
                PC_inc = 0;
                D_addr_sel = 0; 
                D_rd = 0; 
                D_wr = 0; 
                RF_W_data = 0;
                RF_s1 = 0;
                RF_s0 = 0;
                RF_W_addr = 0;
                W_wr = 0;
                RF_Rp_addr = 0;
                Rq_rd = 0;
                RF_Rq_addr = 0;
                Rq_rd = 0;
                alu_s1 = 0;
                alu_s0 = 0;       
                case(opcode)
                    `ADD_REG_OP : begin
                        RF_W_addr = dest;
                        W_wr = 1;
                    end                    
                    `SUB_REG_OP : begin
                        RF_W_addr = dest;
                        W_wr = 1;
                    end
                    
                    `MULT_REG_OP : begin
                        RF_W_addr = dest;
                        W_wr = 1;
                    end
                    
                    `SHIFT_REG_OP : begin
                        RF_W_addr = dest;
                        W_wr = 1;
                    end
                    
                    `LOAD_OP : begin
                        RF_W_addr = dest;
                        W_wr = 1;
                    end
                    
                    `SAVE_OP : begin
                    end
                    
                    `BNEZ_OP : begin
                        if (RF_Rp_zero == 0) begin //if RF_Rp_zero is zero(false), then the test register is not zero => branch
                            PC_ld = 1;
                        end                        
                    end
                endcase
            end
        endcase
        
        state = state + 1;
    end
endmodule
