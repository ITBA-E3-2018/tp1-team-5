`include "inputNOTbitset.v"
module inputWordSetNOT(bitEnable, wordIn1, wordIn2, wordOut1, wordOut2);

parameter n=4;  //'n' define el número de bits de la palabra 
                //(por defecto de toman 4 bits)

//inputs 
input bitEnable;
input [n-1:0]wordIn1;
input [n-1:0]wordIn2;

//outputs
output [n-1:0]wordOut1;
output [n-1:0]wordOut2;


//logica combinacional del modulo

genvar i;
generate
    for(i=0; i <n; i=i+1)
    begin
        inputNOTbitSet bitNOTSetter(bitEnable, wordIn1[i], wordIn2[i], wordOut1[i], wordOut2[i]);
    end
endgenerate


endmodule