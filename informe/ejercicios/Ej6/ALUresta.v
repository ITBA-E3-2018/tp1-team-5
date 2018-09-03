`include "ALUsuma.v"
`include "ALUcompA2.v"

module ALUresta(
    input1,
    input2,
    output1
);
    wire Cin = 0;
    wire Cout;
    wire[N:0] auxInput;
    parameter N =3;

    input[N:0] input1;
    input[N:0] input2;
    output[N:0] output1;
    ALUcompA2 inst1(input2,auxInput);
    addern inst2(Cin, input1, auxInput,output1, Cout);

endmodule