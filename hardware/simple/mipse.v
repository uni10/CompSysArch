`include "def.h"
module mipse(
input clk, rst_n,
input [`DATA_W-1:0] instr,
input [`DATA_W-1:0] readdata,
output reg [`DATA_W-1:0] pc, 
output [`DATA_W-1:0] aluresult,
output [`DATA_W-1:0] writedata,
output memwrite);

wire [`DATA_W-1:0] srca, srcb, result;
wire [`OPCODE_W-1:0] opcode;
wire [`SHAMT_W-1:0] shamt;
wire [`OPCODE_W-1:0] func;
wire [`REG_W-1:0] rs, rd, rt, writereg;
wire [`SEL_W-1:0] com;
wire [`DATA_W-1:0] signimm;
wire [`DATA_W-1:0] pcplus4;
wire regwrite;
wire sw_op, beq_op, bne_op, addi_op, lw_op, j_op, alu_op;
wire zero;

assign {opcode, rs, rt, rd, shamt, func} = instr;
assign signimm = {{16{instr[15]}},instr[15:0]};

// Decorder
assign sw_op = (opcode == `OP_SW);
assign lw_op = (opcode == `OP_LW);
assign alu_op = (opcode == `OP_REG) & (func[5:3] == 3'b100);
assign addi_op = (opcode == `OP_ADDI);
assign beq_op = (opcode == `OP_BEQ);
assign bne_op = (opcode == `OP_BNE);
assign j_op = (opcode == `OP_J);
assign memwrite = sw_op;

assign srcb = (addi_op | lw_op | sw_op ) ? 
								signimm : writedata;

assign com = (addi_op|lw_op|sw_op) ? `ALU_ADD: 
			(beq_op | bne_op) ? `ALU_SUB: func;

assign result = lw_op  ? readdata : aluresult;

assign regwrite = lw_op | alu_op | addi_op ;

assign writereg = alu_op ? rd : rt;

alu alu_1(.a(srca), .b(srcb), .s(com), .y(aluresult), .zero(zero));

rfile rfile_1(.clk(clk), .rd1(srca), .a1(rs), .rd2(writedata), .a2(rt), 
	.wd3(result), .a3(writereg), .we3(regwrite));

assign pcplus4 = pc+4;
always @(posedge clk or negedge rst_n) 
begin 
   if(!rst_n) pc <= 0;
   else if (j_op) 
   	 pc	<= {pc[31:28],instr[25:0],2'b0};
   else if ((beq_op & zero) | (bne_op & !zero))
     pc <= pcplus4 +{signimm[29:0],2'b0} ;
   else 
     pc <= pcplus4;
end

endmodule
