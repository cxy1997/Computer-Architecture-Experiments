`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:17:55 03/08/2017 
// Design Name: 
// Module Name:    Top 
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
module Top(clock, switches, reset, LED);
    input clock;
	 input [2:0] switches;
    input reset;
	 output reg [7:0] LED;
	 wire clk;
    wire REG_DST,
	      JUMP,
			BRANCH,
			MEM_READ,
			MEM_TO_REG,
			MEM_WRITE;
    wire [1:0] ALU_OP;
	 wire ALU_SRC,
	      REG_WRITE;
	 wire [3:0] ALUCTR;
	 wire [31:0] PC_IN;
	 wire [31:0] PC_OUT;
	 wire [31:0] INST;
	 wire [4:0] WRITEREG;
	 wire [31:0] INSTSHIFTED;
	 wire [31:0] SIGNEXTENDED;
	 wire [31:0] EXTENDSHIFTED;
	 wire [31:0] ADDRES1;
	 wire [31:0] ADDRES2;
	 wire [4:0] MUXRES1;
	 wire [31:0] MUXRES2;
	 wire [31:0] MUXRES3;
	 wire [31:0] MUXRES4;
	 wire [31:0] READDATA1;
	 wire [31:0] READDATA2;
	 wire [31:0] READDATA;
    wire ZERO;
	 wire [31:0] ALURES;
	 wire [31:0] READMEM;
    wire AND_GATE_RES;
	 wire [31:0] DISP;
	 timeDivider td(.clockIn(clock), .clockOut(clk));
    PC programCounter(
	     .clock(clk),
		  .reset(reset),
		  .INPUT(PC_IN),
		  .OUTPUT(PC_OUT));
	 inst_memory instMem(
	     .readAddress(PC_OUT),
		  .instruction(INST));
	 Ctr mainCtr(
	     .opCode(INST[31:26]),
		  .regDst(REG_DST),
		  .jump(JUMP),
		  .branch(BRANCH),
		  .memRead(MEM_READ),
		  .memToReg(MEM_TO_REG),
		  .aluOp(ALU_OP),
		  .memWrite(MEM_WRITE),
		  .aluSrc(ALU_SRC),
		  .regWrite(REG_WRITE));
	 Adder adder1(
	     .INPUT1(PC_OUT),
		  .INPUT2(32'b00000000000000000000000000000001),
		  .OUTPUT(ADDRES1));
	 Left_shift_2 shifter1(
	     .INPUT(INST),
		  .OUTPUT(INSTSHIFTED));
	 Mux_5 mux1(
	     .SEL(REG_DST),
		  .INPUT1(INST[20:16]),
		  .INPUT2(INST[15:11]),
		  .OUTPUT(MUXRES1));
	 register REG(
	     .clock_in(clk),
		  .reset(reset), 
		  .readReg1(INST[25:21]), 
		  .readReg2(INST[20:16]), 
		  .writeReg(MUXRES1),
		  .showAddress(switches),
		  .writeData(MUXRES4), 
		  .regWrite(REG_WRITE), 
		  .readData1(READDATA1), 
		  .readData2(READDATA2),
		  .display(DISP));
	 signext signExtend(
	     .inst(INST[15:0]),
		  .data(SIGNEXTENDED));
	 Mux_32 mux2(
	     .SEL(ALU_SRC),
		  .INPUT1(READDATA2),
		  .INPUT2(SIGNEXTENDED),
		  .OUTPUT(MUXRES2));
	 AluCtr aluCtr(
	     .aluOp(ALU_OP),
		  .funct(INST[5:0]),
		  .aluCtr(ALUCTR));
	 Alu alu(
	     .input1(READDATA1),
		  .input2(MUXRES2),
		  .aluCtr(ALUCTR),
		  .zero(ZERO),
		  .aluRes(ALURES));
	 Left_shift_2 shifter2(
	     .INPUT(SIGNEXTENDED),
		  .OUTPUT(EXTENDSHIFTED));
	 Adder adder2(
	     .INPUT1(ADDRES1),
		  .INPUT2(EXTENDSHIFTED),
		  .OUTPUT(ADDRES2));
	 And_gate andgate(
	     .INPUT1(BRANCH),
		  .INPUT2(ZERO),
		  .OUTPUT(AND_GATE_RES));
	 Mux_32 mux3(
	     .SEL(AND_GATE_RES),
		  .INPUT1(ADDRES1),
		  .INPUT2(ADDRES2),
		  .OUTPUT(MUXRES3));
	 Mux_32 mux4(
	     .SEL(JUMP),
		  .INPUT1(MUXRES3),
		  .INPUT2({ADDRES1[31:28], 2'b00, INSTSHIFTED[25:0]}),
		  .OUTPUT(PC_IN));
	 data_memory dataMem(
	     .clock_in(clk),
		  .address(ALURES),
		  .writeData(READDATA2),
		  .memWrite(MEM_WRITE), 
		  .memRead(MEM_READ),
		  .readData(READDATA));
	 Mux_32 mux5(
	     .SEL(MEM_TO_REG),
		  .INPUT1(ALURES),
		  .INPUT2(READDATA),
		  .OUTPUT(MUXRES4));
	 always @ (posedge clk)
	 begin
	     if (!reset)
		  begin
		      LED = 8'b00000000;
		  end
		  else begin
		      LED = DISP[7:0];
		  end
	 end
endmodule
