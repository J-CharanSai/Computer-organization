`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:40 11/05/2021 
// Design Name: 
// Module Name:    signextension_16 
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
module signextension_16(input [15:0] imm16, output  [31:0] imm32);

	assign imm32[31:0] = { {16{imm16[15]}},imm16[15:0] };


endmodule
