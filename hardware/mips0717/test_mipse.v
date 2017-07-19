/* test bench */
`timescale 1ns/1ps
`include "def.h"
module test_mipse;
parameter STEP = 10;
   reg clk, rst_n;
   wire [`DATA_W-1:0] ddataout, ddatain ;
   wire [`DATA_W-1:0] iaddr;
   wire [`DATA_W-1:0] daddr;
   wire [`DATA_W-1:0] idata;
   wire we;
   integer count;
  
   always #(STEP/2) begin
            clk <= ~clk;
   end

   mipse mipse_1(.clk(clk), .rst_n(rst_n), .instr(idata),
               .readdata(ddatain), .pc(iaddr), .aluresult(daddr),
               .writedata(ddataout), .memwrite(we) );
  imem  imem_1(.a(iaddr[17:2]), .rd(idata) );
  dmem  dmem_1(.clk(clk), .a(daddr[17:2]), .rd(ddatain), 
  					.wd(ddataout), .we(we) );

   initial begin
      $dumpfile("mipse.vcd");
      $dumpvars(0,mipse_1);
	  count <= 0;
      clk <= `DISABLE;
      rst_n <= `ENABLE_N;
   #(STEP*1/4)
   #STEP
      rst_n <= `DISABLE_N;
   #(STEP*100)
   $finish;
   end

   always @(negedge clk) begin
    count <= count+1;
	if(we & daddr == 32'h00000050) begin
    $display("Clock Count: %d ", count);
	$finish; end
	end

   always @(negedge clk) begin
      $display("pc:%h idatain:%h", mipse_1.pc, mipse_1.instr);
      $display("reg:%h %h %h %h %h %h %h %h | %h", 
	mipse_1.rfile_1.rf[0], mipse_1.rfile_1.rf[1], mipse_1.rfile_1.rf[2],
	mipse_1.rfile_1.rf[3], mipse_1.rfile_1.rf[4], mipse_1.rfile_1.rf[5],
	mipse_1.rfile_1.rf[6], mipse_1.rfile_1.rf[7], mipse_1.rfile_1.rf[31]); 
   end 
endmodule
