`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:58:11 03/08/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(clock, reset, INPUT, OUTPUT);
    input clock;
	 input reset;
	 input [31:0] INPUT;
	 output reg [31:0] OUTPUT;
	 initial begin
	    OUTPUT = 0;
	 end
	 always @ (posedge clock)
	 begin
	     if (!reset) OUTPUT = 32'b00000000000000000000000000000000;
		  else OUTPUT = INPUT;
	 end
	 /*always @ (reset)
	 begin
	     OUTPUT = 32'b00000000000000000000000000000000;
	 end*/

endmodule
