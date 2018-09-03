`include "ALUresta.v"

module ALUresta_tb();

    parameter N=3;
    reg[N:0] input1;
    reg[N:0] input2;    
    wire[N:0] outputN;
    ALUresta inst2(input1,input2,outputN);

    initial begin
        $monitor("Inputs: %b    %b\nOutput: %b",input1,input2,outputN);

        input1 = 4'b0000;
        input2 = 4'b0011; #10;

        input1 = 4'b1010;
        input2 = 4'b0011; #10;

    end

    
endmodule