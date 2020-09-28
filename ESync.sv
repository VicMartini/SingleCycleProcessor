module ESync(input logic set, reset, output logic OUT);
	logic tempOut = 0;
	assign OUT = tempOut;
	always @(posedge set, posedge reset)
		begin
			if (set) tempOut = 1;
			else if (reset) tempOut = 0;
		end
		
endmodule
