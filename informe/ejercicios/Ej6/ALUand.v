/*
    Modulo que realiza la operacion and entre dos nummeros de
    N-bits. El cuarto parametro que recibe el modulo es el
    numero de bits de los inputs
*/
module ALUand(input1, input2, out);

    parameter N=3;
    //Input ports
    input[N:0] input1;
    input[N:0] input2;

    //Output ports
    output[N:0] out;
    assign out= input1 & input2;

endmodule