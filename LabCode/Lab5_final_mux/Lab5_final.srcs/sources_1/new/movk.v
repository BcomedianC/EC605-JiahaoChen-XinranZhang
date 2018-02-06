module movk(instruction, RFRD2, WriteReg, MovK, MemMov, rst);

input [31:0] instruction;
input [63:0] RFRD2, MemMov;
input rst;
input MovK;

output reg [63:0] WriteReg;

always@(posedge rst, MovK)
begin

if (MovK==1)
    WriteReg<={RFRD2[63:16], instruction[20:5]};
else if (MovK==0)
    WriteReg<=MemMov;

end

endmodule