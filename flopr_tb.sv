// test bench for flip-flop register module

module flopr_tb();

	logic clk, reset;
	logic [63:0] d; //I
	logic [63:0] q; //O
	
	logic [63:0] testvectors [9:0]; 
	integer error_count, i;
	
	flopr flopr_instance(.clk(clk), .reset(reset), .d(d), .q(q));
	
	always  // Generate clock pulse
		begin 
			clk = 0; #5; clk = 1; #5;
		end
	
	initial
		begin
		 $readmemh("/home/vmartini/intelFPGA_lite/20.1/Projects/SingleCycleProcessor/testvectors/10x64bit_numbers_hex.tv", testvectors); // Load test vectors
		 i = 0; error_count = 0; reset = 1; // Reset signal is initially on
		end
	
	always @(negedge clk) // Feed numbers into the data port on the falling edge of clk
		begin
			d = testvectors[i]; #10; d = '0;
			if (i >= 4) reset = 0; // Turn the reset signal off, right when the fifth cycle finsihes
			if (i >= 9) // End the simulation after 10 cycles;
				begin
					$display("The simulation has finished, %d errors occurred", error_count);
					$finish;
				end
		end
	
	always @(posedge clk)
		begin
			#1;
			if ((q !== testvectors[i] && i > 4) || (q !== '0 && i <= 0)) error_count += 1;
			$display("Output         | %b", q);
			$display("Expected value | %b", testvectors[i]);
			i += 1;
		end
		
endmodule

