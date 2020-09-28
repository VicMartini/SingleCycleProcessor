module fetch(input logic PCSrc_F, clk,input logic reset, EProc_F, input logic [63:0] PCBranch_F, EVAddr_F, output logic [63:0] imem_addr_F, NextPC_F);

	logic [63:0] mux0_to_mux1, mux_to_pc, adder_to_mux, flopr_output;
	
	mux2 multiplexer0(.d0(adder_to_mux), .d1(PCBranch_F), .s(PCSrc_F), .y(mux0_to_mux1));
	mux2 multiplexer1(.d0(mux0_to_mux1), .d1(EVAddr_F), .s(EProc_F), .y(mux_to_pc));
	flopr flip_flop_register(.clk(clk), .reset(reset), .d(mux_to_pc), .q(flopr_output));
	adder adder_unit(.a(flopr_output), .b(64'd4), .y(adder_to_mux));
	
	assign imem_addr_F = flopr_output;
	assign NextPC_F = mux0_to_mux1;
	endmodule
