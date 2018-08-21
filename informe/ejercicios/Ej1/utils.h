//// ----------------------------- ////
//// LIBRERIA: Funciones Utiles ////
//// ----------------------------- ////
#ifndef UTILS_H
#define UTILS_H

#include <stdbool.h>
#include <math.h>

#define MAX_LENGTH_WORD 100

typedef void (*pCallback) (int,char*,void*, bool*);

//parseCmd: lo unico que hace esta funcion es pasarle los parametros al callback 
//de tipo 'pCallback' (al callback se le pasa el numero de parametro y
//el parametro en caracreres ascii). 
//Esto lo realiza hasta que no haya mas parametros, o hasta que 
//el callback intencionalmente impida que se continue 'parseando', poniendo 
//el flag de tipo bool (que se pasa por parámetro al callback) en true.
//ademas, al callback se le brinda un puntero genérico 'userData' que sirve
//como intermediario del callback y del usuario que llama a parseCmd. 
//IMPORTANTE: en caso de que no haya parametros, se llamara al callback con 'nroDeParametro'
//igual a cero.
void parseCmd(int argc, char *argv[], pCallback p, void *userData);


//isStringNaturalOrCero: Esta función recibe una palabra y chequea si representa un numero
//natural o cero. Se asume que la palabra esta formada por caracteres ascii. Devuelve true
//si la palabra efectivamente representaba un numero natural o cero,y devuelve false en
//caso de encontrar caracteres que no sean numeros naturales o cero.
//además, en caso de devolver true, cambia la variable a la que apunta el puntero a int
//pasado por parámetro, asignandole a dicha variable el valor del numero representado
//por la palabra en caracteres ascii.
bool isStringNaturalOrCero(char *palabra, int *palabra2num);

//tamPalabra: Esta función devuelve la cantidad de caracteres de la palabra (arreglo de chars)
//que se le pasa como parámetro (sin contar el terminador). Se asume que la palabra termina con el terminador '\0'.
//ademas, vale aclarar que el programa lee palabras de hasta 'MAX_LENGTH_WORD' caracteres.
//el minimo que puede valer el tamaño de la palabra es cero (cuando solo esta el terminador).
int tamPalabra(char *palabra);

#endif /* UTILS_H */