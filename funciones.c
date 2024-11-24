#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "funciones.h"

void Comenzar(void) {
    printf("Inicio del programa.\n");
}

void Terminar(void) {
    printf("Fin del programa.\n");
}

void Asignar(REG_EXPRESION izq, REG_EXPRESION der) {
    printf("Asignar: %s = %s\n", izq.nombre, der.nombre);
}

REG_EXPRESION ProcesarId(char *nombre) {
    REG_EXPRESION reg;
    strcpy(reg.nombre, nombre);
    return reg;
}

REG_EXPRESION ProcesarCte(int valor) {
    REG_EXPRESION reg;
    reg.valor = valor;
    snprintf(reg.nombre, TAMLEX, "%d", valor);
    return reg;
}

REG_EXPRESION GenInfijo(REG_EXPRESION e1, char *op, REG_EXPRESION e2) {
    REG_EXPRESION reg;
    static int tempCount = 0;
    snprintf(reg.nombre, TAMLEX, "t%d", tempCount++);
    printf("Operación: %s %s %s -> %s\n", e1.nombre, op, e2.nombre, reg.nombre);
    return reg;
}

void Leer(REG_EXPRESION reg) {
    printf("Leer: %s\n", reg.nombre);
}

void Escribir(REG_EXPRESION reg) {
    printf("Escribir: %s\n", reg.nombre);
}


int main(int argc, char *argv[]) {
    printf("Compilador ejecutandose...\n");
    return 0;
}
