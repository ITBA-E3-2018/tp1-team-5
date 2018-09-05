`include "ALUand.v"
`include "ALUarithmeticShiftLeft.v"
//`include "ALUcompA2.v"
`include "ALUnot.v"
//`include "ALUor.v"
`include "ALUresta.v"
//`include "ALUsuma.v"
`include "ALUxor.v"
`include "ALUdecoder.v"
`include "inputWordSet.v"
`include "ALUoutputSelector.v"

//TABLA DE OPERADORES PARA EL USUARIO
//suma-0
//resta-1
//shift-2
//complementoA2-3
//and-4
//or-5
//xor-6
//not-7


module ALU(
    input1,
    input2,
    operation,
    output1,
    Cout,
);

//TABLA DE OPERADORES PARA EL PROGRAMADOR
`define OPxor 0//xor-0
`define OPshift1 1//shift-1
parameter OPand=2;//and-2
parameter OPsuma=3;//suma-3
parameter OPnot=4;//not-4
parameter OPcompA2=5;//complementoA2-5
parameter OPor=6;//or-6
parameter OPresta=7;//resta-7

parameter n=4;  //numero de bits
parameter ops=8; //numero de operaciones 

//inputs
input [n-1:0]operation;
input [n-1:0]input1;
input [n-1:0]input2;

//outputs
output [n-1:0]output1;
output Cout;

initial begin
    $readmemb("memInputs1.txt", memInputs1ForOperations);
    $readmemb("memInputs2.txt", memInputs1ForOperations);
    $readmemb("memOutput.txt", memOutputs);
end

//resultados intermedios

wire [n-1:0]enableOperation;

reg [n-1:0]memInputs1ForOperations[0:ops-1];
reg [n-1:0]memInputs2ForOperations[0:ops-1];
reg [n-1:0]memOutputs[0:ops-1];




//logica combinacional del modulo

ALUdecoder decodeOperation(operation, enableOperation);



genvar i;
generate
    for(i=0; i < n; i=i+1)
    begin
        inputWordSet #(n) wordSetters(enableOperation[i], input1, input2, memInputs1ForOperations[i], memInputs2ForOperations[i]);
    end
endgenerate

ALUxor xorer(memInputs1ForOperations[OPxor], memInputs2ForOperations[OPxor], memOutputs[OPxor]);
ALUarithmeticShiftLeft shifteador(memInputs1ForOperations[OPshift], memInputs2ForOperations[OPshift], memOutputs[OPshift]);
ALUand ander(memInputs1ForOperations[OPand], memInputs2ForOperations[OPand], memOutputs[OPand]);
ALUsuma sumador(0, memInputs1ForOperations[OPsuma], memInputs2ForOperations[OPsuma], memOutputs[OPsuma], Cout);
ALUnot noter(memInputs1ForOperations[OPnot], memOutputs[OPnot]);
ALUcompA2 complementadorA2(memInputs1ForOperations[OPcompA2], memOutputs[OPcompA2]);
ALUor orer(memInputs1ForOperations[OPor], memOutputs[OPor]);
ALUresta restador(memInputs1ForOperations[OPresta], memOutputs[OPresta]);


ALUoutputSelector selectorOutput(memOutputs[OPxor], memOutputs[OPshift], memOutputs[OPand], 
                                memOutputs[OPsuma], memOutputs[OPnot],
                                memOutputs[OPcompA2], memOutputs[OPor],
                                memOutputs[OPresta], output1);


endmodule