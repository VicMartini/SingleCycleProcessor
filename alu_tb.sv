module alu_tb();

	logic [63:0] a, b, result;
	logic [4:0] ALUControl;
	logic zero;
	integer errors, i, j;
	
	
	alu alu_instance(.a(a), .b(b), .ALUControl(ALUControl), .result(result), .zero(zero));
	
	initial
		begin
			errors = 0;
			for ( i = 0; i < 10; i +=1) // Both positive
				begin
					for ( j = 0; j < 10; j +=1)
						begin

							ALUControl = 4'b0000; a = 64'(i); b = 64'(j);#5; //AND
							if (result !== (64'(i) & 64'(j))) errors += 1;

							ALUControl = 4'b0001; a = 64'(i); b = 64'(j);#5; //OR
							if (result !== (64'(i) | 64'(j))) errors += 1;							
							
							ALUControl = 4'b0010; a = 64'(i); b = 64'(j);#5; // ADD
							if (result !== 64'(i) + 64'(j)) errors += 1;

							ALUControl = 4'b0110; a = 64'(i); b = 64'(j);#5; // SUB
							if (result !== 64'(i) - 64'(j)) errors += 1;

							ALUControl = 4'b0111; a = 64'(i); b = 64'(j);#5; // PASS B
							if (result !== 64'(j)) errors += 1;
							
							ALUControl = 4'b1100; a = 64'(i); b = 64'(j);#5; // NOR 
							if (result !== ~(64'(i) | 64'(j)))errors += 1; 						

							
														
						end
				end
				
				for ( i = 0; i < 10; i +=1) // One negative and one positive
				begin
					for ( j = 0; j > -10; j -=1)
						begin

							ALUControl = 4'b0000; a = 64'(i); b = 64'(j);#5; //AND
							if (result !== (64'(i) & 64'(j))) errors += 1;

							ALUControl = 4'b0001; a = 64'(i); b = 64'(j);#5; //OR
							if (result !== (64'(i) | 64'(j))) errors += 1;							
							
							ALUControl = 4'b0010; a = 64'(i); b = 64'(j);#5; // ADD
							if (result !== 64'(i) + 64'(j)) errors += 1;

							ALUControl = 4'b0110; a = 64'(i); b = 64'(j);#5; // SUB
							if (result !== 64'(i) - 64'(j)) errors += 1;

							ALUControl = 4'b0111; a = 64'(i); b = 64'(j);#5; // PASS B
							if (result !== 64'(j)) errors += 1;
							
							ALUControl = 4'b1100; a = 64'(i); b = 64'(j);#5; // NOR 
							if (result !== ~(64'(i) | 64'(j)))errors += 1; 						

							
														
						end
				end
				$display("The simulation has finished, %d errors occurred", errors);

		end

endmodule
								
							
			