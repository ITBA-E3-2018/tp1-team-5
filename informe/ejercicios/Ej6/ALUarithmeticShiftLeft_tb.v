`include "ALUarithmeticShiftLeft.v"

module ALUarithmeticShiftLeft_tb();
    parameter N=3;
    reg[N:0] inputN;
    wire[N:0] outputN;
    ALUarithmeticShiftLeft inst1(inputN,outputN);

    initial begin
        $monitor("Input: %b  \nOutput: %b",inputN,outputN);

        inputN = 4'b0000; #10;
        inputN = 4'b0001; #10;
        inputN = 4'b0010; #10;
        inputN = 4'b0011; #10;
        inputN = 4'b0100; #10;
        inputN = 4'b0101; #10;
        inputN = 4'b0110; #10;
        inputN = 4'b0111; #10;
        inputN = 4'b1000; #10;
        inputN = 4'b1001; #10;
        inputN = 4'b1010; #10;
        inputN = 4'b1011; #10;
        inputN = 4'b1100; #10;
        inputN = 4'b1101; #10;
        inputN = 4'b1110; #10;
        inputN = 4'b1111; #10;

    end

endmodule
