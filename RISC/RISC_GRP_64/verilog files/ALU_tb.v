`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:16:32 11/11/2021
// Design Name:   ALU
// Module Name:   /home/ise/vm/Assign_7_last_lab/ALU_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [3:0] ALUc;
	reg [31:0] data1;
	reg [31:0] data2;

	// Outputs
	wire [31:0] ALUresult;
	wire b;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.ALUc(ALUc), 
		.data1(data1), 
		.data2(data2), 
		.ALUresult(ALUresult), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		ALUc = 4'b0000;//add
		data1 = 1;
		data2 = 2;
		#10;
      ALUc = 4'b0001;//comp 
		data1 = 5;
		data2 = 6;
		#10;
      ALUc = 4'b0010;// and
		data1 = 12;
		data2 = 23;
		#10;
      ALUc = 4'b0011;//xor
		data1 = 12;
		data2 = 20;
		#10;
      ALUc = 4'b0100;//shllv
		data1 = 1;
		data2 = 2;
		#10;
      ALUc = 4'b0101;//shrlv
		data1 = -1;
		data2 = 2;
		#10;
      ALUc = 4'b0110;//shrav
		data1 = -1;
		data2 = 2;
		#10;
		ALUc = 4'b1100;//br
		data1 = 12;
		data2 = 2;
		#10;ALUc = 4'b1101;//bltz
		data1 = -1;
		data2 = 2;
		#10;ALUc = 4'b1110;//bz
		data1 = 0;
		data2 = 2;
		#10;ALUc = 4'b1110;//bz
		data1 = 2;
		data2 = 2;
		#10;ALUc = 4'b1111;//bnz
		data1 = -1;
		data2 = 2;
		#10;ALUc = 4'b1000;//b
		data1 = -1;
		data2 = 2;
		#10;ALUc = 4'b1001;//bl
		data1 = 1;
		data2 = 2;
		#10;ALUc = 4'b1010;//bcy
		data1 = 1;
		data2 = 2;
		#10;ALUc = 4'b1011;//bncy
		data1 = 1;
		data2 = 2;
		#10;
        
		// Add stimulus here

	end
      
endmodule

