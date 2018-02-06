`timescale 1ns / 1ps

module clockdivider(
clk,
rst,
clk_out,
    );
    
input clk;
input rst;

output reg clk_out;

reg [26:0] counter;

always @(posedge clk or posedge rst or counter or clk_out)
begin
if (rst==1'b1)begin
    clk_out <= 0;
    counter <= 0;
    end
if (rst==1'b0 && counter<'d100000000)begin
    counter = counter + 1;    
    end
if (rst==1'b0 && counter=='d100000000)begin
    clk_out = ~clk_out; 
    counter <= 0;   
    end    
end
   
endmodule