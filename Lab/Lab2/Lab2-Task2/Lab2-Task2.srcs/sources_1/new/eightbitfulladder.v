`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2016 07:48:47 PM
// Design Name: 
// Module Name: eightbitfulladder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module eightbitfulladder( A, B, CI, CO, Y);
    input [7:0] A;
    input [7:0] B;
    input CI;
    wire [6:0] w;
    
    output CO;    
    output [7:0] Y;
    
    
    singlebitfulladder uut1(A[0],B[0],CI,w[0],Y[0]);
    singlebitfulladder uut2(A[1],B[1],w[0],w[1],Y[1]);
    singlebitfulladder uut3(A[2],B[2],w[1],w[2],Y[2]);
    singlebitfulladder uut4(A[3],B[3],w[2],w[3],Y[3]);
    singlebitfulladder uut5(A[4],B[4],w[3],w[4],Y[4]);
    singlebitfulladder uut6(A[5],B[5],w[4],w[5],Y[5]);
    singlebitfulladder uut7(A[6],B[6],w[5],w[6],Y[6]);
    singlebitfulladder uut8(A[7],B[7],w[6],CO,Y[7]);

endmodule
