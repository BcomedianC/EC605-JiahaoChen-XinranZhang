`timescale 1ns / 1ps

module ALU( A, B, Y, opcode, N, Z, C, V);
    input [7:0] A, B;
    input [3:0] opcode;
    reg cout;
    output reg [7:0] Y;
    output reg N, Z, C, V;

    always @( A or B or Y or opcode)
    begin

    
    if (opcode == 4'b0001)
        Y[7:0] = A & B;
    if (opcode == 4'b0010)
        Y[7:0] = A | B;
    if (opcode == 4'b0011)
        Y[7:0] = ~A ;
    if (opcode == 4'b0100)
        Y[7:0] = A ^ B;
    if (opcode == 4'b0101)
        Y[7:0] = A << B;
    if (opcode == 4'b0110)
        Y[7:0] = $signed (A) >>> B;
    if (opcode == 4'b0111)
        Y[7:0] = A >> B;
    if (opcode == 4'b1000)
        {cout, Y} = A + B;
    if (opcode == 4'b1001)
        {cout, Y} = A - B;    
        
    if (Y[7]==1)
        N = 1;
    else
        N = 0;
        
    if (Y[7:0]==0)
        Z = 1;
    else
        Z = 0;
        
    if (A[7]==0&&B[7]==0&&Y[7]==1||A[7]==1&&B[7]==1&&Y[7]==0)
        V = 1;
    else
        V = 0;
    
    if (cout==1&&(opcode==4'b1000||opcode==4'b1001))
        C = 1;
    else
        C = 0;

    end
    
endmodule
