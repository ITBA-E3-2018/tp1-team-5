/*
    Modulo hace Shift Left Aritmetico multiplicando el input por dos 
*/

module ALUarithmeticShiftLeft(
    binaryInput,
    binaryOutput
);

    parameter N=3; //number of bits
    reg[N:0] binaryTwo= 2;

    //Ports
    input[N:0] binaryInput;
    output[N:0] binaryOutput;

    assign binaryOutput = binaryTwo*binaryInput;

endmodule