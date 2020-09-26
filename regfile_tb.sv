module regfile_tb();

	logic clk, we3; 
	logic [4:0] ra1, ra2, wa3;
	logic [63:0] rd1, rd2, wd3;
	integer error_count = 0;
	integer i = 0;
	
	regfile regfile_instance(.clk(clk), .we3(we3), .ra1(ra1), .ra2(ra2), .wa3(wa3), .wd3(wd3), 
									 .rd1(rd1), .rd2(rd2));
	initial 
		begin 
			ra1 = 0; ra2 = 0; wa3 = 0; we3 = 0; wd3 = 0; 
		end
	always  // Generate clock pulse
		begin 
			clk = 1; #5; clk = 0; #5;
		end

	always @(negedge clk)
		begin
			ra1 <= i; ra2 <= i;#2;
			$display("READ %d | %d", rd1, rd2);
			if((rd1 !== i) | (rd2 !==i)) error_count += 1;
			i += 1;

		end
	
	always @(posedge clk)
		begin
			we3 <= 1; wa3 <= 64'(i); wd3 = 64'd848;#2;
			ra1 = 5'(i);
			$display("---------------------------------------------");
			$display("wa3 : %d | ra1 = %d | rd1 = %d", wa3, ra1, rd1);
			$display("---------------------------------------------");
			if (i == 30)
				begin
					$display("Simulation finished, %d errors were found", error_count);
					$finish;
				end
		end
		
endmodule
			
			
			