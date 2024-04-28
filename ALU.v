module ALU(
	input [31:0] A,
	input [31:0] B,
	input [3:0] ALUControl,
	output reg [31:0] Result,
	output Zero);

	always @(*)
	begin
		case (ALUControl)
			4'b0000 : Result = A & B; // and
			4'b0001 : Result = A | B; // or
			4'b0010 : Result = A + B; // add
			4'b0110 : Result = A - B; // sub
			default : Result = A + B;
		endcase
	end
	
	assign Zero = (Result == 0) ? 1 : 0;
	
endmodule