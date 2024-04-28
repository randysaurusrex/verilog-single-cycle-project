module InstructionMemory(
	input [31:0] A,
	output reg [31:0] ID);
	
	reg [31:0] instMemory [0:1023];

	initial begin
		$readmemh("a.out", instMemory);
	end
	
always @(A)
	begin 
		ID <= instMemory[A];
	end
endmodule
