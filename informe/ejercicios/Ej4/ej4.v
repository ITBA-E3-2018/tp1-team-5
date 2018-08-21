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

module FourBitTwoComplementTB(
);
    reg a,
        b,
        c,
        d;
    wire e,
         f,
         g,
         h;
    FourBitTwoComplement dut(a,b,c,d,e,f,g,h);
    initial begin
        $monitor("Input:  a=%b   b=%b   c=%b   d=%b\nOutput: e=%b   f=%b   g=%b   h=%b",a,b,c,d,e,f,g,h);
        a=0;b=0;c=0;d=0; #10;
        a=0;b=0;c=0;d=1; #10;
        a=0;b=0;c=1;d=0; #10;
        a=0;b=0;c=1;d=1; #10;
        a=0;b=1;c=0;d=0; #10;
        a=0;b=1;c=0;d=1; #10;
        a=0;b=1;c=1;d=0; #10;
        a=0;b=1;c=1;d=1; #10;
        a=1;b=0;c=0;d=0; #10;
        a=1;b=0;c=0;d=1; #10;
        a=1;b=0;c=1;d=0; #10;
        a=1;b=0;c=1;d=1; #10;
        a=1;b=1;c=0;d=0; #10;
        a=1;b=1;c=0;d=1; #10;
        a=1;b=1;c=1;d=0; #10;
        a=1;b=1;c=1;d=1; #10;
        $finish;
    end
endmodule
