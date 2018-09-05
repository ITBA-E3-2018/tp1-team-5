`include "ALUoutputSelector.v"

module ALUoutputSelector_tb(
    
);
    reg[3:0] input1;
    reg[3:0] input2;
    reg[3:0] input3;
    reg[3:0] input4;
    reg[3:0] input5;
    reg[3:0] input6;
    reg[3:0] input7;
    reg[3:0] input8;

    wire[3:0] outputN;

    ALUoutputSelector out(input1, input2, input3, input4, input5, input6, input7, input8, outputN);

    initial begin
        $monitor("Inputs:\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\nOutput: %b",input1,input2,input3,input4,input5,input6,input7,input8,outputN);

        input1 = 4'b0000;
        input2 = 4'b0000;
        input3 = 4'b0000;
        input4 = 4'b0011;
        input5 = 4'b0000;
        input6 = 4'b0000;
        input7 = 4'b0000;
        input8 = 4'b0000; #10;    

        input1 = 4'b0000;
        input2 = 4'b0000;
        input3 = 4'b0000;
        input4 = 4'b000;
        input5 = 4'b0000;
        input6 = 4'b0000;
        input7 = 4'b0000;
        input8 = 4'b1111; #10;    

        input1 = 4'b0000;
        input2 = 4'b0000;
        input3 = 4'b0000;
        input4 = 4'b0000;
        input5 = 4'b0000;
        input6 = 4'b0000;
        input7 = 4'b1000;
        input8 = 4'b0000; #10;        
    end

endmodule