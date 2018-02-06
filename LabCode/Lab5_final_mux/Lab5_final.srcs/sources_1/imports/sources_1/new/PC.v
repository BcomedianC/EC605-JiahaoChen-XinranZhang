module ProgramCounter(PC, clk, rst, Uncondbranch, Branch, Zero, instruction);
    
    parameter BITSIZE = 64;
    
    input clk, rst, Uncondbranch, Branch, Zero;
    input [31:0] instruction;
    
    reg [63:0] address;
    
    output reg [BITSIZE-1:0] PC;
       
    always @(negedge clk, posedge rst)
    begin
        if ( rst )
            PC = 0;
            
        else if ( rst == 0 && (Uncondbranch==1 || (Branch==1&&Zero==1)))
        begin
            if (instruction[31:21] == 11'h0A0 || instruction[31:21] == 11'h5A0)
                address<=$signed(instruction[20:5]);
            PC <= PC + address;
        end
        
        else if ( rst == 0 )
            PC <= PC + 1;
    end
endmodule
