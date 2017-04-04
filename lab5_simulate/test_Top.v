`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:31:59 03/15/2017
// Design Name:   Top
// Module Name:   E:/cxy/lab5/test_Top.v
// Project Name:  LAB5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Top;

	// Inputs
	reg clk;
	reg reset;
	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.reset(reset)
	);
   always #50 clk <= ~ clk;
	initial begin
		clk <= 0;
		reset <= 0;
      #1100 reset <= 1;
	end
      
endmodule

