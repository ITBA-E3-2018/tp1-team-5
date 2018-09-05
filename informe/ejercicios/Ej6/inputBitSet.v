module inputBitSet(bitEnable, bitIn1, bitIn2, bitOut1, bitOut2);
//inputs
input bitEnable;
input bitIn1;
input bitIn2;
//outputs
output bitOut1;
output bitOut2;

//logica combinacional del modulo
and(bitOut1, bitEnable, bitIn1);
and(bitOut2, bitEnable, bitIn2);


endmodule