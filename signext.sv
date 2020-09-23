module signext(input logic [31:0] a, output logic[31:0] y);

	always_comb
		begin
			casez(a[31:21])
				11'b111110000?0 : y <=  64'(signed'(a[20:12])); 
				11'b10110100??? : y <= 64'(signed'(a[23:5]));
				default : y <= 0;
			endcase
	end
endmodule

