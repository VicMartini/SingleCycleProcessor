// Testbench SingleCycleProcessorPatterson
// Top-level Entity: processor_arm

module processor_tb();
	localparam  N = 64;
	logic        	CLOCK_50, reset;
	logic        	DM_writeEnable;
	logic [N-1:0] 	DM_writeData, DM_addr;
	logic 			dump, ExtIRQ;
	logic ExtlAck;
	
  // instantiate device under test
  processor_arm  dut (CLOCK_50, reset, DM_writeData, DM_addr, DM_writeEnable, ExtlAck, dump, ExtIRQ);
    
  // generate clock
  always     // no sensitivity list, so it always executes
    begin
      #5 CLOCK_50 = ~CLOCK_50; 
    end
	 
	 
  initial
    begin
		ExtIRQ = 0; 
      CLOCK_50 = 0; reset = 1; dump = 0;
      #20 reset = 0; 
		#40; ExtIRQ = 1;#10; ExtIRQ = 0;
		#167; ExtIRQ = 1;#10; ExtIRQ = 0;

      #670 dump = 1; 
	  #20 $stop;
	end 
endmodule

