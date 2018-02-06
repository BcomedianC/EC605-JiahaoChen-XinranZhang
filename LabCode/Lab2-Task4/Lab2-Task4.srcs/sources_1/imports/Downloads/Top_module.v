`timescale 1ns / 1ps

module Top_module(clk, rst, switches, btn, leds, seven_seg, seven_enable);
input clk, rst;					// Needed for syncronous inputs
input [15:0] switches;			// Input switches
input [1:0] btn;				// Buttons used to save switches to registers
output [3:0] leds;				// Display N, V, C, Z
output reg [6:0] seven_seg;		// Display outputs to seven segment
output reg [3:0] seven_enable;	// Select which seven segment to display
reg [15:0] counter;
reg [7:0] A, B;
reg [3:0] SEL;
wire [7:0] Y;
wire [3:0] ones, tens, hundreds;
wire [6:0] seven_seg_ones, seven_seg_tens, seven_seg_hundreds;
/********* ADD MODULE DECLARATIONS HERE ************/
ALU uut1( A, B, Y, SEL, leds[3], leds[2], leds[1], leds[0]);
bcd_converter uut3(Y, ones, tens, hundreds);
seven_segment_display uut4(ones, seven_seg_ones);
seven_segment_display uut5(tens, seven_seg_tens);
seven_segment_display uut6(hundreds, seven_seg_hundreds);
/********* END MODULE DECLARATIONS HERE ************/

/**************** INPUT REGISTERS ******************/
/* This always block saves switch inputs into      */
/* registers when buttons are pressed.             */
always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        A <= 0;
        B <= 0;
        SEL <= 0;
    end
    else
    begin
        if (btn[0])
            {A, B} <= switches;
        if (btn[1])
            SEL <= switches[3:0];
        counter = counter + 1'b1;
    end
end

always @(counter[13])
begin
case(counter[13:12])
0:begin 
seven_enable=4'b1110;
seven_seg=seven_seg_ones;
end
1:begin
seven_enable=4'b1101;
seven_seg=seven_seg_tens;
end
2:begin 
seven_enable=4'b1011;
seven_seg=seven_seg_hundreds;
end
default: seven_enable=4'b1111;

endcase
end

/********* End always block **********/
endmodule
/************ End module *************/

/************ EXAMPLE BCD MODULE HEADER *************/
/* This function would be used to convert a binary  */
/* number into a decimal number split into 3 digits */

module bcd_converter(binary, ones, tens, hundreds);
input [7:0] binary;
output reg [3:0] ones, tens, hundreds;
integer a;

always @(binary or hundreds or tens or ones)
begin
ones = binary % 'd10;
tens = binary % 'd100 /'d10;
hundreds = binary / 'd100;

end

endmodule
/************ End module *************/

/********* EXAMPLE SEVEN SEGMENT DISPLAY MODULE **********/
/* This function would be used to convert a decimal digit*/
/* into a proper seven segment display value. Refer to   */
/* reference manual for seven segment led configuration  */

module seven_segment_display(digit, seven_seg_out);
input [3:0] digit;
output reg [6:0] seven_seg_out;

always @(*)
begin
case(digit)
4'd0 : seven_seg_out = 7'b1000000;
4'd1 : seven_seg_out = 7'b1111001;
4'd2 : seven_seg_out = 7'b0100100;
4'd3 : seven_seg_out = 7'b0110000;
4'd4 : seven_seg_out = 7'b0011001;
4'd5 : seven_seg_out = 7'b0010010; 
4'd6 : seven_seg_out = 7'b0000010;
4'd7 : seven_seg_out = 7'b1111000; 
4'd8 : seven_seg_out = 7'b0000000;
4'd9 : seven_seg_out = 7'b0010000;
endcase
end
endmodule
/************ End module *************/