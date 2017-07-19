`include "def.h"

module alu (
  input [`DATA_W-1:0] a, b, 
  input [`SEL_W-1:0] s,
  output [`DATA_W-1:0] y,
  output zero );
  assign y = s==`ALU_ADD ? a+b:
  			 s==`ALU_SUB ? a-b:
             s==`ALU_AND ? a & b:
             s==`ALU_OR ? a | b:
             s==`ALU_XOR ? a ^ b:
             s==`ALU_NOR ? ~ (a | b):
  			 s==`ALU_ADDU ? a+b:
			 b;
  assign zero = (y == 32'b0);
endmodule
