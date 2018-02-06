`timescale 1ns / 1ns

module Program_Counter_Testbench;

    parameter BITSIZE = 64;
    
    reg Zero, Branch, Uncondbranch;
    reg [25:0]BR_address;
    reg clk, rst;

    wire [BITSIZE-1:0] PC;

    ProgramCounter uut(PC, BR_address, Zero, Branch, Uncondbranch, clk, rst);

    initial
    begin
        clk = 0;
        rst = 1;
        Zero = 0;
        Branch = 0;
        Uncondbranch = 0;
        BR_address = 20;
        
        #1
        rst = 0;
        
        #10
        Zero = 1;
        
        #1
        Branch = 1;
        
        
        #1
        Zero = 0;
        
        
        #1
        Uncondbranch = 1;
       
    end
    
    always
        #1 clk = !clk;

endmodule
