`timescale 1ns / 100ps

module Structural_testbench;
    
    reg [7:0] A, B;
    reg [3:0] opcode;
    wire N, Z, C, V;
    wire [7:0] Y;

	    
    ALU uut( A, B, Y, opcode, N, Z, C, V);
 
    initial
    begin

     A = 8'b00000000;
     B = 8'b00000000;

     #50;
     A = 8'b00000100;
     B = 8'b00000011;
     opcode = 4'b1000;
     
     #50;
     A = 8'b00000011;
     B = 8'b00000001;
     opcode = 4'b0010;
     
     #50;
     A = 8'b00000011;
     B = 8'b11111111;
     opcode = 4'b0011;
     
     #50;
     A = 8'b00000011;
     B = 8'b00000001;
     opcode = 4'b0100;
     
     #50;
     A = 8'b00000011;
     B = 8'b00000001;
     opcode = 4'b0101;
     
     #50;
     A = 8'b10000011;
     B = 8'b00000001;
     opcode = 4'b0110;
          
     #50;
     A = 8'b10000011;
     B = 8'b00000001;
     opcode = 4'b0111;
          
     #50;
     A = 8'b01000000;
     B = 8'b01000000;
     opcode = 4'b1000; 
     
     #50;
     A = 8'b10000011;
     B = 8'b00000011;
     opcode = 4'b1001; 

     
     #50;
     
        
     $finish;
        
    end
endmodule
