module ir_tb(
    );
    reg [15:0] in;
    reg clk, load;
    
    wire [15:0] out;
    
    ir uut(out, clk, in, load);

    initial begin
        clk = 0;
    end
    always #10 clk = ~clk;
    
    initial begin
    load = 0;
    in = 16'hffff;
    
    #100
    
    load = 1;
    
    #100 
    
    in = 16'h00ff;
    
    #100
    
    load = 1; 
    
    #100 
    $stop;
    end
endmodule
