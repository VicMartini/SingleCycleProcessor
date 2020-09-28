// 4:1 MULTIPLEXER

module mux4 #(parameter N = 64)
				(input logic [N-1:0] d0, d1, d2, d3, 
				input logic [0:1] s,
				output logic [N-1:0] y);
	always_comb
		begin 
			casez(s)
				2'b00 : y = d0;
				2'b01 : y = d1;
				2'b10 : y = d2;
				2'b11 : y = d3;
				default : y = d0;
			endcase 
		end
endmodule