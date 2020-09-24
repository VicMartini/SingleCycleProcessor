module fetch(input logic PCSrc_F, clk, reset, input logic [63:0] PCBranch_F, output logic imem_addr_F);

	logic mux_to_pc;
	logic adder_to_mux;
	logic flopr_output;
	
	mux2 multiplexer(.d0(), .d1(PCBranch_F), .s(PCSrc_F), .y(mux_to_pc));
	flopr flip_flop_register(.clk(clk), .reset(reset), .d(mux_to_pc), .q(flopr_output));
	adder adder_unit(.a(flopr_output), .b(64'd4), .y(adder_to_mux));
	
	assign imem_addr_F = flopr_output;
	
	endmodule
