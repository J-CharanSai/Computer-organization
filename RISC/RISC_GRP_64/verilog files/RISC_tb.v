`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:44 11/11/2021
// Design Name:   KGPRISC
// Module Name:   /home/ise/vm/Assign_7_last_lab/RISC_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGPRISC
// 
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RISC_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire slowclk1;

	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.reset(reset), 
		.slowclk1(slowclk1)
	);
	always #20 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#20.1;
		reset = 0;
        
		// Add stimulus here

	end 
       
endmodule

