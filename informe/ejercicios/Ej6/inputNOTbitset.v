module inputNOTbitSet(bitEnable, bitIn1, bitIn2, bitOut1, bitOut2);
//inputs
input bitEnable;
input bitIn1;
input bitIn2;
//outputs
output bitOut1;
output bitOut2;

//auxiliares

wire w1;

//logica combinacional del modulo
not(w1, bitEnable);
or(bitOut1, bitIn1, w1);
or(bitOut2, bitIn2, w1);


endmodule