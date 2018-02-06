`timescale 1ns / 1ns

module Structural_testbench();
    
    reg A, B, C, D;
    reg [1:0] sel;
    
    wire Y1;
	wire Y2;
    
    Tutorial_Mux4 uut2(.A(A), .B(B), .C(C), .D(D), .sel(sel), .Y(Y1));
    Tutorial_Mux4_Alt uut1(.A(A), .B(B), .C(C), .D(D), .sel(sel), .Y(Y1));
    
    initial
    begin
        A = 0;
        B = 1;
        C = 1;
        D = 0;
        
        #5 sel = 0;
        #5 sel = sel + 1;
        #5 sel = sel + 1;
        #5 sel = sel + 1;
        #5;
        $finish;
        
    end
    
endmodule
