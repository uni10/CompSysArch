/* test bench */
`include "def.h"

module fpga_test(clk, trigger);

     (* mark_debug = "true" *) input clk;
    (* mark_debug = "true" *) output trigger;
    reg treg;
   reg rst_n;
   wire [`DATA_W-1:0] ddatain, ddataout;
   wire [`DATA_W-1:0] iaddr;
   wire [`DATA_W-1:0] daddr;
   wire [`DATA_W-1:0] idata;
   wire we;
   
   //reg [9:0] count;
     
   always @(posedge clk)
   begin
    /*if (count==1000) begin
        count <= count + 1;
        rst_n <= 0;
        end
    else if (count==100) begin
            count <= count + 1;
            treg <= ~treg;
            end
    else*/
        //count <= count + 1;
        //rst_n <= 1;
       //treg <= ~treg;
             rst_n <= `DISABLE_N;
             treg = clk;
   end
   assign trigger = treg;

   mipse mipse_1(.clk(clk), .rst_n(rst_n), .instr(idata),
               .readdata(ddatain), .pc(iaddr), .aluresult(daddr),
               .writedata(ddataout), .memwrite(we) );
  imem  imem_1(.a(iaddr[17:2]), .rd(idata) );
  dmem  dmem_1(.clk(clk), .a(daddr[17:2]), .rd(ddatain), 
  					.wd(ddataout), .we(we) );
  					

endmodule
