module tb_CPU ;
reg clk;
reg reset;
wire [15:0] Instruction;
wire [7:0]pc;
wire [15:0]RegisterC;
reg [15:0] memory [31:0];
wire [7:0] temp;

assign temp = pc[7:0];
assign Instruction = memory [temp[7:0]];
initial 
begin
$readmemb("text_vector.txt", memory);
clk = 1'b0;
reset = 1'b1;
#10
reset = 1'b0;
#500 $stop;
end
always begin
#10 clk = ~clk;
end



processor  u1(
.clk(clk),
.reset(reset), 
.Instruction(Instruction),
.pc(pc),
.RegisterC(RegisterC)
);


endmodule
