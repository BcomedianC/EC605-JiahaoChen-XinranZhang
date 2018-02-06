module Register_File(instruction, ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);
    
    parameter BITSIZE = 64;
    parameter REGSIZE = 32;
    input [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    input [BITSIZE-1:0] WriteData;
    input [31:0] instruction;
    input WriteEnable;
    output reg [BITSIZE-1:0] ReadData1, ReadData2;
    input clk, rst;
    
    reg [BITSIZE-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers
    
    integer i;                                  // Used below to rst all registers
    
    // Asyncronous read of register file.
    always @(instruction, ReadSelect1, reg_file[ReadSelect1])
    begin
        ReadData1 = reg_file[ReadSelect1];
    end
    
    // Asyncronous read of register file.
    always @(instruction, ReadSelect2, reg_file[ReadSelect2])
    begin
        ReadData2 = reg_file[ReadSelect2];
    end
    
    // Write back to register file on clk edge.
    always @(posedge rst, negedge clk)
    begin
        if (rst==1)
            for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 'b0; // rst all registers
        else if (rst == 0 && WriteEnable!=0)
                reg_file[WriteSelect] <= WriteData; //If writeback is enabled and not 0 register.
    end

initial
begin
    reg_file[0]=0;
    reg_file[1]=0;
    reg_file[2]=0;
end

endmodule
 
