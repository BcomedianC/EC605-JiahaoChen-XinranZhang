module ProgramCounter(PC, address, mux, clk, rst);
    
    parameter BITSIZE = 64;
    
    input mux, clk, rst;
    input [BITSIZE-1:0] address;
    
    output reg [BITSIZE-1:0] PC;
       
    always @(posedge clk, rst)
    begin
        if ( rst )
            PC = 0;
        else if ( rst == 0 && mux == 1 )
            PC <= PC + address; 
        else if ( rst == 0 && mux == 0 )
            PC <= PC + 1;
    end
endmodule
