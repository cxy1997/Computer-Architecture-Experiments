`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:10:19 03/01/2017 
// Design Name: 
// Module Name:    register 
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
module register(clock_in, readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
	 input clock_in;
    input [25:21] readReg1;
    input [20:16] readReg2;
    input [4:0] writeReg;
    input [31:0] writeData;
    input regWrite;
    output [31:0] readData1;
    output [31:0] readData2;
	 
    reg [31:0] readData1;
	 reg [31:0] readData2;
	 reg [31:0] regFile[31:0];
    
	 always @ (readReg1 or readReg2 /* or */)
	 begin
	     regFile[0] = 0;
		  readData1 = regFile[readReg1];
		  readData2 = regFile[readReg2];
	 end
	 always @ (negedge clock_in)
	 begin
	     if (regWrite == 1)
	         regFile[writeReg] = writeData;
	 end
endmodule
