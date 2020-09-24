module execute(input logic AluSrc, input logic [3:0] AluControl,
					input logic [63:0] PC_E, signImm_E, readData1_E, readData2_E,
					output logic [63:0] PCBranch_E, aluResult_E, writeData_E,
					output logic zero_E);
					
	logic [63:0]  mux_to_alu, sl2_to_adder;
	
	mux2 multiplexer(.d0(readData2_E), .d1(signImm_E), .s(AluSrc), .y(mux_to_alu));
	alu alu_unit(.a(readData1_E), .b(mux_to_alu), .ALUControl(AluControl), .result(aluResult_E));
	sl2 shift_left_two(.a(signImm_E), .y(sl2_to_adder));
	adder adder_unit(.a(PC_E), .b(sl2_to_adder), .y(PCBranch_E));
	
	assign writeData_E = readData2_E;

endmodule

