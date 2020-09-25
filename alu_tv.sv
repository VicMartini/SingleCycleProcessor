module alu_tb();

	logic [63:0] a, b, result;
	logic [4:0] ALUControl;
	logic zero;
	integer errors, i, j;
	
	
	alu alu_instance(.a(a), .b(b), .result(result), .zero(zero));
	
	initial
		begin
			for( i = 0; i < 32; i +=1) testnumbers[i] = 64'd'(i);
			
			for ( i = 0; i < 32; i +=1) 
				begin
					for ( j = 0; i < 32; i +=1)
						begin
							ALUControl = 4'b0000; a = 64'd'(i); a = 64'd'(j);#5;
							if ((result !== a & b) | (result == 0 && zero !== 0)) errors += 1;
						end
				end
		end
		$display("")
endmodule
								
							
			