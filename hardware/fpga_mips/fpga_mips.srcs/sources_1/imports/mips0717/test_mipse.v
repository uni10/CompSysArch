/* test bench */
`include "def.h"
module test_mipse(clk);
   input clk;
   reg rst_n;
   wire [`DATA_W-1:0] ddataout, ddatain ;
   wire [`DATA_W-1:0] iaddr;
   wire [`DATA_W-1:0] daddr;
   wire [`DATA_W-1:0] idata;
   wire we;
   
   mipse mipse_1(.clk(clk), .rst_n(rst_n), .instr(idata),
               .readdata(ddatain), .pc(iaddr), .aluresult(daddr),
               .writedata(ddataout), .memwrite(we) );
  imem  imem_1(.a(iaddr[17:2]), .rd(idata) );
  dmem  dmem_1(.clk(clk), .a(daddr[17:2]), .rd(ddatain), 
  					.wd(ddataout), .we(we) );

   initial begin
      rst_n <= `ENABLE_N;
   end

   always @(negedge clk) begin
      rst_n <= `DISABLE_N;
   end

endmodule
