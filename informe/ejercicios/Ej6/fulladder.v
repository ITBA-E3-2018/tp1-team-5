module fulladder(Cin, x, y, s, Cout);

//inputs
input Cin;
input x;
input y;

//outputs
output s;
output Cout;

//estados intermedios
wire w1; //x xor y
wire w2; //x and y
wire w3; //x and Cin
wire w4; //y and Cin
wire w5; //w3 or w4

//logica combinacional del modulo
xor(w1, x, y); 
xor(s, w1, Cin); //seteo de 'resultado de suma'

and(w2, x, y);
and(w3, x, Cin);
and(w4, y, Cin);
or(w5, w3, w4);
or(Cout, w2, w5);   //seteo de 'carry de salida'
endmodule


