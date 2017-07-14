/* 1. 答えに達したかを示すレジスタ */
/* 2. 9つのマスを管理する(各1byte)(memoryに送る) */
/* 3. 0の位置を保つレジスタ */  
/* 4. 距離の合算をとるためのレジスタ(0..8個) */
/* [0..8]の配列をもった状態を作れれば完成 */


module regfile(src0, src1, dst, we, data, clk, rst_n, outa, outb);
	input wire clk, rst_n;
	input wire [3:0] src0, src1;
	input wire [3:0] dst;
	input wire [7:0] data;
	input wire we;
	output wire [7:0] outa, outb;

	reg [7:0] regis [15:0];

always @(posedge clk) begin
	if (!rst_n) begin
		regis[0] <= 0;
		regis[1] <= 0;
		regis[2] <= 0;
		regis[3] <= 0;
		regis[4] <= 0;
		regis[5] <= 0;
		regis[6] <= 0;
		regis[7] <= 0;
		regis[8] <= 0;
		regis[9] <= 0;
		regis[10] <= 0;
		regis[11] <= 0;
		regis[12] <= 0;
		regis[13] <= 0;
		regis[14] <= 0;
		regis[15] <= 0;
	end else begin
		if (we) begin
			regis[dst] <= data;
		end else begin
			regis[dst] <= regis[dst];
		end
	end
end

assign outa = regis[src0];
assign outb = regis[src1];

endmodule
