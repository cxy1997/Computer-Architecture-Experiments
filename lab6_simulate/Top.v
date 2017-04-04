`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:28 03/27/2017 
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
module Top(clk, reset);
    input clk;
    input reset;
    wire [31:0] PC_in;
	 wire [31:0] PC_out;
	 wire [31:0] AddRes1;
	 wire [31:0] Instruction;
	 wire [31:0] AddRes1_2;
	 wire [31:0] Instruction_2;
	 wire REG_DST, BRANCH, MEM_READ, MEM_TO_REG, MEM_WRITE, ALU_SRC, REG_WRITE;
	 wire [1:0] ALU_OP;
	 wire [31:0] ReadData1;
	 wire [31:0] ReadData2;
	 wire [31:0] SignExtended;
	 wire REG_DST_2, BRANCH_2, MEM_READ_2, MEM_TO_REG_2, MEM_WRITE_2, ALU_SRC_2, REG_WRITE_2;
	 wire [1:0] ALU_OP_2;
	 wire [31:0] AddRes1_3;
	 wire [31:0] SignExtended_2;
	 wire [31:0] ReadData1_2;
	 wire [31:0] ReadData2_2;
	 wire [31:0] ALU_Mux_Res;
	 wire [4:0] Rt;
    wire [4:0] Rd;
	 wire [4:0] RegDst_Mux_Res;
	 wire [3:0] ALUCTR;
	 wire [31:0] SHIFTLEFT2;
	 wire [31:0] AddRes2;
	 wire Zero;
	 wire [31:0] ALURes;
	 wire [4:0] RegDst_Mux_Res_2;
	 wire [31:0] ReadData2_3;
	 wire [31:0] ALURes_2;
	 wire Zero_2;
	 wire BRANCH_3, MEM_READ_3, MEM_TO_REG_3, MEM_WRITE_3, REG_WRITE_3;
	 wire BranchRes;
	 wire [31:0] AddRes2_2;
	 wire [31:0] ReadData;
	 wire [31:0] ReadData_2;
	 wire [31:0] ALURes_3;
	 wire [4:0] RegDst_Mux_Res_3;
	 wire [31:0] WriteReg_Mux_Res;
	 wire MEM_TO_REG_4, REG_WRITE_4;
	 PC programCounter(
	     .clock(clk),
		  .reset(reset),
		  .INPUT(PC_in),
		  .OUTPUT(PC_out));
    inst_memory instMem(
	     .readAddress(PC_out),
		  .instruction(Instruction));
	 Adder Adder1(
	     .INPUT1(PC_out),
		  .INPUT2(32'b00000000000000000000000000000001),
		  .OUTPUT(AddRes1));
	 cache_32 cache1(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(AddRes1),
		  .OUTPUT(AddRes1_2));
	 cache_32 cache2(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(Instruction),
		  .OUTPUT(Instruction_2));
	 Ctr mainCtr(
	     .reset(reset),
	     .opCode(Instruction_2[31:26]),
		  .regDst(REG_DST),
		  .branch(BRANCH),
		  .memRead(MEM_READ),
		  .memToReg(MEM_TO_REG),
		  .aluOp(ALU_OP),
		  .memWrite(MEM_WRITE),
		  .aluSrc(ALU_SRC),
		  .regWrite(REG_WRITE));
	 register REG(
	     .clock_in(clk),
		  .reset(reset), 
		  .readReg1(Instruction_2[25:21]), 
		  .readReg2(Instruction_2[20:16]), 
		  .writeReg(RegDst_Mux_Res_3), 
		  .writeData(WriteReg_Mux_Res), 
		  .regWrite(REG_WRITE_4), 
		  .readData1(ReadData1), 
		  .readData2(ReadData2));
	 cache_WB cache3(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(REG_WRITE),
		  .memToRegIn(MEM_TO_REG),
		  .regWriteOut(REG_WRITE_2),
		  .memToRegOut(MEM_TO_REG_2));
    cache_M cache4(
	     .clock(clk),
		  .reset(reset),
		  .branchIn(BRANCH),
		  .memReadIn(MEM_READ),
		  .memWriteIn(MEM_WRITE),
		  .branchOut(BRANCH_2),
		  .memReadOut(MEM_READ_2),
		  .memWriteOut(MEM_WRITE_2));
	 cache_Ex cache5(
	     .clock(clk),
		  .reset(reset),
		  .regDstIn(REG_DST),
		  .AluOpIn(ALU_OP),
		  .ALUSrcIn(ALU_SRC),
		  .regDstOut(REG_DST_2),
		  .AluOpOut(ALU_OP_2),
		  .ALUSrcOut(ALU_SRC_2));
	 cache_32 cache6(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(AddRes1_2),
		  .OUTPUT(AddRes1_3));
	 cache_32 cache7(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ReadData1),
		  .OUTPUT(ReadData1_2));
	 cache_32 cache8(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ReadData2),
		  .OUTPUT(ReadData2_2));
	 signext signExtend(
	     .inst(Instruction_2[15:0]),
		  .data(SignExtended));
	 cache_32 cache9(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(SignExtended),
		  .OUTPUT(SignExtended_2));
	 cache_5 cache10(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(Instruction_2[20:16]),
		  .OUTPUT(Rt));
    cache_5 cache11(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(Instruction_2[15:11]),
		  .OUTPUT(Rd));
	 Mux_5 RegDst_Mux(
	     .SEL(REG_DST_2),
		  .INPUT1(Rt),
		  .INPUT2(Rd),
		  .OUTPUT(RegDst_Mux_Res));
	 Left_shift_2 shifter(
	     .INPUT(SignExtended_2),
		  .OUTPUT(SHIFTLEFT2));
	 Adder Adder2(
	     .INPUT1(AddRes1_3),
		  .INPUT2(SHIFTLEFT2),
		  .OUTPUT(AddRes2));
	 AluCtr aluCtr(
	     .aluOp(ALU_OP_2),
		  .funct(SignExtended_2[5:0]),
		  .aluCtr(ALUCTR));
	 Mux_32 ALU_Mux(
	     .SEL(ALU_SRC_2),
		  .INPUT1(ReadData2_2),
		  .INPUT2(SignExtended_2),
		  .OUTPUT(ALU_Mux_Res));
	 Alu alu(
	     .input1(ReadData1_2),
		  .input2(ALU_Mux_Res),
		  .aluCtr(ALUCTR),
		  .zero(Zero),
		  .aluRes(ALURes));
	 cache_WB cache12(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(REG_WRITE_2),
		  .memToRegIn(MEM_TO_REG_2),
		  .regWriteOut(REG_WRITE_3),
		  .memToRegOut(MEM_TO_REG_3));
    cache_M cache13(
	     .clock(clk),
		  .reset(reset),
		  .branchIn(BRANCH_2),
		  .memReadIn(MEM_READ_2),
		  .memWriteIn(MEM_WRITE_2),
		  .branchOut(BRANCH_3),
		  .memReadOut(MEM_READ_3),
		  .memWriteOut(MEM_WRITE_3));
	 cache_32 cache14(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(AddRes2),
		  .OUTPUT(AddRes2_2));
	 cache_1 cache15(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(Zero),
		  .OUTPUT(Zero_2));
	 cache_32 cache16(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ALURes),
		  .OUTPUT(ALURes_2));
	 cache_32 cache17(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ReadData2_2),
		  .OUTPUT(ReadData2_3));
    cache_5 cache18(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(RegDst_Mux_Res),
		  .OUTPUT(RegDst_Mux_Res_2));
	 And_gate andgate(
	     .INPUT1(BRANCH_3),
		  .INPUT2(Zero_2),
		  .OUTPUT(BranchRes));
	 Mux_32 PC_Mux(
	     .SEL(BranchRes),
		  .INPUT1(AddRes1),
		  .INPUT2(AddRes2_2),
		  .OUTPUT(PC_in));
	 data_memory dataMem(
	     .clock_in(clk),
		  .address(ALURes_2),
		  .writeData(ReadData2_3),
		  .memWrite(MEM_WRITE_3), 
		  .memRead(MEM_READ_3),
		  .readData(ReadData));
	 cache_WB cache19(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(REG_WRITE_3),
		  .memToRegIn(MEM_TO_REG_3),
		  .regWriteOut(REG_WRITE_4),
		  .memToRegOut(MEM_TO_REG_4));
	 cache_32 cache20(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ReadData),
		  .OUTPUT(ReadData_2));
	 cache_32 cache21(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(ALURes_2),
		  .OUTPUT(ALURes_3));
	 Mux_32 WriteReg_Mux(
	     .SEL(MEM_TO_REG_4),
		  .INPUT1(ALURes_3),
		  .INPUT2(ReadData_2),
		  .OUTPUT(WriteReg_Mux_Res));
    cache_5 cache22(
	     .clock(clk),
		  .reset(reset),
	     .INPUT(RegDst_Mux_Res_2),
		  .OUTPUT(RegDst_Mux_Res_3));
endmodule
