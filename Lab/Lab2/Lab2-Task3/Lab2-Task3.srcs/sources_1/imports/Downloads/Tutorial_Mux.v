`timescale 1ns / 1ps

module Gate_Level_MUX(A, B, sel, Y);
input  A, B;
input sel;
output  Y;

    wire  w1, w2;
    wire sel_b;
    
    not inv1(sel_b,sel);
    and and1(w1, A, sel_b);
    and and2(w2, B, sel);
    or  or1(Y, w1, w2);
   
endmodule
