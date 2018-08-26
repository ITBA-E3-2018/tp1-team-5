`include "ALUand.v"

module ALUand_tb();
    parameter N=3;
    reg[N:0] x;
    reg[N:0]y;
    wire[N:0]z;
    ALUand inst1(x,y,z);
    
    initial begin
        $display("x\t y\t z\t");
        $monitor("%b\t %b\t %b\t", x, y, z);

        x= 'b 1111;
        y= 'b 1111;
        #5
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
        x='b 0111;
        y='b 1001;
        #5 $finish;
        
    end


endmodule  