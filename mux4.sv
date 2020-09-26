// 4:1 MULTIPLEXER

module mux4 #(parameter N = 64)
				(input logic [N-1:0] d0, d1, d2, d3, 
				input logic [0:1] s,
				output logic [N-1:0] y);
	always_comb
		begin 
			casez(s)
				00 : y = d0;
				01 : y = d1;
				10 : y = d2;
				11 : y = d3;
			endcase 
		end
endmodule