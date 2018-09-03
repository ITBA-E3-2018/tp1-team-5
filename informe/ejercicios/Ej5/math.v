`include "ALUand.v"
module comparison(A, B, AeqB, AgtB, AltB);
parameter n = 4;
//inputs
input [n-1:0]A;
input [n-1:0]B;

//outputs
output AeqB; //"A equal to B"
output AgtB; //"A greater than B"
output AltB; //"A less than B"

//resultados intermedios
wire [n-1:0]W1; // isEqual bit a bit entre 'A' y 'B' (W1=in,..., i2, i1)
wire [n-1:0]W2; // isGreater bit a bit entre 'A' y 'B'
wire [n-1:0]W3; // combinaciones de bits de W1 
                //(W1= 1, 1 and in, 1 and in and i(n-1), ...in and... i1 and i0)

wire [n-1:0]W4;

//logica combinacional del módulo      

or(W3[n-1], 1, 1); //se setea el bit mas significativo en 1 para que
                //no interrumpa las operaciones con compuertas 'and'

genvar i;
generate
    for(i=0; i <= (n-1); i=i+1)
    begin
        isEqual BitsEqual(A[i], B[i], W1[i]); //A equal B bit a bit
        isGreater BitsGreater(A[i], B[i], W2[i]); //A greater B bit a bit
        
    end
endgenerate

genvar k;
generate
    for (k=1; k <= (n-1); k=k+1) //W6=[1, i(n-1), i(n-1).i(n-2), ..., i(n-1)!];
    begin
        and(W3[n-k-1], W3[n-k], W1[n-k]);
    end
endgenerate

andNbits #(n) isAEqualB(AeqB, W1); 
                            //se setea el resultado de AeqB (AeqB = in.(n.1)...in2.i1)

ALUand #(n-1) W2andbitW3(W2, W3, W4); //se instancia con "n-1" como parametro por cuestion
                                    //del modull ALUand, pero los bits realmente son 'n'

orNbits #(n) isAGreaterB(AgtB, W4); //se setea el resultado de AgtB

nor(AltB, AeqB, AgtB); //se setea el resultado de AltB

endmodule



module orNbits(result, X);
parameter n = 4;

//inputs 
input [n-1:0]X; //X contiene los n bits a los que se les debe 
                 //aplicar la operacion and entre sí

//output
output  result;

//resultados intermedios
wire [n:0]R1;//R1 son los resultados intermedios de la sucesion de compuertas 'or'




//logica combinacional del modulo

 and(R1[0], 0, 0);  //inicializo esta posicion del wire en 1 para que
                    //no me afecte en la comparacion de tipo 'and'

genvar i;
generate
     for(i=0; i <= n-1; i=i+1)
    begin
        or(R1[i+1], X[i], R1[i]);
    end
endgenerate

assign result=R1[n];


endmodule

module andNbits(result, X);
parameter n = 4;

//inputs 
input [n-1:0]X; //X contiene los n bits a los que se les debe 
                 //aplicar la operacion and entre sí

//output
output  result;

//resultados intermedios
wire [n:0]R1;//R1 son los resultados intermedios de la sucesion de compuertas 'and'




//logica combinacional del modulo

 or(R1[0], 1, 1);  //inicializo esta posicion del wire en 1 para que
                    //no me afecte en la comparacion de tipo 'and'

genvar i;
generate
     for(i=0; i <= n-1; i=i+1)
    begin
        and(R1[i+1], X[i], R1[i]);
    end
endgenerate

assign result=R1[n];


endmodule

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


module addern(Cin, X, Y, S, Cout);
parameter n=4;

//inputs
input Cin;
input [n-1:0]X;
input [n-1:0]Y;

//outputs
output [n-1:0]S;
output Cout;

//logica combinacional del modulo
wire [n:0]C;
assign C[0]=Cin;
assign Cout=C[n];

//generacion de modulos fulladders (stages) que suman bit a bit (teniendo en cuenta el carry)
genvar i;
generate
    for(i=0; i <= (n-1); i=i+1)
    begin:addbit
        fulladder stage(C[i], X[i],Y[i], S[i], C[i+1]); //cada stage le pasa el carry a la 
    end                                               //proxima stage
endgenerate

endmodule
