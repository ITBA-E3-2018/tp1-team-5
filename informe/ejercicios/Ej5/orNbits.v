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