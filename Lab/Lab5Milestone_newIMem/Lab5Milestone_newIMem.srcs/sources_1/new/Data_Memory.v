module Data_Memory(Addr, Writedata, Readdata, MemWrite, MemRead, clk, rst);
    
    parameter BITSIZE = 64;
    parameter DATSIZE = 256;
            
    input [BITSIZE-1:0] Addr, Writedata;
    input MemWrite, MemRead;
    input clk, rst;
    
    output reg [BITSIZE-1:0] Readdata;
    
    reg [BITSIZE-1:0] data_memory [DATSIZE-1:0];   // Entire list of registers
    
    integer i;                                  // Used below to rst all registers
    
    always @(Addr, data_memory[Addr])
    begin
        Readdata = data_memory[Addr];
    end
  
    always @(posedge clk)
    begin
        if (rst)
            for (i=0; i<DATSIZE; i=i+1) 
                data_memory[i] <= 'b0; // rst all data memory
        else if (MemWrite != 0)
                data_memory[Addr] <=  Writedata; 
        else if (MemRead != 0)
                Readdata <= data_memory[Addr];
    end

endmodule
