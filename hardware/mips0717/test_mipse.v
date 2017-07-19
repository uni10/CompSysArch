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
   #(STEP*100000)
   $finish;
   end

   always @(negedge clk) begin
    count <= count+1;
	// if(we & daddr == 32'h00000050) begin
 //    $display("Clock Count: %d ", count);
	// $finish; end
	end

   always @(negedge clk) begin
      $display("");
      $display("pc:%h idatain:%h", mipse_1.pc, mipse_1.instr);
      $display("16: %h field_length:%h cmd_log: %h %h %h %h %h %h %h",
        dmem_1.mem[4],
        dmem_1.mem[5832],
        dmem_1.mem[5833],
        dmem_1.mem[5834],
        dmem_1.mem[5835],
        dmem_1.mem[5836],
        dmem_1.mem[5837],
        dmem_1.mem[5838],
        dmem_1.mem[5839]);
      $display("fields[0]:%h %h %h %h %h %h %h %h",
        dmem_1.mem[72],
        dmem_1.mem[73],
        dmem_1.mem[74],
        dmem_1.mem[75],
        dmem_1.mem[76],
        dmem_1.mem[77],
        dmem_1.mem[78],
        dmem_1.mem[79]);
      $display("fields[1]:%h %h %h %h %h %h %h %h",
        dmem_1.mem[80],
        dmem_1.mem[81],
        dmem_1.mem[82],
        dmem_1.mem[83],
        dmem_1.mem[84],
        dmem_1.mem[85],
        dmem_1.mem[86],
        dmem_1.mem[87]);
      $display("fields[2]:%h %h %h %h %h %h %h %h",
        dmem_1.mem[88],
        dmem_1.mem[89],
        dmem_1.mem[90],
        dmem_1.mem[91],
        dmem_1.mem[92],
        dmem_1.mem[93],
        dmem_1.mem[94],
        dmem_1.mem[95]);
      $display("fields[3]:%h %h %h %h %h %h %h %h",
        dmem_1.mem[96],
        dmem_1.mem[97],
        dmem_1.mem[98],
        dmem_1.mem[99],
        dmem_1.mem[100],
        dmem_1.mem[101],
        dmem_1.mem[102],
        dmem_1.mem[103]);
      $display("queue[0]: %h queue[1]: %h queue[255]: %h",
        dmem_1.mem[5873],
        dmem_1.mem[5874],
        dmem_1.mem[6128]);
      $display("head: %h", dmem_1.mem[6129]);
      $display("tail: %h", dmem_1.mem[6130]);
      $display("reg 02 10:%h %h %h %h %h %h %h %h %h", 
        mipse_1.rfile_1.rf[2], mipse_1.rfile_1.rf[3], mipse_1.rfile_1.rf[4],
        mipse_1.rfile_1.rf[5], mipse_1.rfile_1.rf[6], mipse_1.rfile_1.rf[7],
        mipse_1.rfile_1.rf[8], mipse_1.rfile_1.rf[9], mipse_1.rfile_1.rf[10]);
      $display("reg 11 19:%h %h %h %h %h %h %h %h %h", 
        mipse_1.rfile_1.rf[11], mipse_1.rfile_1.rf[12], mipse_1.rfile_1.rf[13],
        mipse_1.rfile_1.rf[14], mipse_1.rfile_1.rf[15], mipse_1.rfile_1.rf[16],
        mipse_1.rfile_1.rf[17], mipse_1.rfile_1.rf[18], mipse_1.rfile_1.rf[19]);
      $display("reg 20 29:%h %h %h %h %h %h %h %h %h", 
        mipse_1.rfile_1.rf[20], mipse_1.rfile_1.rf[21], mipse_1.rfile_1.rf[22],
        mipse_1.rfile_1.rf[23], mipse_1.rfile_1.rf[25], mipse_1.rfile_1.rf[26],
        mipse_1.rfile_1.rf[27], mipse_1.rfile_1.rf[28], mipse_1.rfile_1.rf[29]); 
   end 
endmodule
