module FourBitTwoComplement(
    inputA,
    inputB,
    inputC,
    inputD,
    outputE,
    outputF,
    outputG,
    outputH,
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
    assign outputC = (inputA & ~inputB & ~inputC & ~inputD)||(~inputA & ~inputC & inputD)||(~inputA & ~inputB & inputC)||(~inputA & inputB);
endmodule

module FourBitTwoComplementTB(
);
    reg a,
        b,
        c,
        d,
        e,
        f,
        g,
        h;
    FourBitTwoComplement dut(a,b,d,c,e,f,g,h)

    initial begin
        a=0;b=0;c=0;d=0; #10;
        a=1;b=0;c=0;d=0; #10;
        a=1;b=1;c=0;d=0; #10;
        a=0;b=1;c=1;d=1; #10;
    end
endmodule
