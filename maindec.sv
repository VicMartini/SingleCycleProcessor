module maindec(input logic [10:0] Op, 
					output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
					output logic [1:0] ALUOp);
					
	always_comb 
		begin
			$display("%b",Op);
			casez(Op)
				11'b11111000010 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]}=  9'b000100010; // LDUR
				11'b11111000000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]}=  9'b110001000; // STUR
				11'b10110100??? : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead,  MemWrite, Branch, ALUOp[1:0]} = 9'b100000101; // CBZ
				11'b???0101?000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp[1:0]}=  9'b000100010; // R Instructions			
				default : {Reg2Loc, ALUSrc, MemtoReg, MemRead, RegWrite, MemWrite, Branch, ALUOp[1:0]} = '0;
			endcase
		end

endmodule
