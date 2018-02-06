module ControlUnit(instruction, Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, MovK, rst);

input [31:0] instruction;
input rst;
output reg Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, MovK;
output reg [3:0] ALUOp;

always @(instruction, posedge rst)
begin
if (rst != 0)
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=0;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=0;
    MovK=0;
end

else
 
begin
//branch
if (instruction[31:21] == 11'h0A0)
begin
    Reg2Loc=1;
    Uncondbranch=1;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0101;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=0;
    MovK=0;
end

//and
else if (instruction[31:21] == 11'h450)
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0001;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=1;
    MovK=0;
end 

//add
else if (instruction[31:21] == 11'h458)
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0110;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=1;
    MovK=0;
end

//orr
else if (instruction[31:21] == 11'h550)
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0010;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=1;
    MovK=0;
end

//cbz
else if (instruction[31:21] == 11'h5A0)
begin
    Reg2Loc=1;
    Uncondbranch=0;
    Branch=1;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0101;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=0;
    MovK=0;
end

//sub
else if (instruction[31:21] == 11'h658)
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0111;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=1;
    MovK=0;
end

//movk
else if (instruction[31:21] == 11'h794)
begin
    Reg2Loc=1;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=0;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=1;
    MovK=1;
end

//stur
else if (instruction[31:21] == 11'h7C0)
begin
    Reg2Loc=1;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=4'b0110;
    MemWrite=1;
    ALUSrc=1;
    RegWrite=0;
    MovK=0;
end

//ldur
else if (instruction[31:21] == 11'h7C2)
begin
    Reg2Loc=1;
    Uncondbranch=0;
    Branch=0;
    MemRead=1;
    MemtoReg=1;
    ALUOp=4'b0110;
    MemWrite=0;
    ALUSrc=1;
    RegWrite=1;
    MovK=0;
end

else
begin
    Reg2Loc=0;
    Uncondbranch=0;
    Branch=0;
    MemRead=0;
    MemtoReg=0;
    ALUOp=0;
    MemWrite=0;
    ALUSrc=0;
    RegWrite=0;
    MovK=0;
end

end

end

endmodule
