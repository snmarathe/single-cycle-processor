`timescale 1ns/1ps
`include "processor.v"

module testbench();
reg clk, rst;

always #4 clk = ~clk;
processor dut (clk, rst);

initial
begin
	$monitor ("time = %t, clk = %b, rst = %b", $time, clk, rst);
	
	clk = 0; rst = 0; 
    #1 rst = 1; #1 rst = 0;
	#44 $finish;
end
endmodule