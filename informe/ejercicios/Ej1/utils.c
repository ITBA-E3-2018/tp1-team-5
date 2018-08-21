#include "utils.h"
#include <stdio.h>
#define EOW '\0'


void parseCmd(int argc, char *argv[], pCallback p, void *userData)
{
	int i = 0;
    bool stop = false;
    if (argc > 1)
    {
        i = 1;
    }
    while((i < argc) && !stop)
    {
        p(i, argv[i], userData, &stop);
        i++;
    }
}

bool isStringNaturalOrCero(char *palabra, int *palabra2num)
{
    int i = 0, aux = 0;
    int n = tamPalabra(palabra); 
    char c = 'A';
    bool ret = false, error = false;
    for(i = 0; i < n; i++)
    {
        c = palabra[i]; //la palabra tiene n caracteres + el terminador. (i siempre es menor a n)
        if ((c >= '0') && (c <= '9'))
        {
            aux += pow(10, n-i-1)*(c-'0');
        }
        else
        {
            error = false;
        }
        
    }
    if(!error)
    {
        ret = true;
        *palabra2num=aux;
    }
    return ret;
}
int tamPalabra(char *palabra)
{
    int i = 0;
    char c = 'A'; //se inicializa la variable con algun valor distinto del terminador EOW
    while((c != EOW) && (i < MAX_LENGTH_WORD))
    {
        c=palabra[i];
        i++;
    }
    printf("tampalabra: %d\n", i-1);
    return (i-1);
}