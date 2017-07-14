/*
*	AND, OR, ADD, SUB, INC, DEC, COMP, LOAD, STORE, LI, (JMP, JNZ)
*/
module alu(ina, inb, op, zf, out);
	input wire [7:0] ina, inb;
	input wire [3:0] op;
	output reg [7:0] out;
	output reg zf;

`include "def.h"

always @(*) begin
	case (op)
	AND : begin
		out <= ina & inb;
		zf <= 0;
	end

	OR : begin
		out <= ina | inb;
		zf <= 0;
	end

	ADD : begin
		out <= ina + inb;
		zf <= 0;
	end

	SUB : begin
		out <= (ina > inb) ? ina - inb : inb - ina;
		zf <= 0;
	end

	INC : begin
		out <= ina + 1;
		zf <= 0;
	end

	DEC : begin
		out <= ina - 1;
		zf <= 0;
	end

	COMP : begin
		zf <= (ina == inb) ? 1 : 0;
	end

	CHECK : begin
		zf <= (ina == inb) ? 1 : 0;
	end

	LOAD : begin
		out <= ina;
		zf <= 0;
	end

	STORE : begin
		out <= ina;
		zf <= 0;
	end

	LI : begin
		out <= ina;
		zf <= 0;
	end

	default : begin
		out <= 0;
		zf <= 0;
	end

	endcase
end

endmodule
