module top_processor
(
input wire clk,
input wire reset,
input wire [15:0] Instruction,
output wire [7:0] pc,
output wire [15:0]RegisterC);

wire [31:0] Alu_out;  
wire [15:0]Reg_Cout;
wire we_DM;
wire [15:0]A;
wire [15:0]B;        
wire [15:0]I;     
wire Load_IR;
wire [15:0]datamem_out;
wire Z;         
wire C;
wire Inc_PC;
wire Sel_PC;
wire Load_PC;
wire Load_A;
wire Load_B;
wire Load_C;
wire [1:0]alu_mode;
wire [3:0]opcode_ALU;
wire [3:0] opcode;
wire EQ;
wire GT;
wire ZA;
wire ZB;

assign RegisterC = Reg_Cout;

Instr_reg x1 (Instruction, Load_IR, clk, reset, I, opcode);
CPU_controller x2 (Z, C, clk, reset, I[15:12], Load_IR, Inc_PC, Load_PC, Load_A, Load_B, Load_C, wen_DM, Sel2, opcode_ALU, alu_mode);
data_mem x3 (Reg_Cout, I[11:7] ,datamem_out, clk, reset, wen_DM);
reg_c x4 (Alu_out, clk, reset, Load_C, I[4:0], Sel2, Reg_Cout);
prog_cntr x5 (pc, I[11:7], reset, clk, Inc_PC, Load_PC);
reg_ab x6(datamem_out, clk, reset, Load_A, Load_B, A, B);
ALU x7 (A, B, opcode_ALU, alu_mode, Alu_out, C, Z, EQ, GT, ZA, ZB);

endmodule
