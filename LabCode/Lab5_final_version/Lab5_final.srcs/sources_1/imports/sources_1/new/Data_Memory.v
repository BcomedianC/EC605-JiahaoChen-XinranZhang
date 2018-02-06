module Data_Memory(instruction, Addr, Writedata, Readdata, MemWrite, MemRead, clk, rst);
    
    parameter BITSIZE = 64;
    parameter DATSIZE = 64;
            
    input [BITSIZE-1:0] Addr, Writedata;
    input [31:0] instruction;
    input MemWrite, MemRead;
    input clk, rst;
    
    output reg [BITSIZE-1:0] Readdata;
    
    reg [BITSIZE-1:0] data_memory [DATSIZE-1:0];   // Entire list of registers
    
    integer i;                                  // Used below to rst all registers
    
    always@(instruction, Addr, MemRead)
    begin    
        if (MemRead != 0)
            Readdata = data_memory[Addr];
    end
  
    always @(posedge clk, Writedata, instruction, posedge rst)
    begin
        if (rst)
            for (i=0; i<DATSIZE; i=i+1) 
                data_memory[i] = 'b0; // rst all data memory
        else if (MemWrite != 0)
                data_memory[Addr] =  Writedata; 

    end

endmodule
