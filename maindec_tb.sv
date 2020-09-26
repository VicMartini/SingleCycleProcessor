module maindec_tb();

	logic [10:0] Op; 
	logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
	logic [1:0] ALUOp;
	
	maindec maindec_instance(Op, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
	
	initial 
		begin 
			Op = 11'b11111000010;#2;
			$display("%b | 000100010",  {Reg2Loc, ALUSrc, MemtoReg, MemRead, RegWrite, MemWrite, Branch, ALUOp[1:0]});
			Op = 11'b11111000000;#2;
			$display("%b | 110001000",  {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]});
			Op = 11'b10110100000;#2;
			$display("%b | 100000101",  {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]});
			Op = 11'b0001010000;#2;
			$display("%b | 000100010",  {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]});
			Op = 11'b00000000000;#2;
			$display("%b | 000000000",  {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]});
		end
endmodule
