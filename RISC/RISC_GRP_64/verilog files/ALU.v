`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:27 10/22/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
input [3:0] ALUc,
input [31:0] data1, 
input [31:0] data2,
output reg [31:0] ALUresult,
output reg b
    );
	 reg carry,sign,overflow,zflag;
	 always @(*)
	 begin
	 b = 1'b0;
		case (ALUc)
			4'b0000: // add
				begin
					{carry,ALUresult}  = data1+data2;
					if((data1 >= 0 && data2 >= 0 && ALUresult<0)||(data1 < 0 && data2 < 0 && ALUresult>=0))
						begin 
							overflow = 1;
						end
					else
						begin 
							overflow = 0;
						end
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1 | overflow == 1) ? 1'b1 : 1'b0;
				end
			4'b0001: //comp
				begin
					{carry,ALUresult}  = ~data2 + 1;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b0010: //and
				begin
					ALUresult = data1 & data2;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b0011: //XOR
				begin
					ALUresult = data1 ^ data2;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b0100: // left shift
				begin
					ALUresult = data1 << data2;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b0101: // right shift
				begin
					ALUresult = data1 >> data2;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
				
			4'b0110: // arithmatic right shift
				begin
					ALUresult = data1 >>> data2;
					overflow = 0;
					carry =  0;
					zflag = (ALUresult == 0) ? 1'b1 : 1'b0;
					sign = (ALUresult[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b1100:
				begin
					ALUresult = data1;
					b = 1'b1;
				end
			4'b1101:
				begin
					ALUresult = 0;
					b = (data1[31] == 1'b1) ? 1'b1 : 1'b0;
				end
			4'b1110:
				begin
					ALUresult = 0;
					b = (data1 == 0) ? 1'b1 : 1'b0;
				end
			4'b1111:
				begin
					ALUresult = 0;
					b = (data1 == 0) ? 1'b0 : 1'b1;
				end
			4'b1000:
				begin
					ALUresult = 0;
					b = 1'b1;
				end
			4'b1001:
				begin
					ALUresult = 0;
					b = 1'b1;
				end
			4'b1010:
				begin
					ALUresult = 0;
					b = ~carry;
				end
			4'b1011:
				begin
					ALUresult = 0;
					b = carry;
				end
			default:
				begin 
					ALUresult = 0;
					b = 1'b0;
				end 
			
		endcase 
	 end
	 
 

endmodule
