module alumux(instruction, data2, ALUSrc, ALU2, rst);
    
    input [31:0] instruction;
    input [63:0] data2;
    input ALUSrc, rst;
    
    output reg [63:0] ALU2;
       
    always @(posedge rst, ALUSrc)
    begin
    
        if ( rst )
        begin
            ALU2 <= 0;
        end
        
        else if ( rst == 0 && ALUSrc == 1)
            ALU2<=$signed(instruction[20:10]);
        
        else if ( rst == 0 && ALUSrc == 0)
            ALU2 <= data2;
    end
endmodule
