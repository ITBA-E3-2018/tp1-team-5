`include "math.v"

module BCDfulladder(A, B, OUT);


//inputs
input [3:0]A;
input [3:0]B;

//output
output [7:0]OUT; //el output tiene una cifra (de 4 bits) mas con respecto al input

//resultados intermedios
wire Cout1; //carryout de la primer suma
wire Cout2; //carryout de la segunda suma
wire [3:0]S1; //resultado de la primer suma
wire [3:0]S2; //resultado de la segunda suma
wire S1eqOffset;//resultados de la comparacion
wire S1gtOffset;
wire S1ltOffset;
wire selectAddition; //S1gtOffset or Cout1
wire carryResult; //Cout1 or Cout2


wire [3:0]offsetComparator; //offset para comparar con el resultado de la suma
wire [3:0]offsetsecondAdder; //vale 6 cuando hay carry o el resultado de la primer
                //suma es mayor al 'offsetComparator'

//logica combinacional

addern #(4) firstAdder(0, A, B, S1, Cout1);

comparison #(4)comparator(S1, offsetComparator, S1eqOffset, S1gtOffset, S1ltOffset);

or(selectAddition, S1gtOffset, Cout1);

or(carryResult, Cout1, Cout2);

addern #(4)  secondAdder(0, S1, offsetsecondAdder, S2, Cout2);




genvar i;
generate
    assign offsetsecondAdder[3]=0;  //el offset del segundo sumador es '6' o '0'
    assign offsetsecondAdder[2]=selectAddition;
    assign offsetsecondAdder[1]=selectAddition;
    assign offsetsecondAdder[0]=0;
    assign OUT[4]=carryResult;

    for(i=0; i <= 3; i=i+1)
    begin
        assign OUT[i]=S2[i];
    end
    
    for (i=5; i <= 7; i=i+1)
    begin
        assign OUT[i]=0;
    end
    assign offsetComparator=9;
    
endgenerate

endmodule