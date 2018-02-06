`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2016 10:51:06 AM
// Design Name: 
// Module Name: eightbitcounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module eightbitcounter_testbench;
reg clk;
reg rst;
reg direction;
reg [7:0] maximum;
wire [7:0] count;


eightbitcounter uut(
clk,
rst,
direction,
maximum,
count
);
 
initial
begin
clk = 0;
rst = 1;
direction = 1'b1;
maximum = 8'b00001000;

#10
rst = 0;

#500
direction = 1'b0;

end

always
    #10 clk = !clk;
    
endmodule
