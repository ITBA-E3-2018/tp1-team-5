/*
    Modulo que recibe un numero de N-bits y devuelve su version
    negada
*/
module ALUnot(input1, out);

    parameter N=3;
    //Input ports
    input[N:0] input1;

    //Output ports
    output[N:0] out;
    assign out= ~input1;

endmodule