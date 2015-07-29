`timescale 1ns / 1ps
//register file module
module regfile (clk, W_wr, W_addr, W_data, Rp_addr, Rq_addr, Rp_data, Rq_data, Rp_rd, Rq_rd, RF_Rp_zero);
    
    input clk;
    input W_wr, Rp_rd, Rq_rd;
    input [3:0] W_addr, Rp_addr, Rq_addr;
    input [15:0] W_data;
    output reg [15:0] Rp_data, Rq_data;
    output reg RF_Rp_zero;
    reg [15:0] 	 regfile [0:15];

    always @(posedge clk) begin
        //write to regfile
        if (W_wr) begin 
            regfile[W_addr] <= W_data; 
        end  
        
        //read from regfile
        if(Rp_rd) begin
            Rp_data = regfile[Rp_addr];
        end
        if (Rq_rd) begin
            Rq_data = regfile[Rp_addr];
            if (regfile[Rp_addr] == 16'b0) begin
                RF_Rp_zero = 1;
            end else begin
                RF_Rp_zero = 0;
            end
        end
    end
endmodule