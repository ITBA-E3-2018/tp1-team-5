`include "ALU.v"

//TABLA DE OPERADORES PARA EL USUARIO
//suma-0
//not-1
//shift-2
//complementoA2-3
//and-4
//or-5
//xor-6
//resta-7

module ALU_tb();

reg [3:0]in1;
reg [3:0]in2;
reg [2:0]operation;

wire [3:0]out1;
wire Cout;

ALU aritmeticaLogica(in1, in2, operation, out1, Cout);

initial begin

      assign in1=8;
        assign in2=9;
        assign operation=0; //suma

        #1
        $display("in1:%b in2:%b op:%b, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==1)? "PASS":"FAIL");
        assign in1=10;
        assign in2=9;
        assign operation=1; //resta
        $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==1)?"PASS":"FAIL");
        assign in1=4;
        assign in2=9;
        assign operation=2; //shift
        #1
       $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==8)?"PASS":"FAIL");
        assign in1=8;
        assign in2=9;
        assign operation=3; //complA2
        #1
       $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==8)?"PASS":"FAIL");
        assign in1=8;
        assign in2=9;
        assign operation=4; //and
        #1
        $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b, %s", in1, in2, operation, out1, Cout, (out1==8)?"PASS":"FAIL");
        assign in1=8;
        assign in2=9;
        assign operation=5; //or
        #1
        $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==9)?"PASS":"FAIL");
        assign in1=8;
        assign in2=9;
        assign operation=6; //xor
        #1
        $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==1)?"PASS":"FAIL");
        assign in1=8;
        assign in2=9;
        assign operation=7; //not
        #1
        $display("in1:%b\t in2:%b\t op:%b\t, out:%b, CarryOut:%b %s", in1, in2, operation, out1, Cout, (out1==7)?"PASS":"FAIL");
        
        
    
end


endmodule