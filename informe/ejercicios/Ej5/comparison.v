`include "isEqual.v"
`include "isGreater.v"
`include "andNbits.v"
`include "orNbits.v"
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
