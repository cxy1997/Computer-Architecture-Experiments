`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:59 02/22/2017 
// Design Name: 
// Module Name:    Alu 
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
module Alu(input1, input2, aluCtr, zero, aluRes);
    input [31:0] input1;
    input [31:0] input2;
    input [3:0] aluCtr;
    output zero;
    output [31:0] aluRes;
	 reg zero;
	 reg [31:0] aluRes;
	 
	 always @ (input1 or input2 or aluCtr)
	 begin
	     if (aluCtr == 4'b0010) //add
		      aluRes = input1 + input2;
		  else if (aluCtr == 4'b0110) //sub
		      aluRes = input1 - input2;
		  else if (aluCtr == 4'b0000) //and
		      aluRes = input1 & input2;
		  else if (aluCtr == 4'b0001) //or
		      aluRes = input1 | input2;
		  else if (aluCtr == 4'b0111) //slt
		      if (input1 < input2)
				    aluRes = 1;
				else
				    aluRes = 0;
		  else if (aluCtr == 4'b1100) //NOR
            aluRes = ~(input1 | input2);
		  
		  if (aluRes == 0)
				zero = 1;
		  else
				zero = 0;
    end
endmodule
