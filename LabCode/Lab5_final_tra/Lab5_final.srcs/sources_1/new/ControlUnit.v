module ControlUnit(instruction, Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, clk, rst);

input instruction;
input rst, clk;
output reg Reg2Loc, Uncondbranch, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [2:0] ALUOp;

always @(posedge clk or posedge rst)
if (rst != 0)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=0;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=0;
end

else
 
begin
//branch
if (instruction == 11'h0A0)
begin
    Reg2Loc<=1;
    Uncondbranch<=1;
    Branch<=0;
    MemRead<=0;
    MemRead<=0;
    ALUOp<=3'b101;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=0;
end

//and
else if (instruction == 11'h450)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b001;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
end 

//add
else if (instruction == 11'h458)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b110;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
end

//orr
else if (instruction == 11'h550)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b010;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
end

//cbz
else if (instruction == 11'h5A0)
begin
    Reg2Loc<=1;
    Uncondbranch<=0;
    Branch<=1;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b101;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=0;
end

//sub
else if (instruction == 11'h658)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b111;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=1;
end

//movk
else if (instruction == 11'h794)
begin
    Reg2Loc<=0;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=0;
    MemWrite<=0;
    ALUSrc<=0;
    RegWrite<=0;
end

//stur
else if (instruction == 11'h7C0)
begin
    Reg2Loc<=1;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=0;
    MemtoReg<=0;
    ALUOp<=3'b110;
    MemWrite<=1;
    ALUSrc<=1;
    RegWrite<=0;
end

//ldur
else if (instruction == 11'h7C2)
begin
    Reg2Loc<=1;
    Uncondbranch<=0;
    Branch<=0;
    MemRead<=1;
    MemtoReg<=1;
    ALUOp<=3'b110;
    MemWrite<=0;
    ALUSrc<=1;
    RegWrite<=1;
end



end

endmodule
