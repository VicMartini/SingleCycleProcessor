module ESync(input logic set, reset, output logic OUT);

	always_ff @(posedge set, posedge reset)
		begin
			if (set) OUT = 1;
			if (reset) OUT = 1;
		end
		
endmodule
