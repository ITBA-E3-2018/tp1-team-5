`include "decoder.v"


module ALUdecoder(
    input1,
    output1
);
    input[2:0] input1;
    output[7:0] output1;
    wire[7:0] outputAux;
    decoder dec1(input1[2],input1[1],outputAux[7],outputAux[6],outputAux[5],outputAux[4]);
    decoder dec2(input1[2],input1[1],outputAux[3],outputAux[2],outputAux[1],outputAux[0]);
    
    assign output1[7]= outputAux[7]&input1[0];
    assign output1[6]= outputAux[6]&input1[0];
    assign output1[5]= outputAux[5]&input1[0];
    assign output1[4]= outputAux[4]&input1[0];
    assign output1[3]= outputAux[3]&(~input1[0]);
    assign output1[2]= outputAux[2]&(~input1[0]);
    assign output1[1]= outputAux[1]&(~input1[0]);
    assign output1[0]= outputAux[0]&(~input1[0]);

endmodule