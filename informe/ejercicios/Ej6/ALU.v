`include "ALUand.v"
`include "ALUarithmeticShiftLeft.v"
`include "ALUcompA2.v"
`include "ALUnot.v"
`include "ALUor.v"
`include "ALUresta.v"
`include "ALUsuma.v"
`include "ALUxor.v"

module ALU(
    input1,
    input2,
    operation,
    output1,
);

parameter = 3;
input[N:0] operation;
input[N:0] input1;
input[N:0] input2;
output1[N:0] output1;

//segun el input en operation, se ejecuta una operacion en particular
//si la operacion requiere solo un input, se elige el input1 y se ignora input2

case (operation)
/*
    0 : ALUand and();
    1 : ;
    2 : ;
    3 : ;
    4 : ;
    5 : ;
    6 : ;
    7 : ;
    8 : ;
*/
endcase
    
endmodule