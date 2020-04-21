module mux4to1(sel,in0,in1,in2,out);

	input [1:0]sel;
	input [7:0]in0,in1,in2;
	output reg[7:0]out;
	
	always@(sel,in0,in1,in2)
	case(sel)
		2'b00:	out = in0;
		2'b01:	out = in1;
		2'b10:	out = in2;
	default: out = 8'bzzzzzzzz;
	endcase

endmodule 