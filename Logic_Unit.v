module LU(input  [15:0]A, input [15:0]B, input [3:0]opcode_lu, output EQ,GT,ZA,ZB, output reg [15:0]out_lu);

assign EQ = (A==B)?1'b1:1'b0;
assign GT = (A>B)?1'b1:1'b0;
assign ZA = (A==16'd0)?1'b1:1'b0;
assign ZB = (B==16'd0)?1'b1:1'b0;

always @(*)
begin
out_lu <= 16'd0;
	case(opcode_lu)
		4'b0000: out_lu <= A & B;
		4'b0001: out_lu <= A | B;
		4'b0010: out_lu <= ~(A & B);
		4'b0011: out_lu <= ~(A | B);
		4'b0100: out_lu <= ~A;
		4'b0101: out_lu <= ~B;
		4'b0110: out_lu <= A ^ B;
		4'b001: out_lu <= ~(A ^ B);
	default: out_lu <= 16'd0;
endcase

end
endmodule
