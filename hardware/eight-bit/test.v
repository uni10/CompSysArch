`timescale 1ps/1ps

module test;
	reg clk, rst_n;

	parameter STEP = 10;

	always #(STEP/2) clk =~ clk;

	/*
	*	top moduleのインスタンス化
	*/
	top t0(clk, rst_n);

	initial begin
		clk = 0;
		rst_n = 0;
		$dumpfile("./top_test.vcd");
		$dumpvars(0, t0);
		/* $monitor(clk, rst_n); */
	#STEP
		rst_n = 1;
	#(STEP * 1000);

	$finish;

	end
endmodule
