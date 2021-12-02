`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:03 10/22/2021 
// Design Name: 
// Module Name:    controller 
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
`define f0 6'b000000
`define f1 6'b000001
`define f2 6'b000010
`define f3 6'b000011
`define f4 6'b000100
`define f5 6'b000101
`define f6 6'b000110

`define aluAddi 6'b100010
`define aluCompi 6'b100011

`define LW 6'b100100
`define SW 6'b100101

`define b 6'b010000
`define bl 6'b010101
`define bcy 6'b010110
`define bncy 6'b010111

`define br 6'b010001
`define bltz 6'010010
`define bz 6'b010011
`define bnz 6'b010100

module controller(
input [5:0] opcode,
input [5:0] func,
output reg variable,branch,jump,readmemo,ALUsrc,mem2reg,writememo,UCbranch,regwrite,wreg,blreturn,
output reg [3:0] ALUop
    );
	 
	 always @(*)
		begin
			variable = 1'b0; regwrite = 1'b0;
			writememo = 1'b0; mem2reg = 1'b0;
			UCbranch = 1'b0; readmemo = 1'b0;
			wreg = 1'b0;
			branch = 1'b0; ALUsrc = 1'b0;
			jump = 1'b0; ALUop = 4'b0000;
			blreturn = 1'b0;
			case (opcode)
				6'b000000://R- type
					begin
						case (func)
							`f0: // add 
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b000;
								end
							`f1: // comp
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b001;									
								end
							`f2: // and
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b010;
								end
							`f3: // xor
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b011;									
								end
							`f4: // shllv
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b100;
								end
							`f5: // shrlv
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b101;									
								end
							`f6: // shrav
								begin
									variable = 1'b1; regwrite = 1'b1;
									ALUop[2:0] = 3'b110;
								end
							default:
								begin
									ALUop = 4'b1111;
								end
						endcase
					end
				6'b000001: // R-type
					begin
						case(func)
							`f4: // shll
								begin
									regwrite = 1'b1;
									ALUop[2:0] = 3'b100;
								end
							`f5: // shrl
								begin
									regwrite = 1'b1;
									ALUop[2:0] = 3'b101;									
								end
							`f6: // shra
								begin
									regwrite = 1'b1;
									ALUop[2:0] = 3'b110;
								end
							default:
								begin
									ALUop = 4'b0000;
								end
						endcase
					end
				`aluAddi:
					begin
						regwrite = 1'b1;ALUsrc = 1'b1;
					end 
				`aluCompi:
					begin
						regwrite = 1'b1;ALUsrc = 1'b1;
						ALUop[2:0] = 3'b001;
					end 
				`SW:
					begin
						variable = 1'b1; writememo = 1'b1;
						ALUsrc = 1'b1;
						ALUop = 4'b0000;
					end
				`LW:
					begin
						mem2reg = 1'b1;wreg = 1'b1;
						variable = 1'b1; regwrite = 1'b1;
						ALUsrc = 1'b1; readmemo = 1'b1;
						ALUop = 4'b0000;
					end
				`b:
					begin
						jump = 1'b1;
					end
				`bl:
					begin 
						jump = 1'b1;
						ALUop[2:0] = 3'b001;
					end
				`bcy:
					begin
						jump = 1'b1;
						ALUop[2:0] = 3'b010;
					end
				`bncy:
					begin 
						jump = 1'b1;
						ALUop[2:0] = 3'b011;
					end
				`br:
					begin 
						jump = 1'b1;
						blreturn = 1'b1;
						ALUop[2:0] = 3'b100;
					end
				`bz:
					begin 
						branch = 1'b1;
						UCbranch = 1'b1;
						ALUop[2:0] = 3'b110;
					end
				`bnz:
					begin 
						branch = 1'b1;
						UCbranch = 1'b1;
						ALUop[2:0] = 3'b111;
					end
				default:  // bltz
				begin 
					branch = 1'b1;
					UCbranch = 1'b1;
					ALUop = 4'b0101;
				end
			endcase
		end


endmodule
