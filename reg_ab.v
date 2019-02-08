module reg_ab(input [15:0]datamem_out, input clk, input reset, input Load_A, input Load_B, output wire [15:0]A, output wire [15:0]B);
reg [15:0]A_mem;
reg [15:0]B_mem;

always @(posedge clk or reset)
begin
	if(reset == 1'b1)
	begin

	A_mem = 16'd0;
	B_mem  = 16'd0;
	end

else
	begin
	if(Load_A == 1'b1)
	A_mem <= datamem_out;
		if(Load_B == 1'b1)
		B_mem <=datamem_out;
	end
end 

assign A = A_mem;
assign B = B_mem;
endmodule
reg_a
