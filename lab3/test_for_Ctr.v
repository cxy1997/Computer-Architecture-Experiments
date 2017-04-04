`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:05 02/22/2017
// Design Name:   Ctr
// Module Name:   E:/cxy/lab3/test_for_Ctr.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ctr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_for_Ctr;

	// Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDst;
	wire aluSrc;
	wire memToReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire branch;
	wire [1:0] aluOp;
	wire jump;

	// Instantiate the Unit Under Test (UUT)
	Ctr uut (
		.opCode(opCode), 
		.regDst(regDst), 
		.aluSrc(aluSrc), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOp(aluOp), 
		.jump(jump)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		#100 opCode = 6'b100011;
		#100 opCode = 6'b101011;
		#100 opCode = 6'b000100;
		#100 opCode = 6'b000010;
		#100 opCode = 6'b010101;
		// Add stimulus here

	end
      
endmodule

