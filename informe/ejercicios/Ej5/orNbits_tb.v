`include "orNbits.v"

module andNbits_tb();

parameter n=4;

reg [n-1:0]X;

wire resultado;

orNbits compOR(resultado, X);

initial begin
    #5
    X=0000;
    #1
    $display("Test 1 (0000): resultado:%b (%s)", resultado, (resultado==0 ) ? "PASS" : "FAIL" );

    X=10;
    #1
    $display("Test 2 (1010): resultado: resultado=%b (%s)", resultado, (resultado==1 ) ? "PASS" : "FAIL" );

    X=15;
    #1
    $display("Test 3 (1111): resultado: resultado=%b (%s)", resultado, (resultado==1 ) ? "PASS" : "FAIL" );
end

endmodule