`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2016 09:26:40 PM
// Design Name: 
// Module Name: fourbitfulladder
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

module fourbitfulladder( A, B, CI, CO, Y);
    input [3:0] A;
    input [3:0] B;
    input CI;
    wire [2:0] w;
    
    output CO;    
    output [3:0] Y;
    
    singlebitfulladder uut1(A[0],B[0],CI,w[0],Y[0]);
    singlebitfulladder uut2(A[1],B[1],w[0],w[1],Y[1]);
    singlebitfulladder uut3(A[2],B[2],w[1],w[2],Y[2]);
    singlebitfulladder uut4(A[3],B[3],w[2],CO,Y[3]);


endmodule
