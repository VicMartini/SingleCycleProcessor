module alu_tb();

	logic [63:0] a, b, result;
	logic [4:0] ALUControl;
	logic zero;
	integer errors, i, j;
	
	
	alu alu_instance(.a(a), .b(b), .ALUControl(ALUControl), .result(result), .zero(zero));
	
	initial
		begin
			errors = 0;
			for ( i = 0; i < 10; i +=1) 
				begin
					for ( j = 0; j < 10; j +=1)
						begin
							ALUControl = 4'b0010; a = 64'(i); b = 64'(j);#5;
							if (result !== 64'(i) + 64'(j)) errors += 1;
							$display("result %d", result);
						end
				end
				$display("The simulation has finished, %d errors occurred", errors);

		end

endmodule
								
							
			