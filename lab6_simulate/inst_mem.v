`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:48:26 03/27/2017 
// Design Name: 
// Module Name:    inst_mem 
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
module inst_memory(readAddress, instruction);
    input [31:0] readAddress;
	 output [31:0] instruction;
	 reg [31:0] memFile[0:255];
	 initial begin
	     $readmemb("./mem_inst.txt", memFile);
	 end
	 assign instruction = memFile[readAddress];

endmodule