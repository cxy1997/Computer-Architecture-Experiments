`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:33:45 03/27/2017 
// Design Name: 
// Module Name:    Adder 
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
module Adder(INPUT1, INPUT2, OUTPUT);
    input wire [31:0] INPUT1;
	 input wire [31:0] INPUT2;
	 output wire [31:0] OUTPUT;
	 assign OUTPUT = INPUT1 + INPUT2;

endmodule