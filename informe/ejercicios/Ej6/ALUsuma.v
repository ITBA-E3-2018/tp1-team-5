`include "fulladder.v"
module ALUsuma(Cin, X, Y, S, Cout);
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
