`include "ALUnot.v"

module ALUnot_tb();
    parameter N=3;
    reg[N:0] x;
    wire[N:0] z;
    ALUnot inst1(x,z);
    
    initial begin
        $display("x\t z\t");
        $monitor("%b\t %b\t", x, z);

        x= 'b 1111;

        #5
        x='b 0000;

        #5
        x='b 1010;

         #5
        x='b 0101;

        #5
        x='b 1001;

         #5
       x='b 0011;

        #5
        x='b 1100;
        #5 $finish;
        
    end

endmodule 