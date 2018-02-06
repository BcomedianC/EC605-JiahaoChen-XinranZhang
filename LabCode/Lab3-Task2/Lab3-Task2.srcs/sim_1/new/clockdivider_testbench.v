`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2016 01:17:34 PM
// Design Name: 
// Module Name: clockdivider_testbench
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


module clockdivider_testbench;
reg clk;
reg rst;
wire clk_out;

clockdivider uut(
clk,
rst,
clk_out,
    );
    
initial
begin
clk = 0;
rst = 1;

#1
rst = 0;

#500
rst = 0;

end

always
    #1 clk = !clk;

endmodule
