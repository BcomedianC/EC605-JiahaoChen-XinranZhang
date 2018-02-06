`timescale 1ns / 1ns

module ALU( data1, data2, ALUoutput, ALUOp, Zero);
    input [63:0] data1, data2;
    input [3:0] ALUOp;
    output reg [63:0] ALUoutput;
    output reg Zero;

    always @( data1 or data2 or ALUoutput or ALUOp)
    begin

    if (ALUOp == 4'b0001)
        ALUoutput = data1 & data2;
        
    if (ALUOp == 4'b0010)
        ALUoutput = data1 | data2;
        
    if (ALUOp == 4'b0011)
        ALUoutput = ~data1 ;
        
    if (ALUOp == 4'b0100)
        ALUoutput = data1;
        
    if (ALUOp == 4'b0101)
        ALUoutput = data2;
        
    if (ALUOp == 4'b0110)
        ALUoutput = data1 + data2;
        
    if (ALUOp == 4'b0111)
        ALUoutput = data1 - data2;
        
    if (ALUoutput==0)
        Zero = 1;
    else
        Zero = 0;

    end
    
endmodule
