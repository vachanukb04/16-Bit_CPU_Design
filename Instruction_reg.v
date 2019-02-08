module Instr_reg(input [15:0]Instruction, input Load_IR, input clk, input reset, output [15:0]I, output reg[3:0]opcode);

reg [15:0]Irmem;

always @(posedge clk or reset)
begin
	if(reset == 1'b1)
	Irmem <= 16'd0;
	
else
	begin
	if(Load_IR == 1'b1)
	Irmem <= Instruction;
	opcode <= I[15:12];
	end
end

assign I = Irmem;
endmodule
