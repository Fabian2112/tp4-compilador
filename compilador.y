%{
#include "funciones.h"
#include <stdio.h>

void yyerror(const char *msg);
int yylex(void);
%}

%union {
    char *nombre; // Para IDs
    int valor;    // Para CONSTANTE
    REG_EXPRESION reg; // Para expresiones completas
}

%token <nombre> ID
%token <valor> CONSTANTE
%token INICIO FIN LEER ESCRIBIR
%token PARENIZQUIERDO PARENDERECHO COMA PUNTOYCOMA ASIGNACION SUMA RESTA FDT
%token ERRORLEXICO
%type <reg> expresion primaria
%type <reg> identificador

%%

objetivo:
    programa FDT { Terminar(); }
;

programa:
    INICIO lista_sentencias FIN { Comenzar(); }
;

lista_sentencias:
    sentencia
    | lista_sentencias sentencia
;

sentencia:
    identificador ASIGNACION expresion PUNTOYCOMA { Asignar($1, $3); }
    | LEER PARENIZQUIERDO lista_identificadores PARENDERECHO PUNTOYCOMA
    | ESCRIBIR PARENIZQUIERDO lista_expresiones PARENDERECHO PUNTOYCOMA
;

lista_identificadores:
    identificador { Leer($1); }
    | lista_identificadores COMA identificador { Leer($3); }
;

lista_expresiones:
    expresion { Escribir($1); }
    | lista_expresiones COMA expresion { Escribir($3); }
;

expresion:
    primaria
    | expresion SUMA primaria { $$ = GenInfijo($1, "+", $3); }
    | expresion RESTA primaria { $$ = GenInfijo($1, "-", $3); }
;

primaria:
    identificador
    | CONSTANTE { $$ = ProcesarCte($1); }
    | PARENIZQUIERDO expresion PARENDERECHO { $$ = $2; }
;

identificador:
    ID { $$ = ProcesarId($1); }
;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error sintáctico: %s\n", msg);
}
