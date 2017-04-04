`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:59:20 02/22/2017
// Design Name:   AluCtr
// Module Name:   E:/cxy/lab3/test_for_cluCtr.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AluCtr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_for_cluCtr;

	// Inputs
	reg [5:0] funct;
	reg [1:0] aluOp;

	// Outputs
	wire [3:0] aluCtr;

	// Instantiate the Unit Under Test (UUT)
	AluCtr uut (
		.aluOp(aluOp), 
		.funct(funct), 
		.aluCtr(aluCtr)
	);

	/*initial begin
		aluOp = 0;
		funct = 0;
      #100 funct = 6'bxxxxxx;
		#100 aluOp = 2'bx1;
		#100 aluOp = 2'b1x;
		funct = 6'bxx0000;
		#100 funct = 6'bxx0010;
		#100 funct = 6'bxx0100;
		#100 funct = 6'bxx0101;
		#100 funct = 6'bxx1010;
	end*/ //(A)
      
	initial begin
		aluOp = 0;
		funct = 0;
		#100;
		#100 aluOp = 2'b01;
		#100 aluOp = 2'b10;
		#100 funct = 6'b000010;
		#100 funct = 6'b000100;
		#100 funct = 6'b000101;
		#100 funct = 6'b001010;
		#100 funct = 6'b100111;
	end // (B)
endmodule

