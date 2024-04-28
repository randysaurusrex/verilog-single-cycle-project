module ProgramCounter(
	input CLK,
	input [31:0] dataIn,
	output reg [31:0] dataOut);
	
	reg [31:0] pcreg;
	
	initial
	begin
		pcreg = 32'd0;
		dataOut = 32'd0;
	end
	
	always@(posedge CLK)
	begin 
		dataOut = pcreg;
	end
	
	always@(negedge CLK)
	begin
		pcreg <= dataIn;
	end
 
endmodule