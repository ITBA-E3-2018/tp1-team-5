`include "inputNOTbitset.v"

module inputNOTbitset();

reg in1, in2, enable;
wire out1, out2;
inputNOTbitSet instancia(enable, in1, in2, out1, out2);

initial begin
    assign enable=0;
    assign in1=0;
    assign in2=0;
     #1
     $display("out1:%b, out2:%b-%s", out1, out2, ((out1==1) && (out2==1))? "PASS":"FAIL");
    assign enable=0;
    assign in1=1;
    assign in2=1;
     #1
     $display("out1:%b, out2:%b-%s", out1, out2, ((out1==1) && (out2==1))? "PASS":"FAIL");
     assign enable=1;
    assign in1=1;
    assign in2=1;
     #1
     $display("out1:%b, out2:%b-%s", out1, out2, ((out1==1) && (out2==1))? "PASS":"FAIL");
     assign enable=1;
    assign in1=0;
    assign in2=0;
     #1
     $display("out1:%b, out2:%b-%s", out1, out2, ((out1==0) && (out2==0))? "PASS":"FAIL");
end


endmodule