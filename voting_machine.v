`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:56 02/10/2014 
// Design Name: 
// Module Name:    voting_machine 
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

module my_design(w,n,o,a,b,c,d);
input w,n,o;
output a,b,c,d;
assign a = w&n&o;
assign b = ~w&~n&o | ~w&n&o | w&~n&o  | w&n&~o;
assign c = ~w&n&~o | ~w&n&o | w&~n&~o | w&~n&o;
assign d = ~w&n&~o | ~w&n&o | w&n&~o  | w&n&o;
endmodule // end my_design

module voting_machine (A,B,C,clk50MHz,rst,LEDOUT,LEDSEL);
input A;
input B;
input C;
input clk50MHz;
input rst;
output[7:0] LEDOUT;
output[3:0] LEDSEL;
supply1[7:0] vcc;
wire s0, s1, s2, s3, s4, s5, s6, s7;
wire [3:0] i;
wire DONT_USE, clk_5KHz;
assign s7 = 1'b1;
// instantiation and connect the two sub-modules
my_design u0(A,B,C,i[0],i[1],i[2],i[3]);
led u1({i[0],i[1],i[2],i[3]},s0,s1,s2,s3,s4,s5,s6);
LED_MUX u2(clk_5KHz, rst, {s7, s6, s5, s4, s3, s2, s1, s0},
vcc, vcc, vcc, LEDOUT, LEDSEL);
clk_gen u3 (.clk50MHz(clk50MHz), .rst(rst),
.clksec4(DONT_USE), .clk_5KHz(clk_5KHz));
// Signal DONT_USE will cause some warnings during Synthesis.
// You can ignore the warnings.
endmodule // end voting_machine