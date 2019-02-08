module reg_c(input [31:0]Alu_out, input clk, input reset, input Load_C,input [4:0]I, input Sel2, output wire [15:0]Reg_Cout);

reg [15:0]reg_mem;
wire [15:0]mux_out;

assign mux_out = Sel2?Alu_out:{11'd0,I[4:0]};
assign Reg_Cout = reg_mem;

always @(posedge clk or reset)
begin
	if(reset==1'b1)
	reg_mem = 16'd0;
else
	begin
	if(Load_C == 1'b1)
	reg_mem = mux_out;
	end
end

endmodule
