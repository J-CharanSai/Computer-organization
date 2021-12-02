`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:54 10/22/2021 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
input [4:0] addr,
input [31:0] wd,
input clk,readmemo,
input writememo,
output [31:0] rd
    );
	 
/*input clka;
input ena;
input [0 : 0] wea;
input [4 : 0] addra; 
input [31 : 0] dina;
output [31 : 0] douta;*/ 
	 
	 //parameter ena = 1'b1;
	 DATAMEMO datamem(.clka(clk),.wea(writememo),.addra(addr[4:0]),.dina(wd),.douta(rd));

endmodule
