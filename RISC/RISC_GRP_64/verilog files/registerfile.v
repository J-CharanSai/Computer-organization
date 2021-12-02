`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:17 10/22/2021 
// Design Name: 
// Module Name:    registerfile 
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
module registerfile(
input [4:0] r1,
input [4:0] r2,
input [4:0] wr,
input [31:0] wd,
input clk,
input reset,
input regwrite,
input [5:0] op, input[31:0] pc_inR,
output reg [31:0] data1,
output reg [31:0] data2
    );
	 integer i,j;
	 reg [31:0] regs[31:0];
	 /*reg [31:0] d1v, d2v;
	 assign data1 = d1v;
	 assign data2 = d2v;
	 */
	 
	always@(posedge clk)
	begin
		if (reset)
		begin
			for(i = 0;i<32;i=i+1) 
				regs[i] <= 32'd0;
		end
		else
		begin
			#2;
			begin
				data1 <= regs[r1];
				data2 <= regs[r2];
			end
			if(regwrite)
			begin 
				#4;
				regs[wr] <= wd;
			end
			
			if (op == 6'b010101) // branch and link
			begin
				regs[31] <= pc_inR+1;
			end
			
		end
	end
	 


endmodule
