`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:26:49 03/27/2017
// Design Name:   cache_32
// Module Name:   D:/myFPGA/cxy/lab6/test_cache.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cache_32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cache;

	// Inputs
	reg clock;
	reg reset;
	reg [31:0] INPUT;

	// Outputs
	wire [31:0] OUTPUT;

	// Instantiate the Unit Under Test (UUT)
	cache_32 uut (
		.clock(clock), 
		.reset(reset), 
		.INPUT(INPUT), 
		.OUTPUT(OUTPUT)
	);
   
   always #50 clock <= ~ clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		INPUT = 0;

		// Wait 100 ns for global reset to finish
		#100;
      INPUT = 32;
		// Add stimulus here

	end
      
endmodule

