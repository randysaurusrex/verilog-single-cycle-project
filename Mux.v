module Mux(
	input [31:0] A,
	input [31:0] B,
	input select,
	output reg [31:0] MuxOut);

	always @(*)
	begin
		case(select) 
		2'b00: MuxOut = A;
		2'b01: MuxOut = B;
		default: MuxOut = 32'dx;
		endcase
	end 
endmodule