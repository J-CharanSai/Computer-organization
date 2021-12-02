`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:50:50 11/10/2021
// Design Name:   programcounter
// Module Name:   /home/ise/vm/Assign_7_last_lab/programcounter_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: programcounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module programcounter_tb;

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

		// Wait 100 ns for global reset to finish
		#16;
		reset = 0;
		#2 branch = 1;
		pc_in = 3;
		#5 jump = 1;
		pc_in = 2;
		#10 $finish;
		
		
        
		// Add stimulus here

	end
      
endmodule

