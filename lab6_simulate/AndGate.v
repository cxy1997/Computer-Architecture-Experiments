`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:42:03 03/27/2017 
// Design Name: 
// Module Name:    AndGate 
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
module And_gate(INPUT1, INPUT2, OUTPUT);
    input INPUT1;
	 input INPUT2;
	 output OUTPUT;
	 assign OUTPUT = INPUT1 & INPUT2;

endmodule
