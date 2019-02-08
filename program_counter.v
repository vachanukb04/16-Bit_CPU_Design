module prog_cntr(
output [7:0] insaddr,
input wire [4:0] addr,
input wire reset,
input wire clk,
input wire Inc_PC,
input wire Load_PC
);

reg [7:0] pc;

always @(posedge clk or reset)
begin
	if(reset == 1'b1 ) 
		pc <= 8'd0;
	
	else begin 
		if(Load_PC == 1'b1) 
		pc <= 8'd0;
		
	else begin 
		if(Load_PC == 1'b1)  
		pc <= {3'b0, addr};
	else begin
		if(Inc_PC == 1'b1)
		pc  <= pc+1;
		
	else pc <= pc;
end
end
end
end
assign insaddr = pc;
endmodule
