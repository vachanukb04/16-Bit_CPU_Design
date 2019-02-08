module ALU (input [15:0]A, input [15:0]B, input [3:0]opcode_ALU, input[1:0]alu_mode, output reg [31:0]Alu_out,  output wire C,Z,EQ,GT,ZA,ZB);
reg [3:0]opcode_au;
reg [3:0]opcode_lu;
reg [3:0]opcode_shifter;
wire [16:0]out_au;
wire [31:0]out_prod;
wire [15:0]out_lu;
wire [15:0]out_shift;

assign Z = (Alu_out == 16'd0)?1:0;

always @(*)
begin
	if(alu_mode == 2'b00)
begin
	opcode_au = opcode_ALU;
	Alu_out<= out_au[15:0];
end

	else if (alu_mode == 2'b01)
	begin
	opcode_lu = opcode_ALU;
	Alu_out <= out_lu;
	end

	else if(alu_mode == 2'b10)
	begin 
	opcode_shifter = opcode_ALU;
	Alu_out <= out_shift;
	end

	else
	begin
	Alu_out <= 16'd0;
	end
end

AU m1(A,B,opcode_au,Cy,out_au,out_prod);
LU m2(A,B,opcode_lu,EQ,GT,ZA,ZB,out_lu);
barrelShifter m3(A,B,opcode_shifter,out_shift);

endmodule

Arithmetic Unit: 
module AU(input [15:0]A, input [15:0]B, input [3:0]opcode_au, output Cy, output reg [16:0]out_au, output reg [31:0]out_prod);

always @(*)
begin
out_au <= 17'd0;
out_prod <= 31'd0;
	case(opcode_au)
		4'b0001: out_au <= A + B;
		4'b0010: out_prod <= A*B;
		4'b0100: out_au <= A/B;
		4'b1000: out_au <= A-B;
	default: begin
		out_au <= 17'd0; 
		out_prod <= 32'd0;
		end
	endcase
end

assign Cy = out_au[16];
endmodule
