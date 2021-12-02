`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:22 11/05/2021 
// Design Name: 
// Module Name:    signextension_21 
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
module signextension_21(input [20:0] imm21, output  [31:0] imm32);

	assign imm32[31:0] = { {11{imm21[20]}},imm21[20:0] };


endmodule
