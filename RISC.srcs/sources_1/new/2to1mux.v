module mux_2_to_1(in0, in1, out, sel);

input[7:0] in0, in1;
input sel;
output[7:0] out;
reg[7:0] out;

always @ (*)begin
case (sel)
2'b0: out = in0;
2'b1: out = in1;

endcase

end
endmodule