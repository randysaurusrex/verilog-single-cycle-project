module DataMemory(
	input CLK,
	input MemWrite,
	input MemRead,
	input [31:0] Address,
	input [31:0] WriteData,
	output [31:0] ReadData);
	
	reg [31:0] dataMemory [0:1023];
	
	initial begin
	$readmemh("initdatamemfinal.txt", dataMemory);
	end 
	
	always @(posedge CLK)
	begin
		if (MemWrite == 1'b1)
		begin
			dataMemory[Address] <= WriteData;
		end
	end
	assign ReadData = dataMemory[Address];
endmodule
