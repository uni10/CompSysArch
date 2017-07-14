/*
*	[15:12] alu_op
*	[11:8]	dst
*	[7:4]	src1
*	[3:0]	src0
*/

/* sel1が真のときは，即値を使う計算． */
/* その他のときは，registerから値を引っ張ってきて演算をする */

/* sel2が真のときは，memoryからのデータを読み込む命令 */
module decoder(
	input [15:0] op,
   	input zf,
   	output reg [5:0] pc_in, 
	output reg [3:0] src0, src1, dst, 
	output reg [7:0] data, 
	output reg [3:0] alu_op, 
	output reg pc_we, reg_we, sel1, sel2, mem_we
);

`include "def.h"

always @(*) begin
//synopsys parallel_case full_case
	case (op[15:12])
	AND : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	OR : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	ADD : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	INC : begin
		alu_op <= op[15:12];
		/* incrementするだけだから，dstとsrc0を一緒にする */
		dst <= op[3:0];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	DEC : begin
		alu_op <= op[15:12];
		/* decrementするだけだから，dstとsrc0を一緒にする */
		dst <= op[3:0];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	JMP : begin
		pc_in <= op[5:0];
		pc_we <= 1;
	end

	JNZ : begin
		/* zfの出力0ならjmp */
		pc_in <= op[5:0];
		pc_we <= ~zf;
	end

	JZ : begin
		/* zfの出力1ならjmp */
		pc_in <= op[5:0];
		pc_we <= zf;
	end

	COMP : begin
		alu_op <= op[15:12];
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	LI : begin
		alu_op <= op[15:12];
		dst <= op[11:8];
		src1 <= 0;
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 1;
		sel2 <= 0;
		data <= op[7:0];
		mem_we <= 0;
	end

	LOAD : begin
		alu_op <= op[15:12];
		/* memoryの内容を書き込むregister */
		dst <= op[11:8];
		/* オフセットが格納されたregister */
		src1 <= op[7:4];
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 1;
		data <= 0;
		mem_we <= 0;
	end

	STORE : begin
		alu_op <= op[15:12];
		/* オフセットが格納されたregister番号 */
		src1 <= op[7:4];
		/* 内容の格納されたregister番号 */
		src0 <= op[3:0];
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 0;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 1;
	end

	default : begin
		pc_we <= 0;
	end

endcase
end

endmodule
