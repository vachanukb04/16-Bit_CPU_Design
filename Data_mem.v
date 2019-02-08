module data_mem
(
input wire [15:0] Reg_Cout,
input wire [4:0] addr,
output wire [15:0] datamem_out,
input wire clk,
input wire reset,
input wire wen_DM
);

integer i;
reg [15:0]datamem[15:0];

always @(posedge clk or reset)
begin
	if(reset == 1'b1)
		for(i=0;i<16;i=i+1)
		datamem[i] = 16'd0;

	else begin
	if(wen_DM == 1'b1)
 	datamem[addr] <= Reg_Cout; 
	end
end

assign datamem_out = datamem[addr];
endmodule
