`timescale 1ns / 1ns

module Structural_testbench();
    
    reg A, B, CI;    
    wire Y, CO;
    
    singlebitfulladder uut(A,B,CI,CO,Y);

    
    initial
    begin
        A = 0;
        B = 1;
        C = 1;

        
        #5 sel = 0;
        #5 sel = sel + 1;
        #5 sel = sel + 1;
        #5 sel = sel + 1;
        #5;
        $finish;
        
    end
    
endmodule
