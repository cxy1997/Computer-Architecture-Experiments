`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:52:04 03/27/2017 
// Design Name: 
// Module Name:    Mux 
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
module Mux_5(SEL, INPUT1, INPUT2, OUTPUT);
    input SEL;
	 input [4:0] INPUT1;
	 input [4:0] INPUT2;
	 output [4:0] OUTPUT;
	 assign OUTPUT = (SEL) ? INPUT2 : INPUT1;
endmodule

module Mux_32(SEL, INPUT1, INPUT2, OUTPUT);
    input SEL;
	 input [31:0] INPUT1;
	 input [31:0] INPUT2;
	 output [31:0] OUTPUT;
	 assign OUTPUT = (SEL) ? INPUT2 : INPUT1;
endmodule
