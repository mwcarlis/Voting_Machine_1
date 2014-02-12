`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:38 02/10/2014 
// Design Name: 
// Module Name:    utility 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module clk_gen(clk50MHz, rst, clksec4, clk_5KHz);
input clk50MHz, rst;
output clksec4, clk_5KHz;
reg clksec4, clk_5KHz;
integer count, count1;
always@(posedge clk50MHz)
begin
	if(rst)
	begin
		count = 0;
		count1 = 0;
		clksec4 = 0;
		clk_5KHz =0;
end
else
begin
		if(count == 100000000)
		begin
			clksec4 = ~clksec4;
			count = 0;
		end
		if(count1 == 20000)
		begin
			clk_5KHz = ~clk_5KHz;
			count1 = 0;
		end
		count = count + 1;
		count1 = count1 + 1;
end
	end
endmodule

module led(number, s0, s1, s2, s3, s4, s5, s6);
output s0, s1, s2, s3, s4, s5, s6;
input [3:0] number;
reg s0, s1, s2, s3, s4, s5, s6;
always @ (number)
begin // BCD to 7-segment decoding
case (number) // s0 - s6 are active low
	4'b0000: begin s0=0; s1=0; s2=0; s3=1; s4=0; s5=0; s6=0; end
	4'b0001: begin s0=1; s1=0; s2=1; s3=1; s4=0; s5=1; s6=1; end
	4'b0010: begin s0=0; s1=1; s2=0; s3=0; s4=0; s5=1; s6=0; end
	4'b0011: begin s0=0; s1=0; s2=1; s3=0; s4=0; s5=1; s6=0; end
	4'b0100: begin s0=1; s1=0; s2=1; s3=0; s4=0; s5=0; s6=1; end
	4'b0101: begin s0=0; s1=0; s2=1; s3=0; s4=1; s5=0; s6=0; end
	4'b0110: begin s0=0; s1=0; s2=0; s3=0; s4=1; s5=0; s6=0; end
	4'b0111: begin s0=1; s1=0; s2=1; s3=1; s4=0; s5=1; s6=0; end
	4'b1000: begin s0=0; s1=0; s2=0; s3=0; s4=0; s5=0; s6=0; end
	4'b1001: begin s0=0; s1=0; s2=1; s3=0; s4=0; s5=0; s6=0; end
	default: begin s0=1; s1=1; s2=1; s3=1; s4=1; s5=1; s6=1; end
endcase
end
endmodule // end led

module LED_MUX (clk, rst, LED0, LED1, LED2, LED3, LEDOUT, LEDSEL);
input clk, rst;
input [7:0] LED0, LED1, LED2, LED3;
output[3:0] LEDSEL;
output[7:0] LEDOUT;

reg [3:0] LEDSEL;
reg [7:0] LEDOUT;
reg [1:0] index;
always @(posedge clk)
begin
if(rst)
index = 0;
else
index = index + 1;
end
always @(index or LED0 or LED1 or LED2 or LED3)
begin
	case(index)
	0: 	begin
			LEDSEL = 4'b1110;
			LEDOUT = LED0;
			end
	1: 	begin
			LEDSEL = 4'b1101;
			LEDOUT = LED1;
			end
	2: 	begin
			LEDSEL = 4'b1011;
			LEDOUT = LED2;
			end
	3: 	begin
			LEDSEL = 4'b0111;
			LEDOUT = LED3;
			end
	default: begin
			LEDSEL = 0; LEDOUT = 0;
			end
	endcase
end
endmodule
