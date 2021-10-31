`timescale 1ns/1ns
`include "processor.v"

module testbench();
reg clk, rst;

always #5 clk = ~clk;
processor dut (clk, rst);

initial
begin
	$monitor ("time = %t,\tclk = %b, rst = %b", $time, clk, rst);
	
	clk = 0; rst = 0; 
    #1 rst = 1; #1 rst = 0;
	#110 $finish;
end
endmodule