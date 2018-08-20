/*
Modulo que simula un mux de cuatro entradas y dos
lineas de seleccion. Cuando solo la primera linea de
seleccion esta prendida, correspone al segundo input. En cambio
cuando solo la segunda linea esta prendida corresponde al
tercer input.
Asimismo, cuandos las dos estan apagadas corresponde al 
primer input y todas prendidas al ultimo input.
*/

module mux(select1,select2,input1,input2,input3,input4, out);

        //Input ports
        input input1, input2, input3, input4;
        input select1, select2;
        //output ports
        output out;
        reg out;

        always @* begin

          if(~(select1 || select2))
          begin
            if(input1)
              out=1;
              else
              out=0;
          end

          else if((select2==0)&&(select1==1))
          begin
            if(input2)
            out=1;
              else
              out=0;
          end
          else if((select2==1)&&(select1==0))
          begin
            if(input3)
              out=1;
              else
              out=0;
          end
          else if(select2&&select1)
          begin
            if(input4)
              out=1;
              else
              out=0;
          end

        end


endmodule