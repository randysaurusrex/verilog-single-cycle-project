module ImmGen(input [31:0] instruction,
              output reg [31:0] immExt);
		
	always @(*)
	begin
		case(instruction[6:0])
		7'b0110011: // All R-type instructions
			immExt = 32'd0;
		7'b0010011: // Standard I-type instructions
		begin
			if (instruction[14:12] == 3'h3) // SLTIU zero-extends
			begin
				immExt = {20'h00000, instruction[31:20]};
			end
			else
			begin
				immExt = (instruction[31] == 1'b1) ? {20'hfffff, instruction[31:20]} : {20'h00000, instruction[31:20]};
			end
		end
		7'b0000011: // Loads
		begin
			if (instruction[14:12] == 3'h4 || instruction[14:12] == 3'h5) // LBU or LHU zero-extend
			begin
				immExt = {20'h00000, instruction[31:20]};
			end
			else
			begin
				immExt = (instruction[31] == 1'b1) ? {20'hfffff, instruction[31:20]} : {20'h00000, instruction[31:20]};
			end
		end
		7'b0100011: // Stores
			immExt = (instruction[31] == 1'b1) ? {20'hfffff, instruction[31:25], instruction[11:7]} : {20'h00000, instruction[31:25], instruction[11:7]};
		7'b1100011: // Branches
			if (instruction[14:12] == 3'h6 || instruction[14:12] == 3'h7) // BLTU or BGEU zero-extend
			begin
				immExt = {20'h00000, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
			end
			else // everything else
			begin
				immExt = (instruction[31] == 1'b1) ? {20'hfffff, instruction[7], instruction[30:25], instruction[11:8], 1'b0} : {20'h00000, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
			end
		7'b1101111: // JAL
			immExt = (instruction[31] == 1'b1) ? {12'hfff, instruction[19:12], instruction[20], instruction[30:21], 1'b0} : {12'h000, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
		7'b1100111: // JALR
			immExt = (instruction[31] == 1'b1) ? {20'hfffff, instruction[31:20]} : {20'h00000, instruction[31:20]};
		default: immExt = 32'hx;
		endcase
	end
endmodule
