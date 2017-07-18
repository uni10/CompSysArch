//SEG[11] W4 AN3
//SEG[10] V4 AN2
//SEG[9] U4 AN1
//SEG[8] U2 AN0
//SEG[7] V7 DP
//SEG[6] U7 CG
//SEG[5] V5 CF
//SEG[4] U5 CE
//SEG[3] V8 CD
//SEG[2] U8 CC
//SEG[1] W6 CB
//SEG[0] W7 CA
module Num_7seg_1(NUM, SEG);
    input [3:0] NUM;
    output [11:0] SEG;
    reg [11:0] buff;
    
    always @(NUM)
    begin
        case (NUM)
            4'b0000:buff <= 12'b1110_1_1000000; //0
            4'b0001:buff <= 12'b1110_1_1111001; //1
            4'b0010:buff <= 12'b1110_1_0100100; //2
            4'b0011:buff <= 12'b1110_1_0110000; //3
            4'b0100:buff <= 12'b1110_1_0011001; //4
            4'b0101:buff <= 12'b1110_1_0010010; //5
            4'b0110:buff <= 12'b1110_1_0000010; //6
            4'b0111:buff <= 12'b1110_1_1011000; //7
            4'b1000:buff <= 12'b1110_1_0000000; //8
            4'b1001:buff <= 12'b1110_1_0010000; //9
            4'b1010:buff <= 12'b1110_1_0100000; //a
            4'b1011:buff <= 12'b1110_1_0000011; //b
            4'b1100:buff <= 12'b1110_1_0100111; //c
            4'b1101:buff <= 12'b1110_1_0100001; //d
            4'b1110:buff <= 12'b1110_1_0000100; //e
            4'b1111:buff <= 12'b1110_1_0001110; //f
            default:buff <= 12'b1111_1_1111111; //off 
        endcase
    end
    
    assign SEG = buff;
    
endmodule