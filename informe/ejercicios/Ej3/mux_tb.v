`include "mux.v"
module mux_tb;

reg inp1;
reg inp2;
reg inp3;
reg inp4;
reg sel1;
reg sel2;
wire out1;

    initial begin

        
        $display("input1\t input2\t input3\t input4\t sel1\t sel2\t out");
        $monitor("%b\t %b\t %b\t %b\t %b\t %b\t %b", inp1, inp2, inp3, inp4, sel1, sel2,out1);

        //Primer caso
        sel1=0; //Se prueba que solo el inp1
        sel2=0; //sea el relevante
        inp1=1;
        inp2=0;
        inp3=0;
        inp4=0;

        #10sel1=0;
        sel2=0;
        inp1=0;
        inp2=0;
        inp3=0;
        inp4=0;


        //segundo caso
        #10 sel1=1; //se prueba que solo
        sel2=0;    //el inp2 es el relevante 
        inp1=0;
        inp2=1;
        inp3=0;
        inp4=0;

        #10sel1=1;
        sel2=0;
        inp1=0;
        inp2=0;
        inp3=0;
        inp4=0;

        //tercer caso
        #10 sel1=0; //se prueba que solo
        sel2=1;     //el inp3 es el relevante
        inp1=0;
        inp2=0;
        inp3=1;
        inp4=0;

        #10sel1=0;
        sel2=1;
        inp1=0;
        inp2=0;
        inp3=0;
        inp4=0;

        //cuarto caso
        #10 sel1=1; //se prueba que solo
        sel2=1;     //el inp4 es el relevante
        inp1=0;
        inp2=0;
        inp3=0;
        inp4=1;

        #10sel1=1;
        sel2=1;
        inp1=0;
        inp2=0;
        inp3=0;
        inp4=0;

        #10 $finish;

    end


    mux instance1(sel1, sel2, inp1, inp2, inp3,inp4,out1);





endmodule