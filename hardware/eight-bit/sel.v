module sel(a, b, sel, c);
	/* 1のときa */
	input wire [7:0] a, b;
	input wire sel;
	output wire [7:0] c;

assign c = (sel) ? a : b;

endmodule
