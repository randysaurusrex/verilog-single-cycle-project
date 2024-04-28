module ALUControl(
	input funct7,
	input [2:0] funct3,
	input [1:0] ALUOp,
	output reg [3:0] ALUControl);
	
	always @(*)
	begin
	case (ALUOp)
		2'b00 : ALUControl = 4'b0010; // load/store
		2'b01 : ALUControl = 4'b0110; // branch
		2'b11 : ALUControl = 4'b0010; // addi
		default : ALUControl = 4'bxxxx;
	endcase
	case({funct7,funct3})
		4'b0000 : ALUControl = 4'b0010; // add
		4'b1000 : ALUControl = 4'b0110; // sub
		4'b0111 : ALUControl = 4'b0000; // and
		4'b0110 : ALUControl = 4'b0001; // or
		default : ALUControl = 4'bxxxx;
	endcase
	end
endmodule