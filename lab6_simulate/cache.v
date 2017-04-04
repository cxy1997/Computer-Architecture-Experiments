`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:07 03/27/2017 
// Design Name: 
// Module Name:    cache 
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
module cache_32(clock, reset, INPUT, OUTPUT);
    input clock;
	 input reset;
	 input [31:0] INPUT;
	 output reg [31:0] OUTPUT;
	 initial begin
	    OUTPUT <= 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) OUTPUT = 32'b00000000000000000000000000000000;
		  else */OUTPUT = INPUT;
	 end
endmodule

module cache_1(clock, reset, INPUT, OUTPUT);
    input clock;
	 input reset;
	 input INPUT;
	 output reg OUTPUT;
	 initial begin
	    OUTPUT <= 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) OUTPUT = 0;
		  else */OUTPUT = INPUT;
	 end
endmodule

module cache_5(clock, reset, INPUT, OUTPUT);
    input clock;
	 input reset;
	 input [4:0] INPUT;
	 output reg [4:0] OUTPUT;
	 initial begin
	    OUTPUT <= 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) OUTPUT = 5'b00000;
		  else */OUTPUT = INPUT;
	 end
endmodule

module cache_Ex(clock, reset, regDstIn, AluOpIn, ALUSrcIn, regDstOut, AluOpOut, ALUSrcOut);
    input clock;
	 input reset;
	 input regDstIn;
	 input [1:0] AluOpIn;
	 input ALUSrcIn;
	 output reg regDstOut;
	 output reg [1:0] AluOpOut;
	 output reg ALUSrcOut;
	 initial begin
	     regDstOut = 0;
		  AluOpOut = 0;
		  ALUSrcOut = 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) begin
		      regDstOut = 0;
		      AluOpOut = 0;
		      ALUSrcOut = 0;
		  end
		  else */begin
		      regDstOut = regDstIn;
		      AluOpOut = AluOpIn;
		      ALUSrcOut = ALUSrcIn;
		  end
	 end
endmodule

module cache_M(clock, reset, branchIn, memReadIn, memWriteIn, branchOut, memReadOut, memWriteOut);
    input clock;
	 input reset;
	 input branchIn;
	 input memReadIn;
	 input memWriteIn;
	 output reg branchOut;
	 output reg memReadOut;
	 output reg memWriteOut;
	 initial begin
	     branchOut = 0;
		  memReadOut = 0;
		  memWriteOut = 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) begin
		      branchOut = 0;
		      memReadOut = 0;
		      memWriteOut = 0;
		  end
		  else */begin
		      branchOut = branchIn;
		      memReadOut = memReadIn;
		      memWriteOut = memWriteIn;
		  end
	 end
endmodule

module cache_WB(clock, reset, regWriteIn, memToRegIn, regWriteOut, memToRegOut);
    input clock;
	 input reset;
	 input regWriteIn;
	 input memToRegIn;
	 output reg regWriteOut;
	 output reg memToRegOut;
	 initial begin
	     regWriteOut = 0;
		  memToRegOut = 0;
	 end
	 always @ (posedge clock)
	 begin
	     /*if (reset) begin
	         regWriteOut = 0;
		      memToRegOut = 0;
		  end
		  else */begin
	         regWriteOut = regWriteIn;
		      memToRegOut = memToRegIn;
		  end
	 end
endmodule