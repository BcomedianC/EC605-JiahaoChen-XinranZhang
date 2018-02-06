module datamux(instruction, Readdata, ALUoutput, MemtoReg, RegWriteData, rst);
    
    input [31:0] instruction;
    input [63:0] Readdata, ALUoutput;
    input MemtoReg, rst;
    
    output reg [63:0] RegWriteData;
       
    always @(posedge rst, MemtoReg, instruction, Readdata, ALUoutput)
    begin
        if ( rst )
            RegWriteData = 0;
        
        else if ( rst == 0 && MemtoReg == 1)
            RegWriteData = Readdata;
        
        else if ( rst == 0 && MemtoReg == 0)
            RegWriteData = ALUoutput;
    end
endmodule
