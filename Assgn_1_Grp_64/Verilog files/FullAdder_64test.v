`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// assignment no.: 1
// problem no.: 2(c)
// semester : 5th semester
// group no.: 64
// names of group members: 1. Jatoth Charan Sai
//									2. Tirupathi Suguna Bhaskar
//////////////////////////////////////////////////////////////////////////////////

module FullAdder_64test;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg cin;

	// Outputs
	wire [63:0] s;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	FullAdder_64 uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.carry(carry)
	);

	initial begin
		a = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		b = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		cin = 0;
		#2 
		a = 64'b0000000000000000000000000000000000000000000000000000000000000001;
		b = 64'b0000000000000000000000000000000000000000000000000000000000000001;
		cin = 1;
		#2 
		a = 64'b0110;
		b = 64'b1100;
		cin = 1;
		#2 
		a = 64'b1111111111111111111111111111111111111111111111111111111111110110;
		b = 64'b1111111111111111111111111111111111111111111111111111111111110001;
		cin = 1;
		#2 
		a = 64'b1111111111111111111111111111111111111111111111111111111111111110;
		b = 64'b1111111111111111111111111111111111111111111111111111111111110001;
		cin = 1;
		#2 
		a = 64'b1111111111111111111111111111111111111111111111111111111111111111;
		b = 64'b1111111111111111111111111111111111111111111111111111111111111111;
		cin = 1;
		#2 
$finish;

	end
      
endmodule
