`include "decoder.v"

module decoder_tb();

    reg inp1;
    reg inp2;
    wire out1, out2, out3, out4;

    initial begin

        
        $display("input1\t input2\t out1 out2 out3 out4");
        $monitor("%b\t %b\t %b %b %b %b", inp1, inp2, out1, out2, out3, out4);

        //Primer caso
        inp1=0;
        inp2=0;

        //segundo caso
        #10 inp1=1;
        inp2=0;

        //tercer caso
        #10 inp1=0;
        inp2=1;

        //cuarto caso
        #10 inp1=1;
        inp2=1;

        #10 $finish;

    end


    decoder dec1(inp1, inp2, out1, out2, out3, out4);



endmodule