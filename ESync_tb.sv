module ESync_tb();

	logic set, reset, OUT;
	ESync esync_instance(set, reset, OUT);
	initial
		begin 
			set = 1;#1; set = 0;#20;
			reset = 1; #1; reset = 0; #30;
			set = 1;#1; set = 0;#50;
			reset = 1; #20; reset = 0; #30;
		end
endmodule

