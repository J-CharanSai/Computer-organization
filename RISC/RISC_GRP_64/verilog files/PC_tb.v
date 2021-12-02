`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:11:09 11/11/2021
// Design Name:   ProgramCounter
// Module Name:   /home/ise/vm/Assign_7_last_lab/PC_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_tb;

	// Inputs
	reg clk;
	reg reset;
	reg branch;
	reg jump;
	reg [31:0] pc_in;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.clk(clk), 
		.reset(reset), 
		.branch(branch), 
		.jump(jump), 
		.pc_in(pc_in), 
		.pc(pc)
	);
	always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		branch = 0;
		jump = 0;
		pc_in = 0;
		#5 reset = 0;
		#100;
		jump = 1;
		pc_in = 12;
		#4 jump = 0;
		#100;
		branch = 1;
		pc_in = 3;
		#4 branch = 0;
        
		// Add stimulus here

	end
      
endmodule

