module imem(input [5:0] pc, output reg [15:0] op);

`include "def.h"
`include "regdef.h"

always @(pc) begin
	case (pc)
		0 : begin
			op[15:12] <= LI;
			op[11:8] <= CELL_NUM;
			op[7:0] <= 8;
		end

		1 : begin
			op[15:12] <= LI;
			op[11:8] <= CUL_CELL;
			op[7:0] <= 0;
		end

		2 : begin
			op[15:12] <= COMP;
			op[7:4] <= CELL_NUM;
			op[3:0] <= CUL_CELL;
		end

		3 : begin 
			op[15:12] <= INC;
			op[3:0] <= CUL_CELL;
		end

		4 : begin
			op[15:12] <= JNZ;
			op[5:0] <= 2;
		end

		/* debugs */
	/* 0 : begin */
	/* 	op[15:12] <= LI; */
	/* 	op[11:8] <= 0; */
	/* 	op[7:0] <= 1; */
	/* end */

	/* 1: begin */
	/* 	op[15:12] <= LI; */
	/* 	op[11:8] <= 1; */
	/* 	op[7:0] <= 12; */
	/* end */

	/* 2: begin */
	/* 	op[15:12] <= ADD; */
	/* 	op[11:8] <= 2; */
	/* 	op[7:4] <= 0; */
	/* 	op[3:0] <= 1; */
	/* end */

	/* 3 : begin */
	/* 	op[15:12] <= INC; */
	/* 	op[3:0] <= 2; */
	/* end */

	/* 4 : begin */
	/* 	op[15:12] <= COMP; */
	/* 	op[11:8] <= 0; */
	/* 	op[7:4] <= 0; */
	/* 	op[3:0] <= 0; */
	/* end */

	/* 5 : begin */
	/* 	op[15:12] <= INC; */
	/* 	op[3:0] <= 2; */
	/* end */

	/* 6 : begin */
	/* 	op[15:12] <= STORE; */
	/* 	op[7:4] <= 0; */
	/* 	op[3:0] <= 1; */
	/* end */

	/* 7 : begin */ 
	/* 	op[15:12] <= LOAD; */
	/* 	op[11:8] <= 3; */
	/* 	op[7:4] <= 0; */
	/* end */

	/* 8: begin */
	/* 	op[15:12] <= ADD; */
	/* 	op[11:8] <= 4; */
	/* 	op[7:4] <= 3; */
	/* 	op[3:0] <= 1; */
	/* end */

endcase
end

endmodule
