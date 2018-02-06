module ProgramCounter(PC, clk, rst, Uncondbranch, Branch, Zero, instruction);
    
    parameter BITSIZE = 64;
    
    input clk, rst, Uncondbranch, Branch, Zero;
    input [31:0] instruction;
    
    reg flag;
    
    reg [63:0] address, PCmid;
    
    output reg [BITSIZE-1:0] PC;
       
    always@(Uncondbranch, Branch, Zero)
    flag = (Uncondbranch | (Branch & Zero));
       
    always @(posedge clk, posedge rst)
    begin
        if ( rst )
        begin
            PCmid = 0;
            address=0;
        end
            
        else if ( flag )
        begin
            if (Uncondbranch)
                address=$signed(instruction[20:0]);
            else
                address=$signed(instruction[20:5]);
            PCmid = PCmid + address;
        end
        
        else
            PCmid = PCmid + 1;
    end
    
    always@(negedge clk)
    PC = PCmid;
    
endmodule
