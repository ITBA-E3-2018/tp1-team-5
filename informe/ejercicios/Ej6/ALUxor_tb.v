`include "ALUxor.v"

module ALUxor_tb();
    parameter N=3;
    reg[N:0] x;
    reg[N:0]y;
    wire[N:0]z;
    ALUxor inst1(x,y,z);
    
    initial begin
        $display("x\t y\t z\t");
        $monitor("%b\t %b\t %b\t", x, y, z);

        x= 'b 1101;
        y= 'b 0111;
        #5
        x='b 0001;
        y='b 0101;
        #5
        y='b 1010;
         #5
        y='b 0101;
        #5
        x='b 0000;
         #5
        y='b 1111;
        #5
        x='b 1111;
        y='b 0001;
        #5 $finish;
        
    end


endmodule // 