module FourBitTwoComplement(
    inputA,
    inputB,
    inputC,
    inputD,
    outputE,
    outputF,
    outputG,
    outputH
);
    input inputA;
    input inputB;
    input inputC;
    input inputD;
    output outputE;
    output outputF;
    output outputG;
    output outputH;

    assign outputH = inputD;
    assign outputG = (inputC & ~inputD)|(~inputC & inputD);
    assign outputF = (inputB & ~inputC & ~inputD)|(~inputB & inputC)|(~inputB & inputD);
    assign outputE = (inputA & ~inputB & ~inputC & ~inputD)||(~inputA & ~inputC & inputD)||(~inputA & ~inputB & inputC)||(~inputA & inputB);
endmodule
