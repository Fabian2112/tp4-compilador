#ifndef FUNCIONES_H
#define FUNCIONES_H

#define TAMLEX 32

typedef struct {
    char nombre[TAMLEX];
    int valor;
} REG_EXPRESION;

void Comenzar(void);
void Terminar(void);
void Asignar(REG_EXPRESION izq, REG_EXPRESION der);
REG_EXPRESION ProcesarId(char *nombre);
REG_EXPRESION ProcesarCte(int valor);
REG_EXPRESION GenInfijo(REG_EXPRESION e1, char *op, REG_EXPRESION e2);
void Leer(REG_EXPRESION reg);
void Escribir(REG_EXPRESION reg);

#endif
