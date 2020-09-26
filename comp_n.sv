module comp_n #(parameter N = 64) (input logic [63:0] d0, d1, output logic y);

	assign y = (d0 == d1);
	
endmodule


