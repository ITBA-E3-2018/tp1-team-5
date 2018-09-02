`include "fulladder.v"

module fulladder_tb();

reg x, y, Cin;
wire s, Cout;

fulladder FA(Cin, x, y, s, Cout);

//tests benches
initial begin
    x = 0;
    y = 0;
    Cin=0;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 1 (0+0)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 0) && (Cout == 0)) ? "PASS" : "FAIL" );
    
    x = 1;
    y = 0;
    Cin=0;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 2 (1+0)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 1) && (Cout == 0)) ? "PASS" : "FAIL" );

    x = 0;
    y = 1;
    Cin=0;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 3 (0+1)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 1) && (Cout == 0)) ? "PASS" : "FAIL" );

    x = 1;
    y = 1;
    Cin=0;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 4 (1+1)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 0) && (Cout == 1)) ? "PASS" : "FAIL" );

    x = 1;
    y = 1;
    Cin=1;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 5 (1+1+carryIN)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 1) && (Cout == 1)) ? "PASS" : "FAIL" );

    x = 1;
    y = 0;
    Cin=1;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 6 (1+0+carryIN)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 0) && (Cout == 1)) ? "PASS" : "FAIL" );

    x = 0;
    y = 1;
    Cin=1;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 7 (0+1-carryIN)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 0) && (Cout == 1)) ? "PASS" : "FAIL" );

    x = 0;
    y = 0;
    Cin=1;
    #1; // After changing a set of variables, I need to let a tick pass to allow the change to propagate.
    $display("Test 8 (0+0+carryIN)- s: %b carryOut: %b - %s ", s, Cout, ( (s == 1) && (Cout == 0)) ? "PASS" : "FAIL" );
end

endmodule