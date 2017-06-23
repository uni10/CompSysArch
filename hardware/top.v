module top(input clk, rst_n);
	wire [7:0] dec_sel_data, sel_reg_data;
	wire [7:0] regdata0, regdata1, mem_out, sel_alu_data, alu_out;
	wire sel1, sel2;
	wire pc_we;
	wire reg_we;
	wire mem_we;
	wire zf, zf_out;
	wire [5:0] pc, pc_in; 
	wire [15:0] op;
	wire [3:0] alu_op; 
	wire [3:0] src0, src1, dst;

	// assigning each wire and input / output.
pc pc_0(
	.clk(clk), 
	.rst_n(rst_n),
   	.pc_in(pc_in[5:0]), 
	.pc_out(pc[5:0]), 
	.we(pc_we)
);

imem imem_0(
	.pc(pc[5:0]),
	.op(op[15:0])
);

decoder decoder_0(
	.op(op[15:0]),
	.zf(zf_out),
	.pc_in(pc_in[5:0]),
	.pc_we(pc_we),
	.src0(src0[3:0]), 
	.src1(src1[3:0]),
   	.dst(dst[3:0]), 
	.data(dec_sel_data[7:0]), 
	.alu_op(alu_op[3:0]), 
   	.reg_we(reg_we), 
	.sel1(sel1), 
	.sel2(sel2),
   	.mem_we(mem_we)
);

memory memory_0(
	.clk(clk),
	.rst_n(rst_n),
	.in(alu_out[7:0]),
	.addr(regdata1[7:0]),
	.we(mem_we),
	.out(mem_out[7:0])
);

/* 即値 */
sel dec_reg_sel(
	.a(dec_sel_data[7:0]), 
	.b(regdata0[7:0]), 
	.sel(sel1), 
	.c(sel_alu_data[7:0])
);

sel memory_alu_sel(
	.a(mem_out[7:0]), 
	.b(alu_out[7:0]), 
	.sel(sel2), 
	.c(sel_reg_data[7:0])
);

alu a0(
	.ina(sel_alu_data[7:0]), 
	.inb(regdata1[7:0]), 
	.op(alu_op[3:0]), 
	.zf(zf), 
	.out(alu_out[7:0])
);

zf zf0(
	.clk(clk),
	.rst_n(rst_n), 
	.zf_in(zf),
	.zf_out(zf_out)
);

regfile r0(
	.clk(clk), 
	.rst_n(rst_n), 
	.src0(src0[3:0]), 
	.src1(src1[3:0]), 
	.dst(dst[3:0]), 
	.we(reg_we), 
	.data(sel_reg_data[7:0]), 
	.outa(regdata0[7:0]), 
	.outb(regdata1[7:0])
);

endmodule
