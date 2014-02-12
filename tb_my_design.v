`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:26 02/10/2014 
// Design Name: 
// Module Name:    tb_my_design 
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
// testbench for module my_design.v
module tb_my_design;
reg tb_w, tb_n, tb_o;
wire tb_a, tb_b, tb_c, tb_d;
//instantiate the module my_design
my_design DUT (tb_w, tb_n, tb_o, tb_a, tb_b, tb_c, tb_d);
//all initial blocks begin at time=0 concurrently
initial
	begin
		tb_o = 0;
		forever #5 tb_o = ~tb_o;
end

initial
	begin
		tb_n = 0;
		forever #10 tb_n = ~tb_n;
end
initial
	begin
		tb_w = 0;
		forever #20 tb_w = ~tb_w;
end
//stop at time=40
initial
		#40 $stop;
initial
		$monitor($time, "A=%b, B=%b, C=%b : a=%b, b=%b, c=%b, d=%b",
		tb_w, tb_n, tb_o, tb_a, tb_b, tb_c, tb_d);
endmodule
