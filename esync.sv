module ESync(input logic set, reset, output logic OUT);

	always_ff @(posedge set, posedge reset)
		begin
			if (set) OUT = 1'b1;
			if (reset) OUT = 1'b0;
		end
		
endmodule
