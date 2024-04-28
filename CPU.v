module CPU(input sysclk);
	
	wire [31:0] PCIn, PCOut;
	wire [3:0] ALUControl;
	wire MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, Branch, Jump;
	wire [1:0] ALUOp;
	wire [31:0] instruction;
	wire signed [31:0] imm;
	wire [31:0] WriteData, ReadData1, ReadData2, MuxOut;
	wire [31:0] ALUResult;
	wire [31:0] ReadDataMem;
	wire Zero;
	wire [31:0] PC4, PCImm;
	wire mux3select;

	ProgramCounter pc(.CLK(sysclk), .dataIn(PCIn), .dataOut(PCOut));
	
	InstructionMemory inmem(.A(PCOut), .ID(instruction));
	
	Control controlUnit(.OpCode(instruction[6:0]), 
							  .MemRead(MemRead),
							  .MemWrite(MemWrite), 
							  .MemToReg(MemToReg), 
							  .ALUSrc(ALUSrc), 
							  .RegWrite(RegWrite), 
							  .Branch(Branch), 
							  .Jump(Jump), 
							  .ALUOp(ALUOp));
						
	
	RegisterFile regFile(.clk(sysclk), 
								.RegWrite(RegWrite), 
								.WriteReg(instruction[11:7]), 
								.WriteData(WriteData), 
								.ReadReg1(instruction[19:15]), 
								.ReadReg2(instruction[24:20]), 
								.ReadData1(ReadData1), 
								.ReadData2(ReadData2));
								
	ImmGen immgen(.instruction(instruction), .immExt(imm));
	
	Mux ALUmux(.A(ReadData2), .B(imm), .select(ALUSrc), .MuxOut(MuxOut));
	
	ALUControl aluControl(.funct7(instruction[30]), 
								 .funct3(instruction[14:12]), 
								 .ALUOp(ALUOp), 
								 .ALUControl(ALUControl));
								 
	ALU alu(.A(ReadData1), 
			  .B(MuxOut), 
			  .ALUControl(ALUControl), 
			  .Result(ALUResult), 
			  .Zero(Zero));
			  
	DataMemory datamem(.CLK(sysclk), 
							 .MemWrite(MemWrite), 
							 .MemRead(MemRead), 
							 .Address(ALUResult), 
							 .WriteData(ReadData2), 
							 .ReadData(ReadDataMem));
							 
	Mux mux2(.A(ALUResult), .B(ReadDataMem), .select(MemtoReg), .MuxOut(WriteData));
	
	Adder add4(.A(PCOut), .B(32'b0000000000000000000000000000001), .Sum(PC4));
	
	Adder addImm(.A(PCOut), .B(imm), .Sum(PCImm));
	
	assign mux3select = Jump | (Branch & Zero);
	
	Mux mux3(.A(PC4), .B(PCImm), .select(mux3select), .MuxOut(PCIn));
	
endmodule
