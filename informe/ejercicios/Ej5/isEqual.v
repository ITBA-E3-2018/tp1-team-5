module isEqual(a, b, isEq);

//inputs
input a;
input b;

//output
output isEq;


//resultados intermedios
wire w1;//a xor b

//logica combinacional del modulo

xor(w1, a, b);
not(isEq, w1);

endmodule