`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/--/-- --:--:--
// Design Name: 
// Module Name: Decoder_7seg
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

module Decoder_7seg(
    input CLK,
    input [1:0] DIR,
    input [7:0] NUM,
    output [11:0] SEG
    );

	reg [11:0] buff;
	wire [11:0] seg_d1, seg_d2, seg_d3, seg_d4;
	reg [9:0] ff = 0;
	reg [1:0] count = 0;
	
	Dir_7seg Dir(
	   .DIR(DIR),
	   .SEG1(seg_d4),
	   .SEG2(seg_d3)
	);
	
	Num_7seg_2 Num2(
	   .NUM(NUM[7:4]),
	   .SEG(seg_d2)
	);
	
	Num_7seg_1 Num1(
	   .NUM(NUM[3:0]),
	   .SEG(seg_d1)
	);
	
	 always @(posedge CLK)
	 begin
	   if (ff==1000) begin
	       ff <= 0;
	       count <= count +1;
	       end
	   else
	       ff <= ff + 1;
	 end
	
	always @(CLK)
	begin
	   case(count)
	   2'b00: begin
            buff <= seg_d4;
	   end
	   2'b01: begin
            buff <= seg_d3;
       end
	   2'b10: begin
            buff <= seg_d2;
       end
	   2'b11: begin
            buff <= seg_d1;
       end
       endcase
	end
	
	assign SEG = buff;
	
endmodule