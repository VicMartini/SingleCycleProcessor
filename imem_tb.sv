module imem_tb();

	logic [5:0] addr; 
	logic [31:0] q;
	integer error_count, i;
	logic [31:0] instructions [0:24] = '{25{0}};
	
	imem imem_instance(.addr(addr), .q(q));
	
	initial 
		begin
			error_count = 0;
			instructions [0:18] = '{32'hf8000000, 32'hf8008001,
											32'hf8010002, 32'hf8018003,
											32'hf8020004, 32'hf8028005,
											32'hf8030006, 32'hf8400007,
											32'hf8408008, 32'hf8410009,
											32'hf841800a, 32'hf842000b,
											32'hf842800c, 32'hf843000d,
											32'hcb0e01ce, 32'hb400004e,
											32'hcb01000f, 32'h8b01000f,
											32'hf803800f};
								
			for(i = 0; i < 19; i+=1)
				begin 
					addr = 6'(i);#5
					if (q !== instructions[i]) error_count += 1;
					$display("Instruction | %b", q);
				end
				
			for (i = 19; i < 25; i += 1)
				begin
					addr = 6'(i);#5
					if (q !== instructions[i]) error_count += 1;
					$display("Instruction %d | %b", i, q);
				end
				
			
			$display("Simulation finished, %d errors were found", error_count);
		end
endmodule