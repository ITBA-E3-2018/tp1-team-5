#include <stdio.h>
#include "utils.h"
#define SIGNED 1
#define UNSIGNED 0
#define LIMIT_LENGHT 64
#define NUMBER_OF_PARAMS 3

typedef struct{ /// parametros por linea de comandos
    int signo;
    int bitsEntera;
    int bitsFraccionaria;
    bool isError;
    char *errorMessage;
}t_data;

void parseCallback(int numberOfParam, char *stringParam, void *data, bool *stop);

int main(int argc, char *argv[])
{
    double resolucion=0, nmax=0, nmin=0, rango=0;
    t_data input;
    parseCmd(argc, argv, parseCallback, &input);
    printf("%d\n %d\n %d\n %d\n",  input.signo, input.bitsEntera, input.bitsFraccionaria, argc);
    if(!input.isError)
    {
        resolucion = exp2(-1*input.bitsFraccionaria);
        if(input.signo == SIGNED)  
        {
            nmax = exp2(input.bitsEntera-1)-1; //hasta aqui se tiene la parte entera maxima
            nmax += (1-exp2((-1)*input.bitsFraccionaria)); //aqui se agrega la maxima parte fraccionaria
            nmin = (-1)*exp2(input.bitsEntera-1);
        } 
        else //input is unsigned
        {
            nmax = exp2(input.bitsEntera)-1; //hasta aqui se tiene la parte entera maxima
            nmax += (1-exp2(-1*input.bitsFraccionaria)); //aqui se agrega la maxima parte fraccionaria
            nmin = 0;
        } 
        rango = nmax-nmin;
        printf("resolucion: %f, rango: %f \n", resolucion, rango);
    }
    else
    {
        printf("%s", input.errorMessage);
    }

    return 0;

}

void parseCallback(int numberOfParam, char *stringParam, void *data, bool *stop)
{
    t_data *dataInput = data; //casteo del puntero data 
    dataInput->isError=false; //se comenzara con el flag en false
    dataInput->errorMessage="los parametros del usuario son correctos";
    
    switch(numberOfParam)
    {
        case 0: //no hay parametros
                dataInput->isError = true;
                dataInput->errorMessage = "ERROR, no se han ingresado parametros";
                *stop=true;
            break;
        case 1: //se valida el signo
                if(!isStringNaturalOrCero(stringParam, &(dataInput->signo)) || ((dataInput->signo != 0 && 
                (dataInput->signo != 1))) )
                {
                   
                    dataInput->isError=true;
                    dataInput->errorMessage="ERROR al especificar bit de signo (primer parametro)\n";
                    *stop=true;
                }
                break;
        case 2: //se valida la parte entera
                if(!isStringNaturalOrCero(stringParam, &dataInput->bitsEntera) || (dataInput->bitsEntera == 0))
                {
                    dataInput->isError=true;
                    dataInput->errorMessage="ERROR al especificar bits de parte entera (segundo parametro)\n";
                    *stop=true;
                }
        break;
        case 3: //se valida la parte fraccionaria
                if(!isStringNaturalOrCero(stringParam, &dataInput->bitsFraccionaria))
                {
                    dataInput->isError=true;
                    dataInput->errorMessage="ERROR al especificar bits de parte fraccionaria (tercer parametro)\n";
                    *stop=true;
                }
        break;
        default: //hay mas de 3 parametros
                dataInput->isError=true;
                dataInput->errorMessage="ERROR, debe ingresar solo 3 parametros\n";
                *stop=true;
    }
        

}