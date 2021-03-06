`timescale 1ns / 1ps


module singlebitfulladder(A,B,CI,CO,Y);
    input A, B, CI;
    output CO, Y;
    wire w1, w2, w3;
    
    xor G1 ( w1, A, B);
    and G2 ( w2, A, B);
    and G3 ( w3, w1, CI);
    xor G4 ( Y, CI, w1);
    or G5 ( CO, w2, w3);
    
endmodule
