`timescale 1ns / 1ps

module eightbitcounter(
clk,
rst,
direction,
maximum,
count
);

input clk;
input rst;
input direction;
input [7:0] maximum;

output reg [7:0] count;

always @(posedge clk or posedge rst or direction or maximum)
if (rst==1'b1)begin
    count <= 0;
    end
else if (rst==0 && direction==1 )begin
    count = count + 1;
    if (count==maximum+1)
    count <= 0;
    end
else if (rst==0 && direction==0)begin
    count = count - 1;
    if (count==0)
    count <= maximum;
    end

endmodule

