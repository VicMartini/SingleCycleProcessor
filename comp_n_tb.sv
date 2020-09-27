module comp_n_tb(); 

	logic [63:0] d0, d1;
	logic y;
	
	comp_n comp_n_instance(d0, d1, y);
	
	initial
		begin
			d0 <= 64'd 52;d1 <= 64'd 52;#20;
			d0 <= 64'd 54;d1 <= 64'd 52;#20;	
			d0 <= 64'd 52;d1 <= 64'd 55;#20;
			d0 <= 64'd 55;d1 <= 64'd 55;#20;
		end
endmodule
