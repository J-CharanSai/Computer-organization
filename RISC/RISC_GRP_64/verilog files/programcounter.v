`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:40 11/10/2021 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
	input clk,
	input reset,
	input branch, jump,
	input [31:0] pc_in,
	output reg [31:0] pc
    );
	 always @(posedge clk)
	 begin
		if(reset == 1'b1) pc = 0;
		else 
			begin
				if(jump) pc = (pc_in);
				else if(branch) pc = pc+ 1 + (pc_in);
				else pc = pc + 1;
			end
	 end


endmodule
