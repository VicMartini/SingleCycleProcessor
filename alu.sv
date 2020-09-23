module alu(input logic [63:0] a, input logic [63:0] b, input logic [3:0] ALUControl, output logic [63:0] result, output logic zero);

	always_comb
		begin 
			casez(ALUControl)
				4'b0000 : begin result = a & b; $display("MATCH a = %d, b = %d",a, b); end
				4'b0001 : result = a | b;
				4'b0010 : result = a + b;
				4'b0110 : result = a - b;
				4'b0111 : result =  b;
				4'b0010 : result = ~(a | b);
				default : result = b;
			endcase
			zero = 64'(result == zero);
		end

		
endmodule


				