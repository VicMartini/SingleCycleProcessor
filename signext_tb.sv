module signext_tb();

	logic [31:0] a;
	logic [64:0] y;
	integer error_count;
	logic [31:0] test_instructions [3:0];
	
	signext signext_instance(.a(a), .y(y));	
														  
	initial 
		begin
			error_count = 0;
			a = '{{11'b11111000010, 9'd16, 2'b00, 5'd5, 5'd6}};#5;
			if (y !== 64'd16) error_count += 1;
			a = '{{11'b11111000000, 9'd124, 2'b00, 5'd5, 5'd6}};#5;
			if (y !== 64'd124) error_count += 1;
			a = '{{11'b11111000000, 9'd192, 2'b00, 5'd5, 5'd6}};#5;
			if (y !== 64'd192) error_count += 1;	
			a = 32'd0;#5;
			if (y !== 64'd0) error_count += 1;	
			$display("Simulation finished, %d errors occurred", error_count);
		end
													  
												
endmodule
