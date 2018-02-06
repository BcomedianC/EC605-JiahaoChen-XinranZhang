`timescale 1ns / 1ps

module ALU( A, B, Y, opcode, N, Z, C, V);
    input [7:0] A, B;
    input [3:0] opcode;
    output [8:0] Y;
    output N, Z, C, V;
    
    always @( A or B or Y or opcode)
    begin
    
    if (opcode == 4'b0001)
    assign    Y[7:0] = A & B;
    if (opcode == 4'b0010)
    assign    Y[7:0] = A | B;
    if (opcode == 4'b0011)
    assign    Y[7:0] = !A ;
    if (opcode == 4'b0100)
    assign    Y[7:0] = A ^ B;
    if (opcode == 4'b0101)
    assign    Y[7:0] = A << B;
    if (opcode == 4'b0110)
    assign    Y[7:0] = A >>> B;
    if (opcode == 4'b0111)
    assign    Y[7:0] = A >> B;
    if (opcode == 4'b1000)
    assign    Y[7:0] = A + B;
    if (opcode == 4'b1001)
    assign    Y[7:0] = A - B;    
        
    if (Y[7:0]<0)
    assign    N = 1;
    if (Y[7:0]==0)
    assign    Z = 1;
    if (Y[8]>0)
    assign    V = 1;
    
    end
    
endmodule
