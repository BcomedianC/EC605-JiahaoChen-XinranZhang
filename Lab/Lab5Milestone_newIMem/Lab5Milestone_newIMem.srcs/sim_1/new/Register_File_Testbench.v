`timescale 1ns / 1ns

module Register_File_Testbench;

    parameter BITSIZE = 64;
    parameter DATSIZE = 256;
    
    reg [BITSIZE-1:0] Addr, Writedata;
    reg MemWrite, MemRead;
    reg clk, rst;

    wire [BITSIZE-1:0] Readdata;

    Register_File uut(Addr, Writedata, Readdata, MemWrite, MemRead, clk, rst);

    initial
    begin
        clk = 0;
        rst = 1;
        
        #100
        rst = 0;
        Addr = 50;
        MemWrite = 1;
        Writedata = 5;
        
        #100
        MemWrite = 0;
        Writedata = 0;
        
        #100
        Addr = 60;
        MemWrite = 1;
        Writedata = 10;
        
        #100
        MemWrite = 0;
        Writedata = 0;
        
        #100
        Addr = 50;
        MemRead = 1;
        
        #100
        MemRead = 0;
        
        #100
        Addr = 60;
        MemRead = 1;
        
        #100
        MemRead = 0;
        
    end
    
    always
        #1 clk = !clk;

endmodule
