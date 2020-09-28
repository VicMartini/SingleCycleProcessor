module ESync(input logic set, reset, output logic OUT);
	logic tempOut = 0;
	assign OUT = tempOut;
	always_ff @(posedge set, posedge reset)
		begin
			if (set) begin tempOut = 1; $display("SET"); end
			if (reset) begin tempOut = 0; $display("RESET"); end
		end
		
endmodule
