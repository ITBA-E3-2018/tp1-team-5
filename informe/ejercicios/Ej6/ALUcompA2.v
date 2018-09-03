module ALUcompA2(
    input1,
    output1
);
    parameter N=3;
    input[N:0] input1;
    output[N:0] output1;
    reg[N:0] binaryOne = 1;

    assign output1 = (~input1)+binaryOne;
    
endmodule
