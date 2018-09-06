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
`include "inputWordSetNOT.v"
`include "ALUoutputSelector.v"


module ALU(input1,
    input2,
    operation,
    output1,
    Cout
);

//TABLA DE OPERADORES PARA EL PROGRAMADOR
parameter OPxor=0;//xor-0
parameter OPshift=1;//shift-1
parameter OPand=2;//and-2
parameter OPsuma=3;//suma-3
parameter OPnot=4;//not-4
parameter OPcompA2=5;//complementoA2-5
parameter OPor=6;//or-6
parameter OPresta=7;//resta-7

parameter n=4;  //numero de bits
parameter ops=8; //numero de operaciones 

//inputs
input [2:0]operation;
input [n-1:0]input1;
input [n-1:0]input2;

//outputs
output [n-1:0]output1;
output Cout;

//resultados intermedios

wire [ops-1:0]enableOperation;

wire [n-1:0]memInputs1ForOperations[0:ops-1];
wire [n-1:0]memInputs2ForOperations[0:ops-1];
wire [n-1:0]memOutputs[0:ops-1];

wire [n-1:0]auxInputNot;
wire auxEnableNot;




//logica combinacional del modulo

ALUdecoder decodeOperation(operation, enableOperation);



genvar i;
generate
    for(i=0; i < ops; i=i+1)
    begin
        if(i!=OPnot)
        begin
            inputWordSet #(n) wordSetters(enableOperation[i], input1, input2, memInputs1ForOperations[i], memInputs2ForOperations[i]);
        end
        else begin
            inputWordSetNOT #(n) wordNOTsetters(enableOperation[i], input1, input2, memInputs1ForOperations[i], memInputs2ForOperations[i]);
        end
    end
endgenerate

ALUxor xorer(memInputs1ForOperations[OPxor], memInputs2ForOperations[OPxor], memOutputs[OPxor]);
ALUarithmeticShiftLeft shifteador(memInputs1ForOperations[OPshift], memOutputs[OPshift]);
ALUand ander(memInputs1ForOperations[OPand], memInputs2ForOperations[OPand], memOutputs[OPand]);
ALUsuma sumador(1'b0, memInputs1ForOperations[OPsuma], memInputs2ForOperations[OPsuma], memOutputs[OPsuma], Cout);
ALUnot noter(memInputs1ForOperations[OPnot], memOutputs[OPnot]);
ALUcompA2 complementadorA2(memInputs1ForOperations[OPcompA2], memOutputs[OPcompA2]);
ALUor orer(memInputs1ForOperations[OPor], memInputs2ForOperations[OPor], memOutputs[OPor]);
ALUresta restador(memInputs1ForOperations[OPresta], memInputs2ForOperations[OPresta], memOutputs[OPresta]);


ALUoutputSelector selectorOutput(memOutputs[OPxor], memOutputs[OPshift], memOutputs[OPand], 
                                memOutputs[OPsuma], memOutputs[OPnot],
                                memOutputs[OPcompA2], memOutputs[OPor],
                                memOutputs[OPresta], output1);
//



endmodule
