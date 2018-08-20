module mux(
            select1,
            select2,
            input1,
            input2,
            input3,
            input4,
            out);

        //Input ports
        input input1, input2, input2, input3, input4;
        input select1, select2;
        //output ports
        output out;
        wire a,b,c,d,e,f,g,h;

        if(select1 & select2)
        begin
          if(input1)
            out=1;
            else
            out=0;
        end

        else if()


endmodule