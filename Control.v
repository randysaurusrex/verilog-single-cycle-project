module Control(
  input [6:0] OpCode,
  output MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, Branch, Jump,
  output [1:0] ALUOp);
  reg [8:0] control;
  always @(*)
  begin
    case (OpCode)
      7'b0110011 : control <= 9'b001000010; // R-type
		7'b0000011 : control <= 9'b111100000; // L-type [ld]
		7'b0100011 : control <= 9'b1x0010000; // S-type
		7'b1100011 : control <= 9'b0x0001001; // SB-type
		7'b0010011 : control <= 9'b101000011; // I-type
		7'b1101111 : control <= 9'b111xx0100; // jal-type
		default : control    <= 9'bxxxxxxxxx;
    endcase
  end
  
  assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp} = control;

endmodule