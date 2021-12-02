`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:41 10/22/2021 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
	input [31:0] pc,
	input clk,
	output [31:0] instr
    );
	 INSMEMO insmem(
  .clka(clk),
  .addra(pc[4:0]),
  .douta(instr)
);
	 


endmodule
