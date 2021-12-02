`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:43 11/10/2021
// Design Name:   registerfile
// Module Name:   /home/ise/vm/Assign_7_last_lab/registerF_tb.v
// Project Name:  Assign_7_last_lab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registerF_tb;

	// Inputs
	reg [4:0] r1;
	reg [4:0] r2;
	reg [4:0] wr;
	reg [31:0] wd;
	reg clk;
	reg res;
	reg regwrite;

	// Outputs
	wire [31:0] data1;
	wire [31:0] data2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut (
		.r1(r1), 
		.r2(r2), 
		.wr(wr), 
		.wd(wd), 
		.clk(clk), 
		.res(res), 
		.regwrite(regwrite), 
		.data1(data1), 
		.data2(data2)
	);
always #2 clk = ~clk;
	initial begin
		// Initialize Inputs
		r1 = 0;
		r2 = 0;
		wr = 0;
		wd = 0;
		clk = 0;
		res = 0;
		regwrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		regwrite = 1;
		wr = 14;
		wd = 21;
		#100
		wr = 15;
		wd = 12;
		#100
		regwrite = 0;
		r1 = 14;
		r2 = 15;
		#100 $finish;
		
        
		// Add stimulus here

	end
      
endmodule

