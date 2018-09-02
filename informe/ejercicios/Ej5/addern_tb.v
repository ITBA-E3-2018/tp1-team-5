`include "addern.v"
module addern_tb();

reg Cin;
reg [3:0]X;
reg [3:0]Y;
reg [7:0]A;
reg [7:0]B;

wire [3:0]S;
wire[7:0]C;
wire Cout1;
wire Cout2;

addern #(4)adder4(Cin, X[3:0], Y[3:0], S[3:0], Cout1);
addern #(8)adder8(Cin,A[7:0], B[7:0], C[7:0], Cout2);

initial begin
    //prueba de una suma de 4 bits
    X=10;
    Y=7;
    Cin=0;
    #1
    $display("resultado:%b b / %d d, carryOut:%b", S, S, Cout1);
    //prueba de una suma de 8 bits
    A=64;
    B=16;
    Cin=0;
    #1
    $display("resultado:%b b / %d d, carryOut:%b", C, C, Cout2);
end

endmodule
