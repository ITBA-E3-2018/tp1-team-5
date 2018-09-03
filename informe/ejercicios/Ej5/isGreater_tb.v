`include "isGreater.v"
module isGreater_tb();

reg a, b;
wire isGr;//es '1' cuando 'a' es mas grande que 'b'

isGreater comparator(a, b, isGr);

initial begin
    a=0;
    b=0;
    #1
    $display("Test 1 (0 vs 0): resultado: isGr=%b (%s)", isGr, (isGr==0 ) ? "PASS" : "FAIL" );

    a=1;
    b=0;
    #1
    $display("Test 2 (1 vs 0): resultado: isGr=%b (%s)", isGr, (isGr==1 ) ? "PASS" : "FAIL" );

    a=1;
    b=1;
    #1
    $display("Test 3 (1 vs 1): resultado: isGr=%b (%s)", isGr, (isGr==0 ) ? "PASS" : "FAIL" );

    a=0;
    b=1;
    #1
    $display("Test 4 (0 vs 1): resultado: isEq=%b (%s)", isGr, (isGr==0 ) ? "PASS" : "FAIL" );
end

endmodule