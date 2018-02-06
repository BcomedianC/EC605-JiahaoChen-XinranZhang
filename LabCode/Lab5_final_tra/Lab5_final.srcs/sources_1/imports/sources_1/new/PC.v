module ProgramCounter(PC, address, clk, rst, Uncondbranch, Branch, Zero);
    
    parameter BITSIZE = 64;
    
    input clk, rst, Uncondbranch, Branch, Zero;
    input [BITSIZE-1:0] address;
    
    output reg [BITSIZE-1:0] PC;
       
    always @(posedge clk, rst)
    begin
        if ( rst )
            PC = 0;
        else if ( rst == 0 && (Uncondbranch==1 || (Branch==1&&Zero==1)))
            PC <= PC + address;
        else
            PC <= PC + 1;
    end
endmodule
