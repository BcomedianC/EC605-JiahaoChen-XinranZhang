module Single_Cycle_Datapath(clk, rst, PCtest, RFWDtest, RFRD1test, RFRD2test, ALU2test, ALUoutputtest, Readdatatest, MemMovtest, instructiontest, RReg1test, RReg2test, WRegtest, ALUOptest, Reg2Loctest, Uncondbranchtest, Branchtest, Zerotest, MemReadtest, MemtoRegtest, MemWritetest, ALUSrctest, RegWritetest, MovKtest);
input clk, rst;
wire [63:0] PC, RFWD, RFRD1, RFRD2, ALU2, ALUoutput, Readdata, MemMov;
wire [31:0] instruction;
wire [4:0] RReg1, RReg2, WReg;
wire [2:0] ALUOp;
wire Reg2Loc, Uncondbranch, Branch, Zero, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, MovK;

output [63:0] PCtest, RFWDtest, RFRD1test, RFRD2test, ALU2test, ALUoutputtest, Readdatatest, MemMovtest;
output [31:0] instructiontest;
output [4:0] RReg1test, RReg2test, WRegtest;
output [2:0] ALUOptest;
output Reg2Loctest, Uncondbranchtest, Branchtest, Zerotest, MemReadtest, MemtoRegtest, MemWritetest, ALUSrctest, RegWritetest, MovKtest;

ProgramCounter program_counter(PC, clk, rst, Uncondbranch, Branch, Zero, instruction);
Instruction_Memory instruction_memory(PC, instruction);
ControlUnit control_unit(instruction, Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, MovK, rst);
Reg2mux reg2_mux(instruction, RReg1, RReg2, WReg, Reg2Loc, rst);
Register_File register_file(instruction, RReg1, RReg2, WReg, RFWD, RegWrite, RFRD1, RFRD2, clk, rst);
alumux alu_mux(instruction, RFRD2, ALUSrc, ALU2, rst);
ALU alu_unit( RFRD1, ALU2, ALUoutput, ALUOp, Zero);
Data_Memory data_memory (ALUoutput, RFRD2, Readdata, MemWrite, MemRead, clk, rst);
datamux data_mux(instruction, Readdata, ALUoutput, MemtoReg, MemMov, rst);

movk movk_md(instruction, RFRD2, RFWD, MovK, MemMov, rst);

assign PCtest=PC;
assign RFWDtest=RFWD;
assign RFRD1test=RFRD1;
assign RFRD2test=RFRD2;
assign ALU2test=ALU2;
assign ALUoutputtest=ALUoutput;
assign Readdatatest=Readdata;
assign MemMovtest=MemMov;
assign instructiontest=instruction;
assign RReg1test=RReg1;
assign RReg2test=RReg2;
assign WRegtest=WReg;
assign ALUOptest=ALUOp;
assign Reg2Loctest=Reg2Loc;
assign Uncondbranchtest=Uncondbranch;
assign Branchtest=Branch;
assign Zerotest=Zero;
assign MemReadtest=MemRead;
assign MemtoRegtest=MemtoReg;
assign MemWritetest=MemWrite;
assign ALUSrctest=ALUSrc;
assign RegWritetest=RegWrite;
assign MovKtest=MovK;

endmodule
