/*
*	Program counterは基本的に1ずつ増えていきます
*	このPCはIMEMのアドレスを表していて，そのアドレスにある命令(OP)を
*	読み取ってデコーダに渡す形になります．
*
*	we = write enable
*/
module pc(pc_in, pc_out, clk, rst_n, we);
	input wire clk, rst_n;
	input wire [5:0] pc_in;
	input wire we;
	output reg [5:0] pc_out;

always @(posedge clk) begin
	if (!rst_n) begin
		pc_out <= 0;
	end else begin
		if (we) begin
			pc_out <= pc_in;
		end else begin
			pc_out <= pc_out + 1;
		end
	end
end

endmodule
