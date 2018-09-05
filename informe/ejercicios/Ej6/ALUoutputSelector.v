`include "ALUor.v"

module ALUoutputSelector(
    input1,
    input2,
    input3,
    input4,
    input5,
    input6,
    input7,
    input8,
    output1
);
    parameter N=3;
    input[N:0] input1;
    input[N:0] input2;
    input[N:0] input3;
    input[N:0] input4;
    input[N:0] input5;
    input[N:0] input6;
    input[N:0] input7;
    input[N:0] input8;
    output[N:0] output1;

    wire[N:0] aux1;
    wire[N:0] aux2;
    wire[N:0] aux3;
    wire[N:0] aux4;
    wire[N:0] aux5;
    wire[N:0] aux6;

    ALUor#(3) out1(input1,input2,aux1);
    ALUor#(3) out2(input3,input4,aux2);
    ALUor#(3) out3(input5,input6,aux3);
    ALUor#(3) out4(input7,input8,aux4);

    ALUor#(3) out6(aux1,aux2,aux5);
    ALUor#(3) out7(aux3,aux4,aux6);

    ALUor#(3) out8(aux5,aux6,output1);

endmodule