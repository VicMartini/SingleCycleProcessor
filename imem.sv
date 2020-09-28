module imem #(parameter N = 32)(input logic [5:0] addr, output logic [N-1:0] q);

	logic [N-1:0] memory [0:63] = '{64{0}};
	
	initial
		begin 
		/*	
			ORIGINAL PROGRAM
			memory[0:18] = '{32'hf8000000, 32'hf8008001,
								32'hf8010002, 32'hf8018003,
								32'hf8020004, 32'hf8028005,
								32'hf8030006, 32'hf8400007,
								32'hf8408008, 32'hf8410009,
								32'hf841800a, 32'hf842000b,
								32'hf842800c, 32'hf843000d,
								32'hcb0e01ce, 32'hb400004e,
								32'hcb01000f, 32'h8b01000f,
								32'hf803800f};
		*/
		
		$readmemh("/home/vmartini/intelFPGA_lite/20.1/Projects/ProcessorWithExceptions/program.tv", memory);
		
		
		end
		
	assign q = memory[addr];

endmodule
