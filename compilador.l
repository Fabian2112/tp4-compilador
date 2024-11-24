%{
#include "funciones.h"
#include "compilador.tab.h"

int yywrap(void) { return 1; }
%}

%%

[inicio]         { return INICIO; }
[fin]            { return FIN; }
[leer]           { return LEER; }
[escribir]       { return ESCRIBIR; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.nombre = strdup(yytext); return ID; }
[0-9]+           { yylval.valor = atoi(yytext); return CONSTANTE; }
"+"              { return SUMA; }
"-"              { return RESTA; }
"("              { return PARENIZQUIERDO; }
")"              { return PARENDERECHO; }
","              { return COMA; }
";"              { return PUNTOYCOMA; }
":="             { return ASIGNACION; }
<<EOF>>          { return FDT; }
[ \t\n]          { /* Ignorar espacios y saltos de línea */ }
.                { printf("Error léxico: %s\n", yytext); return ERRORLEXICO; }

%%
