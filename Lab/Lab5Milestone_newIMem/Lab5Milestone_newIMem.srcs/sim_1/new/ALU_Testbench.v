`timescale 1ns / 1ns

module ALU_Testbench;

    parameter BITSIZE = 64;
    
    reg [BITSIZE-1:0] data1, data2;
    reg [3:0] ALUOp;

    wire [BITSIZE-1:0] ALUoutput;
    wire Zero;

    ALU uut( data1, data2, ALUoutput, ALUOp, Zero);

    initial
    begin
        data1 = 5;
        data2 = 8;
    
        #10
        ALUOp = 4'b0001;
        
        #10
        ALUOp = 4'b0010;
        
        #10
        ALUOp = 4'b0011;
        
        #10
        ALUOp = 4'b0100;
        
        #10
        ALUOp = 4'b0101;
        
        #10
        data2 = 5;
        ALUOp = 4'b0110;
        
        #10
        ALUOp = 4'b0111;
        
        #10
        data2 = 8;
        
    end
    

endmodule
