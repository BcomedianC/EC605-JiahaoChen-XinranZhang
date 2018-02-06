`timescale 1ns / 1ps

module wraparoundLEDS(
clk,
rst,
btn,
counter,
leds
    );
    
input clk;
input rst;
input [1:0] btn;
input [7:0] counter;

output reg [3:0] leds;

reg clk_out;
reg [1:0] flag;
reg [4:0] state;
reg [7:0] count;
reg [31:0] clkcounter;

always @(posedge clk or posedge rst)
begin
if (rst==1'b1)begin
    clk_out <= 0;
    clkcounter <= 0;

    end
else begin
if (clkcounter < 'd49999999)begin
    clkcounter <= clkcounter + 1;    
    end
else if (clkcounter >='d49999999)begin
    clk_out = ~clk_out; 
    clkcounter <= 0;   
    end    
end 
end
 
always @(posedge clk_out or posedge rst)
begin
if (rst==1'b1)begin
    state <= 5'b00000;
    count <= 0;
    leds <= 4'b0000;
    end
else begin
        case(state)
            5'b00000: begin
                        
                        state <= (btn==2'b01) ? 5'b00001 : (btn==2'b10) ? 5'b01001 : 5'b00000;
                      end
            5'b00001: begin
                        count <= counter;
                        state <= 5'b00010;
                      end
            5'b00010: begin
                        if (count > 0)begin
                        count = count - 1;
                        end
                        if (count == 0)begin 
                        leds <= 4'b0001;
                        end
                        state <= (count==0) ? 5'b00011 : 5'b00010;
                      end
            5'b00011: begin
                         count <= counter;
                         state <= 5'b00100;
                      end
            5'b00100: begin
                         if (count > 0)begin
                         count <= count - 1;
                         end
                         if (count == 0)begin 
                         leds <= 4'b0010;
                         end
                         state <= (count==0) ? 5'b00101 : 5'b00100;
                      end
            5'b00101: begin
                         count <= counter;
                         state <= 5'b00110;
                      end
            5'b00110: begin
                         if (count > 0)begin
                         count <= count - 1;
                         end
                         if (count == 0)begin 
                         leds <= 4'b0100;
                         end
                         state <= (count==0) ? 5'b00111 : 5'b00110;
                      end
            5'b00111: begin
                         count <= counter;
                         state <= 5'b01000;
                      end
            5'b01000: begin
                         if (count > 0)begin
                         count <= count - 1;
                         end
                         if (count == 0)begin 
                         leds <= 4'b1000;
                         end
                         state <= (count==0) ? 5'b00000 : 5'b01000;
                      end
            5'b01001: begin
                          count <= counter;
                          state <= 5'b01010;
                      end
            5'b01010: begin
                          if (count > 0)begin
                          count <= count - 1;
                          end
                          if (count == 0)begin 
                          ///leds <= 4'b0001;
                          leds <= 4'b1000;
                          end
                          state <= (count==0) ? 5'b01011 : 5'b01010;
                        end
            5'b01011: begin
                           count <= counter;
                           state <= 5'b01100;
                        end
            5'b01100: begin
                           if (count > 0)begin
                           count <= count - 1;
                           end
                           if (count == 0)begin 
                           leds <= 4'b0100;
                           end
                           state <= (count==0) ? 5'b01101 : 5'b01100;
                        end
            5'b01101: begin
                           count <= counter;
                           state <= 5'b01110;
                        end
            5'b01110: begin
                           if (count > 0)begin
                           count <= count - 1;
                           end
                           if (count == 0)begin 
                           leds <= 4'b0010;
                           end
                           state <= (count==0) ? 5'b01111 : 5'b01110;
                        end
            5'b01111: begin
                           count <= counter;
                           state <= 5'b10000;
                        end
            5'b10000: begin
                           if (count > 0)begin
                           count <= count - 1;
                           end
                           if (count == 0)begin 
                           leds <= 4'b0001;
                           end
                           state <= (count==0) ? 5'b00000 : 5'b10000;
                        end                                
        endcase 
        end    
end

endmodule
