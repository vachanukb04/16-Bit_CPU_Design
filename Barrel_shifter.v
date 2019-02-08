module barrelShifter(input [15:0]A, [15:0]B,input [3:0]opcode_shifter,output reg [15:0]out_shift);

reg [15:0]med;

always @(*)
begin
	if (opcode_shifter == 4'b0001)
begin
	case (B)
		16'h0000: begin
		med = A << 0;
		out_shift = {med[15:0]};
	end

		16'h0001: begin
		med = A << 1;
		out_shift = {med[15 : 1], A [15]};
	end

		16'h0002:begin
 		med = A << 2;
		out_shift = {med[15 : 2], A [15:14]};
	end

		16'h0003: begin
 		med = A << 3;
		out_shift = {med[15 : 3], A [15:13]};
	end

		16'h0004: begin
 		med = A << 4;
		out_shift = {med[15 : 4], A [15:12]};
	end

		16'h0005: begin 
		med = A << 5;
		out_shift = {med[15 : 5], A [15:11]};
	end

		16'h0006: begin
		med = A << 6;
		out_shift = {med[15 : 6], A [15:10]};
	end

		16'h0007: begin 
		med = A << 7;
		out_shift = {med[15 : 7], A [15:9]};
	end

		16'h0008: begin 
		med = A << 8;
		out_shift = {med[15 : 8], A [15:8]};
	end

		16'h0009: begin 
		med = A << 9;
		out_shift = {med[15 : 9], A [15:7]};
	end

		16'h000A: begin 
		med = A << 10;
		out_shift = {med[15 : 10], A [15:6]};
	end

		16'h000B: begin 
		med = A << 11;
		out_shift = {med[15 : 11], A [15:5]};
	end

		16'h000C: begin 
		med = A << 12;
		out_shift = {med[15 : 12], A [15:4]};
	end

		16'h000D:begin 
		med = A << 13;
		out_shift = {med[15 : 13], A [15:3]};
	end

		16'h000E: begin
		med = A << 14;
		out_shift = {med[15 : 14], A [15:2]};
	end

		16'h000F: begin
 		med = A << 15;
		out_shift = {med[15 : 15], A [15:1]};
	end

		default : out_shift <= 16'h0000;
	endcase
end

else if(opcode_shifter == 4'b0000)
begin
	case (B)
		16'h0000: begin
		med = A >> 0;
		out_shift = {med[15:0]};
	end

		16'h0001: begin
		med = A >> 1'b1;
		out_shift = {A [0],med[14 : 0]};
	end

		16'h0002:begin
 		med = A >> 2;
		out_shift = {A [1:0],med[13 : 0]};
	end

		16'h0003: begin
 		med = A >> 3;
		out_shift = {A [2:0],med[12 : 0]};
	end

		16'h0004: begin
 		med = A>>4;
		out_shift = {A [3:0],med[11 : 0]};
	end

		16'h0005: begin 
		med = A>>5;
		out_shift = {A [4:0],med[10 : 0]};
	end

		16'h0006: begin
		med = A>>6;
		out_shift = {A [5:0],med[9 : 0]};
	end

		16'h0007: begin 
		med = A>>7;
		out_shift = {A [6:0],med[8 : 0]};
	end
			
		16'h0008: begin 
		med = A>>8;
		out_shift = {A [7:0],med[7 : 0]};
	end

		16'h0009: begin 
		med = A>>9;
		out_shift = {A [8:0],med[6 : 0]};
	end

		16'h000A: begin 
		med = A>>10;
		out_shift = {A [9:0],med[5 : 0]};
	end

		16'h000B: begin 
		med = A>>11;
		out_shift = {A [10:0],med[4 : 0]};
	end

		16'h000C: begin 
		med = A>>12;
		out_shift = {A [11:0],med[3 : 0]};
	end

		16'h000D:begin 
		med = A>>13;
		out_shift = {A [12:0],med[2 : 0]};
	end

		16'h000E: begin
		med = A>>14;
		out_shift = {A [13:0],med[1 : 0]};
	end

		16'h000F: begin
	 	med = A>>15;
		out_shift = {A [14:0],med[0]};
	end

		default : out_shift <= 16'h0000;
	endcase
	end
end
endmodule
