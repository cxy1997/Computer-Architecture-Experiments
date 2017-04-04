`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:49:00 03/27/2017
// Design Name:   Top
// Module Name:   D:/myFPGA/cxy/lab6/test_Top.v
// Project Name:  lab6
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
   reg PCButton;
	reg ALUButton;
	wire [7:0] LED;
	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clock(clk), 
		.PCButton(PCButton),
		.ALUButton(ALUButton),
		.reset(reset),
		.LED(LED)
	);
   always #50 clk <= ~ clk;
	initial begin
		clk <= 0;
		reset <= 0;
		PCButton <= 1;
		ALUButton <= 0;
      #1100 reset <= 1;
	end
      
endmodule

