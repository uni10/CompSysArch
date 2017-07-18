module Dir_7seg(DIR, SEG1, SEG2);
    input [1:0] DIR;
    output [11:0] SEG1, SEG2;
    reg [11:0] buff1, buff2;
    
    always @(DIR)
     begin
        case (DIR)
            2'b00: begin //UP
                buff1 <= 12'b0111_1_1000001;
                buff2 <= 12'b1011_1_0001100;
            end
            2'b01: begin //DOWN
                buff1 <= 12'b0111_1_0100001;
                buff2 <= 12'b1011_1_0100011;
            end
            2'b10: begin //RIGHT
                buff1 <= 12'b0111_1_0001000;
                buff2 <= 12'b1011_1_1111001;
            end
            2'b11: begin //LEFT
                buff1 <= 12'b0111_1_1000111;
                buff2 <= 12'b1011_1_0000110;
            end                                                   
        endcase
     end
     
     assign SEG1 = buff1;
     assign SEG2 = buff2;
         
endmodule
