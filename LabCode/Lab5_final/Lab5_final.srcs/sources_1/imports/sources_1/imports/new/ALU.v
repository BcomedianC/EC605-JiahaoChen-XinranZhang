`timescale 1ns / 1ns

module ALU( data1, data2, ALUoutput, ALUOp, Zero);

    input [63:0] data1, data2;
    input [2:0] ALUOp;
    output reg [63:0] ALUoutput;
    output reg Zero;

    always @( data1 or data2 or ALUoutput or ALUOp)
    begin

    if (ALUOp == 3'b001)
        ALUoutput = data1 & data2;
        
    if (ALUOp == 3'b010)
        ALUoutput = data1 | data2;
        
    if (ALUOp == 3'b011)
        ALUoutput = ~data1 ;
        
    if (ALUOp == 3'b100)
        ALUoutput = data1;
        
    if (ALUOp == 3'b101)
        ALUoutput = data2;
        
    if (ALUOp == 3'b110)
        ALUoutput = data1 + data2;
        
    if (ALUOp == 3'b111)
        ALUoutput = data1 - data2;
        
    if (ALUoutput==0)
        Zero = 1;
    else
        Zero = 0;

    end
    
endmodule
