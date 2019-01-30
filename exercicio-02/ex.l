%{

%}

COMENTARIO "$"([a-zA-Z]|" ")+

INT "int"
FLOAT "float"
STRING "string"

NUM [0-9]+

OPERADORESAR [+*/]|"-"
OPERADORESLOG [<>=]

LEITURA "input(&"[a-zA-Z]+")"
ESCRITA "output('"[a-zA-Z]+"')"
ESCRITAVARIAVEL "output(""&"[a-zA-Z]+")"

CONDICIONALIF "if("[a-zA-Z]+")"
CONDICIONALELSE "else"

LOOP "while("[a-zA-Z]+")"

INICIO "INICIO"
FIM "FIM"

PALAVRA [a-zA-Z]+

ESPACO " "


%%

{COMENTARIO} {
    printf ("Comentário: %s\n", yytext);
}
{INICIO} {
    printf ("Inicio: %s\n", yytext);
}
{INT} {
    printf ("Inteiro: %s\n", yytext);
}
{FLOAT} {
    printf ("Float: %s\n", yytext);
}
{STRING} {
    printf ("String: %s\n", yytext);
}
{NUM} {
    printf ("Numero: %s\n", yytext);
}
{LEITURA} {
    printf ("Leitura: %s\n", yytext);
}
{ESCRITA} {
    printf ("Escrita: %s\n", yytext);
}
{ESCRITAVARIAVEL} {
    printf ("Escrita de variavel: %s\n", yytext);
}
{OPERADORESAR} {
    printf ("Operador aritmetico: %s\n", yytext);
}
{OPERADORESLOG} {
    printf ("Operador lógico: %s\n", yytext);
}
{CONDICIONALIF} {
    printf ("Condicional if: %s\n", yytext);
}
{CONDICIONALELSE} {
    printf ("Condicional else: %s\n", yytext);
}
{LOOP} {
    printf ("Loop: %s\n", yytext);
}
{FIM} {
    printf ("Fim do programa!\n");
}
{PALAVRA} {
    printf ("Variavel: %s\n", yytext);
}

%%