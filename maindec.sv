module maindec(input logic [10:0] Op, input logic ExtIRQ, ExcAck, reset,
					output logic Reg2Loc, output logic [1:0] ALUSrc, output logic MemtoReg, RegWrite, MemRead, MemWrite, Branch,
					output logic [1:0] ALUOp, output logic [3:0] EStatus, output logic ERet, Exc, ExtlAck);
					
	logic NotAnInstr;
	
	logic [3:0] EStatusIntermediate;
	logic ExcIntermediate;
	
	always_comb 
		begin
			$display("%b",Op);
			if (~reset)
				begin
					casez(Op)
						11'b11111000010 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =   16'b0011110000000000; // LDUR
						11'b11111000000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =   16'b1010001000000000; // STUR
						11'b10110100??? : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead,  MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =  16'b1000000101000000; // CBZ
						11'b???0101?000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =   16'b0000100010000000; // R Instructions
						11'b11010110100 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =   16'b0000000101000010;  //ERET 
						11'b11010101001 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =   16'b1100100001000000;  //MRS

						default : {Reg2Loc, ALUSrc, MemtoReg, MemRead, RegWrite, MemWrite, Branch, ALUOp[1:0], EStatusIntermediate, ERet, NotAnInstr} =          16'b0000000000001001;
					endcase
				end
			else
				begin
					{Reg2Loc, ALUSrc, MemtoReg, MemRead, RegWrite, MemWrite, Branch, ALUOp[1:0],EStatusIntermediate, ERet, NotAnInstr} =          16'b0;
				end
		end
	
	assign EStatus = (ExtIRQ) ? 4'b0001 : EStatusIntermediate; 
	assign Exc = ExtIRQ || NotAnInstr;
	assign ExtlAck = ExcAck && ExtIRQ;
	

endmodule
