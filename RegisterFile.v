module RegisterFile(
	input clk,
	input RegWrite,
	input [4:0] WriteReg,
	input [31:0] WriteData,
	input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	output [31:0] ReadData1,
	output [31:0] ReadData2);
	
	reg [31:0] regfile [0:31];
	
	initial begin
		$readmemh("initregfinal.txt", regfile);
	end
	 
	always @(posedge clk)
	begin
		if (RegWrite == 1'b1)
				regfile[WriteReg] <= WriteData; // write
	end
	
	// read
	assign ReadData1 = (ReadReg1 == 0) ? 32'b0 : regfile[ReadReg1];
	assign ReadData2 = (ReadReg2 == 0) ? 32'b0 : regfile[ReadReg2];
	
endmodule
