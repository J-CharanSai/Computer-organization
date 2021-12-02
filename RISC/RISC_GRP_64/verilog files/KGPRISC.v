`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:39 10/22/2021 
// Design Name: 
// Module Name:    KGPRISC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module KGPRISC(
input clk,
input reset,
output slowclk1
    );
	 
	 reg slowclk1,slowclk2;
	 always @(clk)
	 begin
		#1;
		slowclk1 = clk;
		#4;
		slowclk2 = clk;
	 end
	 wire [31:0]  instr, pc_in,pc;
	 wire branch_pc, jump_pc;
	 wire [15:0] imm16;
	 wire [20:0] imm21;
	 wire [31:0] imm32_1,imm32_2,imm32;
	 wire variable,branch,jump,readmemo,ALUsrc,mem2reg,writememo,UCbranch,regwrite,wreg,blreturn;
	 wire [3:0] ALUop,ALUc;
	 wire [4:0] r2,wr;
	 wire [31:0] wrtdata,data1,data2,aluin2;
	 wire b;
	 wire [31:0] ALUresult;
	 wire [31:0] readdata;
	 
	 ProgramCounter pc11(.clk(clk),
								.reset(reset),
								.branch(branch_pc),
								.jump(jump_pc),
								.pc_in(pc_in),
								.pc(pc));
	 InstructionMemory im1(.pc(pc),
							.clk(slowclk1),
							.instr(instr));
	 
	 assign imm16 = instr[15:0];
	 assign imm21 = instr[20:0];
	 
	 signextension_16 se16(.imm16(imm16),.imm32(imm32_1));
	 signextension_21 se21(.imm21(imm21),.imm32(imm32_2));
	 
	 controller ctrl(.opcode(instr[31:26]),
						  .func(instr[5:0]),
						  .variable(variable),.branch(branch),.jump(jump),.blreturn(blreturn),
						  .readmemo(readmemo),.ALUsrc(ALUsrc),.mem2reg(mem2reg),
						  .writememo(writememo),.UCbranch(UCbranch),.regwrite(regwrite),
						  .wreg(wreg),.ALUop(ALUop));
						  
	 assign imm32 = (UCbranch == 1'b1) ? imm32_2 : imm32_1;
	 assign r2 = (variable == 1'b1) ? instr[20:16] : instr[15:11];
	 assign wr = (wreg == 1'b1) ? instr[20:16] : instr[25:21];
	 //assign pc_in = imm32;
				
	 registerfile registers(.r1(instr[25:21]),
									.r2(r2),
									.wr(wr),
									.wd(wrtdata),
									.clk(clk),
									.reset(reset),
									.pc_inR(pc),.op(instr[31:26]),
									.regwrite(regwrite),
							 		.data1(data1),
									.data2(data2));
						
	 assign pc_in = (blreturn == 1'b1) ? data1 : imm32;
		
	 ALUcrtl aluc1(.op(instr[31:26]),
				.ALUop(ALUop),
				.ALUc(ALUc));
	 

	 assign aluin2 = (ALUsrc == 1'b1) ? imm32 : data2;
				
    ALU alu1(.ALUc(ALUc),
			.data1(data1), 
			.data2(aluin2),
			.ALUresult(ALUresult),
			.b(b));
	 
	 assign branch_pc = branch & b;
	 //assign jump_pc = (jump & b);
	 assign jump_pc = (jump & b) || blreturn;
			
	DataMemory dm1(.addr(ALUresult[4:0]),
						.wd(data2),
						.clk(slowclk2),.readmemo(readmemo),
						.writememo(writememo),
						.rd(readdata));
	
	 assign wrtdata = (mem2reg == 1'b1) ? readdata : ALUresult;

endmodule
