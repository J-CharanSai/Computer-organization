`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:22 11/10/2021
// Design Name:   InstructionMemory
// Module Name:   /home/ise/vm/Assign_7_last_lab/instructiomemory_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructiomemory_tb;

	// Inputs
	reg [31:0] pc;
	reg clk;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.pc(pc), 
		.clk(clk), 
		.instr(instr)
	);
	always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		pc = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		pc = 1;
      #100;
		pc = 2;
      #100;
		pc = 3;
      #100;
		pc = 4;
      #100;
		pc = 5;
      #100;
		pc = 6;
        
		// Add stimulus here

	end
      
endmodule

