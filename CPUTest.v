module CPUTest (output error);
	reg testclk;
	CPU DUT(.sysclk(testclk));
	initial
	begin
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
		testclk = 1'b1;
		#10;
		testclk = 1'b0;
		#10;
	end
endmodule
