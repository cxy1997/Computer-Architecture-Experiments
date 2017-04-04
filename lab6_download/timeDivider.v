`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:55 03/28/2017 
// Design Name: 
// Module Name:    timeDivider 
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
module timeDivider(clockIn, clockOut);
	 input clockIn;
	 output clockOut;
	 reg clockOut;
	 
	 reg[23:0] buffer = 0;
	 always@(posedge clockIn)
	 begin
	     buffer <= buffer+1;
		  clockOut <= &buffer;
    end
endmodule
