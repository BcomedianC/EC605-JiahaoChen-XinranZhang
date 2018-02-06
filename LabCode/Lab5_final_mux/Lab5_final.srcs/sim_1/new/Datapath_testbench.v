`timescale 1ns / 1ps

module Datapath_testbench;

reg clk, rst;
wire [63:0] PCtest, RFWDtest, RFRD1test, RFRD2test, ALU2test, ALUoutputtest, Readdatatest, MemMovtest;
wire [31:0] instructiontest;
wire [4:0] RReg1test, RReg2test, WRegtest;
wire [2:0] ALUOptest;
wire Reg2Loctest, Uncondbranchtest, Branchtest, Zerotest, MemReadtest, MemtoRegtest, MemWritetest, ALUSrctest, RegWritetest, MovKtest;



Single_Cycle_Datapath uut(clk, rst, PCtest, RFWDtest, RFRD1test, RFRD2test, ALU2test, ALUoutputtest, Readdatatest, MemMovtest, instructiontest, RReg1test, RReg2test, WRegtest, ALUOptest, Reg2Loctest, Uncondbranchtest, Branchtest, Zerotest, MemReadtest, MemtoRegtest, MemWritetest, ALUSrctest, RegWritetest, MovKtest);

initial
begin
clk = 1;
rst = 1;

#1
rst = 0;

#100
rst = 0;

end


always
#10 clk = !clk;

endmodule
