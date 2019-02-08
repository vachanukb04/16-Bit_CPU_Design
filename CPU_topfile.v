module CPU_controller 
(
input wire Z,
input wire C,
input wire clk,
input wire reset,
input wire [3:0]opcode,
output reg Load_IR,
output reg Inc_PC,
output reg Load_PC,
output reg Load_A,
output reg Load_B,
output reg Load_C,
output reg wen_DM,
output reg  Sel2,
output reg [3:0]opcode_ALU,
output reg [1:0]alu_mode
);
reg [1:0] present_state;
reg temp1,temp2;
reg [1:0] next_state;

parameter rst = 2'b00, fetch = 2'b01, execute =2'b10;
always @(posedge clk or reset)
begin
if(reset == 1'b1)
	present_state <= rst; 
else
	present_state <= next_state;
end

always @ (posedge clk) begin

if(present_state == rst)
begin
	   opcode_ALU <= 4'd0; 
           Load_IR = 1'b0;
           Load_A =1'b0;
           Sel2 <= 1'b0;
           Load_B <= 1'b0;
           Load_C = 1'b0;
           Load_PC = 1'b0;
           Inc_PC <= 1'b0;
           wen_DM = 1'b0;
           alu_mode = 2'b11;           
	   next_state = fetch;
end

else if(present_state == fetch)
begin
 	   Load_IR = 1'b1;
           Load_A =1'b0;
           Sel2 <= 1'b0;
           Load_B <= 1'b0;
           Load_C = 1'b0;
           Load_PC = 1'b0;
           Inc_PC <= 1'b0;
           wen_DM = 1'b0;
           alu_mode = 2'b11; 
	   opcode_ALU <= 4'b0000;  
	   next_state = execute;
end

else if(present_state == execute)
begin
	Load_IR <= 1'b0;
 		case (opcode)
 			4'b0001 : begin    				//ADD operation.
           			opcode_ALU <= opcode;
         			alu_mode  = 2'b00;
				Load_A = 1'b1;
				Load_B =1'b1;
				Load_C = 1'b1;
				wen_DM = 1'b1;
				Sel2 = 1'b1;
 				Load_PC <= 1'b1;
				Inc_PC <= 1'b1;
				if(C==1'b1)temp1 = 1'b1;
				else temp1 =1'b0;
				if(Z==1'b1)temp2 = 1'b1;
				else temp2 =1'b0;
            		end

			4'b1000 : begin   
				opcode_ALU <= opcode;                   // subtract.
              			alu_mode  = 2'b00;
				Load_A = 1'b1;
				Load_B =1'b1;
				Load_C = 1'b1;
				wen_DM = 1'b1;
				Sel2 = 1'b1;
 				Load_PC <= 1'b1;
				Inc_PC <= 1'b1;
				if(C==1'b1)temp1 = 1'b1;
				else temp1 =1'b0;
				if(Z==1'b1)temp2 = 1'b1;
				else temp2 =1'b0;
            		end

			4'b0011 : begin                                  // Store data from Register C to DM
           			opcode_ALU <= 4'b0000;
           			alu_mode <= 2'b11;
           			Load_C <= 1'b0;
				wen_DM = 1'b1;
				Load_B = 1'b0;
				Load_A = 1'b0;
				Load_PC = 1'b0;
				Inc_PC = 1'b1;
				Sel2 = 1'b1;
           		 end

			4'b0100 : begin    
				opcode_ALU <= 4'b0000;
				alu_mode <= 2'b11;
 				Load_C <= 1'b1;
				wen_DM = 1'b0;
				Load_B = 1'b1;
				Load_A = 1'b1;
				Load_PC = 1'b1;
				Inc_PC = 1'b1;
				Sel2 = 1'b0;                       // Load an immediate value into register C.                 
           		end

			4'b0101 : begin                       //  Load a value specified by the address in the IR to A from DM.
  				opcode_ALU <= 4'b0000;
				alu_mode <= 2'b11;
				Load_C <= 1'b0;
				wen_DM = 1'b0;
				Load_B = 1'b0;
				Load_A = 1'b1;
				Load_PC = 1'b0;
				Inc_PC = 1'b1;
				Sel2 = 1'b1;      
  			end

			4'b0110 : begin                  // Load a value specified by the address to B from DM.
				opcode_ALU =4'b0000;
				alu_mode <= 2'b11;
				Load_C <= 1'b0;
				wen_DM = 1'b0;
				Load_B = 1'b1;
				Load_A = 1'b0;
				Load_PC = 1'b0;
				Inc_PC = 1'b1;
				Sel2 = 1'b1;    
			end

			4'b1001: begin      //and
				opcode_ALU = 4'b0000;
				alu_mode  <= 2'b01;
				Load_C <= 1'b1;
				wen_DM = 1'b0;
				Load_B = 1'b1;
				Load_A = 1'b1;
				Load_PC = 1'b0;
				Inc_PC = 1'b1;
				Sel2 = 1'b1;                                
			end            
		endcase

	next_state = fetch;
	end
end
endmodule 
