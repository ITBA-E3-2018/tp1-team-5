`include "BCDfulladder.v"
module BCDfulladder_tb();

reg [3:0]A;
reg [3:0]B;
wire [7:0]C;

BCDfulladder BCD1digitAdder(A, B, C);

initial begin
assign A=5; //test con dos digitos de resultado
assign B=6;
#1
$display("Test 1 - A:%d, B:%d, C:%b / %h %s ", A, B, C, C, (C==(A+B+6))? "PASS":"FAIL");

assign A=9; //testo con dos digitos de resultado pero con correccion de carry
assign B=8;
#1
$display("Test 1 - A:%d, B:%d, C:%b / %h %s" , A, B, C, C, (C==(A+B+6))? "PASS":"FAIL");

assign A=5; //testo con un digito de resultado pero con correccion de carry
assign B=3;
#1
$display("Test 1 - A:%d, B:%d, C:%b / %h %s ", A, B, C, C, (C==(A+B))? "PASS":"FAIL");

end

endmodule