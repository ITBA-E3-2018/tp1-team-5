`include "isEqual.v"
module isEqual_tb();
reg a, b;
wire isEq;

isEqual comparatorEqual(a, b, isEq);

initial begin
    a=0;
    b=0;
    #1
    $display("Test 1 (0 vs 0): resultado: isEq=%b (%s)", isEq, (isEq==1 ) ? "PASS" : "FAIL" );

    a=1;
    b=0;
    #1
    $display("Test 2 (1 vs 0): resultado: isEq=%b (%s)", isEq, (isEq==0 ) ? "PASS" : "FAIL" );

    a=1;
    b=1;
    #1
    $display("Test 3 (1 vs 1): resultado: isEq=%b (%s)", isEq, (isEq==1 ) ? "PASS" : "FAIL" );

    a=0;
    b=1;
    #1
    $display("Test 4 (0 vs 1): resultado: isEq=%b (%s)", isEq, (isEq==0 ) ? "PASS" : "FAIL" );
end

endmodule