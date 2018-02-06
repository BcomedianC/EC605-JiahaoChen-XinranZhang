module Reg2mux(instruction, RReg1, RReg2, WReg, Reg2Lock, rst);
    
    input [31:0] instruction;
    input Reg2Lock, rst;
    
    output reg [4:0] RReg1, RReg2, WReg;
       
    always @(instruction, Reg2Lock, posedge rst)
    begin
        if ( rst )
        begin
            RReg1 = 31;
            RReg2 = 31;
            WReg = 31;
        end
        
        else if ( rst == 0 && Reg2Lock == 1)
        begin
            RReg1 = instruction[9:5];
            RReg2 = instruction[4:0];
            WReg = instruction[4:0];
        end
        
        else if ( rst == 0 && Reg2Lock == 0)
        begin
            RReg1 = instruction[9:5];
            RReg2 = instruction[20:16];
            WReg = instruction[4:0];
        end
    end
endmodule
