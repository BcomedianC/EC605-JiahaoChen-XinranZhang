`timescale 1ns / 1ps

module ALU( A, B, Y, opcode, N, Z, C, V);
    input [7:0] A, B;
    input [3:0] opcode;
    output reg [8:0] Y;
    output reg N, Z, C, V;
    
    always @( A or B or Y or opcode)
    begin
    
    if (opcode == 4'b0001)
        Y[7:0] = A & B;
    if (opcode == 4'b0010)
        Y[7:0] = A | B;
    if (opcode == 4'b0011)
        Y[7:0] = !A ;
    if (opcode == 4'b0100)
        Y[7:0] = A ^ B;
    if (opcode == 4'b0101)
        Y[7:0] = A << B;
    if (opcode == 4'b0110)
        Y[7:0] = A >>> B;
    if (opcode == 4'b0111)
        Y[7:0] = A >> B;
    if (opcode == 4'b1000)
        Y[8:0] = A + B;
    if (opcode == 4'b1001)
        Y[8:0] = A - B;    
        
    if (Y[7:0]<0)
        N = 1;
    else
        N = 0;
        
    if (Y[7:0]==0)
        Z = 1;
    else
        Z = 0;
        
    if (Y[8]>0)
        V = 1;
    else
        V = 0;
    
    end
    
endmodule
