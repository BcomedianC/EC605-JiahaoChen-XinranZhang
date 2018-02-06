`timescale 1ns / 1ns

module Tutorial_Mux4(A, B, C, D, sel, Y);

input A, B, C, D;
input [1:0] sel;
output Y;

wire w1, w2;

Gate_Level_MUX mux1(.A(A), .B(B), .sel(sel[0]), .Y(w1));
Gate_Level_MUX mux2(.A(C), .B(D), .sel(sel[0]), .Y(w2));

Gate_Level_MUX mux3(.A(w1), .B(w2), .sel(sel[1]), .Y(Y));

endmodule
