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
wire [`DATA_W-1:0] unsignimm;
wire [`DATA_W-1:0] pcplus4;
wire regwrite;
wire sw_op, beq_op, bne_op, addi_op, lw_op, j_op, jal_op, jr_op, alu_op;
wire ori_op, lui_op;
wire slt_op, slti_op;
wire zero;

assign {opcode, rs, rt, rd, shamt, func} = instr;
assign signimm = {{16{instr[15]}},instr[15:0]};
assign unsignimm = {16'b0,instr[15:0]};

// Decorder
assign sw_op = (opcode == `OP_SW);
assign lw_op = (opcode == `OP_LW);
assign alu_op = (opcode == `OP_REG) & (func[5:3] == 3'b100);
assign addi_op = (opcode == `OP_ADDI);
assign addiu_op = (opcode == `OP_ADDIU);
assign slti_op = (opcode == `OP_SLTI);
assign ori_op = (opcode == `OP_ORI);
assign lui_op = (opcode == `OP_LUI);
assign beq_op = (opcode == `OP_BEQ);
assign bne_op = (opcode == `OP_BNE);
assign j_op = (opcode == `OP_J);
assign jal_op = (opcode == `OP_JAL);
assign jr_op = (opcode == `OP_REG) & (func == `FUNC_JR);
assign slt_op = (opcode == `OP_REG) & (func == `FUNC_SLT);
assign sltu_op = (opcode == `OP_REG) & (func == `FUNC_SLTU);
assign memwrite = sw_op;
assign bltz_op = (opcode == `OP_REGIMM) & (rt == `OP_BLTZ);
assign bgez_op = (opcode == `OP_REGIMM) & (rt == `OP_BGEZ);
assign blez_op = (opcode == `OP_BLEZ);
assign sll_op = (opcode == `OP_REG) & (func == `FUNC_SLL);
assign movz_op = (opcode == `OP_REG) & (func == `FUNC_MOVZ);

assign srcb = (addi_op | lw_op | sw_op | slti_op) ? signimm : 
				lui_op ? {instr[15:0], 16'b0}:
				(ori_op | addiu_op) ? unsignimm : 
								writedata;

assign com = (addi_op | addiu_op | lw_op | sw_op) ? `ALU_ADD: 
			ori_op ? `ALU_OR:
			lui_op ? `ALU_THB:
			(beq_op | bne_op | slt_op | sltu_op | slti_op ) ? `ALU_SUB: func;
			
assign movz_en = movz_op & (writedata == 0);

assign result = slt_op | sltu_op | slti_op ? {31'b0,aluresult[31]} :
		movz_en ?  srca:
		sll_op ? (writedata << shamt) :
		jal_op ? pcplus4:
		lw_op  ? readdata :
		aluresult;

assign regwrite = lw_op | alu_op | addi_op | addiu_op | jal_op | slt_op | sltu_op | slti_op | sll_op | movz_en | ori_op | lui_op;

assign writereg = jal_op ? 5'b11111: alu_op | slt_op | sltu_op | sll_op | movz_en ? rd : rt;

alu alu_1(.a(srca), .b(srcb), .s(com), .y(aluresult), .zero(zero));

rfile rfile_1(.clk(clk), .rd1(srca), .a1(rs), .rd2(writedata), .a2(rt), 
	.wd3(result), .a3(writereg), .we3(regwrite));

assign pcplus4 = pc+4;
always @(posedge clk or negedge rst_n) 
begin 
   if(!rst_n) pc <= 0;
   else if (j_op | jal_op) 
   	 pc	<= {pc[31:28],instr[25:0],2'b0};
   else if (jr_op) 
   	 pc	<= srca;
   else if ((beq_op & zero) | (bne_op & !zero))
     pc <= pcplus4 +{signimm[29:0],2'b0} ;
	else if ((bltz_op & (srca < 0)) | (blez_op & (srca <= 0)) | (bgez_op & (srca > 0)))
     pc <= pcplus4 +{signimm[29:0],2'b0} ;
   else 
     pc <= pcplus4;
end

endmodule
