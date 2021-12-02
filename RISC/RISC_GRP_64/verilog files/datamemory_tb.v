`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:27 11/10/2021
// Design Name:   DataMemory
// Module Name:   /home/ise/vm/Assign_7_last_lab/datamemory_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datamemory_tb;

	// Inputs
	reg [4:0] addr;
	reg [31:0] wd;
	reg clk;
	reg writememo;
	reg readmemo;

	// Outputs
	wire [31:0] rd;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.addr(addr), 
		.wd(wd), 
		.clk(clk), 
		.writememo(writememo), 
		.readmemo(readmemo), 
		.rd(rd)
	);
	always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		addr = 0;
		wd = 0;
		clk = 0;
		writememo = 0;
		readmemo = 0;

		// Wait 100 ns for global reset to finish
		#100;
		addr = 1;
      #100;
		addr = 0;
		wd = 36;
		writememo = 1;
      #100;
		addr = 1;
		wd = 60;
		writememo = 1;
		#100;
		addr = 2;
		wd = -4;
		writememo = 1;
      #100;
		writememo = 0;
		addr = 4;
      #100; 
		addr = 5;
      #100;
		addr = 6;
      #100;
		addr = 7;
		#100;
		addr = 8;
      
        
		// Add stimulus here

	end
      
endmodule

