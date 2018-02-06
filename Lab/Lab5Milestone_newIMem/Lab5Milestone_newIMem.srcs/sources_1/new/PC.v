module ProgramCounter(PC, BR_address, Zero, Branch, Uncondbranch, clk, rst);
    
    parameter BITSIZE = 64;
    
    input Zero, Branch, Uncondbranch;
    input clk, rst;
    input [25:0]BR_address;
    
    reg [BITSIZE-1:0] Extendaddress;
    
    output reg [BITSIZE-1:0] PC;
    
    always @(BR_address)
    begin
        Extendaddress = {38'b0,BR_address} << 2;  
    end
       
    always @(posedge clk)
    begin
        if (rst)
            PC <= 0;
        else if (Uncondbranch != 0 || (Branch != 0 && Zero !=0))
            PC <= PC + Extendaddress; 
        else 
            PC <= PC + 4;
    end

endmodule
