module mux4_tb();

	logic [63:0] d0, d1, d2,d3;
	logic [1:0] s;
	logic [63:0] y;
	
	mux4 mux4_instance(d0, d1, d2, d3, s, y);
	
	initial 
		begin
			d0 = 64'd21; 
			d1 = 64'd22;
			d2 = 64'd23;
			d3 = 64'd24;
			
			#1;
			s = 2'b00;
			#2;
			s = 2'b01;
			#2;		
			s = 2'b10;
			#2;
			s = 2'b11;
			#2;		
		end

endmodule