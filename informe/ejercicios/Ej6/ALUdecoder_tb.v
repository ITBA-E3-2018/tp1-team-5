`include "ALUdecoder.v"

module ALUdecoder_tb(
    
);
    //vars
    reg[2:0] inputN;
    wire[7:0] outputN;

    ALUdecoder dec(inputN,outputN);
    initial begin
        $monitor("Input: %b  \nOutput: %b",inputN,outputN);

        inputN = 3'b000; #10;
        inputN = 3'b001; #10;
        inputN = 3'b010; #10;
        inputN = 3'b011; #10;
        inputN = 3'b100; #10;
        inputN = 3'b101; #10;
        inputN = 3'b110; #10;
        inputN = 3'b111; #10;

    end
endmodule

