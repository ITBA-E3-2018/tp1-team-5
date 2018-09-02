module isGreater(a, b, isGr);

//inputs
input a;
input b;

//outputs
output isGr;

//resultados intermedios
wire w1; //not b

//logica combinacional del modulo
not(w1, b);
and(isGr, a, w1);

endmodule

